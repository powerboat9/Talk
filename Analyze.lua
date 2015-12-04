local tArgs = {...}
local fileIn = tArgs[1]
local fileOut = tArgs[2]

fileInData = ""
do
    local file = fs.open(fileIn, "r")
    fileInData = file.readAll()
    file.close()
end

local baseNet = {
    wordList = {
        before = {},
        after = {}
    }
    insertSentance = function(self, txt)
        local words = {}
        for k, v in txt:gmatch("[^%s\t\n]-") do
            words[k] = v
        end
        for i, iV in ipairs(words) do
            for j, jV in ipairs(words) do
                if j ~= i then
                    if j > i then
                        self.wordList.after[iV][j - i] = {}
                        local wordCache = self.wordList.after[iV][j - i]
                        
