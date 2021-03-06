require "rails_helper"

describe "new task creation", type: :feature do
  it "enables a user to create a new task and see the task" do
    expect(Task.count).to eq(0)

    visit welcome_path
    click_on "New Task"
    expect(current_path).to eq(new_task_path)
    fill_in "task[name]", with: "Task 1"
    fill_in "task[due_date]", with: "15/04/19"
    fill_in "task[description]", with: "This is a description for Task 1."
    click_on "Create Task"

    task = Task.first

    expect(current_path).to eq(task_path(task.id))
    expect(Task.count).to eq(1)
    expect(page).to have_content("Task 1")
    expect(page).to have_content("15-04-19")
    expect(page).to have_content("This is a description for Task 1.")
    expect(page).to have_content("This task has not yet been completed.")
  end
end
