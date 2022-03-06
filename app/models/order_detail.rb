class OrderDetail < ApplicationRecord
 belongs_to :order
 belongs_to :item
 enum gender: { not_pay: 0, confirm: 1, make: 2, prepare: 3, done: 4 }
end
