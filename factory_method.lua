
require('_class')


local ChineseGetter = class()

function ChineseGetter:ctor()
    self.trans = {
        dog = "狗",
        cat = "猫"
    }
end

function ChineseGetter:get(msgid)
    return self.trans[msgid] or msgid
end



local EnglishGetter = class()

function EnglishGetter:ctor()
end

function EnglishGetter:get(msgid)
    return msgid
end



local languages_ = {
    chinese = ChineseGetter,
    english = EnglishGetter
}

local function get_localizer(language)
    return languages_[language].new()
end



local samples_ = {"dog","parrot","cat","bear"}
local chinese = get_localizer("chinese")
local english = get_localizer("english")

for _, name in ipairs(samples_) do
    print(english:get(name), chinese:get(name))
end

---------------------------------------------------------------------------
-- OUTPUT
---------------------------------------------------------------------------
-- dog 狗
-- parrot  parrot
-- cat 猫
-- bear    bear
