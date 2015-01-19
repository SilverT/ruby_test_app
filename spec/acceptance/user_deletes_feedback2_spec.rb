feature "Destroying feedback" do
  
  scenario "User cancels feedback deletion" do
    visit '/feedbacks/new'
    
    fill_in "feedback_text", :with => 'test3'
    
    click_button "Create Feedback"
    click_link "Back"
    
    visit '/'
    page.first(:xpath, "//tr[td[contains(.,'test3')]]/td/a", :text => 'Destroy').click
 
    alert = page.driver.browser.switch_to.alert.dismiss


    expect(page).to have_text("test3")
  end  
end