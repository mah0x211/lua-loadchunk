lua-loadchunk
=========

Lua chunk loader module.

---


## Installation

```sh
luarocks install loadchunk --from=http://mah0x211.github.io/rocks/
```


## Functions

### fn, err = loadchunk.string( str [, env [, ident]] )

returns the compiled chunk as a function.

**Parameters**

- `str:string`: chunk string.
- `env:table`: chunk environment.
- `ident:string`: used as the chunk name for error messages and debug information.

**Returns**

- `fn:function`: compiled chunk as a function.
- `err:string`: error message.


### fn, err = loadchunk.file( pathname [, env] )

returns the compiled chunk as a function.

**Parameters**

- `pathname:string`: pathname of chunk file.
- `env:table`: chunk environment.

**Returns**

- `fn:function`: compiled chunk as a function.
- `err:string`: error message.

