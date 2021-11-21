class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, dependent: :destroy


   def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
   end


  # attachment :post_image
  # 複数画像投稿のため
  has_many_attached :post_images

  def self.search(keyword)
    where(["title like? OR caption like? OR shop_name like? OR item like? OR jewel like? OR material like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
  # LIKE句はSQLの検索を行うための演算子
  # カラム LIKE? = 〇〇カラムを検索という意味

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
  validates :caption, presence: true, length: { minimum: 2, maximum: 500 }
  validates :rate, presence: true
  validates :jewel, presence: true
  validate :post_image_length

  private

  def post_image_length
    if post_images.length >= 4
      errors.add(:post_images, "は3枚以内にしてください")
    end
  end
end
