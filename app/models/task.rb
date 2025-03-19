class Task < ApplicationRecord
  validates :title, :due_date, :priority, presence: true

  after_create :schedule_reminder

  private

  def schedule_reminder
    return unless due_date.present?

    reminder_time = due_date - 1.hour
    TaskMailer.reminder_email(self).deliver_later(wait_until: reminder_time) if reminder_time > Time.current
  end

end
