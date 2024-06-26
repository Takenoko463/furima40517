require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、birth_day、4つのnameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができるないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'name_last_wが空では登録できない' do
        @user.name_last_w = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last w can't be blank"
      end
      it 'name_first_wが空では登録できない' do
        @user.name_first_w = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first w can't be blank"
      end
      it 'name_last_rが空では登録できない' do
        @user.name_last_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last r can't be blank"
      end
      it 'name_first_rが空では登録できない' do
        @user.name_first_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first r can't be blank"
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
      it 'emailは@を持たなくてはいけない' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'name_last_wは全角でないといけない' do
        @user.name_last_w = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Name last w must be full width'
      end
      it 'name_first_wは全角でないといけない' do
        @user.name_first_w = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Name first w must be full width'
      end
      it 'name_last_rは全角カタカナでないといけない' do
        @user.name_last_r = 'かくニン'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Name last r must be full width Katakana'
      end
      it 'name_first_rは全角カタカナでないといけない' do
        @user.name_first_r = 'かくニン'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Name first r must be full width Katakana'
      end
    end
  end
end
