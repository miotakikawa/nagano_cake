class Item < ApplicationRecord
    attachment :image
    belongs_to :genre
    has_many :cart_items
    # enum is_active:{sale: true, not_sale: false}
    def taxin_price
        price*1.1
    end
end
