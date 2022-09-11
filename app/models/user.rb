class User < ApplicationRecord
  enum role: { admin: 'admin' }
  enum currency: { usd: 'usd', gbp: 'gbp', eur: 'eur', jod: 'jod', jpy: 'jpy' }

  has_many :glasses, class_name: 'Glasses'
  has_one :cart
end
