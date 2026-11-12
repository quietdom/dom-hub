-- dom hub - loader
local SOURCES = {
    "https://cdn.jsdelivr.net/gh/quietdom/dom-hub@main/dom_hub.lua",
    "https://raw.githubusercontent.com/quietdom/dom-hub/main/dom_hub.lua",
    "https://cdn.jsdelivr.net/gh/quietdom/dom-hub@main/dom_hub.lua?t=" .. tostring(os.time()),
}

local src
for _, url in ipairs(SOURCES) do
    local ok, body = pcall(game.HttpGet, game, url)
    if ok and type(body) == "string" and #body > 0 then
        src = body
        break
    end
end

if not src then
    return warn("dom hub: fetch failed")
end

local chunk, err = loadstring(src, "dom_hub")
if not chunk then
    return warn("dom hub: compile failed - " .. tostring(err))
end

return chunk()
