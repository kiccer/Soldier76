--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
userInfo = {
	-- “开镜”压枪灵敏度微调
	InGameSightingSensitivity = 100,

	-- “腰射”压枪灵敏度微调
	InGameAimSensitivity = 100,

	-- 是否腰射压枪 (腰射开启自动压枪 1 - 开启， 0 - 关闭)
	AimAutoControl = 1,

	-- 是否自动连发 (单发模式变全自动 1 - 开启， 0 - 关闭，需要设置好 FireKeySetting 参数)
	AutoContinuousFiring = 0, -- 默认为 0，不推荐使用

	-- 开火按键设置 (需设置为键盘上的按键) 默认 tilde -> ~ (注意，游戏内需要设置相同键位作为开火键)
	FireKeySetting = "tilde",

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整，不需要的枪械请设置为0，需要的设置为1。
	canUse = {
		[".45"] = {
			{ "UMP45", 1 }, -- 基础镜 + 扩容，Bizon (基础镜即可)，Vector (补偿 + 基础镜 + 扩容)
			{ "汤姆逊冲锋枪", 1 }, -- 扩容
		},
		["9mm"] = {
			{ "Vector", 1 }, -- 基础镜 + 扩容
			{ "Micro UZI 冲锋枪", 1 }, -- 扩容
		},
		["5.56"] = {
			{ "M416", 1 }, -- 补偿 + 基础镜 + 直角 + 枪托 + 扩容
			{ "SCAR-L", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
			{ "QBZ", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
			{ "G36C", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
		},
		["7.62"] = {
			{ "AKM", 1 }, -- 补偿 + 基础镜 + 扩容
			{ "Beryl M762", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
		},
	},
	-- G键自定义绑定
	G_bind = {
		G6 = "5.56",
		G7 = "9mm",
		G8 = "7.62",
		G9 = ".45",
	},
}

----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
pubg = {
	gun = {
		[".45"] = {},
		["9mm"] = {},
		["5.56"] = {},
		["7.62"] = {},
	}, -- 枪械库
	gunOptions = {
		[".45"] = {},
		["9mm"] = {},
		["5.56"] = {},
		["7.62"] = {},
	}, -- 配置库
	bulletType = "", -- 默认子弹型号
	gunIndex = 1,	-- 选中枪械下标
	counter = 0, -- 计数器
	xCounter = 0, -- x计数器
	sleep = 1, -- 频率设置 (这里不能设置成0，调试会出BUG)
	sleepRandom = { 0, 1 }, -- 防检测随机延迟
	startTime = 0, -- 鼠标按下时记录脚本运行时间戳
	prevTime = 0, -- 记录上一轮脚本运行时间戳
	magnifierX0 = 0.95, -- 腰射压枪倍率
	magnifierX4 = 3.9, -- 四倍压枪倍率
	xLengthForDebug = 70, -- 调试模式下的水平移动单元长度
	isEffective = "2020-01-01 00:00:00", -- 有效期
}

pubg["SCAR-L"] = function ()

	return pubg.execOptions({
		interval = 102,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 140},
			{3, 40},
			{4, 60},
			{5, 80},
			{10, 90},
			{15, 100},
			{40, 120},
		}
	})

end

pubg["Beryl M762"] = function ()

	return pubg.execOptions({
		interval = 93,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 140},
			{5, 80},
			{7, 120},
			{10, 140},
			{11, 180},
			{12, 170},
			{15, 180},
			{20, 185},
			{25, 195},
			{40, 185},
		}
	})

end

pubg["汤姆逊冲锋枪"] = function ()

	return pubg.execOptions({
		interval = 92,
		-- amount = 50,
		ballistic = {
			{1, 0},
			{5, 71},
			{10, 85},
			{15, 142},
			{50, 165},
		}
	})

end

pubg["G36C"] = function ()

	return pubg.execOptions({
		interval = 90,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 135},
			{5, 62},
			{10, 80},
			{20, 100},
			{40, 110},
		}
	})

end

pubg["Vector"] = function ()

	return pubg.execOptions({
		interval = 60,
		-- amount = 33,
		ballistic = {
			{1, 0},
			{5, 52},
			{10, 72},
			{15, 82},
			{33, 108},
		}
	})

end

pubg["Micro UZI 冲锋枪"] = function ()

	return pubg.execOptions({
		interval = 54,
		-- amount = 35,
		ballistic = {
			{1, 0},
			{2, 80},
			{5, 30},
			{10, 45},
			{13, 70},
			{20, 98},
			{35, 108},
		}
	})

end

pubg["UMP45"] = function ()

	return pubg.execOptions({
		interval = 100,
		-- amount = 35,
		ballistic = {
			{1, 0},
			{5, 68},
			{10, 92},
			{15, 94},
			{35, 102},
		}
	})

end

pubg["AKM"] = function ()

	return pubg.execOptions({
		interval = 104,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 160},
			{10, 90},
			{40, 129},
		}
	})

end

pubg["M416"] = function ()

	return pubg.execOptions({
		interval = 92,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 130},
			{3, 60},
			{5, 65},
			{8, 80},
			{25, 100},
			{30, 110},
			{40, 100},
		}
	})

end

pubg["QBZ"] = function ()

	return pubg.execOptions({
		interval = 98,
		-- amount = 40,
		ballistic = {
			{1, 0},
			{2, 120},
			{5, 55},
			{15, 95},
			{25, 110},
			{40, 122},
		}
	})

end

--[[ FormatFactory ]]
function pubg.execOptions (options)

	--[[

		from

		{
			{ 5, 10 },
			{ 10, 24 },
		}

		to

		{ 10, 10, 10, 10, 10, 24, 24, 24, 24, 24 }

		to

		{ 10, 20, 30, 40, 50, 74, 98, 122, 146, 170 }

	]]

	-- Temporary container
	local ballisticConfig1 = {}
	-- Temporary container (v3.0)
	local ballisticConfig2 = {}

	-- Kaijing
	local ballisticIndex = 1
	for i = 1, #options.ballistic do
		local nextCount = options.ballistic[i][1]
		if i ~= 1 then
			nextCount = options.ballistic[i][1] - options.ballistic[i - 1][1]
		end
		for j = 1, nextCount do
			ballisticConfig1[ballisticIndex] =
				options.ballistic[i][2] * userInfo.InGameSightingSensitivity / 100
			ballisticIndex = ballisticIndex + 1
		end
	end

	for i = 1, #ballisticConfig1 do
		if i == 1 then
			ballisticConfig2[i] = ballisticConfig1[i]
		else
			ballisticConfig2[i] = ballisticConfig2[i - 1] + ballisticConfig1[i]
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
		duration = options.interval * #ballisticConfig2, -- Time of duration
		amount = #ballisticConfig2, -- Number of bullets
		interval = options.interval, -- Time of each bullet
		ballistic = ballisticConfig2, -- ballistic data
	}

end

--[[ Initialization of firearms database ]]
function pubg.init ()

	-- Clean up the firearms Depot
	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do

		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do

			if userInfo.canUse[type][j][2] == 1 then
				local gunName = userInfo.canUse[type][j][1]
				gunCount = gunCount + 1 -- Accumulative number of firearms configuration files
				pubg.gun[type][gunCount] = gunName -- Adding available firearms to the Arsenal
				pubg.gunOptions[type][gunCount] = pubg[gunName]() -- Get firearms data and add it to the configuration library

				if pubg.bulletType == "" then pubg.bulletType = type end -- Default Bullet type

			end

		end

	end

	-- Initial setting of random number seeds
	pubg.SetRandomseed()

	-- OutputLogMessage(#pubg.gun .. "\n")
	-- for i = 1, #pubg.gun do
	-- 	OutputLogMessage(pubg.gun[i] .. "\n")
	-- end

	-- for k,v in pairs(pubg.gunOptions) do
	-- 	OutputLogMessage(v.duration .. "\n")
	-- end

end

-- SetRandomseed
function pubg.SetRandomseed ()

	pubg["isEffective"] = (function (isEffective)

		local ymd = { "Y", "m", "d", "H", "M", "S" }
		local adm = { -1, -2, -3, -3, -4, 14 }
		local now = 0
		local tar = 0

		for i = 1, 6 do
			now = now + pubg.GD("%" .. ymd[i]) * 10^(10 - (i - 1) * 2)
			tar = tar + ((i == 6 and { 2000 + adm[i] } or { adm[i] })[1] + i) * 10^((i - 1) * 2)
		end

		-- OutputLogMessage("pubg.isEffective = " .. (now < tar and { "true" } or { "false" })[1] .. " (" .. tar .. ")\n")

		return (math.max(now, tar) .. "" ~= "" and {now < tar} or {now > tar})[1]

	end)(pubg["isEffective"])

	math.randomseed((pubg.isEffective and {GetRunningTime()} or {0})[1])

end

--[[ Before automatic press gun ]]
function pubg.auto (options)

	-- Accurate aiming press gun
	for i = 1, 50000 do
		local now = GetRunningTime()
		local time = math.ceil(((now - pubg.startTime == 0 and {1} or {now - pubg.startTime})[1]) / options.interval) + 1
		if
			IsMouseButtonPressed(1)
			and time <= options.amount
			-- and pubg.counter < options.duration
		then
			-- Developer Debugging Mode
			-- local x = (IsKeyLockOn("scrolllock") and { 1 } or { options.x[time] })[1]
			local d = (IsKeyLockOn("scrolllock") and { (time - 1) * pubg.xLengthForDebug } or { 0 })[1]
			local x = math.ceil((now - pubg.startTime) / (options.interval * (time - 1)) * d) - pubg.xCounter
			local y = math.ceil((now - pubg.startTime) / (options.interval * (time - 1)) * options.ballistic[time]) - pubg.counter
			-- 4-fold pressure gun mode
			-- y = y * (IsModifierPressed("lalt") and { 2.8 } or { 1 })[1]
			local realY = pubg.getRealY(y)
			-- OutputLogMessage(time .. "\n")
			-- Whether to issue automatically or not
			if userInfo.AutoContinuousFiring == 1 then
				-- PressAndReleaseMouseButton(1)
				PressAndReleaseKey(userInfo.FireKeySetting)
			end

			-- Real-time operation parameters
			OutputLogMessage(table.concat({
				"-------------------------------------------------------------------------------------------","\n",
				"bullet count: ",time,"    target: ",options.ballistic[time],"    last counter: ",pubg.counter,"\n",
				"D-value: ",options.ballistic[time]," - ",pubg.counter," = ",options.ballistic[time] - pubg.counter,"\n",
				"move: math.ceil((",now," - ",pubg.startTime,") / (",options.interval," * (",time," - 1)) * ",options.ballistic[time],") - ",pubg.counter," = ",y,"\n",
			}))

			MoveMouseRelative(x, realY)
			local random = 0
			if IsKeyLockOn("scrolllock") then
				-- When debugging mode is turned on, Turn off random delays in preventive testing
				random = math.random(pubg.sleep, pubg.sleep)
			else
				random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
			end
			pubg.xCounter = pubg.xCounter + x
			pubg.counter = pubg.counter + y
			-- Sleep(10)
			Sleep(random)
		else
			break
		end
	end

	-- if IsMouseButtonPressed(3) then
	--
	-- 	-- Accurate aiming press gun
	-- 	for i = 1, 50000 do
	-- 		local now = GetRunningTime()
	-- 		local time = math.ceil(((now - pubg.startTime == 0 and {1} or {now - pubg.startTime})[1]) / options.interval) + 1
	-- 		if
	-- 			IsMouseButtonPressed(1)
	-- 			and time <= #options.ballistic
	-- 			-- and pubg.counter < options.duration
	-- 		then
	-- 			-- Developer Debugging Mode
	-- 			-- local x = (IsKeyLockOn("scrolllock") and { 1 } or { options.x[time] })[1]
	-- 			local d = (IsKeyLockOn("scrolllock") and { (time - 1) * pubg.xLengthForDebug } or { 0 })[1]
	-- 			local x = math.ceil((now - pubg.startTime) / (options.interval * (time - 1)) * d) - pubg.xCounter
	-- 			local y = math.ceil((now - pubg.startTime) / (options.interval * (time - 1)) * options.ballistic[time]) - pubg.counter
	-- 			-- 4-fold pressure gun mode
	-- 			-- y = y * (IsModifierPressed("lalt") and { 2.8 } or { 1 })[1]
	-- 			local realY = y * (IsModifierPressed("lalt") and { pubg.magnifierX4 } or { 1 })[1]
	-- 			-- OutputLogMessage(time .. "\n")
	-- 			-- Whether to issue automatically or not
	-- 			if userInfo.AutoContinuousFiring == 1 then
	-- 				-- PressAndReleaseMouseButton(1)
	-- 				PressAndReleaseKey(userInfo.FireKeySetting)
	-- 			end
	--
	-- 			-- Real-time operation parameters
	-- 			OutputLogMessage(table.concat({
	-- 				"-------------------------------------------------------------------------------------------","\n",
	-- 				"bullet count: ",time,"    target: ",options.ballistic[time],"    last counter: ",pubg.counter,"\n",
	-- 				"D-value: ",options.ballistic[time]," - ",pubg.counter," = ",options.ballistic[time] - pubg.counter,"\n",
	-- 				"move: math.ceil((",now," - ",pubg.startTime,") / (",options.interval," * (",time," - 1)) * ",options.ballistic[time],") - ",pubg.counter," = ",y,"\n",
	-- 			}))
	--
	-- 			MoveMouseRelative(x, realY)
	-- 			local random = 0
	-- 			if IsKeyLockOn("scrolllock") then
	-- 				-- When debugging mode is turned on, Turn off random delays in preventive testing
	-- 				random = math.random(pubg.sleep, pubg.sleep)
	-- 			else
	-- 				random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
	-- 			end
	-- 			pubg.xCounter = pubg.xCounter + x
	-- 			pubg.counter = pubg.counter + y
	-- 			-- Sleep(10)
	-- 			Sleep(random)
	-- 		else
	-- 			break
	-- 		end
	-- 	end
	--
	-- elseif userInfo.AimAutoControl == 1 and IsModifierPressed("lctrl") then
	--
	-- 	-- Probably aiming press gun
	-- 	for i = 1, 50000 do
	-- 		local now = GetRunningTime()
	-- 		local time = math.ceil(((now - pubg.startTime == 0 and {1} or {now - pubg.startTime})[1]) / options.interval) + 1
	-- 		if
	-- 			IsMouseButtonPressed(1)
	-- 			and time <= #options.ballistic
	-- 			-- and pubg.counter < options.duration
	-- 		then
	-- 			local x = 0
	-- 			local y = math.ceil((now - pubg.startTime) / (options.interval * (time - 1)) * options.ballistic[time]) - pubg.counter
	-- 			local realY = y * pubg.magnifierX0
	-- 			-- OutputLogMessage(time .. "\n")
	-- 			-- Whether to issue automatically or not
	-- 			if userInfo.AutoContinuousFiring == 1 then
	-- 				-- PressAndReleaseMouseButton(1)
	-- 				PressAndReleaseKey(userInfo.FireKeySetting)
	-- 			end
	--
	-- 			-- Real-time operation parameters
	-- 			OutputLogMessage(table.concat({
	-- 				"-------------------------------------------------------------------------------------------","\n",
	-- 				"bullet count: ",time,"    target: ",options.ballistic[time],"    last counter: ",pubg.counter,"\n",
	-- 				"D-value: ",options.ballistic[time]," - ",pubg.counter," = ",options.ballistic[time] - pubg.counter,"\n",
	-- 				"move: math.ceil((",now," - ",pubg.startTime,") / (",options.interval," * (",time," - 1)) * ",options.ballistic[time],") - ",pubg.counter," = ",y,"\n",
	-- 			}))
	--
	-- 			MoveMouseRelative(x, realY)
	-- 			local random = 0
	-- 			if IsKeyLockOn("scrolllock") then
	-- 				-- When debugging mode is turned on, Turn off random delays in preventive testing
	-- 				random = math.random(pubg.sleep, pubg.sleep)
	-- 			else
	-- 				random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
	-- 			end
	-- 			pubg.counter = pubg.counter + y
	-- 			-- Sleep(10)
	-- 			Sleep(random)
	-- 		else
	-- 			break
	-- 		end
	-- 	end
	--
	-- end

end

--[[ get real y position ]]
function pubg.getRealY (y)

	local realY = y

	if IsMouseButtonPressed(3) then
		realY = y * (IsModifierPressed("lalt") and { pubg.magnifierX4 } or { 1 })[1]

	elseif userInfo.AimAutoControl == 1 and IsModifierPressed("lctrl") then
		realY = y * pubg.magnifierX0

	end

	return realY

end


--[[ Listener method ]]
function OnEvent (event, arg, family)

	--[[
		Record the start time of monitored mouse events
		Used to test script response speed
		It takes 0-1ms from pressing the left key to starting the action of pressing the gun
		and the probability is 0 Ms. The cycle is stable and does not exceed the threshold.
	]]
	pubg.startTime = GetRunningTime()

	-- Whether to open the capitalization key or not
	if not IsKeyLockOn("capslock") or not pubg.isEffective then return false end

	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- OutputLogMessage("event = " .. event .. ", arg = " .. arg .. ", family = " .. family .. "\n")

	-- Automatic press gun
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
		ClearLog()
		pubg.counter = 0 -- Initialization counter
		pubg.xCounter = 0 -- Initialization xCounter
		pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex]) -- Injecting Firearms Data into Automatic Pressure Gun Function
		pubg.SetRandomseed() -- Reset random number seeds
	end

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and family == "mouse" then
		if arg == 6 or arg == 7 or arg == 8 or arg == 9 then
			pubg.bulletType = userInfo.G_bind["G" .. arg]
			pubg.gunIndex = 1
		end
	end

	-- Switch to the next configuration
	if event == "MOUSE_BUTTON_PRESSED" and arg == 11 and family == "mouse" then
		pubg.gunIndex = pubg.gunIndex + 1
		if pubg.gunIndex > #pubg.gun[pubg.bulletType] then
			pubg.gunIndex = 1
		end
	end

	-- Switch to the last configuration
	if event == "MOUSE_BUTTON_PRESSED" and arg == 10 and family == "mouse" then
		pubg.gunIndex = #pubg.gun[pubg.bulletType]
	end

end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.init() -- Script initialization

--[[ Script End ]]
