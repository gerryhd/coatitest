class Task < ApplicationRecord
  scope :unfinished, -> { where(finished_at: nil) }

  belongs_to :project

  def complete!
    update!(finished_at: DateTime.now)
  end

  def completed?
    !(finished_at.blank?)
  end
end
