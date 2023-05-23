require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての入力事項が存在すれば登録できる' do
          expect(@user).to be_valid
      end
      it 'パスワードが6文字以上、半角英数字であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it '名字は全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it '名前は全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角(カタカナ)であれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角(カタカナ)であれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'メールアドレスが空欄では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスに@を含まないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken" 
      end
      it 'パスワードが空欄では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードと確認が不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワード(確認含む)が5文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'パスワード(確認含む)が半角英数字でないと保存できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数を両方含む必要があります"
      end
      it 'パスワード(確認)が空欄では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it '名字のフリガナが全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it '名前のフリガナが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it '生年月日が空欄では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
