class Lens < ApplicationRecord
  self.table_name = 'lenses'

  has_many :glasses, class_name: 'Glasses'

  enum prescription_type: { fashion: 'fashion', single_vision: 'single_vision', varifocals: 'varifocals' }
  enum lens_type: { classic: 'classic', blue_light: 'blue_light', transition: 'transition' }
end
