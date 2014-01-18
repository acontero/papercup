require 'spec_helper'

describe "user session" do
  before(:each) do
    @user = FactoryGirl.build(:user)
    @user.password = "password"
    @user.password_confirmation = "password"
    @user.save

    @prompt = FactoryGirl.build(:prompt)
  end

  it "logs a user in" do
    visit "/users/sign_in"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    expect(page).to have_content "Signed in as"
  end

  it "logs in and creates a link" do
    visit "/users/sign_in"

    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password

    click_button "Sign in"

    click_link "Ideas Log"

    click_link "New"

    fill_in 'Name', with: 'An idea'
    fill_in 'Notes', with: 'Some notes la la la'

    click_button "Create Prompt"

    expect(page).to have_content "Name: An idea"

  end

end