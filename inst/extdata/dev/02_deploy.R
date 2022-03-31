## adding env variables dynamically

library(connectapi)

dev_url <- "https://rstudio-connect.foo.com/"
prod_url <- "https://rstudio-connect-dev.foo.com/"

# DEVELOPMENT SETUP ####

Sys.setenv(
  CONNECT_SERVER = dev_url,
  CONNECT_API_KEY = Sys.getenv("dev_key")
)

dev_client <- connect()

dash_guid = "foo" # find this at bottom of info tab on rsconnect after publishing

env <- get_environment(content_item(dev_client, dash_guid))

# here you can set company credentials if required for db connections

set_environment_new(
  env,
  "key" = Sys.getenv("dev_key")
)

# PRODUCTION SETUP ####

Sys.setenv(
  CONNECT_SERVER = prod_url,
  CONNECT_API_KEY = Sys.getenv("prod_key")
)

prod_client <- connect()

dash_guid = "foo"

env <- get_environment(content_item(prod_client, dash_guid))

# here you can set company credentials if required for db connections

set_environment_new(
  env,
  "key" = Sys.getenv("prod_key")
)





