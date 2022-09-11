class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :glasses, class_name: 'Glasses'
end
