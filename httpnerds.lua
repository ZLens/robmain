if hookfunction and newcclosure then
local originalHttpGet = game.HttpGet
-- Use hookfunction or newcclosure to prevent tampering
hookfunction(game.HttpGet, newcclosure(function(self, ...)
if self == game and select(1, ...) == originalHttpGet then
-- Block the hook or spy attempt
return nil
end
-- Call the original function if no tampering is detected
return originalHttpGet(self, ...)
end))
end
