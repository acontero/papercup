require 'spec_helper'

describe Prompt do
  before(:each) do
  	@prompt = FactoryGirl.create(:prompt)
  end

  it "has a name" do
   @prompt.name.should be_present
  end

  # it "belongs to a user" do
  #   user = FactoryGirl.create(:user)
  #   user.prompts << @prompt
  #   @prompt.user.should == user
  # end

  
end
