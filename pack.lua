ECHO = {
    Version = "1.0.0"
}

Debug:Print("Loading ECHO Raid Pack Lua v" .. ECHO.Version)


function echoHideInCombat(marker)
  return Mumble.PlayerCharacter.IsInCombat
end