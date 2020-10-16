#!/usr/local/bin/lua


package.path = package.path .. ';/home/john/SoraClient/lib/?.lua'


-- soraclient.lua
-- 
-- mon, sep 21, 2020
-- pleasant fall day. morning temps in the 40s
--   afternoon temps in the low 70s. sunny.
--   i saw some decent early fall color
--   yesterday while birdwatching along the 
--   lake erie shoreline of northwest ohio.


local user = require "user"
local post = require "post"


if #arg < 1 then
    error("missing parameters. use ./soraclient.lua help for info.")
end


if #arg == 1 and arg[1] == "login" then
    user.request_login_link()
elseif #arg == 2 and arg[1] == "activate" then
    user.activate_login(arg[2])  
elseif #arg == 2 and arg[1] == "create" then
    post.create(arg[2])    
elseif #arg == 3 and arg[1] == "update" then
    post.update(arg[2], arg[3])
else
    print("nothing to do for: " .. arg[1])
end
