local product_aggregator = {
    products = {}
}

function product_aggregator:new(_items)
    local validateProducts = function (_products)
        local isProductValid = function (_product)
            for j, k in pairs(_product) do
                if (j == 'name' and type(k) ~= 'string') or (j == 'price' and (type(k) ~= 'number' or k < 0)) then
                    return false
                end
            end
            return true
        end

        local removeIfExistsWithLowerPrice = function (_product)
            for j, k in pairs(self.products) do
                if k.name == _product.name and k.price <= _product.price then
                    table.remove(self.products, j)
                end
            end
        end

        for _, k in pairs(_products) do
            if isProductValid(k) then
                removeIfExistsWithLowerPrice(k)
                table.insert(self.products, k)
            end
        end
    end

    local sortProducts = function ()
        local compare = function (_first, _second)
            return _first.price < _second.price
        end
        table.sort(self.products, compare)
    end

    validateProducts(_items)
    sortProducts()
end

function product_aggregator:getProducts()
    return self.products
end

function product_aggregator:averagePrice()
    local sum = 0
    for _, j in pairs(self.products) do
        sum = sum + j.price
    end
    return sum / #self.products
end

return product_aggregator
