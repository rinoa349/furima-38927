class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :order
  has_one_attached :image

  #ActiveHashとのアソシエーション
  belongs_to :category
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :item_status_id
    validates :prefecture_id
    validates :category_id
    validates :shipping_cost_id
    validates :shipping_date_id
    #300円同等か以上、9,999,999円同等か以下
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 
    }
  end
  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 , message:"can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :prefecture_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end
end
