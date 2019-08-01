class Memo < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  validates :deadline, presence: true
end
