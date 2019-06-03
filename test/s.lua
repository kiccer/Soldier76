function getTime ()
  return math.floor((os.time() + os.clock()) * 1000)
end

function Sleep(n)
   if n > 0 then os.execute("ping -n " .. tonumber(n + 1) / 1000 .. " localhost > NUL") end
end

function execOptions (options)

	--[[

		from

		{
			{ 5, 10 },
			{ 10, 24 },
		}

		to

		{ 10, 10, 10, 10, 10, 24, 24, 24, 24, 24 }

	]]

	-- Temporary container
	local newConfig = {
		accurate = {},
		probably = {},
		x = {},
	}
	local newConfig2 = {
		accurate = {},
		probably = {},
		x = {},
	}

	-- Kaijing
	local accurateIndex = 1
	for i = 1, #options.accurate do
		local nextCount = options.accurate[i][1]
		if i ~= 1 then
			nextCount = options.accurate[i][1] - options.accurate[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.accurate[accurateIndex] =
				options.accurate[i][2] * 100 / 100
			accurateIndex = accurateIndex + 1
		end
	end

	for i = 1, #newConfig.accurate do
		if i == 1 then
			newConfig2.accurate[i] = newConfig.accurate[i]
		else
			newConfig2.accurate[i] = newConfig2.accurate[i - 1] + newConfig.accurate[i]
		end
	end

	-- Yaoshe
	local probablyIndex = 1
	for i = 1, #options.probably do
		local nextCount = options.probably[i][1]
		if i ~= 1 then
			nextCount = options.probably[i][1] - options.probably[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.probably[probablyIndex] =
				options.probably[i][2] * 100 / 100
			probablyIndex = probablyIndex + 1
		end
	end

  for i = 1, #newConfig.probably do
		if i == 1 then
			newConfig2.probably[i] = newConfig.probably[i]
		else
			newConfig2.probably[i] = newConfig2.probably[i - 1] + newConfig.probably[i]
		end
	end

	-- X (Kaijing)
	local xIndex = 1
	for i = 1, #options.x do
		local nextCount = options.x[i][1]
		if i ~= 1 then
			nextCount = options.x[i][1] - options.x[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.x[xIndex] = options.x[i][2] * 100 / 100
			xIndex = xIndex + 1
		end
	end

  for i = 1, #newConfig.x do
		if i == 1 then
			newConfig2.x[i] = newConfig.x[i]
		else
			newConfig2.x[i] = newConfig2.x[i - 1] + newConfig.x[i]
		end
	end

	-- for v = 1, #newConfig.x do
	-- 	OutputLogMessage(newConfig.x[v] .. "\n")
	-- 	if newConfig.x[v] ~= 0 then
	-- 		OutputLogMessage(options.duration .. "\n")
	-- 		break
	-- 	end
	-- end

	return {
		duration = options.duration, -- Time of duration
		amount = options.amount, -- Number of bullets
		one = options.duration / options.amount, -- Time of each bullet
		accurate = newConfig2.accurate, -- Accurate aiming configuration
		probably = newConfig2.probably, -- Probably aiming configuration
		x = newConfig2.x, -- Accurate aiming configuration (transverse)
	}

end

local data = execOptions({
  duration = 3600,
  amount = 40,
  accurate = {
    {1, 0},
    {2, 17},
    {3, 5},
    {4, 9},
    {10, 11},
    {13, 12},
    {40, 16},
  },
  x = {
    {40, 0},
  },
  probably = {
    {15, 5},
    {40, 7},
  },
})

for i = 1, #data.accurate do
  print(data.accurate[i])
end

local startTime = getTime()
local counter = 0

function auto (options)
  for i = 1, 50000 do
    local now = getTime()
    local time = math.ceil((now - startTime == 0 and {1} or {now - startTime})[1] / options.one) + 1
    if not (time <= 40) then break end
      -- local x = (IsKeyLockOn("scrolllock") and { 7 } or { options.x[time] })[1]
      local y = math.ceil((now - startTime) / (options.one * (time - 1)) * options.accurate[time]) - counter
      -- y = y * (IsModifierPressed("lalt") and { 2.8 } or { 1 })[1]

      -- MoveMouseRelative(x, y)

      -- local random = 0
      -- if IsKeyLockOn("scrolllock") then
      --   -- When debugging mode is turned on, Turn off random delays in preventive testing
      --   random = math.random(pubg.sleep, pubg.sleep)
      -- else
      --   random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
      -- end
      -- if options.accurate[time] == counter then
        print("---------------------------------------------------------------------------")
        -- print("移动距离：" .. y)
        print(table.concat({
          "move: ",
          "math.ceil(",(now - startTime) / (options.one * (time - 1)) * options.accurate[time],") - ",counter," = ",
          math.ceil((now - startTime) / (options.one * (time - 1)) * options.accurate[time]) - counter,
        }))
      -- end
      print("time ago: " .. now - startTime .. "  progress: " .. (now - startTime) / (options.one * (time - 1)))
      print("bullet count: " .. time .. "  target: " .. options.accurate[time] .. "  last counter: " .. counter)
      print("D-value: " .. options.accurate[time] .. " - " .. counter .. " = " .. options.accurate[time] - counter)
      counter = counter + y
      -- Sleep(10)
      -- Sleep(0)
  end
end

auto(data)
