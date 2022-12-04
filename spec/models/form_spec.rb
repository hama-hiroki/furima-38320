require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '配達先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @form.post_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @form.post_code = '0000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Post code 例）123-4567')
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @form.shipping_area_id = '0'
        @form.valid?
        expect(@form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @form.municipalities = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11文字以内でないと保存できないこと' do
        @form.phone_number = '000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが10文字以下では保存できないこと' do
        @form.phone_number = '000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
