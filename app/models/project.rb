class Project < ApplicationRecord
  MAX_TITLE_LENGTH = 140

  belongs_to :user
  has_many :tasks

  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
end
