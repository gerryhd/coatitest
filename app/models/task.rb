class Task < ApplicationRecord
  scope :unfinished, -> { where(finished_at: nil) }
  scope :finished, -> { where("finished_at not null") }

  belongs_to :project

  has_many_attached :files

  def complete!
    update!(finished_at: DateTime.now)
  end

  def completed?
    !(finished_at.blank?)
  end
end
