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


update_sink_list()
update_source_list()

print(audio.source_list[4])
inc_gain(4, 3)
print(get_gain(4))