class Plan < ApplicationRecord
  validates :content, presence: true, length: { minimum:1, massage: 'コンテンツを記入してください' }
end
