class Glasses < ApplicationRecord
  self.table_name = 'glasses'

  belongs_to :lens
  belongs_to :frame
end
