# frozen_string_literal: true

class SaleReason < ActiveHash::Base
  self.data = [
    { id: 1, reason: '住み替え' },
    { id: 2, reason: '相続' },
    { id: 3, reason: '転職・転勤' },
    { id: 4, reason: '離婚' },
    { id: 5, reason: '資産整理' },
    { id: 6, reason: '金銭的な理由' },
    { id: 7, reason: 'その他' }
  ]
end
