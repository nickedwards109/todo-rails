class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
