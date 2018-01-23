class Plan < ApplicationRecord
  validates :content, presence: true
  has_many :comments, foreign_key: "id", dependent: :destroy
end
