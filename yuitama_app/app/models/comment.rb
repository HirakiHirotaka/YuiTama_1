class Comment < ApplicationRecord
  belongs_to :plan, optional: true
end
