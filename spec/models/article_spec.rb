require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '新規投稿' do
    context '投稿できるとき' do
      it 'name, address, url, category_id, imageが正しく入力されていれば投稿できる' do
        expect(@article).to be_valid
      end
      it 'addressが入力されていなくても投稿できる' do
        expect(@article).to be_valid
      end
      it 'urlが入力されていなくても投稿できる' do
        expect(@article).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'nameが空だと投稿できない' do
        @article.name = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが0だと投稿できない' do
        @article.category_id = 0
        @article.valid?
        expect(@article.errors.full_messages).to include("Category can't be blank")
      end
      it 'imageを添付していないと投稿できない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Image を1枚添付してください")
      end
      it 'userと紐づいていないと投稿できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end
end
