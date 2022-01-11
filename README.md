lua-loadchunk
=========

[![test](https://github.com/mah0x211/lua-loadchunk/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-loadchunk/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/mah0x211/lua-loadchunk/badge.svg?branch=master)](https://coveralls.io/github/mah0x211/lua-loadchunk?branch=master)

Lua chunk loader module.

---


## Installation

```sh
luarocks install loadchunk
```


## fn, err = loadchunk.string( str [, env [, ident]] )

returns the compiled chunk as a function.

**Parameters**

- `str:string`: chunk string.
- `env:table`: chunk environment.
- `ident:string`: used as the chunk name for error messages and debug information.

**Returns**

- `fn:function`: compiled chunk as a function.
- `err:string`: error message.


## fn, err = loadchunk.file( pathname [, env] )

returns the compiled chunk as a function.

**Parameters**

- `pathname:string`: pathname of chunk file.
- `env:table`: chunk environment.

**Returns**

- `fn:function`: compiled chunk as a function.
- `err:string`: error message.

