class Glasses < ApplicationRecord
  self.table_name = 'glasses'

  belongs_to :lens, class_name: 'Lens'
  belongs_to :frame
  belongs_to :user
end
