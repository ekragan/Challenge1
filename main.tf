module "AppServer" {
  source = "./APP_Layer"
  sql_vpc_id = module.DBServer.sql_vpc_id
  uname = module.DBServer.uname
  pass = module.DBServer.pass
  pubip = module.DBServer.pubip
  dbname = module.DBServer.dbname
}

module "DBServer" {
  source = "./DB_Layer"
  mysite_vpc_id = module.AppServer.mysite_vpc_id
  mysite_static_ip = module.AppServer.mysite_static_ip
}
