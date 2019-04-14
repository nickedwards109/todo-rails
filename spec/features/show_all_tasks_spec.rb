require "rails_helper"

describe "showing all tasks", type: :feature do
  it "enables a user to look at all the tasks" do
    task_1 = Task.create(
               name: "Task 1 name",
               due_date: "15/04/19",
               description: "This is a description for Task 1."
             )
     task_2 = Task.create(
                name: "Task 2 name",
                due_date: "16/04/19",
                description: "This is a description for Task 2."
              )

      visit tasks_path
      expect(page).to have_content("Task 1 name")
      expect(page).to have_content("15-04-19")
      expect(page).to have_content("This is a description for Task 1.")
      expect(page).to have_content("Task 2 name")
      expect(page).to have_content("16-04-19")
      expect(page).to have_content("This is a description for Task 2.")

      #TODO add links to the tasks show page from other pages, and test those links
  end
end
