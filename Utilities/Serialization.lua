function getFileLines(file)
    lines = {}
    for line in io.lines(file) do 
      lines[#lines + 1] = line
    end
    return lines
end

function serializeObject(object, sectionName)
    local text = "[".. sectionName .."] \n"
    for keys,values in pairs(object) do
        local key = string.match(keys, "^[%a%d_]*$")
        text = text .. key .. "=" .. tostring(object[key]) .. "\n"
    end
    return text
end

function weiteToIni(text, path)
    local file = assert(io.open(path, "w"))
    file:write(text)
    file:close()
end

function deserializeToObject(object, path)
    local keys = {}
    local keyIndex = 1
    for objKeys,values in pairs(object) do
        keys[keyIndex] = string.match(objKeys, "^[%a%d_]*$")
        keyIndex = keyIndex + 1
    end
    local lines = getFileLines(path)
    for i = 1, #lines do
        if string.find(lines[i], "]") == nil then
            for j = 1, #keys do
                if  keys[j] ~= "skip" then
                    if string.find(lines[i], keys[j]) then
                        local value = string.gsub(lines[i], keys[j] .. "=", "")
                        object[keys[j]] = value
                        keys[j] = "skip"
                        break
                    end
                end
            end
        end
        if keys[#keys] == "skip" then
            break
        end
    end
end