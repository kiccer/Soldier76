isStart = false
G1 = false

function OnEvent (event , arg)

	local x = 0

	if event == "MOUSE_BUTTON_PRESSED" and arg == 4 then
		isStart = true
		x = 1
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
		isStart = false
		x = 2
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == 1 and isStart then
		G1 = true
		SetMKeyState(1)
		x = 3
	elseif event == "MOUSE_BUTTON_RELEASED" and arg == 1 then
		G1 = false
		x = 4
	elseif event == "M_PRESSED" and arg == 1 and G1 then
		PressAndReleaseMouseButton(1)
		Sleep(30)
		if G1 then
			SetMKeyState(1)
		end
		x = 5
	end

	OutputLogMessage(x .. "\n")

end

EnablePrimaryMouseButtonEvents(true)
