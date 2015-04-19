function create ()
  
  update_lcd()
end

function update_lcd()
  p = pilot.player()
  local Armour, Shield = p:health()
  local Armour_ = round(Armour,0)
  local Shield_ = round(Shield) 
  local Energy_ = round(p:energy())
  local Speed_ = round(vec2.mod(p:vel()))
  local stats = p:stats()
  
  
  local pipe = io.open("/tmp/g15naev", "w")
  --create screen
  local screen = "MC 1\n" .. 
  "TO 0 0 1 0 \"Shield " .. Shield_ .. "%" .. " \" \n" ..
  "DB 59 1 128 4 1 " .. Shield_ .. " 100" .. " \" \n" ..
  "TO 130 0 1 0 \"(" .. round(stats.shield) .. ")" .. " \" \n" ..
  "TO 0 8 1 0 \"Armour " .. Armour_ .. "%" .." \" \n" ..
  "DB 59 8 128 12 1 " .. Armour_ .. " 100" .. " \" \n" ..
  "TO 130 8 1 0 \"(" .. round(stats.armour) .. ")" .. " \" \n" ..
  "TO 0 16 1 0 \"Energy " .. Energy_ .."%" .." \" \n" ..
  "DB 59 16 128 20 1 " .. Energy_ .. " 100" .. " \" \n" ..
  "TO 130 16 1 0 \"(" .. round(stats.energy) .. ")" .. " \" \n" ..
  "TO 0 24 1 0 \"Speed  " .. Speed_ .." \" \n" ..
  "DB 59 24 128 28 1 " .. Speed_ .. " 100" .. " \" \n" ..
  "TO 130 24 1 0 \"(" .. round(stats.speed_max)  .. ")" .. " \" \n" ..
  "MC 0 \n"
  --write screen
  pipe:write(screen)
  pipe:close()
  hook.timer(200, "update_lcd" )
end

function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end
