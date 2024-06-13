require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'b00000'
        @user.password_confirmation = 'c00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name_lastが空では登録できない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it 'name_firstが空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'name_lastは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.name_last = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name last is invalid')
      end
      it 'name_firstは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.name_first = 'bb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end

      it 'katakana_lastが空では登録できない' do
        @user.katakana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last can't be blank")
      end
      it 'katakana_firstが空では登録できない' do
        @user.katakana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first can't be blank")
      end
      it 'katakana_lastは全角（カタカナ）でないと登録できない' do
        @user.katakana_last = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana last is invalid')
      end
      it 'katakana_firstは全角（カタカナ）でないと登録できない' do
        @user.katakana_first = 'いい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana first is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
