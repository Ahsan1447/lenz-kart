class User < ApplicationRecord
  enum role: { admin: 'admin' }
end
