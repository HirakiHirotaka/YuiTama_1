class Plan < ApplicationRecord
  validates :content, presence: true
  has_many :comments, dependent: :destroy
end
