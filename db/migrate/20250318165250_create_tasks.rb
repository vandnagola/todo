class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.string :priority
      t.string :status
      t.integer :progress

      t.timestamps
    end
  end
end
