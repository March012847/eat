local eat = {}

-- dependencies
local socket = require("socket")
local ltn12 = require("ltn12")
local http = require("socket.http")
local dkjson = require("dkjson")

-- varibles
local webhooks = nil
local reponse = {}

-- main function
function eat:StartEating(person, eater)
  print("Start eating " .. person .. " now")
  socket.sleep(5)
  print("25% eaten")
  socket.sleep(5)
  print("50% eaten")
  socket.sleep(5)
  print("75% eaten")
  socket.sleep(5)
  print("100% eaten")
  socket.sleep(1)
  print(person .. " was eaten by " .. eater)
end

function eat:help()
  print([[
Hello and welcome to the eat package (version 0.0.1-beta). This package is a joke and includes the following functions:

1. eat:help()
   - Prints this help message.

2. eat:StartEating(person, eater)
   - Simulates eating a person with progress output.
]])
end



function eat:registerurl(url)
  print("registered webhook ".. url)
  webhooks = url
end

function eat:PostEating(person, eater)
  local not_encoded = {
    embeds = {
      {
        title = "Person was eaten",
        description = person .. " was eaten by " .. eater,
        color = 16711680
      }
    }
  }

  local encoded = dkjson.encode(not_encoded)
  local response = {}

  http.request{
    url = webhooks,
    method = "POST",
    headers = {
      ["Content-Type"] = "application/json", -- lowercase "application"
      ["Content-Length"] = tostring(#encoded), -- needs to be a string
    },
    source = ltn12.source.string(encoded),
    sink = ltn12.sink.table(response)
  }

  print("Webhook sent! Response: ", table.concat(response))
end


return eat
