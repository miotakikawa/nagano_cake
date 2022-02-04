class Item < ApplicationRecord
    attachment :image
    belongs_to :genre
    # enum is_active:{sale: true, not_sale: false}
end
