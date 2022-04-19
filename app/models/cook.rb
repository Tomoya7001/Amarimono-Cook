class Cook < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  belongs_to :customer
  # favoritesモデルと1:n
  has_many :favorites, dependent: :destroy

  #特定の処理で名前を呼び出せる
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimageフォト.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
