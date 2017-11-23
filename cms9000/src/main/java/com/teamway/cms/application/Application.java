package com.teamway.cms.application;

import java.io.File;
import java.net.URL;
import java.security.ProtectionDomain;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.webapp.WebAppContext;

import com.teamway.cms.cmsserver.CmsServer;
import com.teamway.cms.cmsserver.TestReportAlarm;
import com.teamway.cms.env.EnvServer;
import com.teamway.cms.pgcleint.RpuClient;
import com.teamway.cms.pgcleint.RpuOnlineCheckThread;
import com.teamway.cms.pgcleint.SendToRpuThread;
import com.teamway.cms.pgserver.PAGServer;
import com.teamway.cms.pgserver.PAGServerThread;
import com.teamway.cms.pgutils.PG.RPUCLI_RPUNAME;
import com.teamway.cms.utils.PropertiesUtils;

import sun.misc.Launcher;

/**
 * @author jincy
 */
public class Application {	
	public static final int DEFAULT_PORT = 8080;
	public static final String DEFAULT_CONTEXT_PATH = "/";
	private static final String DEFAULT_APP_CONTEXT_PATH = "root";


	public static void main(String[] args) throws Exception {

		int WebServerPort=	PropertiesUtils.GetIntByKey("WebServerPort");
		int CmsServerPort=	PropertiesUtils.GetIntByKey("CmsServerPort");
		int PagServerPort=	PropertiesUtils.GetIntByKey("PagServerPort");	
		String PagServerPwd=PropertiesUtils.GetStringByKey("PagServerPwd");

		int EnvServerPort = PropertiesUtils.GetIntByKey("EnvServerPort");

		String EnvServerName = PropertiesUtils.GetStringByKey("EnvServerName");
		String EnvServerPwd = PropertiesUtils.GetStringByKey("EnvServerPwd");


		RpuClient.runSendToRpuThread();
		RpuClient.runRecvProcessThread();
		RpuClient.runRpuOnlineCheckThread();

		System.out.println("TVS9000 start ...");

		PAGServer.start(PagServerPort);	

		CmsServer.start(CmsServerPort);

		EnvServer.start(EnvServerPort);

		//测试上报环境量
		//Thread thread =new Thread(new TestReportAlarm());
		//thread.start();
		
		//web服务启动
		runDevServer(WebServerPort, DEFAULT_CONTEXT_PATH);
	}

	public static void runDevServer(int port, String contextPath) {

		Server server = createDevServer(port, contextPath);
		try {
			server.start();
			server.join();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				server.stop();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	public static void runJettyServer(int port, String contextPath) {

		Server server = createJettyServer(port, contextPath);
		try {
			server.start();
			server.join();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				server.stop();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static Server createJettyServer(int port, String contextPath) {

		Server server = new Server(port);
		server.setStopAtShutdown(true);

		ProtectionDomain protectionDomain = Launcher.class.getProtectionDomain();
		URL location = protectionDomain.getCodeSource().getLocation();
		String warFile = location.toExternalForm();

		WebAppContext context = new WebAppContext(warFile, contextPath);
		context.setServer(server);

		String currentDir = new File(location.getPath()).getParent();
		File workDir = new File(currentDir, "work");
		context.setTempDirectory(workDir);

		server.setHandler(context);

		return server;

	}

	public static Server createDevServer(int port, String contextPath) {

		Server server = new Server();
		server.setStopAtShutdown(true);

		ServerConnector connector = new ServerConnector(server);

		connector.setPort(port);
		connector.setReuseAddress(false);
		server.setConnectors(new Connector[] {connector});

		WebAppContext webAppCtx = new WebAppContext(DEFAULT_APP_CONTEXT_PATH, contextPath);
		webAppCtx.setDescriptor(DEFAULT_APP_CONTEXT_PATH + "/WEB-INF/web.xml");
		webAppCtx.setResourceBase(DEFAULT_APP_CONTEXT_PATH);
		webAppCtx.setClassLoader(Thread.currentThread().getContextClassLoader());
		server.setHandler(webAppCtx);


		return server;
	}

}
