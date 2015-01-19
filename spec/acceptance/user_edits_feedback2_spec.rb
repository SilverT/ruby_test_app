feature "Editing feedback" do
  
  scenario "User does not finalize the edit" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test5'
    
    click_button "Create Feedback"
    click_link "Back"
    
    visit '/'
    page.first(:xpath, "//tr[td[contains(.,'test5')]]/td/a", :text => 'Edit').click
        
    fill_in "feedback_text", :with => 'somethingElse'
    click_link "Back"
    expect(page).to have_text("test5")

  end  
end