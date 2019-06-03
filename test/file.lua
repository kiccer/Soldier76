-- require("module")
--
-- module.a()


file = io.open('test.js', 'w')

print(file:read())

-- file:

file:write([[
  function test () {
    console.log('test111')
  }
]])

file:close()
