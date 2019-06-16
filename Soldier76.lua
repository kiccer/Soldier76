--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
-- 推荐边查阅帮助文档，边对下列内容进行修改。
-- 参考地址: https://github.com/kiccer/Soldier76#%E5%88%9D%E6%AC%A1%E4%BD%BF%E7%94%A8
userInfo = {
	-- “开镜”压枪灵敏度微调
	InGameSightingSensitivity = 103,

	-- “腰射”压枪灵敏度微调
	InGameAimSensitivity = 103,

	-- 是否腰射压枪 (腰射开启自动压枪 1 - 开启， 0 - 关闭)
	AimAutoControl = 1,

	-- 是否自动连发 (单发模式变全自动 1 - 开启， 0 - 关闭，需要设置好 FireKeySetting 参数)
	AutoContinuousFiring = 0, -- 默认为 0，不推荐使用

	-- 开火按键设置 (需设置为键盘上的按键) 默认 tilde -> ~ (注意，游戏内需要设置相同键位作为开火键)
	FireKeySetting = "tilde",

	-- 瞄准设置 (default - 使用游戏默认设置 | recommend - 使用脚本推荐设置 | custom - 自定义设置)
	AimingSettings = "recommend",

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整，不需要的枪械请设置为0，需要的设置为1。
	canUse = {
		[".45"] = {
			{ "UMP45", 1 }, -- 基础镜 + 扩容，Bizon (基础镜即可)，Vector (补偿 + 基础镜 + 扩容)
			{ "Tommy Gun", 1 }, -- 扩容
		},
		["9mm"] = {
			{ "Vector", 1 }, -- 基础镜 + 扩容
			{ "Micro UZI", 1 }, -- 扩容
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
			{ "DP-28", 1 }, -- 基础镜
		},
	},

	-- G键自定义绑定
	-- 可绑定指令请参考: https://github.com/kiccer/Soldier76#%E6%8C%87%E4%BB%A4%E5%88%97%E8%A1%A8
	G_bind = {
		-- G
		["G3"] = "",
		["G4"] = "",
		["G5"] = "",
		["G6"] = "5.56",
		["G7"] = "9mm",
		["G8"] = "7.62",
		["G9"] = ".45",
		["G10"] = "last",
		["G11"] = "next",
		-- lalt + G
		["lalt + G3"] = "",
		["lalt + G4"] = "",
		["lalt + G5"] = "",
		["lalt + G6"] = "magnifierX1",
		["lalt + G7"] = "magnifierX3",
		["lalt + G8"] = "magnifierX6",
		["lalt + G9"] = "magnifierX2",
		["lalt + G10"] = "",
		["lalt + G11"] = "magnifierX4",
		-- lctrl + G
		["lctrl + G3"] = "",
		["lctrl + G4"] = "",
		["lctrl + G5"] = "",
		["lctrl + G6"] = "",
		["lctrl + G7"] = "",
		["lctrl + G8"] = "",
		["lctrl + G9"] = "",
		["lctrl + G10"] = "",
		["lctrl + G11"] = "",
		-- lshift + G
		["lshift + G3"] = "",
		["lshift + G4"] = "",
		["lshift + G5"] = "",
		["lshift + G6"] = "",
		["lshift + G7"] = "",
		["lshift + G8"] = "",
		["lshift + G9"] = "",
		["lshift + G10"] = "",
		["lshift + G11"] = "",
		-- ralt + G
		["ralt + G3"] = "",
		["ralt + G4"] = "",
		["ralt + G5"] = "",
		["ralt + G6"] = "",
		["ralt + G7"] = "",
		["ralt + G8"] = "",
		["ralt + G9"] = "",
		["ralt + G10"] = "",
		["ralt + G11"] = "",
		-- rctrl + G
		["rctrl + G3"] = "",
		["rctrl + G4"] = "",
		["rctrl + G5"] = "",
		["rctrl + G6"] = "",
		["rctrl + G7"] = "",
		["rctrl + G8"] = "",
		["rctrl + G9"] = "",
		["rctrl + G10"] = "",
		["rctrl + G11"] = "",
		-- rshift + G
		["rshift + G3"] = "",
		["rshift + G4"] = "",
		["rshift + G5"] = "",
		["rshift + G6"] = "",
		["rshift + G7"] = "",
		["rshift + G8"] = "",
		["rshift + G9"] = "",
		["rshift + G10"] = "",
		["rshift + G11"] = "",
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
	magnifierX1 = 1, -- 基瞄压枪倍率 (裸镜、红点、全息、侧瞄)
	magnifierX2 = 1.3, -- 二倍压枪倍率
	magnifierX3 = 1.3, -- 三倍压枪倍率
	magnifierX4 = 3.9, -- 四倍压枪倍率
	magnifierX6 = 2.3, -- 六倍压枪倍率
	magnifier_current = "magnifierX1", -- 当前使用倍镜
	xLengthForDebug = 60 * userInfo.InGameSightingSensitivity / 100, -- 调试模式下的水平移动单元长度
	isEffective = "2020-01-01 00:00:00", -- 有效期
}

-- 射击准备
function pubg.isAimingState (modeIndex)
	local switch = {

		-- 开镜
		[1] = function ()
			if userInfo.AimingSettings == "recommend" then
				return IsMouseButtonPressed(3) and not IsModifierPressed("lshift")
			elseif userInfo.AimingSettings == "default" then
				return not IsModifierPressed("lshift") and not IsModifierPressed("lalt")
			elseif userInfo.AimingSettings == "custom" then
				-- 自定义设置判断条件 (布尔型)
				-- Customize Setting Judgment Conditions...{Type: Boolean}
				return false -- or true
			end
		end,

		-- 腰射
		[2] = function ()
			if userInfo.AimingSettings == "recommend" then
				return userInfo.AimAutoControl == 1 and IsModifierPressed("lctrl")
			elseif userInfo.AimingSettings == "default" then
				return IsMouseButtonPressed(3)
			elseif userInfo.AimingSettings == "custom" then
				-- 自定义设置判断条件 (布尔型)
				-- Customize Setting Judgment Conditions...{Type: Boolean}
				return false -- or true
			end
		end,

	}

	return switch[modeIndex]()
end

pubg["SCAR-L"] = function ()

	return pubg.execOptions({
		interval = 102,
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

pubg["Tommy Gun"] = function ()

	return pubg.execOptions({
		interval = 92,
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
		ballistic = {
			{1, 0},
			{5, 52},
			{10, 72},
			{15, 82},
			{33, 108},
		}
	})

end

pubg["Micro UZI"] = function ()

	return pubg.execOptions({
		interval = 54,
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

pubg["DP-28"] = function ()

	return pubg.execOptions({
		interval = 116,
		ballistic = {
			{1, 0},
			{7, 100},
			{10, 160},
			{20, 190},
			{40, 195},
			{47, 200},
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
	pubg.outputLogGunInfo()

end

-- outputLogGunInfo
function pubg.outputLogGunInfo ()

	local k = pubg.bulletType
	local i = pubg.gunIndex
	local gunName = pubg.gun[k][i]
	OutputLogMessage("Currently selected gun: " .. gunName .. "\n{ ")
	for j = 1, #pubg.gunOptions[k][i].ballistic do
		local num = pubg.gunOptions[k][i].ballistic[j]
		OutputLogMessage(num .. ", ")
	end
	OutputLogMessage("}\n\n")

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
			pubg.counter = 0 -- Initialization counter
			pubg.xCounter = 0 -- Initialization xCounter
			pubg.SetRandomseed() -- Reset random number seeds
			break
		end
	end

end

--[[ get real y position ]]
function pubg.getRealY (y)
	local realY = y

	if pubg.isAimingState(1) then
		-- realY = y * (IsModifierPressed("lalt") and { pubg.magnifierX4 } or { 1 })[1]
		realY = y * pubg[pubg.magnifier_current]

	elseif pubg.isAimingState(2) then
		realY = y * pubg.magnifierX0 * userInfo.InGameAimSensitivity / 100

	end

	return realY
end

--[[ set bullet type ]]
function pubg.setBulletType (bulletType)
	pubg.bulletType = bulletType
	pubg.gunIndex = 1
	pubg.outputLogGunInfo()
end

--[[ set current magnifier ]]
function pubg.setMagnifier (magnifier)
	pubg.magnifier_current = magnifier
	OutputLogMessage("\nCurrent magnifier: " .. magnifier .. "\n")
end

--[[ G key command binding ]]
function pubg.runCmd (cmd)
	if cmd == "" then cmd = "none" end
	local switch = {

		["none"] = function () end,

		[".45"] = pubg.setBulletType,

		["9mm"] = pubg.setBulletType,

		["5.56"] = pubg.setBulletType,

		["7.62"] = pubg.setBulletType,

		["magnifierX1"] = pubg.setMagnifier,

		["magnifierX2"] = pubg.setMagnifier,

		["magnifierX3"] = pubg.setMagnifier,

		["magnifierX4"] = pubg.setMagnifier,

		["magnifierX6"] = pubg.setMagnifier,

		["first"] = function ()
			pubg.gunIndex = 1
			pubg.outputLogGunInfo()
		end,

		["next"] = function ()
			if pubg.gunIndex < #pubg.gun[pubg.bulletType] then
				pubg.gunIndex = pubg.gunIndex + 1
			end
			-- 切换至底部将不再从头开始
			-- pubg.gunIndex = pubg.gunIndex + 1
			-- if pubg.gunIndex > #pubg.gun[pubg.bulletType] then
			-- 	pubg.gunIndex = 1
			-- end
			pubg.outputLogGunInfo()
		end,

		["last"] = function ()
			pubg.gunIndex = #pubg.gun[pubg.bulletType]
			pubg.outputLogGunInfo()
		end,

	}

	switch[cmd](cmd)
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
		if pubg.isAimingState(1) or pubg.isAimingState(2) then
			pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex]) -- Injecting Firearms Data into Automatic Pressure Gun Function
		end
	end

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and family == "mouse" then
		if arg >=3 and arg <= 11 then
			local modifier = "G"
			if IsModifierPressed("lalt") then
				modifier = "lalt + " .. modifier
			elseif IsModifierPressed("lctrl") then
				modifier = "lctrl + " .. modifier
			elseif IsModifierPressed("lshift") then
				modifier = "lshift + " .. modifier
			elseif IsModifierPressed("ralt") then
				modifier = "ralt + " .. modifier
			elseif IsModifierPressed("rctrl") then
				modifier = "rctrl + " .. modifier
			elseif IsModifierPressed("rshift") then
				modifier = "rshift + " .. modifier
			end
			modifier = modifier .. arg
			OutputLogMessage("\nEfficient operation: " .. modifier .. "\n")
			pubg.runCmd(userInfo.G_bind[modifier])
		end
	end

end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.init() -- Script initialization

--[[ Script End ]]
