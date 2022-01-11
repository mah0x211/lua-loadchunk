package = "loadchunk"
version = "scm-1"
source = {
    url = "git://github.com/mah0x211/lua-loadchunk.git"
}
description = {
    summary = "Lua chunk loader module",
    homepage = "https://github.com/mah0x211/lua-loadchunk",
    license = "MIT/X11",
    maintainer = "Masatoshi Fukunaga"
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        loadchunk = "loadchunk.lua"
    }
}

