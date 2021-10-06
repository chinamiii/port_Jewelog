class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :items, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :post_image


  def self.search(keyword)
      where(["title like? OR caption like? OR shop_name like? OR item like? OR jewel like? OR material like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
    #LIKE句はSQLの検索を行うための演算子
    #カラム LIKE? = 〇〇カラムを検索という意味

  validates :title, presence: true, length: {minimum: 2, maximum: 20}
  validates :caption, presence: true, length: {minimum: 2, maximum: 500}
  validates :post_image, presence: true

  validates :rate, presence: true
  validates :jewel, presence: true

end
