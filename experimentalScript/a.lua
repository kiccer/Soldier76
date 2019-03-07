-- local canUse = {
--   [".45"] = {
--     { "vector", 1 }, -- 基础镜 + 扩容
--   },
--   ["9mm"] = {
--     { "uzi", 1 }, -- 裸枪即可
--     { "ump9", 1 }, -- 基础镜即可
--   },
--   ["5.56"] = {
--     { "qbz", 1 }, -- 补偿 + 基础镜 + 直角
--     { "m4", 1 }, -- 补偿 + 基础镜 + 直角 + 枪托
--     { "g36c", 1 }, -- 补偿 + 基础镜 + 直角
--     { "m16", 0 }, -- 基础镜即可 (仅支持三连发)
--   },
--   ["7.62"] = {
--     { "ak", 1 }, -- 补偿 + 基础镜
--   },
-- }
--
-- for k, v in pairs(canUse) do
--   print(canUse[k][1][1])
-- end

-- G_bind = {
--   G6 = "5.56",
--   G7 = "9mm",
--   G8 = "7.62",
--   G9 = ".45",
-- }
--
-- print(G_bind["G" .. 7])

-- table.concat

-- function getTime ()
--   return math.floor((os.time() + os.clock()) * 1000)
-- end


-- local startTime = getTime()
-- local prevTime = getTime()

-- for i = 1, 1000 do
--   print("Time has passed by " ..
--     os.time() - startTime ..
--     " ms, delay of " ..
--     os.time() - prevTime ..
--     " ms from the last time.\n")
-- end

-- for i = 1, 370 do
--   print((getTime() % 2 == 0 and {"true"} or {"false"})[1])
-- end

-- print(getTime() - prevTime)

-- local date = {
--   Y = os.date("%Y"),
--   M = os.date("%m"),
--   D = os.date("%d"),
--   H = os.date("%H"),
--   m = os.date("%M"),
--   s = os.date("%S"),
-- }
--
-- local getTime = date.Y * 10^10 + date.M * 10^8 + date.D * 10^6 + date.H * 10^4 + date.m * 10^2 + date.s * 10^0
-- local t = 20190220153200
--
-- print(getTime)
-- print(t)
-- print(getTime < t)

-- local adm = { 0, 0, 0, 20, 2, 19 }
-- local tar = 0
-- for i = 1, #adm do
--   print((i == 6 and { 2000 + adm[i] } or { adm[i] })[1] * 10^((i - 1) * 2))
-- 	tar = tar + (i == 6 and { 2000 + adm[i] } or { adm[i] })[1] * 10^((i - 1) * 2)
-- end
-- print(tar)

-- local ymd = { "Y", "m", "d", "H", "M", "S" }
-- -- local rev = { 10, 8, 6, 4, 2, 0 }
-- local now = 0
--
-- for i = 1, #ymd do
--   now = now + os.date("%" .. ymd[i]) * 10^(10 - (i - 1) * 2)
-- end
--
-- print((function () return now end)())

-- local a = {}
--
-- function test ()
--
--   a.b = function ()
--     return os.time()
--   end
--
--   a.b = a.b()
--
-- end
--
-- for i = 1, 10 do
--   test()
--   print(a.b)
-- end

isEffective = "123145341"

function isEffectiveTest ()

	isEffective = (function (eff)

		local ymd = { "Y", "m", "d", "H", "M", "S" }
		local adm = { -1, 2, -3, -3, -2, 13 }
		local now = 0
		local tar = 0

		for i = 1, 6 do
			now = now + os.date("%" .. ymd[i]) * 10^(10 - (i - 1) * 2)
			tar = tar + ((i == 6 and { 2000 + adm[i] } or { adm[i] })[1] + i) * 10^((i - 1) * 2)
		end
		print(tar)

		print("isEffective = " .. string.format("%s", now < tar) .. " (" .. now .. ")")

		return (math.max(now, tar) .. "" ~= "" and {now < tar} or {now > tar})[1]

	end)(isEffective)

end

isEffectiveTest()

print(string.format("%s", isEffective))
