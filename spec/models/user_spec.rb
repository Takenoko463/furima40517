require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、birth_day、4つのnameが存在すれば登録できる' do
      expect(@user).to be_valid
    end
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
    it 'name_last_wは全角漢字でないといけない' do
      @user.name_last_w = 'かくにん'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Name last w must be Kanji'
    end
    it 'name_first_wは全角漢字でないといけない' do
      @user.name_first_w = 'かくニン'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Name first w must be Kanji'
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
    it 'birth_dayは今日より前でないといけない' do
      @user.birth_day = Date.new(2050, 3, 1)
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day must be less than #{Date.today}"
    end
    it 'birth_dayは1920年より後でないといけない' do
      @user.birth_day = Date.new(1900, 3, 1)
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day must be greater than #{Date.new(1920, 1, 1)}"
    end
  end
end
