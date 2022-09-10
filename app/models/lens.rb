class Lens < ApplicationRecord
  self.table_name = 'lenses'

  enum prescription_type: { fashion: 'fashion', single_vision: 'single_vision', varifocals: 'varifocals' }
  enum lens_type: { classic: 'classic', blue_light: 'blue_light', transition: 'transition' }
end
