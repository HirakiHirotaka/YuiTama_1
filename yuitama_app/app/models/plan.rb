class Plan < ApplicationRecord
  validates :content, presence: true
end
