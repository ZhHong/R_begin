library(DBI)
library(RMySQL)
db_driver <- dbDriver("MySQL")
conn <- dbConnect(db_driver,dbname="game_development",username="root",password="root",host="127.0.0.1",port=3306)
summary(conn)
dbGetInfo(conn)
dbListTables(conn)
dbListFields(conn,"users")
sql <- "select userid,sex,login_time,platform from users"
res1 <- dbSendQuery(conn,sql)
dbFetch(res1,n=10)
dbListResults(conn)
#print(res1)
dbClearResult(res1)

char_set_sql <- "SET NAMES gbk"
dbSendQuery(conn,char_set_sql)

sql_history <- "select create_time,ip,zip_reason,zip_time,server_type,country,area,city,cost_ingot,cost_gold from rooms_archive"
res2 <- dbSendQuery(conn,sql_history)
dbFetch(res2,n=10)

dbListResults(conn)
dbClearResult(res2)

dbDisconnect(conn)

dbUnloadDriver(db_driver)