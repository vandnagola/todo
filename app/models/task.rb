class Task < ApplicationRecord
  validates :title, :due_date, :priority, presence: true
end
