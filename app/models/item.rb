class Item < ApplicationRecord
    belongs_to :admin
    attachment :image
    belongs_to :genre
end
