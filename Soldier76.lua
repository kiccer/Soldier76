--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
-- 推荐边查阅帮助文档，边对下列内容进行修改。
-- 参考地址: https://github.com/kiccer/Soldier76#%E5%88%9D%E6%AC%A1%E4%BD%BF%E7%94%A8
-- It is recommended to review the help documents and modify the following contents.
userInfo = {

	-- 是否输出调试信息，关闭后可以减小 CPU 计算压力。建议调试时开启，调试完毕后关闭。(1 - 开启 | 0 - 关闭)
	-- Whether to output debugging information, the CPU calculation pressure can be reduced after close.
	-- It is recommended to turn it on during debugging and turn it off after debugging.
	-- (0 - Disable | 1 - Enable)
	debug = 1,

	-- CPU 负载等级，建议输入 1 ~ 30 之间的数字，不能小于 1 。值越小，压枪效果越好，值越大，帧数越高。(过分掉帧会直接影响压枪效果，请在保证帧数的情况下减小该值)
	-- CPU load level, It is recommended to enter a number between 1 and 30, cannot be less than 1.
	-- The lower the value is, the better the effect is, the higher the value, the higher the number of frames.
	-- (excessive frame dropping will directly affect the gun pressing effect, please reduce the value while ensuring the frame number)
	cpuLoad = 2,

	-- 灵敏度调整 | Sensitivity adjustment
	sensitivity = {
		-- 开镜 | sighting mirror
		ADS = 100,
		-- 腰射 | take aim
		Aim = 0.55,
		-- 二倍 | twice scope
		scopeX2 = 1.3,
		-- 三倍 | trebling scope
		scopeX3 = 1.3,
		-- 四倍 | quadruple scope
		scopeX4 = 3.9,
		-- 六倍 | sixfold scope
		scopeX6 = 2.3,
	},

	-- 自动腰射，不使用自动腰射留空，使用则设置为键盘上按键
	-- Auto aim, leave blank without auto aim, set as the key on the keyboard when using.
	autoPressAimKey = "",

	-- 启动控制 (capslock - 使用大写锁定键控制 | numlock - 小键盘锁定键控制 | G_bind - 使用指令控制) | Start up control
	startControl = "capslock",

	-- 瞄准设置 (default - 使用游戏默认设置 | recommend - 使用脚本推荐设置 | custom - 自定义设置 | ctrlmode - 下蹲模式) | Aiming setting
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

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整。
	-- 模式：0 - 不启用 | 1 - 启用 | 2 - 开启连点
	-- 系数：枪械自身系数，基于 ADS 进行调整 (ADS为全局系数，此处为自身系数)
	-- 下蹲系数：下蹲时的系数，基于 ADS 和 自身系数
	canUse = {
		[".45"] = {
			-- 枪械             模式         系数        下蹲系数
			{ "UMP45",          1,          1,          0.8 }, -- 基础镜 + 扩容，Bizon (基础镜即可)，Vector (补偿 + 基础镜 + 扩容) | Reddot + Mag，Bizon (Reddot)，Vector (Komp + Reddot + Mag)
			{ "Tommy Gun",      1,          1,          0.8 }, -- 扩容 | Mag
		},
			-- 枪械             模式         系数        下蹲系数
		["9mm"] = {
			{ "Vector",         1,          1,          0.8 }, -- 基础镜 + 扩容 | Reddot + Mag
			{ "Micro UZI",      1,          1,          0.8 }, -- 扩容 | Mag
		},
		["5.56"] = {
			-- 枪械             模式         系数        下蹲系数
			{ "M416",           1,          1,          0.8 }, -- 补偿 + 基础镜 + 直角 + 枪托 + 扩容 | Komp + Reddot + Triangular grip + Gunstock + Mag
			{ "SCAR-L",         1,          1,          0.8 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "QBZ",            1,          1,          0.8 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "G36C",           1,          1,          0.8 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "M16A4",          2,          1,          0.8 }, -- 补偿 + 基础镜 + 枪托 + 扩容 | Komp + Reddot + Gunstock + Mag
		},
		["7.62"] = {
			-- 枪械             模式         系数        下蹲系数
			{ "AKM",            1,          1,          0.8 }, -- 补偿 + 基础镜 + 扩容 | Komp + Reddot + Mag
			{ "Beryl M762",     1,          1,          0.8 }, -- 补偿 + 基础镜 + 直角 + 扩容 | Komp + Reddot + Triangular grip + Mag
			{ "DP-28",          0,          1,          0.8 }, -- 基础镜 | Reddot
		},
	},

	-- G键自定义绑定，多余的组合键可以删除
	-- 可绑定指令请参考: https://github.com/kiccer/Soldier76#%E6%8C%87%E4%BB%A4%E5%88%97%E8%A1%A8
	-- 指令绑定演示参考: https://github.com/kiccer/Soldier76#g_bind-%E6%8C%87%E4%BB%A4%E7%BB%91%E5%AE%9A%E6%BC%94%E7%A4%BA
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
		["lalt + G6"] = "",
		["lalt + G7"] = "",
		["lalt + G8"] = "",
		["lalt + G9"] = "",
		["lalt + G10"] = "",
		["lalt + G11"] = "",
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
		["lshift + G6"] = "fast_pickup",
		["lshift + G7"] = "",
		["lshift + G8"] = "",
		["lshift + G9"] = "",
		["lshift + G10"] = "",
		["lshift + G11"] = "fast_lick_box",
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
		["rshift + G6"] = "fast_discard",
		["rshift + G7"] = "",
		["rshift + G8"] = "",
		["rshift + G9"] = "",
		["rshift + G10"] = "",
		["rshift + G11"] = "",
		-- 非鼠标G键，可以使键盘或者耳机上的G键，默认使用键盘G键，请确保你使用的是可编程的罗技键盘 | F1~12 (Non-mouse G-key)
		["F1"] = "",
		["F2"] = "",
		["F3"] = "",
		["F4"] = "",
		["F5"] = "",
		["F6"] = "",
		["F7"] = "",
		["F8"] = "",
		["F9"] = "",
		["F10"] = "",
		["F11"] = "",
		["F12"] = "",
	},
}
























----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------

-- internal configuration
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
	isStart = false, -- 是否是启动状态
	G1 = false, -- G1键状态
	currentTime = 0, -- 此刻
	bulletIndex = 0, -- 第几颗子弹
}

pubg.xLengthForDebug = pubg.generalSensitivityRatio * 30 -- 调试模式下的水平移动单元长度
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
			elseif userInfo.aimingSettings == "ctrlmode" then
				return IsMouseButtonPressed(3) and not IsModifierPressed("lshift")
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
			elseif userInfo.aimingSettings == "ctrlmode" then
				return false
			elseif userInfo.aimingSettings == "custom" then
				return userInfo.customAimingSettings.Aim()
			end
		end,

	}

	return switch[mode]()
end

pubg["M16A4"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 108,
		ballistic = {
			{1, 0},
			{5, 20},
			{40, 24},
		}
	})

end

pubg["SCAR-L"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 96,
		ballistic = {
			{1, 0},
			{2, 30},
			{5, 20},
			{10, 24},
			{15, 28},
			{40, 32},
		}
	})

end

pubg["Beryl M762"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 86,
		ballistic = {
			{1, 0},
			{2, 44},
			{3, 24},
			{5, 28},
			{10, 33},
			{15, 45},
			{30, 47},
			{40, 51},
		}
	})

end

pubg["Tommy Gun"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 84,
		ballistic = {
			{1, 0},
			{3, 20},
			{6, 21},
			{8, 24},
			{10, 30},
			{15, 40},
			{50, 45},
		}
	})

end

pubg["G36C"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 86,
		ballistic = {
			{1, 0},
			{2, 40},
			{5, 16},
			{10, 26},
			{15, 30},
			{20, 34},
			{40, 36},
		}
	})

end

pubg["Vector"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 55,
		ballistic = {
			{1, 0},
			{6, 16},
			{10, 20},
			{13, 24},
			{15, 28},
			{20, 32},
			{33, 34},
		}
	})

end

pubg["Micro UZI"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 46,
		ballistic = {
			{1, 0},
			{2, 13},
			{10, 12},
			{15, 20},
			{35, 30},
		}
	})

end

pubg["UMP45"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 94,
		ballistic = {
			{1, 0},
			{5, 18},
			{15, 30},
			{35, 32},
		}
	})

end

pubg["AKM"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 99,
		ballistic = {
			{1, 0},
			{2, 42},
			{5, 25},
			{10, 32},
			{40, 40},
		}
	})

end

pubg["M416"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 85,
		ballistic = {
			{1, 0},
			{2, 35},
			{4, 18},
			{10, 24},
			{15, 32},
			{30, 30},
			{40, 37},
		}
	})

end

pubg["QBZ"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 92,
		ballistic = {
			{1, 0},
			{2, 34},
			{5, 18},
			{10, 22},
			{15, 32},
			{20, 34},
			{40, 36},
		}
	})

end

pubg["DP-28"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 100,
		ballistic = {
			{1, 0},
			{2, 30},
			{5, 20},
			{47, 30},
		}
	})

end

-- [[通过枪械名查找在 canuse 中的项]]
function pubg.canUseFindByGunName (gunName)
	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do
		local bulletType = forList[i]
		for j = 1, #userInfo.canUse[bulletType] do
			local item = userInfo.canUse[bulletType][j]
			if item[1] == gunName then
				return item
			end
		end
	end
end

--[[ FormatFactory ]]
function pubg.execOptions (gunName, options)

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

	local gunInfo = pubg.canUseFindByGunName(gunName)

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
				-- options.ballistic[i][2] * pubg.generalSensitivityRatio * options.ratio
				options.ballistic[i][2] * pubg.generalSensitivityRatio * gunInfo[3]
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

	-- 取整
	-- for i = 1, #ballisticConfig2 do
	-- 	ballisticConfig2[i] = math.ceil(ballisticConfig2[i])
	-- end

	return {
		duration = options.interval * #ballisticConfig2, -- Time of duration
		amount = #ballisticConfig2, -- Number of bullets
		interval = options.interval, -- Time of each bullet
		ballistic = ballisticConfig2, -- ballistic data
		ctrlmodeRatio = gunInfo[4], -- Individual recoil coefficient for each gun when squatting
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
			local gunName = userInfo.canUse[type][j][1]
			local gunState = userInfo.canUse[type][j][2]

			if gunState >= 1 then
				-- one series
				gunCount = gunCount + 1 -- Accumulative number of firearms configuration files
				pubg.gun[type][gunCount] = gunName -- Adding available firearms to the Arsenal
				pubg.gunOptions[type][gunCount] = pubg[gunName](gunName) -- Get firearms data and add it to the configuration library

				-- 单独设置连发
				pubg.gunOptions[type][gunCount].autoContinuousFiring = ({ 0, 0, 1 })[
					math.max(1, math.min(gunState + 1, 3))
				]
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
	-- console.log(pubg)

end

-- SetRandomseed
function pubg.SetRandomseed ()
	math.randomseed(GetRunningTime())
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
	local realY = pubg.getRealY(options, y)
	MoveMouseRelative(x, realY)
	-- Whether to issue automatically or not
	if options.autoContinuousFiring == 1 then
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
function pubg.getRealY (options, y)
	local realY = y

	if pubg.isAimingState("ADS") then
		realY = y * pubg[pubg.scope_current]
	elseif pubg.isAimingState("Aim") then
		realY = y * userInfo.sensitivity.Aim * pubg.generalSensitivityRatio
	end

	if userInfo.aimingSettings == "ctrlmode" and IsModifierPressed("lctrl") then
		realY = realY * options.ctrlmodeRatio
	end

	return math.round(realY)
end

--[[ change pubg isStart status ]]
function pubg.changeIsStart (isTrue)
	pubg.isStart = isTrue
	if isTrue then
		SetBacklightColor(0, 255, 150, "kb")
		SetBacklightColor(0, 255, 150, "mouse")
	else
		SetBacklightColor(255, 0, 90, "kb")
		SetBacklightColor(255, 0, 90, "mouse")
	end
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

	pubg.changeIsStart(true)
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
			if userInfo.canUse[type][j][2] >= 1 then
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

	pubg.changeIsStart(true)
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
		if pubg.gunIndex > 1 then
			pubg.gunIndex = pubg.gunIndex - 1
		end
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

--[[ 随机偏移 ]]
function pubg.randomOffset (val, offsetScopePx)
	local offsetScope = (offsetScopePx or 10) / 1080 * 65535

	return math.random(
		math.ceil(val - offsetScope),
		math.ceil(val + offsetScope)
	)
end

--[[ 一键舔包，仅拾取进背包的物品，无法拾取需穿戴的物品 ]]
function pubg.fastLickBox ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(20 + pubg.sleep)
	PressAndReleaseMouseButton(1)

	local lastItemCp = {
		300 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535

	-- 重复 3 次动作，强化拾取成功率
	for i = 1, 3 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(
				pubg.randomOffset(670 / 2560 * 65535, 50),
				pubg.randomOffset(710 / 1440 * 65535, 50)
			) -- 修改为背包的坐标
			ReleaseMouseButton(1)
			Sleep(10 + pubg.sleep)
		end
	end

	Sleep(20 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
end

--[[ 一键拾取功能，支持所有分辨率 ]]
function pubg.fastPickup ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(20 + pubg.sleep)
	PressAndReleaseMouseButton(1)

	local lastItemCp = {
		300 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535

	-- 重复 3 次动作，强化拾取成功率
	for i = 1, 3 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(
				pubg.randomOffset(32767, 100),
				pubg.randomOffset(32767, 100)
			)
			ReleaseMouseButton(1)
			Sleep(10 + pubg.sleep)
		end
	end

	Sleep(20 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
end

--[[ 背包清空之术，就算战死，也要让敌人舔个空盒！ ]]
function pubg.fastDiscard ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(10 + pubg.sleep)
	PressAndReleaseMouseButton(1)
	local lastItemCp = {
		630 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535
	-- 清空背包 第一轮
	Sleep(10 + pubg.sleep)
	for i = 1, 5 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(0, 0)
			ReleaseMouseButton(1)
		end
	end
	-- 清空武器
	Sleep(10 + pubg.sleep)
	local itemPos = {
		{ 1770, 180 },
		{ 1770, 480 },
		{ 1770, 780 },
		{ 1770, 1050 },
		{ 2120, 1050 }
	}
	for i = 1, #itemPos do
		MoveMouseTo(
			pubg.randomOffset(itemPos[i][1] / 2560 * 65535),
			pubg.randomOffset(itemPos[i][2] / 1440 * 65535)
		)
		PressAndReleaseMouseButton(3)
	end
	-- 清空背包 第二轮
	Sleep(10 + pubg.sleep)
	for i = 1, 5 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(0, 0)
			ReleaseMouseButton(1)
		end
	end
	-- 清空装备
	Sleep(10 + pubg.sleep)
	local itemPos2 = {
		{ 900, 392 },
		{ 900, 630 },
		{ 900, 720 },
		{ 900, 808 },
		{ 1605, 397 },
		{ 1605, 481 },
		{ 1605, 632 },
		{ 1605, 719 },
		{ 1605, 807 },
		{ 1605, 1049 },
		{ 1605, 1229 }
	}
	for i = 1, #itemPos2 do
		MoveMouseTo(
			pubg.randomOffset(itemPos2[i][1] / 2560 * 65535),
			pubg.randomOffset(itemPos2[i][2] / 1440 * 65535)
		)
		-- Sleep(300 + pubg.sleep)
		PressAndReleaseMouseButton(3)
	end
	Sleep(10 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
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
		["fast_pickup"] = pubg.fastPickup,
		["fast_discard"] = pubg.fastDiscard,
		["fast_lick_box"] = pubg.fastLickBox,
		["off"] = function ()
			pubg.changeIsStart(false)
		end,
	}

	local cmdGroup = string.split(cmd, '|')

	for i = 1, #cmdGroup do
		local _cmd = cmdGroup[i]
		if switch[_cmd] then
			switch[_cmd](_cmd)
		end
	end
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
	local resStr = "      canUse_i\t      series_i\t      Series\t      ratio\t      ctrl ratio\t      Gun Name\n\n"

	for i = 1, #forList do
		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do
			if userInfo.canUse[type][j][2] >= 1 then
				local gunName = userInfo.canUse[type][j][1]
				local tag = gunName == pubg.gun[pubg.bulletType][pubg.gunIndex] and "=> " or "      "
				gunCount = gunCount + 1
				allCount = allCount + 1
				resStr = table.concat({ resStr, tag, allCount, "\t", tag, gunCount, "\t", tag, type, "\t", tag, userInfo.canUse[type][j][3], "\t", tag, userInfo.canUse[type][j][4], "\t", tag, gunName, "\n" })
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

	return table.concat({
		"Currently scope: [ " .. pubg.scope_current .. " ]\n",
		"Currently series: [ ", k, " ]\n",
		"Currently index in series: [ ", i, " / ", #pubg.gun[k], " ]\n",
		"Currently index in canUse: [ ", pubg.allCanUse_index, " / ", pubg.allCanUse_count, " ]\n",
		"Recoil table of [ ", gunName, " ]:\n",
		pubg.outputLogRecoilTable(),
	})
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
	pubg.renderDom.autoLog = table.concat({
		"----------------------------------- Automatically counteracting gun recoil -----------------------------------\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
		"bullet index: ", pubg.bulletIndex, "    target counter: ", options.ballistic[pubg.bulletIndex], "    current counter: ", pubg.counter, "\n",
		"D-value(target - current): ", options.ballistic[pubg.bulletIndex], " - ", pubg.counter, " = ", options.ballistic[pubg.bulletIndex] - pubg.counter, "\n",
		"move: math.ceil((", pubg.currentTime, " - ", pubg.startTime, ") / (", options.interval, " * (", pubg.bulletIndex, " - 1)) * ", options.ballistic[pubg.bulletIndex], ") - ", pubg.counter, " = ", y, "\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
	})
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
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
		if not pubg.runStatus() then return false end
		if userInfo.aimingSettings ~= "default" and not IsMouseButtonPressed(3) then
			pubg.PressOrRelaseAimKey(true)
		end
		if pubg.isAimingState("ADS") or pubg.isAimingState("Aim") then
			pubg.startTime = GetRunningTime()
			pubg.G1 = true
			SetMKeyState(1, "kb")
		end
	end

	if event == "MOUSE_BUTTON_RELEASED" and arg == 1 and family == "mouse" then
		pubg.PressOrRelaseAimKey(false)
		pubg.G1 = false
		pubg.counter = 0 -- Initialization counter
		pubg.xCounter = 0 -- Initialization xCounter
		pubg.SetRandomseed() -- Reset random number seeds
	end

	if event == "M_PRESSED" and arg == 1 and pubg.G1 then
		pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex])
		SetMKeyState(1, "kb")
	end
end

-- [[ processing instruction ]]
function pubg.modifierHandle (modifier)
	local cmd = userInfo.G_bind[modifier]
	pubg.renderDom.combo_key = modifier -- Save combination keys

	if (cmd) then
		pubg.renderDom.cmd = cmd -- Save instruction name
		pubg.runCmd(cmd) -- Execution instructions
	else
		pubg.renderDom.cmd = ""
	end

	pubg.outputLogRender() -- Call log rendering method to output information
end

--[[ Listener method ]]
function OnEvent (event, arg, family)

	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- console.log("event = " .. event .. ", arg = " .. arg .. ", family = " .. family)

	pubg.OnEvent_NoRecoil(event, arg, family)

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and arg >=3 and arg <= 11 and family == "mouse" then
		local modifier = "G" .. arg
		local list = { "lalt", "lctrl", "lshift", "ralt", "rctrl", "rshift" }

		for i = 1, #list do
			if IsModifierPressed(list[i]) then
				modifier = list[i] .. " + " .. modifier
				break
			end
		end

		pubg.modifierHandle(modifier)
	elseif event == "G_PRESSED" and arg >=1 and arg <= 12 then
		-- if not pubg.runStatus() and userInfo.startControl ~= "G_bind" then return false end
		local modifier = "F" .. arg

		pubg.modifierHandle(modifier)
	end

	-- Script deactivated event
	if event == "PROFILE_DEACTIVATED" then
		EnablePrimaryMouseButtonEvents(false)
		ReleaseKey("lshift")
		ReleaseKey("lctrl")
		ReleaseKey("lalt")
		ReleaseKey("rshift")
		ReleaseKey("rctrl")
		ReleaseKey("ralt")
		ClearLog()
	end

end

--[[ tools ]]

-- 四舍五入 #170
function math.round (num, digit)
    local decimalPlaces = 10 ^ (digit or 0)
    return math.floor((num * decimalPlaces * 10 + 5) / 10) / decimalPlaces
end

-- split function
function string.split (str, s)
	if string.find(str, s) == nil then return { str } end

	local res = {}
	local reg = "(.-)" .. s .. "()"
	local index = 0
	local last_i

	--- @diagnostic disable-next-line: undefined-field
	for n, i in string.gfind(str, reg) do
		index = index + 1
		res[index] = n
		last_i = i
	end

	res[index + 1] = string.sub(str, last_i)

	return res
end

-- Javascript Array.prototype.reduce
function table.reduce (t, c)
	local res = c(t[1], t[2])
	for i = 3, #t do res = c(res, t[i]) end
	return res
end

-- Javascript Array.prototype.map
function table.map (t, c)
	local res = {}
	for i = 1, #t do res[i] = c(t[i], i) end
	return res
end

-- Javascript Array.prototype.forEach
function table.forEach (t, c)
	for i = 1, #t do c(t[i], i) end
end

--[[
	* 打印 table
	* @param  {any} val     传入值
	* @return {str}         格式化后的文本
]]
function table.print (val)

	local function loop (val, keyType, _indent)
		_indent = _indent or 1
		keyType = keyType or "string"
		local res = ""
		local indentStr = "     " -- 缩进空格
		local indent = string.rep(indentStr, _indent)
		local end_indent = string.rep(indentStr, _indent - 1)
		local putline = function (...)
			local arr = { res, ... }
			for i = 1, #arr do
				if type(arr[i]) ~= "string" then arr[i] = tostring(arr[i]) end
			end
			res = table.concat(arr)
		end

		if type(val) == "table" then
			putline("{ ")

			if #val > 0 then
				local index = 0
				local block = false

				for i = 1, #val do
					local n = val[i]
					if type(n) == "table" or type(n) == "function" then
						block = true
						break
					end
				end

				if block then
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						if index == 1 then putline("\n") end
						putline(indent, loop(n, type(i), _indent + 1), "\n")
						if index == #val then putline(end_indent) end
					end
				else
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						putline(loop(n, type(i), _indent + 1))
					end
				end

			else
				putline("\n")
				for k, v in pairs(val) do
					putline(indent, k, " = ", loop(v, type(k), _indent + 1), "\n")
				end
				putline(end_indent)
			end

			putline("}, ")
		elseif type(val) == "string" then
			val = string.gsub(val, "\a", "\\a") -- 响铃(BEL)
			val = string.gsub(val, "\b", "\\b") -- 退格(BS),将当前位置移到前一列
			val = string.gsub(val, "\f", "\\f") -- 换页(FF),将当前位置移到下页开头
			val = string.gsub(val, "\n", "\\n") -- 换行(LF),将当前位置移到下一行开头
			val = string.gsub(val, "\r", "\\r") -- 回车(CR),将当前位置移到本行开头
			val = string.gsub(val, "\t", "\\t") -- 水平指标(HT),(调用下一个TAB位置)
			val = string.gsub(val, "\v", "\\v") -- 垂直指标(VT)
			putline("\"", val, "\", ")
		elseif type(val) == "boolean" then
			putline(val and "true, " or "false, ")
		elseif type(val) == "function" then
			putline(tostring(val), ", ")
		elseif type(val) == "nil" then
			putline("nil, ")
		else
			putline(val, ", ")
		end

		return res
	end

	local res = loop(val)
	res = string.gsub(res, ",(%s*})", "%1")
	res = string.gsub(res, ",(%s*)$", "%1")
	res = string.gsub(res, "{%s+}", "{}")

	return res
end

-- console
console = {}
function console.log (str)
	OutputLogMessage(table.print(str) .. "\n")
end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.init() -- Script initialization

--[[ Script End ]]
