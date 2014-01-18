require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

	  it "has an email" do
	    @user.email.should be_present
	  end

	  it "should have a password" do
		@user.password.should be_present
	  end

end





