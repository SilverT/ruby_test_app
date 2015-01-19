require 'spec_helper'

feature "Viewing feedback" do
  
  scenario "User views feedback successfully" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test6'
    
    click_button "Create Feedback"
    click_link "Back"
    
    visit '/'
    page.first(:xpath, "//tr[td[contains(.,'test6')]]/td/a", :text => 'Show').click
        
    expect(page).to have_text("test6")
    page.should have_no_content('Listing feedbacks')


  end  
end