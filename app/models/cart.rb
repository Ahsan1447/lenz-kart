class Cart < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'CartItem', dependent: :destroy
end
