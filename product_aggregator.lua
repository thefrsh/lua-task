local product_aggregator = {
    products = {}
}

function product_aggregator:new(_items)
    local isProductValid = function (_product)
        for k, j in pairs(_product) do

        end
    end

    local validateProducts = function (_products)
        for k, j in pairs(_products) do
            if isProductValid(j) then

            end
        end
    end

    local sortProducts = function (_products)
        local compare = function (_first, _second)
            return _first.price < _second.price
        end
        table.sort(self.products, compare)
    end

end

function product_aggregator:getProducts()
    return self.products
end

function product_aggregator:averagePrice()
    local sum = 0
    for k, j in products do
        sum = sum + j.price
    end
    return sum / #self.products
end

return product_aggregator
