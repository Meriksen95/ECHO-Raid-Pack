-- This is a global table that will be accessible from all of your scripts
ECHO.Script1 = {
    -- This is a global variable that can be accessed from all of your scripts via ExamplePack.Script1.Message
    Message = "Hello from script1.lua"
}

if ExamplePack.Version == "1.0.0" then
    Debug:Print("Version is 1.0.0")
end