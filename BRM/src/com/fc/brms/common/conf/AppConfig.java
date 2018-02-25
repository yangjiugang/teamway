package com.fc.brms.common.conf;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.jolbox.bonecp.BoneCPDataSource;

@Configuration
public class AppConfig {

	@Value("${driverClass}")
	private String driverClass;
	@Value("${jdbcUrl}")
	private String jdbcUrl;
	@Value("${username}")
	private String username;
	@Value("${password}")
	private String password;
	@Value("${idleConnectionTestPeriodInMinutes}")
	private int idleConnectionTestPeriod;
	@Value("${idleMaxAgeInMinutes}")
	private int idleMaxAge;
	@Value("${maxConnectionsPerPartition}")
	private int maxConnectionsPerPartition;
	@Value("${minConnectionsPerPartition}")
	private int minConnectionsPerPartition;
	@Value("${partitionCount}")
	private int partitionCount;
	@Value("${acquireIncrement}")
	private int acquireIncrement;
	@Value("${statementsCacheSize}")
	private int statementsCacheSize;
	@Value("${releaseHelperThreads}")
	private int releaseHelperThreads;

	@Bean(destroyMethod = "close")
	public DataSource boneCPDataSource() {
		BoneCPDataSource dataSource = new BoneCPDataSource();
		dataSource.setDriverClass(driverClass);
		dataSource.setJdbcUrl(jdbcUrl);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		dataSource.setIdleConnectionTestPeriodInMinutes(idleConnectionTestPeriod);
		dataSource.setIdleMaxAgeInMinutes(idleMaxAge);
		dataSource.setMaxConnectionsPerPartition(maxConnectionsPerPartition);
		dataSource.setMinConnectionsPerPartition(minConnectionsPerPartition);
		dataSource.setPartitionCount(partitionCount);
		dataSource.setAcquireIncrement(acquireIncrement);
		dataSource.setStatementsCacheSize(statementsCacheSize);
		dataSource.setReleaseHelperThreads(releaseHelperThreads);
		return dataSource;
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource(this.boneCPDataSource());
		return dataSourceTransactionManager;
	}
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory() {
		SqlSessionFactoryBean sfb = new SqlSessionFactoryBean();
		sfb.setDataSource(this.boneCPDataSource());
		sfb.setConfigLocation(new ClassPathResource("/resources/mybatis-config.xml"));
		return sfb;
	}
}
