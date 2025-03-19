class TaskReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return unless task && !task.status = "completed"

    Rails.logger.info "Reminder: Task '#{task.title}' is due at #{task.due_date}!"
  end
end
