-- 用户配置
UserConfig = {
    -- 基础力度
    power = 5,
    -- 脱敏度
    desensitize = 50,
    -- 启动控制 (scrolllock, capslock, numlock)
    startControl = "capslock",
    -- 随机偏差范围 (不要设置为0，偏差值越小越容易被检测)
    randomDeviation = 1,
    -- 屏幕分辨率
    screenResolution = {
        width = 2560,
        height = 1440
    }
}

-- 开发时使用的工具
-- dofile("E:\\Lynch Bel\\github\\Soldier76\\tools\\console.lua")

-- 运行缓存
RunningCache = {
    -- 偏差像素 (± userConfig.randomDeviation)
    deviationPX = 0,
    -- 累计偏差像素
    deviationCounterPX = 0,
    -- 上一次的 Y 轴位置
    lastY = 0,
    -- 按下右键时的时间戳
    rightMouseDownTimestamp = 0
}

-- 是否启动
function IsStart ()
    return IsKeyLockOn(UserConfig.startControl)
end

-- 判断是否按下
function IsPressed (key)
    if type(key) == "number" then
		return IsMouseButtonPressed(key)
	elseif type(key) == "string" then
		return IsModifierPressed(key)
    else
        return false
    end
end

-- 四舍五入
function Round (num) return math.floor(num + 0.5) end

-- 获取随机力度 (px)
function GetRandomPower ()
    return UserConfig.power + RunningCache.deviationPX + Round(RunningCache.deviationCounterPX / UserConfig.desensitize)
end

-- 主体功能 （压枪循环）
function Main (event, arg, family)
    if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
        -- 启动前先获取一次 Y 轴位置
        local x, y = GetMousePosition()
        RunningCache.lastY = y
        ClearLog()

        while (IsStart() and IsPressed(1) and IsPressed(3)) do
        -- while (IsStart() and IsPressed(1)) do
            -- ConsoleLog("-------------------------------")
            -- 调整偏差 ± userConfig.randomDeviation (px)
            RunningCache.deviationPX = math.max(
                -UserConfig.randomDeviation,
                math.min(
                    UserConfig.randomDeviation,
                    RunningCache.deviationPX + math.random(-1, 1) -- 随机偏差 ±1
                )
            )
            -- ConsoleLog(table.concat({ "随机偏差: ", RunningCache.deviation, "px" }))

            -- 力度/移动距离 (px) (基础 + 偏差)
            local powerPX = GetRandomPower()
            -- ConsoleLog(table.concat({ "力度/移动距离: ", power, "px" }))

            -- 移动鼠标
            MoveMouseRelative(0, powerPX)

            Sleep(math.random(15, 17))

            -- 获取鼠标位置
            local x, y = GetMousePosition()
            -- ConsoleLog(table.concat({ "x: ", x, ", y: ", y }))

            -- 实际移动像素
            local movedPX = Round((y - RunningCache.lastY) / 65535 * UserConfig.screenResolution.height + 1)
            
            -- 偏差像素
            local deviationCounterPX = movedPX - powerPX
            -- ConsoleLog({ "偏差像素: ", deviationCounterPX })

            -- 累计偏差像素
            RunningCache.deviationCounterPX = RunningCache.deviationCounterPX + deviationCounterPX
            -- ConsoleLog({ "累计偏差像素:", RunningCache.deviationCounterPX })

            -- 记录 Y 轴位置
            RunningCache.lastY = y

            -- 预计下一次移动的距离 (px)
            local nextUnitDistance = GetRandomPower()
            -- ConsoleLog(table.concat({ "预计下一次移动的距离: ", nextUnitDistance, "px" }))

            -- 底部安全距离
            local safeDistance = (nextUnitDistance + UserConfig.randomDeviation) / UserConfig.screenResolution.height * 65535
            -- ConsoleLog(table.concat({ "底部安全距离: ", safeDistance, "px" }))

            -- 当鼠标移到底部，距离底部小于安全距离时，调整到顶部 （小于安全距离会影响下一次计算）
            -- if (y >= 65535 - safeDistance) then
            --     -- MoveMouseTo(x, 1)
            --     -- RunningCache.lastY = 1
            --     break
            -- end

            -- ClearLog()
            -- ConsoleLog(RunningCache)
        end

        -- 重置缓存
        RunningCache.deviationPX = 0
        RunningCache.deviationCounterPX = 0
    end
end

-- 入口函数
function OnEvent (event, arg, family)
    -- 与 IsMouseButtonPressed 方法统一
    if arg == 2 then arg = 3 elseif arg == 3 then arg = 2 end

    -- 未启动直接跳过 (安全锁，防止脚本进入死循环后无法退出)
    if not IsStart() then return end

    -- 进入压枪循环
    Main(event, arg, family)
    -- 右键长按 300ms 以上，认定为开镜了，放开右键后，按下 tab 两次，重置鼠标位置
    if event == "MOUSE_BUTTON_PRESSED" and arg == 3 and family == "mouse" then
        RunningCache.rightMouseDownTimestamp = GetRunningTime()
    end

    if event == "MOUSE_BUTTON_RELEASED" and arg == 3 and family == "mouse" then
        -- 右键按下时长
        local rightMouseDownDuration = GetRunningTime() - RunningCache.rightMouseDownTimestamp
        -- ConsoleLog({ "右键按下时长: ", rightMouseDownDuration, "ms" })

        -- 重置鼠标位置
        if (rightMouseDownDuration >= 300 and not IsPressed(1)) then
            PressAndReleaseKey('tab')
            PressAndReleaseKey('tab')
        end
    end

    -- 释放所有占用的按键
    if event == "PROFILE_DEACTIVATED" then
		EnablePrimaryMouseButtonEvents(false)
		ReleaseKey("lshift")
		ReleaseKey("lctrl")
		ReleaseKey("lalt")
		ReleaseKey("rshift")
		ReleaseKey("rctrl")
		ReleaseKey("ralt")
		-- ClearLog()
	end
end

-- 启用鼠标按键 1 事件报告
EnablePrimaryMouseButtonEvents(true)
-- 设置随机数种子
math.randomseed(GetRunningTime())
