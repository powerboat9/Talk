local tArgs = {...}
local fileIn = tArgs[1]
local fileOut = tArgs[2]

fileInData = ""
do
    local file = fs.open(fileIn, "r")
    fileInData = file.readAll()
    file.close()
end

function chunk(txt, data)
    local arrayOfWords = {}
    for word in string.gmatch(txt, "[^%s\t\n]-") do
        arrayOfWords[#arrayOfWords + 1].word = word
    end
    for k, v in ipairs(arrayOfWords) do
        if k > 1 then
            if arrayOfWords[k - 1]:lower() == "the" then
                v.type = "noun"
                return nil --Finnish later
            end
        end
    end
end
