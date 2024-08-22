# frozen_string_literal: true

class Gender < ActiveHash::Base
  self.data = [
    { id: 1, gender: '男性' },
    { id: 2, gender: '女性' },
    { id: 99, gender: 'その他・不明' }
  ]
end
