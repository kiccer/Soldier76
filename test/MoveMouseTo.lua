local test = false

local x, y

function loop ()
  for i = 1, 500 do
    if IsMouseButtonPressed(1) then
      x, y = GetMousePosition()
      y = y + 100
      MoveMouseTo(x, y)
      Sleep(20)
    end
  end
end

function OnEvent(event, arg, family)
  if not test then return false end
	--OutputLogMessage("event = %s, arg = %s\n", event, arg);
  if not IsKeyLockOn("capslock") then return false end
  if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
    loop()
  end

end
ClearLog()
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
