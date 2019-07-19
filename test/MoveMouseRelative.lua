G1 = false

function loop ()
  PressAndReleaseMouseButton(1)
  MoveMouseRelative(0, 30)
  Sleep(20)
end

function OnEvent(event, arg, family)
  --OutputLogMessage("event = %s, arg = %s\n", event, arg);
  if not IsKeyLockOn("capslock") then return false end
  if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
    G1 = true
    SetMKeyState(1)
  end

  if event == "MOUSE_BUTTON_RELEASED" and arg == 1 and family == "mouse" then
  	G1 = false
  end

  if event == "M_PRESSED" and arg == 1 and G1 then
  	loop()
  	SetMKeyState(1)
  end

end
ClearLog()
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
