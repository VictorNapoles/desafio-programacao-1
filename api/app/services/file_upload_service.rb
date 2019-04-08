class FileUploadService

    def initialize(file)
        @file = file        
    end

    def import
        items_array = []

        file_content = @file.read
        puts file_content
      
        File.foreach( @file.path ).with_index do |line, index| 
            if index > 0 
               
                arr = line.split("\t")
                purchase = import_purchaser arr[0].strip               
                product = import_product arr[1].strip, arr[2].strip.to_d 
                merchant = import_merchant arr[5].strip, arr[4].strip 
                item = import_item purchase, arr[3].strip.to_i, product, merchant
                items_array.push(item)               

            end        
        end

        return items_array
    end

    private 
        def import_purchaser (purchaser_name)
            purchaser = Purchaser.where("name like :name",{name: purchaser_name}).first

            if purchaser.nil?
                purchaser = Purchaser.new(name: purchaser_name)
                if purchaser.save
                    return purchaser
            end

            return purchaser
        end      

    end  

    private 
        def import_product (product_description, product_price)
            product = Product.where("description like :description",{description: product_description}).first

            if product.nil?
                product = Product.new(description: product_description, price: product_price)
                if product.save
                    return product
            end

            return product
        end
    end
    
    private
        def import_merchant (merchant_name, merchant_address)
            merchant = Merchant.where("name like :name",{name: merchant_name}).first

            if merchant.nil?
                merchant = Merchant.new(name: merchant_name, address: merchant_address)
                if merchant.save
                    return merchant
            end

            return merchant
        end
    end

    private
        def import_item(purchaser, purchaser_count, product, merchant)
            item = Item.new(purchaser: purchaser, 
                            purchaser_count: purchaser_count,
                            product: product,
                            merchant: merchant)
            if item.save
                return item
            
            return nil

        end
    end
end