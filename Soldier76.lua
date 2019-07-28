--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
-- 推荐边查阅帮助文档，边对下列内容进行修改。
-- 参考地址: https://github.com/kiccer/Soldier76#%E5%88%9D%E6%AC%A1%E4%BD%BF%E7%94%A8
userInfo = {

	-- 是否输出调试信息，关闭后可以减小 CPU 计算压力。建议调试时开启，调试完毕后关闭。(1 - 开启 | 0 - 关闭)
	debug = 1,

	-- CPU 负载等级，建议输入 1 ~ 30 之间的数字，不能小于 1 。值越小，压枪效果越好，值越大，帧数越高。(过分掉帧会直接影响压枪效果，请在保证帧数的情况下减小该值)
	cpuLoad = 5,

	-- 灵敏度调整
	sensitivity = {
		-- 开镜
		ADS = 100,
		-- 腰射
		Aim = 0.55,
		-- 二倍
		scopeX2 = 1.3,
		-- 三倍
		scopeX3 = 1.3,
		-- 四倍
		scopeX4 = 3.9,
		-- 六倍
		scopeX6 = 2.3,
	},

	-- 自动腰射，不使用自动腰射留空，使用则设置为键盘上按键，默认为 tilde -> ~ 键
	autoPressAimKey = "tilde",

	-- 是否自动连发 (单发模式变全自动 1 - 开启， 0 - 关闭)
	autoContinuousFiring = 1, -- 默认为 1

	-- 启动控制 (capslock - 使用大写锁定键控制 | numlock - 小键盘锁定键控制 | G_bind - 使用指令控制)
	startControl = "capslock",

	-- 瞄准设置 (default - 使用游戏默认设置 | recommend - 使用脚本推荐设置 | custom - 自定义设置)
	aimingSettings = "recommend",

	-- 当 aimingSettings = "custom" ，需要在此处设置自定义判断条件，通常配合 IsMouseButtonPressed 或 IsModifierPressed 使用，使用方法请查阅 G-series Lua API 参考文档.docx
	customAimingSettings = {
		-- 开镜判断
		ADS = function ()
			return false -- 判断条件，返回值为布尔型
		end,
		-- 腰射判断
		Aim = function ()
			return false -- 判断条件，返回值为布尔型
		end,
	},

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整，不需要的枪械请设置为0，需要的设置为1。
	canUse = {
		[".45"] = {
			{ "UMP45", 1 }, -- 基础镜 + 扩容，Bizon (基础镜即可)，Vector (补偿 + 基础镜 + 扩容) | Reddot + Mag，Bizon (Reddot)，Vector (Komp + Reddot + Mag)
			{ "Tommy Gun", 1 }, -- 扩容 | Mag
		},
		["9mm"] = {
			{ "Vector", 1 }, -- 基础镜 + 扩容 | Reddot + Mag
			{ "Micro UZI", 1 }, -- 扩容 | Mag
		},
		["5.56"] = {
			{ "M416", 1 }, -- 补偿 + 基础镜 + 直角 + 枪托 + 扩容 | Komp + Reddot + Triangular grip + Gunstock + Mag
			{ "SCAR-L", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "QBZ", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "G36C", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "M16A4", 1 }, -- 补偿 + 基础镜 + 枪托 + 扩容 | Komp + Reddot + Gunstock + Mag
		},
		["7.62"] = {
			{ "AKM", 1 }, -- 补偿 + 基础镜 + 扩容 | Komp + Reddot + Mag
			{ "Beryl M762", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "DP-28", 1 }, -- 基础镜 | Reddot
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
		["lalt + G6"] = "scopeX1",
		["lalt + G7"] = "scopeX3",
		["lalt + G8"] = "scopeX4",
		["lalt + G9"] = "scopeX2",
		["lalt + G10"] = "",
		["lalt + G11"] = "scopeX6",
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
		["ralt + G10"] = "last_in_canUse",
		["ralt + G11"] = "next_in_canUse",
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
----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
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
	allCanUse = {}, -- 所有可用枪械
	allCanUse_index = 1, -- 所有可用枪械列表索引
	allCanUse_count = 0, -- 所有可用总数量
	bulletType = "", -- 默认子弹型号
	gunIndex = 1,	-- 选中枪械下标
	counter = 0, -- 计数器
	xCounter = 0, -- x计数器
	sleep = userInfo.cpuLoad, -- 频率设置 (这里不能设置成0，调试会出BUG)
	sleepRandom = { userInfo.cpuLoad, userInfo.cpuLoad + 5 }, -- 防检测随机延迟
	startTime = 0, -- 鼠标按下时记录脚本运行时间戳
	prevTime = 0, -- 记录上一轮脚本运行时间戳
	scopeX1 = 1, -- 基瞄压枪倍率 (裸镜、红点、全息、侧瞄)
	scopeX2 = userInfo.sensitivity.scopeX2, -- 二倍压枪倍率
	scopeX3 = userInfo.sensitivity.scopeX3, -- 三倍压枪倍率
	scopeX4 = userInfo.sensitivity.scopeX4, -- 四倍压枪倍率
	scopeX6 = userInfo.sensitivity.scopeX6, -- 六倍压枪倍率
	scope_current = "scopeX1", -- 当前使用倍镜
	generalSensitivityRatio = userInfo.sensitivity.ADS / 100, -- 按比例调整灵敏度
	isEffective = "2020-01-01 00:00:00", -- 有效期
	isStart = false, -- 是否是启动状态
	G1 = false, -- G1键状态
	currentTime = 0, -- 此刻
	bulletIndex = 0, -- 第几颗子弹
}

pubg.xLengthForDebug = pubg.generalSensitivityRatio * 60 -- 调试模式下的水平移动单元长度
-- 渲染节点
pubg.renderDom = {
	switchTable = "",
	separator = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n", -- 分割线
	combo_key = "G-key", -- 组合键
	cmd = "cmd", -- 指令
	autoLog = "No operational data yet.\n", -- 压枪过程产生的数据输出
}

-- 是否开镜或瞄准
function pubg.isAimingState (mode)
	local switch = {

		-- 开镜
		["ADS"] = function ()
			if userInfo.aimingSettings == "recommend" then
				return IsMouseButtonPressed(3) and not IsModifierPressed("lshift")
			elseif userInfo.aimingSettings == "default" then
				return not IsModifierPressed("lshift") and not IsModifierPressed("lalt")
			elseif userInfo.aimingSettings == "custom" then
				return userInfo.customAimingSettings.ADS()
			end
		end,

		-- 腰射
		["Aim"] = function ()
			if userInfo.aimingSettings == "recommend" then
				if userInfo.autoPressAimKey == "" then
					return IsModifierPressed("lctrl")
				else
					return not IsModifierPressed("lshift") and not IsModifierPressed("lalt")
				end
			elseif userInfo.aimingSettings == "default" then
				return IsMouseButtonPressed(3)
			elseif userInfo.aimingSettings == "custom" then
				return userInfo.customAimingSettings.Aim()
			end
		end,

	}

	return switch[mode]()
end

pubg["M16A4"] = function ()

	return pubg.execOptions({
		interval = 108,
		ballistic = {
			{1, 0},
			{2, 140},
			{3, 47},
			{4, 68},
			{5, 87},
			{10, 102},
			{20, 119},
			{35, 121},
			{40, 127},
		}
	})

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
			{10, 92},
			{15, 100},
			{20, 110},
			{35, 110},
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
			{7, 122},
			{10, 142},
			{11, 186},
			{12, 176},
			{15, 186},
			{20, 188},
			{25, 196},
			{40, 190},
		}
	})

end

pubg["Tommy Gun"] = function ()

	return pubg.execOptions({
		interval = 94,
		ballistic = {
			{1, 0},
			{5, 71},
			{10, 84},
			{15, 145},
			{50, 169},
		}
	})

end

pubg["G36C"] = function ()

	return pubg.execOptions({
		interval = 91,
		ballistic = {
			{1, 0},
			{2, 135},
			{5, 62},
			{10, 80},
			{20, 101},
			{25, 112},
			{40, 110},
		}
	})

end

pubg["Vector"] = function ()

	return pubg.execOptions({
		interval = 61,
		ballistic = {
			{1, 0},
			{5, 52},
			{10, 72},
			{15, 89},
			{33, 119},
		}
	})

end

pubg["Micro UZI"] = function ()

	return pubg.execOptions({
		interval = 56,
		ballistic = {
			{1, 0},
			{2, 80},
			{5, 30},
			{10, 47},
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
			{5, 69},
			{10, 93},
			{15, 94},
			{35, 101},
		}
	})

end

pubg["AKM"] = function ()

	return pubg.execOptions({
		interval = 107,
		ballistic = {
			{1, 0},
			{2, 157},
			{5, 91},
			{10, 100},
			{35, 126},
			{40, 124},
		}
	})

end

pubg["M416"] = function ()

	return pubg.execOptions({
		interval = 93,
		ballistic = {
			{1, 0},
			{2, 132},
			{3, 62},
			{5, 68},
			{8, 90},
			{25, 103},
			{30, 108},
			{40, 102},
		}
	})

end

pubg["QBZ"] = function ()

	return pubg.execOptions({
		interval = 99,
		ballistic = {
			{1, 0},
			{2, 125},
			{5, 53},
			{15, 97},
			{25, 117},
			{30, 116},
			{35, 115},
			{40, 126},
		}
	})

end

pubg["DP-28"] = function ()

	return pubg.execOptions({
		interval = 116,
		ballistic = {
			{1, 0},
			{7, 106},
			{10, 166},
			{20, 196},
			{40, 191},
			{47, 206},
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
				options.ballistic[i][2] * pubg.generalSensitivityRatio
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
				-- one series
				gunCount = gunCount + 1 -- Accumulative number of firearms configuration files
				pubg.gun[type][gunCount] = gunName -- Adding available firearms to the Arsenal
				pubg.gunOptions[type][gunCount] = pubg[gunName]() -- Get firearms data and add it to the configuration library
				-- all canUse
				pubg.allCanUse_count = pubg.allCanUse_count + 1 -- Total plus one
				pubg.allCanUse[pubg.allCanUse_count] = gunName -- All available firearms

				if pubg.bulletType == "" then pubg.bulletType = type end -- Default Bullet type

			end

		end

	end

	-- Initial setting of random number seeds
	pubg.SetRandomseed()
	pubg.outputLogRender()

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

		return (math.max(now, tar) .. "" ~= "" and {now < tar} or {now > tar})[1]

	end)(pubg["isEffective"])

	math.randomseed((pubg.isEffective and {GetRunningTime()} or {0})[1])

end

--[[ Before automatic press gun ]]
function pubg.auto (options)

	-- Accurate aiming press gun
	pubg.currentTime = GetRunningTime()
	pubg.bulletIndex = math.ceil(((pubg.currentTime - pubg.startTime == 0 and {1} or {pubg.currentTime - pubg.startTime})[1]) / options.interval) + 1

	if pubg.bulletIndex > options.amount then return false end
	-- Developer Debugging Mode
	local d = (IsKeyLockOn("scrolllock") and { (pubg.bulletIndex - 1) * pubg.xLengthForDebug } or { 0 })[1]
	local x = math.ceil((pubg.currentTime - pubg.startTime) / (options.interval * (pubg.bulletIndex - 1)) * d) - pubg.xCounter
	local y = math.ceil((pubg.currentTime - pubg.startTime) / (options.interval * (pubg.bulletIndex - 1)) * options.ballistic[pubg.bulletIndex]) - pubg.counter
	-- 4-fold pressure gun mode
	local realY = pubg.getRealY(y)
	MoveMouseRelative(x, realY)
	-- Whether to issue automatically or not
	if userInfo.autoContinuousFiring == 1 then
		PressAndReleaseMouseButton(1)
	end

	-- Real-time operation parameters
	pubg.autoLog(options, y)
	pubg.outputLogRender()

	pubg.xCounter = pubg.xCounter + x
	pubg.counter = pubg.counter + y

	pubg.autoSleep(IsKeyLockOn("scrolllock"))

end

--[[ Sleep of pubg.auto ]]
function pubg.autoSleep (isTest)
	local random = 0
	if isTest then
		-- When debugging mode is turned on, Turn off random delays in preventive testing
		random = math.random(pubg.sleep, pubg.sleep)
	else
		random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
	end
	-- Sleep(10)
	Sleep(random)
end

--[[ get real y position ]]
function pubg.getRealY (y)
	local realY = y

	if pubg.isAimingState("ADS") then
		realY = y * pubg[pubg.scope_current]

	elseif pubg.isAimingState("Aim") then
		realY = y * userInfo.sensitivity.Aim * pubg.generalSensitivityRatio

	end

	return realY
end

--[[ set bullet type ]]
function pubg.setBulletType (bulletType)
	pubg.bulletType = bulletType
	pubg.gunIndex = 1
	pubg.allCanUse_index = 0

	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do
		local type = forList[i]
		if type ==  bulletType then
			pubg.allCanUse_index = pubg.allCanUse_index + 1
			break
		else
			pubg.allCanUse_index = pubg.allCanUse_index + #pubg.gun[type]
		end
	end

	pubg.isStart = true
end

--[[ set current scope ]]
function pubg.setScope (scope)
	pubg.scope_current = scope
end

--[[ set current gun ]]
function pubg.setGun (gunName)

	local forList = { ".45", "9mm", "5.56", "7.62" }
	local allCanUse_index = 0

	for i = 1, #forList do

		local type = forList[i]
		local gunIndex = 0
		local selected = false

		for j = 1, #userInfo.canUse[type] do
			if userInfo.canUse[type][j][2] == 1 then
				gunIndex = gunIndex + 1
				allCanUse_index = allCanUse_index + 1
				if userInfo.canUse[type][j][1] == gunName then
					pubg.bulletType = type
					pubg.gunIndex = gunIndex
					pubg.allCanUse_index = allCanUse_index
					selected = true
					break
				end
			end
		end

		if selected then break end

	end

	pubg.isStart = true
end

--[[ Consider all available firearms as an entire list ]]
function pubg.findInCanUse (cmd)

	if "first_in_canUse" == cmd then
		pubg.allCanUse_index = 1
	elseif "next_in_canUse" == cmd then
		if pubg.allCanUse_index < #pubg.allCanUse then
			pubg.allCanUse_index = pubg.allCanUse_index + 1
		end
	elseif "last_in_canUse" == cmd then
		pubg.allCanUse_index = #pubg.allCanUse
	end

	pubg.setGun(pubg.allCanUse[pubg.allCanUse_index])
end

--[[ Switching guns in the same series ]]
function pubg.findInSeries (cmd)
	if "first" == cmd then
		pubg.gunIndex = 1
	elseif "next" == cmd then
		if pubg.gunIndex < #pubg.gun[pubg.bulletType] then
			pubg.gunIndex = pubg.gunIndex + 1
		end
	elseif "last" == cmd then
		pubg.gunIndex = #pubg.gun[pubg.bulletType]
	end

	pubg.setGun(pubg.gun[pubg.bulletType][pubg.gunIndex])
end

--[[ Script running status ]]
function pubg.runStatus ()
	if userInfo.startControl == "capslock" then
		return IsKeyLockOn("capslock")
	elseif userInfo.startControl == "numlock" then
		return IsKeyLockOn("numlock")
	elseif userInfo.startControl == "G_bind" then
		return pubg.isStart
	end
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
		["scopeX1"] = pubg.setScope,
		["scopeX2"] = pubg.setScope,
		["scopeX3"] = pubg.setScope,
		["scopeX4"] = pubg.setScope,
		["scopeX6"] = pubg.setScope,
		["UMP45"] = pubg.setGun,
		["Tommy Gun"] = pubg.setGun,
		["Vector"] = pubg.setGun,
		["Micro UZI"] = pubg.setGun,
		["M416"] = pubg.setGun,
		["SCAR-L"] = pubg.setGun,
		["QBZ"] = pubg.setGun,
		["G36C"] = pubg.setGun,
		["M16A4"] = pubg.setGun,
		["AKM"] = pubg.setGun,
		["Beryl M762"] = pubg.setGun,
		["DP-28"] = pubg.setGun,
		["first"] = pubg.findInSeries,
		["next"] = pubg.findInSeries,
		["last"] = pubg.findInSeries,
		["first_in_canUse"] = pubg.findInCanUse,
		["next_in_canUse"] = pubg.findInCanUse,
		["last_in_canUse"] = pubg.findInCanUse,
		["off"] = function ()
			pubg.isStart = false
		end,
	}

	if pubg.ok then switch[cmd](cmd) end
end

--[[ autputLog render ]]
function pubg.outputLogRender ()
	if userInfo.debug == 0 then return false end
	if not pubg.G1 then
		pubg.renderDom.switchTable = pubg.outputLogGunSwitchTable()
	end
	local resStr = table.concat({
		"\n>> [\"", pubg.renderDom.combo_key, "\"] = \"", pubg.renderDom.cmd, "\" <<\n",
		pubg.renderDom.separator,
		pubg.renderDom.switchTable,
		pubg.renderDom.separator,
		pubg.outputLogGunInfo(),
		pubg.renderDom.separator,
		pubg.renderDom.autoLog,
		pubg.renderDom.separator,
	})
	ClearLog()
	OutputLogMessage(resStr)
end

--[[ Output switching table ]]
function pubg.outputLogGunSwitchTable ()
	local forList = { ".45", "9mm", "5.56", "7.62" }
	local allCount = 0
	local resStr = "      canUse_i\t      series_i\t      Series\t      Gun Name\n\n"

	for i = 1, #forList do
		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do
			if userInfo.canUse[type][j][2] == 1 then
				local gunName = userInfo.canUse[type][j][1]
				local tag = gunName == pubg.gun[pubg.bulletType][pubg.gunIndex] and "=> " or "      "
				gunCount = gunCount + 1
				allCount = allCount + 1
				resStr = table.concat({ resStr, tag, allCount, "\t", tag, gunCount, "\t", tag, type, "\t", tag, gunName, "\n" })
			end
		end

	end

	return resStr
end

-- output Log Gun Info
function pubg.outputLogGunInfo ()
	local k = pubg.bulletType
	local i = pubg.gunIndex
	local gunName = pubg.gun[k][i]
	local resStr = ""

	resStr = table.concat({
		resStr,
		"Currently scope: [ " .. pubg.scope_current .. " ]\n",
		"Currently series: [ ", k, " ]\n",
		"Currently index in series: [ ", i, " / ", #pubg.gun[k], " ]\n",
		"Currently index in canUse: [ ", pubg.allCanUse_index, " / ", pubg.allCanUse_count, " ]\n",
		"Recoil table of [ ", gunName, " ]:\n",
		pubg.outputLogRecoilTable(),
	})

	return resStr
end

--[[ output recoil table log ]]
function pubg.outputLogRecoilTable ()
	local k = pubg.bulletType
	local i = pubg.gunIndex
	local resStr = "{ "
	for j = 1, #pubg.gunOptions[k][i].ballistic do
		local num = pubg.gunOptions[k][i].ballistic[j]
		resStr = table.concat({ resStr, num })
		if j ~= #pubg.gunOptions[k][i].ballistic then
			resStr = table.concat({ resStr, ", " })
		end
	end

	resStr = table.concat({ resStr, " }\n" })

	return resStr
end

--[[ log of pubg.auto ]]
function pubg.autoLog (options, y)
	local resStr = ""
	resStr = table.concat({
		resStr,
		"----------------------------------- Automatically counteracting gun recoil -----------------------------------\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
		"bullet index: ", pubg.bulletIndex, "    target counter: ", options.ballistic[pubg.bulletIndex], "    current counter: ", pubg.counter, "\n",
		"D-value(target - current): ", options.ballistic[pubg.bulletIndex], " - ", pubg.counter, " = ", options.ballistic[pubg.bulletIndex] - pubg.counter, "\n",
		"move: math.ceil((", pubg.currentTime, " - ", pubg.startTime, ") / (", options.interval, " * (", pubg.bulletIndex, " - 1)) * ", options.ballistic[pubg.bulletIndex], ") - ", pubg.counter, " = ", y, "\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
	})
	pubg.renderDom.autoLog = resStr
end

function pubg.PressOrRelaseAimKey (toggle)
	if userInfo.autoPressAimKey ~= "" then
		if toggle then
			PressKey(userInfo.autoPressAimKey)
		else
			ReleaseKey(userInfo.autoPressAimKey)
		end
	end
end

--[[ Automatic press gun ]]
function pubg.OnEvent_NoRecoil (event, arg, family)
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" and pubg.ok then
		if not pubg.runStatus() then return false end
		if userInfo.aimingSettings ~= "default" and not IsMouseButtonPressed(3) then
			pubg.PressOrRelaseAimKey(true)
		end
		if pubg.isAimingState("ADS") or pubg.isAimingState("Aim") then
			pubg.startTime = GetRunningTime()
			pubg.G1 = true
			SetMKeyState(1)
		end
	end

	if event == "MOUSE_BUTTON_RELEASED" and arg == 1 and family == "mouse" then
		pubg.PressOrRelaseAimKey(false)
		pubg.G1 = false
		pubg.counter = 0 -- Initialization counter
		pubg.xCounter = 0 -- Initialization xCounter
		pubg.SetRandomseed() -- Reset random number seeds
	end

	if event == "M_PRESSED" and arg == 1 and pubg.G1 and pubg.ok then
		pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex])
		SetMKeyState(1)
	end
end

--[[ Listener method ]]
function OnEvent (event, arg, family)

	-- Whether to open the capitalization key or not
	if not pubg.ok then return false end

	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- OutputLogMessage("event = " .. event .. ", arg = " .. arg .. ", family = " .. family .. "\n")

	pubg.OnEvent_NoRecoil(event, arg, family)

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and arg >=3 and arg <= 11 and family == "mouse" and pubg.ok then
		-- if not pubg.runStatus() and userInfo.startControl ~= "G_bind" then return false end
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
		modifier = modifier .. arg -- Get the combination key
		pubg.renderDom.combo_key = modifier -- Save combination keys
		pubg.renderDom.cmd = userInfo.G_bind[modifier] -- Save instruction name
		pubg.runCmd(userInfo.G_bind[modifier]) -- Execution instructions
		pubg.outputLogRender() -- Call log rendering method to output information
	end

	-- Script deactivated event
	if event == "PROFILE_DEACTIVATED" then
		pubg.PressOrRelaseAimKey(false)
	end

end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.ok = pubg.isEffective
pubg.init() -- Script initialization

--[[ Script End ]]
