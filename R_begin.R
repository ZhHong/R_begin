library(DBI)
library(RMySQL)
conn <- dbConnect(MySQL(),dbname="game_development",username="root",password="root",host="127.0.0.1",port=3306)
dbReadTable(conn,"users")

dbDisconnect(conn)

