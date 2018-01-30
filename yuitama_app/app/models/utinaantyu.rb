class Utinaantyu < ApplicationRecord
  validates :password, {presence: true}
  has_one :profile, dependent: :destroy, foreign_key:"id"
end
