class Comment < ApplicationRecord
  belongs_to :plan, foreign_key: "id", optional: true
end
