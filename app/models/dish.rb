class Dish < ActiveHash::Base
  self.data = [
    {id: 1, name: '主食'}, {id: 2, name: '主菜'}, {id: 3, name: '副菜'},
    {id: 4, name: 'スープ・汁物'}, {id: 5, name: 'おやつ・デザート'}, {id: 6, name: '飲み物'}
  ]
end