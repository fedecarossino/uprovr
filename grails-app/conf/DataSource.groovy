dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			url = "jdbc:mysql://localhost/uprovr"
			cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            dbCreate = "create" //validate
            driverClassName = "com.mysql.jdbc.Driver"
            username = "b2ae794f054159"
            password = "2681f389"
            url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net/heroku_a07b5fd92167917?reconnect=true&useUnicode=yes&characterEncoding=UTF-8"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
            cache.provider_class = "com.opensymphony.oscache.hibernate.OSCacheProvider"
            pooled = true
            properties {
                // Check connections
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                jmxEnabled = true
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                // Evict idle connections
                minEvictableIdleTimeMillis = 1000 * 60 * 10 // To prevent instances to sit idle in the pool more than 10 minutes
                timeBetweenEvictionRunsMillis = 1000 * 60 * 1 // 1 minute
                numTestsPerEvictionRun = 3
                // Connection pool
                initialSize = 5
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                maxWait = 10000 //10 seconds
                maxAge = 10 * 60000
                // Remove abandoned connections (not closed)
                removeAbandoned = true
                removeAbandonedTimeout = 60 * 15 // 15 minutes
                jdbcInterceptors = "ConnectionState;StatementCache(max=200)"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
