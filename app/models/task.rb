class Task < ApplicationRecord
  MAX_NAME_LENGTH = 140

  belongs_to :project

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
