require "rails_helper"

describe "updating a task" do
  it "enables a user to change the tasks's completed attribute to true" do
    task = Task.create(
             name: "Task name",
             due_date: "15/04/19",
             description: "This is a description for a task."
           )
    visit(task_path(task.id))
    expect(page).to have_content("This task has not yet been completed.")
    click_on("Mark Task as Completed")
    expect(current_path).to eq(task_path(task.id))
    expect(page).to have_content("This task has been completed!")
  end
end
