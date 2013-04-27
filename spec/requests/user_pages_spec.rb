require 'spec_helper'

describe "UserPages" do
	subject { page }

  describe "signup page" do
  	before { visit sign_up_path }
    it { should have_selector('h1', text: 'Sign Up') }
    it { should have_selector('title', text: 'Home') }
  end
end
