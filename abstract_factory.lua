
require('_class')
math.randomseed(os.time())


local PetShop = class()
function PetShop:ctor(animal_factory)
    self.pet_factory = animal_factory
end

function PetShop:show_pet()
    local pet = self.pet_factory:get_pet()
    print(string.format("We have a lovely %s", pet:get_name()))
    print(string.format("It says %s", pet:speak()))
    print(string.format("We also have %s", self.pet_factory:get_food()))
end


-- Pet Class
local Dog = class()
function Dog:speak()
    return "woof"
end

function Dog:get_name()
    return "Dog"
end


local Cat = class()
function Cat:speak()
    return "meow"
end

function Cat:get_name()
    return "Cat"
end


-- Factory Class
local DogFactory = class()
function DogFactory:get_pet()
    return Dog.new()
end

function DogFactory:get_food()
    return "dog food"
end


local CatFactory = class()
function CatFactory:get_pet()
    return Cat.new()
end

function CatFactory:get_food()
    return "cat food"
end


-- Create the proper family
local factories_ = {DogFactory, CatFactory}
local function random_factory()
    return factories_[math.random(2)]
end


for i = 1, 3 do
    local shop = PetShop.new(random_factory())
    shop:show_pet()
    print("---------------------")
end


---------------------------------------------------------------------------
-- OUTPUT
---------------------------------------------------------------------------
-- We have a lovely Dog
-- It says woof
-- We also have dog food
-- ---------------------
-- We have a lovely Cat
-- It says meow
-- We also have cat food
-- ---------------------
-- We have a lovely Dog
-- It says woof
-- We also have dog food
-- ---------------------
