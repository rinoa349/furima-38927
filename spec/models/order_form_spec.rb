require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号はが「3桁ハイフン4桁」の半角文字列であれば保存できる' do
        @order_form.post_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外であれば保存できる' do
        @order_form.prefecture_id = 2
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '長野市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.adress = '86'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it '電話番号は10桁以上11桁以内の半角数値であれば保存できる' do
        @order_form.phone_number = '08012345678'
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空では保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_form.post_code = 1234567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号が全角文字列では保存できない' do
        @order_form.post_code = '１２３-４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が「---」では保存できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空では保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order_form.adress = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_form.phone_number = '080-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では保存できない' do
        @order_form.phone_number = 1234567890123
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁以下では保存できない' do
        @order_form.phone_number = 123456789
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角文字列では保存できない' do
        @order_form.phone_number = '０８０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空では保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end