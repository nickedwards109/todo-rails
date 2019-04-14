require 'rails_helper'

describe Task, type: :model do
  it "has name, due date, and description attributes, and a completed attribute
  that is false by default" do
    task = Task.create(
             name: "Task name",
             due_date: "04/15/19",
             description: "This is a description for a task."
           )
    expect(task).to be_valid
    expect(task.completed?).to be_false
  end

  it "validates for the presence of name, due date, and description" do
    no_name_task = Task.create(
                     due_date: "04/15/19",
                     description: "This is a description for a task"
                   )
    expect(no_name_task).to_not be_valid

    no_due_date_task = Task.create(
                         name: "Task name",
                         description: "This is a description for a task"
                       )
    expect(no_due_date_task).to_not be_valid

    no_description_task = Task.create(
                            name: "Task name",
                            due_date: "04/15/19"
                          )
    expect(no_description_task).to_not be_valid
  end
end
