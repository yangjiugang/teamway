package com.fc.brms.common.util;

import java.awt.Font;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.servlet.ChartDeleter;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.general.DefaultPieDataset;

public class ChartUtil {

	public static String generatePieChartString(DefaultPieDataset dataset,
			String title, int width, int height, HttpSession session,
			PrintWriter pw) {

		String filename = null;
		try {
			if (session != null) {
				ChartDeleter deleter = (ChartDeleter) session
						.getAttribute("<SPAN class=hilite1>JFreeChart</SPAN>_Deleter");
				session.removeAttribute("<SPAN class=hilite1>JFreeChart</SPAN>_Deleter");
				session.setAttribute(
						"<SPAN class=hilite1>JFreeChart</SPAN>_Deleter",
						deleter);
			}
			JFreeChart chart = ChartFactory.createPieChart3D(title, // chart
																	// title
					dataset, // data
					true, // include legend
					true, false);
			// Write the chart image to the temporary directory
			ChartRenderingInfo info = new ChartRenderingInfo(
					new StandardEntityCollection());
			// If the last parameter is null, the chart is a "one time"-chart
			// and will be deleted after the first serving.
			// If the last parameter is a session object, the chart remains
			// until session time out.
			filename = ServletUtilities.saveChartAsPNG(chart, width, height,
					info, session);
			// Write the image map to the PrintWriter
			ChartUtilities.writeImageMap(pw, filename, info, true);
			pw.flush();
		} catch (Exception e) {
			System.out.println("Exception - " + e.toString());
			e.printStackTrace(System.out);
			filename = "picture_error.png";
		}
		return filename;
	}

	public static String generatePieChart(DefaultPieDataset dataset,
			String title, int width, int height, HttpSession session,
			PrintWriter pw) {
		String filename = null;
		try {
			if (session != null) {
				ChartDeleter deleter = (ChartDeleter) session
						.getAttribute("JFreeChart_Deleter");
				session.removeAttribute("JFreeChart_Deleter");
				session.setAttribute("JFreeChart_Deleter", deleter);
			}
			JFreeChart chart = ChartFactory.createPieChart3D(title, // chart
					dataset, // data
					true, // include legend
					true, false);
			
			chart.getTitle().setFont(new Font("宋体", Font.BOLD, 15));//解决标题乱码
			chart.getLegend().setItemFont(new Font("宋体", Font.ITALIC, 10));//解决图表底部各部分标签
		    PiePlot piePlot = (PiePlot) chart.getPlot();
		    piePlot.setLabelFont(new Font("宋体", Font.ITALIC, 12));//解决图表上各部分标识乱码
			// Write the chart image to the temporary directory
			ChartRenderingInfo info = new ChartRenderingInfo(
					new StandardEntityCollection());
			// If the last parameter is null, the chart is a "one time"-chart
			// and will be deleted after the first serving.
			// If the last parameter is a session object, the chart remains
			// until session time out.
			ServletUtilities.saveChartAsJPEG(chart, width, height,
					info, session);
			filename = ServletUtilities.saveChartAsPNG(chart, width, height,
					info, session);
			// Write the image map to the PrintWriter
			ChartUtilities.writeImageMap(pw, filename, info, true);
			pw.flush();
		} catch (Exception e) {
			System.out.println("Exception - " + e.toString());
			e.printStackTrace(System.out);
			filename = "picture_error.png";
		}
		return filename;
	}
	
}
