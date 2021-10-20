# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }
    
    context 'postカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        post.title = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
        
    end
  end
end