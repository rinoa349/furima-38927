class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

    validates :nickname,
      presence: true
    validates :email,
      presence: true
    #入力ホームに制限を設ける validates :登録するカラム名, format: { with: 正規表現}
    validates :family_name,
      format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
      presence: true
    validates :first_name,
      format: { with: /\A([ぁ-んァ-ンー-龥]|ー)+\z/},
      presence: true
    validates :family_name_kana,
      format: { with: /\A([ァ-ン]|ー)+\z/},
      presence: true
    validates :first_name_kana,
      format: { with: /\A([ァ-ン]|ー)+\z/},
      presence: true
    validates :birth_day,
      presence: true

    #「英数混合でなければならない」(正規表現)をPASSWORD_REGEXに代入
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    #送られてきた値が正規表現をクリアしているかを確認。
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
  
end
