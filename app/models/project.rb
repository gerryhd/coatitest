class Project < ApplicationRecord
  has_many :tasks

  def incomplete_tasks
    tasks.unfinished
  end
end
