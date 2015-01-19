feature "Editing feedback" do
  
  scenario "User edits feedback successfully" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test4'
    
    click_button "Create Feedback"
    click_link "Back"
    
    visit '/'
    page.first(:xpath, "//tr[td[contains(.,'test4')]]/td/a", :text => 'Edit').click
        
    fill_in "feedback_text", :with => 'somethingElse'
    click_button "Update Feedback"
    expect(page).to have_text("Feedback was successfully updated.")
    visit '/'
    expect(page).to have_text("somethingElse")

  end  
end