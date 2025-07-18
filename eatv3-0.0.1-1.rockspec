package = "Eatv3"
version = "0.0.1-1"

source = {
  url = "https://github.com/March012847/eat/archive/refs/tags/v--0.0.1.zip",
}

description = {
  summary = "eat package",
  detailed = "it just eats a person (joke).",
  homepage = "https://github.com/March012847/eat",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1",
  "luasocket",
  "dkjson"
}

build = {
  type = "builtin",
  modules = {
    ["eat"] = "eat.lua"
  }
}
