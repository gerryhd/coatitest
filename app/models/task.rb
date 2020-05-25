class Task < ApplicationRecord
  scope :unfinished, -> { where(done: false) }

  belongs_to :project
end
