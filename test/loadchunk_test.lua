local testcase = require('testcase')
local loadchunk = require('loadchunk')

local FILENAME = './testchunk.lua'

function testcase.after_all()
    os.remove(FILENAME)
end

function testcase.string()
    -- test that load chunk
    local fn = assert(loadchunk.string('return "hello"'))
    assert.is_function(fn)
    assert.equal(fn(), 'hello')

    -- test that load chunk with environments
    fn = assert(loadchunk.string('return print'))
    assert.is_function(fn)
    assert.rawequal(fn(), print)

    -- test that cannot load invalid chunk
    local _, err = loadchunk.string('hello"')
    assert(err, 'no error')
    assert.is_nil(_)

    -- test that throw an error if no environment
    fn = assert(loadchunk.string('print("foo")', {}))
    err = assert.throws(fn)
    assert.match(err, 'call.+nil value', false)
end

function testcase.file()
    local writechunk = function(str)
        local f = assert(io.open(FILENAME, 'w+'))
        assert(f:write(str))
        assert(f:close())
    end

    -- test that load chunk
    writechunk('return "hello"')
    local fn = assert(loadchunk.file(FILENAME))
    assert.is_function(fn)
    assert.equal(fn(), 'hello')

    -- test that load chunk with specified environments
    writechunk('return print')
    fn = assert(loadchunk.file(FILENAME))
    assert.is_function(fn)
    assert.rawequal(fn(), print)

    -- test that cannot load a empty pathname
    for _, v in ipairs({
        '',
        '    \t  ',
    }) do
        local _, err = loadchunk.file(v)
        assert.match(err, 'file must be non-empty string')
        assert.is_nil(_)
    end
    local _, err = loadchunk.file()
    assert.match(err, 'file must be non-empty string')
    assert.is_nil(_)

    -- test that cannot load invalid chunk string
    writechunk('hello"')
    _, err = loadchunk.file(FILENAME)
    assert(err, 'no error')
    assert.is_nil(_)

    -- test that throw an error if no environment
    writechunk('print("foo")')
    fn = assert(loadchunk.file(FILENAME, {}))
    err = assert.throws(fn)
    assert.match(err, 'call.+nil value', false)
end
