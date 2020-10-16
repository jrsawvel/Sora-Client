
-- user.lua module

local cjson   = require "cjson"

local config    = require "config"
local httputils = require "httputils"


local M = {}


function M.request_login_link()
    local api_url = config.get_value_for("api_url")
    local post_url = api_url .. "/users/login"
    local request_body = { 
        email = config.get_value_for("email"),
        url   = config.get_value_for("home_page") .. "/sora/nopwdlogin"
    }
    local json_text = cjson.encode(request_body)
    local response_body, status_code, headers_table, status_string = httputils.unsecure_json_post(post_url, json_text)
    local h_json = cjson.decode(response_body)
    print(response_body) 
end


function M.activate_login(rev)
    local api_url = config.get_value_for("api_url") .. "/users/login/?rev=" .. rev
    local response_body, status_code, headers_table, status_string = httputils.get_unsecure_web_page(api_url)
    local h_json = cjson.decode(response_body)
    print(response_body) 
end


return M
