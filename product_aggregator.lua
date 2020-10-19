local product_aggregator = {
    products = {}
}

local function compare(_first, _second)
    return _first.price < _second.price
end

local function sortProducts(self)
    table.sort(self.products, compare)
end

local function removeIfExistsWithLowerPrice(self, _product)
    for j, k in pairs(self.products) do
        if k.name == _product.name and k.price <= _product.price then
            table.remove(self.products, j)
        end
    end
end

local function isProductValid(_product)
    for j, k in pairs(_product) do
        if (j == 'name' and type(k) ~= 'string') or (j == 'price' and (type(k) ~= 'number' or k < 0)) then
            return false
        end
    end
    return true
end

local function validateProducts(self, _products)
    for _, k in pairs(_products) do
        if isProductValid(k) then
            removeIfExistsWithLowerPrice(self, k)
            table.insert(self.products, k)
        end
    end
end

function product_aggregator:new(_items)
    validateProducts(self, _items)
    sortProducts(self)
end

function product_aggregator:getProducts()
    return self.products
end

function product_aggregator:averagePrice()
    local sum = 0
    for _, k in pairs(self.products) do
        sum = sum + k.price
    end
    return sum / #self.products
end

return product_aggregator
