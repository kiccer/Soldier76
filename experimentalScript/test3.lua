math.randomseed(os.time())

function Sleep(n)
   if n > 0 then os.execute("ping -n " .. tonumber(n + 1) / 1000 .. " localhost > NUL") end
end

for i = 1, 30 do
  print(math.random(14, 16))
  Sleep(100)
end

print(os.date())
