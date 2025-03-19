class TaskMailer < ApplicationMailer
  default from: 'no-reply@todoapp.com'

  def reminder_email(task)
    @task = task
    mail(to: @task.user_email, subject: "Reminder: Your task '#{@task.title}' is due soon!")
  end
end
