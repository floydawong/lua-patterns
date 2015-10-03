
require("_class")

local Prototype = class()

function Prototype:ctor()
    self._objects = {}
end

function Prototype:register_object(name, obj)
    self._objects[name] = obj
end

function Prototype:unregister_object(name)
    self._objects[name] = nil
end

function Prototype:clone(name, params)
    local obj = self._objects[name] or {}
    local new = {}
    local params = params or {}
    
    for k,v in pairs(obj) do
        new[k] = params[k] or v
    end
    return new
end

local A = class()

function A:ctor()
    self.a = 1
    self.b = 1
    self.c = 1
end


local a = A.new()
local prototype = Prototype.new()
prototype:register_object("objecta", a)

local b = prototype:clone("objecta")
local c = prototype:clone("objecta", {a = 5, b = 5, c = 5})

for _, val in ipairs({a, b, c}) do
    print(val.a, val.b, val.c)
end
---------------------------------------------------------------------------
-- OUTPUT
---------------------------------------------------------------------------
-- 1   1   1
-- 1   1   1
-- 5   5   5
