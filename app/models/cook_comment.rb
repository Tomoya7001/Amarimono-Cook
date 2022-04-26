class CookComment < ApplicationRecord
  # 所属中
  belongs_to :customer
  belongs_to :cook
end
