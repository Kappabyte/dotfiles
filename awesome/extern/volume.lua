audio = {}

audio.sink_list = {}
audio.source_list = {}

-- Return the first index with the given value (or nil if not found).
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

local update_sink_list = function()
    local fd = io.popen("pactl list short sinks")
    local status = fd:read("*all")
    fd:close()

    audio.sink_list = {}

    for token in string.gmatch(status, "[^\r\n]+") do
        local i = 1
        for t in string.gmatch(token, "[^%s]+") do
            if i == 2 then
                table.insert(audio.sink_list, t)
            end
            i = i + 1
        end
    end

    fd = io.popen("pactl get-default-sink")
    status = fd:read("*all")
    fd:close()
    audio.default_sink = status:gsub("[\n\r]", "")
    audio.default_sink_index = indexOf(audio.sink_list, audio.default_sink)
end

local update_source_list = function()
    local fd = io.popen("pactl list short sources")
    local status = fd:read("*all")
    fd:close()

    audio.source_list = {}

    for token in string.gmatch(status, "[^\r\n]+") do
        local i = 1
        for t in string.gmatch(token, "[^%s]+") do
            if i == 2 then
                table.insert(audio.source_list, t)
            end
            i = i + 1
        end
    end

    fd = io.popen("pactl get-default-source")
    status = fd:read("*all")
    fd:close()
    audio.default_source = status:gsub("[\n\r]", "")
    audio.default_source_index = indexOf(audio.source_list, audio.default_source)
end

local get_sinks = function()
    update_sink_list()
    return audio.sink_list
end

local get_sources = function()
    update_source_list()
    return audio.source_list
end

local get_default_sink = function()
    update_sink_list()
    return {
        name = audio.default_sink,
        index = audio.default_sink_index
    }
end

local get_default_source = function()
    return {
        name = audio.default_source,
        index = audio.default_source_index
    }
end

local set_default_sink = function(i)
    local fd = io.popen("pactl set-default-sink " .. audio.sink_list[i])
    fd:close()
    update_sink_list()
end

local set_default_source = function(i)
    local fd = io.popen("pactl set-default-source " .. audio.source_list[i])
    fd:close()
    update_source_list()
end

local get_volume = function(i)
    if(audio.sink_list[i] == nil) then return 100 end
    local fd = io.popen("pactl get-sink-volume " .. audio.sink_list[i])
    local status = fd:read("*all")
    fd:close()

    local i = 1
    for t in string.gmatch(status, "[^%s]+") do
        if i == 5 then
            return tonumber(string.sub(t,1,#t - 1))
        end
        i = i + 1
    end
end

local get_gain = function(i)
    local fd = io.popen("pactl get-source-volume " .. audio.source_list[i])
    local status = fd:read("*all")
    fd:close()

    local i = 1
    for t in string.gmatch(status, "[^%s]+") do
        if i == 5 then
            return tonumber(string.sub(t,1,#t - 1))
        end
        i = i + 1
    end
end

local set_volume = function(i, volume)
    local fd = io.popen("pactl set-sink-volume " .. audio.sink_list[i] .. " " .. volume .. "%")
    fd:close()
end

local inc_volume = function(i, volume)
    local fd = io.popen("pactl set-sink-volume " .. audio.sink_list[i] .. " +" .. volume .. "%")
    fd:close()
end

local dec_volume = function(i, volume)
    local fd = io.popen("pactl set-sink-volume " .. audio.sink_list[i] .. " -" .. volume .. "%")
    fd:close()
end

local set_gain = function(i, volume)
    local fd = io.popen("pactl set-source-volume " .. audio.source_list[i] .. " " .. volume .. "%")
    fd:close()
end

local inc_gain = function(i, volume)
    local fd = io.popen("pactl set-source-volume " .. audio.source_list[i] .. " +" .. volume .. "%")
    fd:close()
end

local dec_gain = function(i, volume)
    local fd = io.popen("pactl set-source-volume " .. audio.source_list[i] .. " -" .. volume .. "%")
    fd:close()
end


return {
    update_source_list = update_source_list,
    update_sink_list = update_sink_list,

    get_sinks = get_sinks,
    get_sources = get_sources,

    get_default_sink = get_default_sink,
    get_default_source = get_default_source,

    set_default_sink = set_default_sink,
    set_default_source = set_default_source,

    get_volume = get_volume,
    get_gain = get_gain,

    set_volume = set_volume,
    inc_volume = inc_volume,
    dec_volume = dec_volume,

    set_gain = set_gain,
    inc_gain = inc_gain,
    dec_gain = dec_gain
}