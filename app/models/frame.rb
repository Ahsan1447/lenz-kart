class Frame < ApplicationRecord
  has_many :glasses, class_name: 'Glasses'
  enum status: { active: 'active', inactive: 'inactive' }

  scope :active, -> { where(status: :active) }
end
