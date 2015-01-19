feature "Adding feedback" do
  scenario "successfully creates new feedback" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test1'
    
    click_button "Create Feedback"
    expect(page).to have_text("Feedback was successfully created.")
  end
end