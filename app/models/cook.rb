class Cook < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :favorites, dependent: :destroy


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
