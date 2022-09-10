class Frame < ApplicationRecord
  enum status: { active: 'active', inactive: 'inactive' }
end
