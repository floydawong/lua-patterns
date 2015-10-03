
require('_class')

-- Data access layer
local Data = class()

function Data:ctor()
	self.products = {
		milk   = {price = 1.50, quantity = 10},
		eggs   = {price = 0.20, quantity = 100},
		cheese = {price = 2.00, quantity = 10}
	}
end

function Data:get(key, default)
	print()
	print("(Fetching from Data Store)")
	return self.products[key] or default
end

-- Business Logic Layer
local BusinessLogic = class()

function BusinessLogic:ctor()
	self.data = Data.new()
end

function BusinessLogic:product_list()
	if not self.product_list_ then
		self.product_list_ = {}
		for key, value in pairs(self.data['products']) do
			table.insert(self.product_list_, key)
		end
	end

	return self.product_list_
end

function BusinessLogic:product_information(product)
	return self.data:get(product, nil)
end

-- User Interface layer
local UI = class()
function UI:ctor()
	self.business_logic = BusinessLogic.new()
end

function UI:get_product_list()
	print('PRODUCT LIST:')
	for _, product in ipairs(self.business_logic:product_list()) do
		print(product)
	end
end

function UI:get_product_information(product)
	local product_info = self.business_logic:product_information(product)

	if product_info then
		print('PRODUCT INFORMATION:')
		print(string.format('Name: %s, Price: %.2f, Quantity: %d', product, product_info.price, product_info.quantity))
	else
		print(string.format('That product "%s" does not exist in the records', product))
	end
end

local ui = UI.new()
ui:get_product_list()
ui:get_product_information('cheese')
ui:get_product_information('eggs')
ui:get_product_information('milk')
ui:get_product_information('arepas')

---------------------------------------------------------------------------
-- OUTPUT
---------------------------------------------------------------------------
-- PRODUCT LIST:
-- eggs
-- cheese
-- milk

-- (Fetching from Data Store)
-- PRODUCT INFORMATION:
-- Name: cheese, Price: 2.00, Quantity: 10

-- (Fetching from Data Store)
-- PRODUCT INFORMATION:
-- Name: eggs, Price: 0.20, Quantity: 100

-- (Fetching from Data Store)
-- PRODUCT INFORMATION:
-- Name: milk, Price: 1.50, Quantity: 10

-- (Fetching from Data Store)
-- That product "arepas" does not exist in the records
