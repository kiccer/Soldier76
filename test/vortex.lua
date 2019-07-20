G1 = false
step = 1
counter = 0
direction = {
  {1, 0},
  {0, 1},
  {-1, 0},
  {0, -1}
}

function loop ()
  PressAndReleaseMouseButton(1)
  local d = direction[step % 4 + 1]
  MoveMouseRelative(d[1] * 10, d[2] * 10)
  counter = counter + 1
  if counter == step + 1 then
    counter = 0
    step = step + 1
  end
  Sleep(10)
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
    counter = 0
    step = 1
  end

  if event == "M_PRESSED" and arg == 1 and G1 then
  	loop()
  	SetMKeyState(1)
  end

end
ClearLog()
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
