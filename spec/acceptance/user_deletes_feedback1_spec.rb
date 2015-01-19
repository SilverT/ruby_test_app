require 'spec_helper'

feature "Destroying feedback" do

  scenario "User successfully destroys feedback" do    
    visit '/feedbacks/new'
    fill_in "feedback_text", :with => 'test2'
    
    click_button "Create Feedback"
    click_link "Back"
    visit '/'
    page.first(:xpath, "//tr[td[contains(.,'test2')]]/td/a", :text => 'Destroy').click    
    
    page.driver.browser.switch_to.alert.accept

    page.should have_no_content('test2')
  end 
end