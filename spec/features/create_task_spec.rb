require "rails_helper"

describe "new task creation", type: :feature do
  it "enables a user to create a new task and see the task" do
    expect(Task.count).to eq(0)

    visit welcome_path
    click_on "New Task"
    expect(current_path).to eq(new_task_path)
    fill_in "#name", with: "Task 1"
    fill_in "#due-date", with: "04/15/19"
    fill_in "#description", with: "This is a description for Task 1."
    click_on "#submit"

    expect(current_path).to eq(task_path)
    expect(Task.count).to eq(1)
    expect(page).to have_content("Task 1")
    expect(page).to have_content("04/15/19")
    expect(page).to have_content("This is a description for Task 1.")
    expect(page).to have_content("This task has not yet been completed.")
    expect(page).to have_link("Show All Tasks", href: "tasks")
  end
end
