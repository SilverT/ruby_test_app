require 'spec_helper'

feature "Adding feedback" do
  scenario "User successfully creates new feedback" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test1'
    
    click_button "Create Feedback"
    expect(page).to have_text("Feedback was successfully created.")
    visit '/'
    expect(page).to have_text("test1")

  end
end