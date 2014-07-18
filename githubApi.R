# problem 1
library(httr)

# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
# Insert your values below - if secret is omitted, it will look it up in
# the GITHUB_CONSUMER_SECRET environmental variable.
#
# Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "4c999a07d4cf2308b754","fdc48ae1cd215750e81642410914603ed8fb7c17")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

json1 <- jsonlite::toJSON(content(req))
json2 <- jsonlite::fromJSON(json1)
json2[json2$name=='datasharing',]$created_at


#problem 4
thepage = readLines('http://biostat.jhsph.edu/~jleek/contact.html')

x <- read.fwf(
  file='/media/ram/D/Library/Tech/Getting and Cleaning Data/Assignments/getdata_wksst8110.for',
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))



 

