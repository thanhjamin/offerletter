require 'test_helper'

feature 'As a site visitor, I want to be able to sign up to use the site by creating an account'
  scenario 'Sign up'

    # Given a registration form
    visit root_path
    page.must_have_content 'Sign Up'
    page.text.wont_include 'Sign Out'
    click_link 'Sign Up'

    #When I register with valid information
    fill_in 'Email', with: 'bed@sleepy.com'
    fill_in 'Password', with: 'jameschuangchuangchuang'
    fill_in 'Password confirmation', with: 'jameschuangchuangchuang'
    click_on 'Sign up'

    # Then I should be signed up
    page.wont_have_content 'There was a problem with your sign up'
    page.text.wont_include 'Sign up'
  end
end