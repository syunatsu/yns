class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください'},
    { id: 1, name: 'カフェ'},
    { id: 2, name: '公園' },
    { id: 3, name: 'テーマパーク'},
    { id: 4, name: 'ランチ'},
    { id: 5, name: 'ディナー'},
    { id: 6, name: 'イベント'},
    { id: 7, name: '旅行'},
    { id: 8, name: '記念'},
    { id: 9, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :articles
end