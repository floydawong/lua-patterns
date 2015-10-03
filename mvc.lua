
require('_class')


local Model = class()

function Model:ctor()
    self.products = {
        milk   = {price = 1.50, quantity = 10},
        eggs   = {price = 0.20, quantity = 100},
        cheese = {price = 2.00, quantity = 10}
    }
end

function Model:get_product_list()
    if not self.product_list_ then
        self.product_list_ = {}
        for key, value in pairs(self.products) do
            table.insert(self.product_list_, key)
        end
    end
    return self.product_list_
end

function Model:get_product_info(product, default)
    return self.products[product] or default
end


local View = class()

function View:product_list(product_list)
    print('PRODUCT LIST:')
    for _, product in ipairs(product_list) do
        print(product)
    end
    print()
end

function View:product_information(product, product_info)
    print('PRODUCT INFORMATION:')
    print(string.format('Name: %s, Price: %.2f, Quantity: %d\n', 
        product, 
        product_info.price, 
        product_info.quantity)
    )
end

function View:product_not_found(product)
    print(string.format('That product "%s" does not exist in the records', product))
end


local Controller = class()

function Controller:ctor()
    self.model = Model.new()
    self.view  = View.new()
end

function Controller:get_product_list()
    local product_list = self.model:get_product_list()
    self.view:product_list(product_list)
end

function Controller:get_product_information(product)
    local product_info = self.model:get_product_info(product, nil)
    if product_info then
        self.view:product_information(product, product_info)
    else
        self.view:product_not_found(product)
    end
end


local controller = Controller.new()
controller:get_product_list()
controller:get_product_information('cheese')
controller:get_product_information('eggs')
controller:get_product_information('milk')
controller:get_product_information('arepas')

---------------------------------------------------------------------------
-- OUTPUT
---------------------------------------------------------------------------
-- PRODUCT LIST:
-- eggs
-- cheese
-- milk

-- PRODUCT INFORMATION:
-- Name: cheese, Price: 2.00, Quantity: 10

-- PRODUCT INFORMATION:
-- Name: eggs, Price: 0.20, Quantity: 100

-- PRODUCT INFORMATION:
-- Name: milk, Price: 1.50, Quantity: 10

-- That product "arepas" does not exist in the records
