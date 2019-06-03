-- arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
--
-- print(#arr)
--
-- for i = 1, #arr do
--   print(arr[i])
-- end

--[[array = {"Lua", "Tutorial"}

for k, v in ipairs(array)
do
   print(k, v)
end
]]

module = {}

local function a ()
  io.write("这是一个公有函数！\n")
end

module.a = a

return module
