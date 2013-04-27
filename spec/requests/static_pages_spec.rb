require 'spec_helper'

describe "StaticPages" do
	subject { page }
  	describe "Home Page" do
  		before { visit root_path }
    	#it "should have the content h1 'Athlete-Trax'" do
    	  # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    	  #visit root_path
    	  it { should have_selector('h1', :text => "Athlete-Trax") }
  		#end
    	#it "should have the title 'Home'" do
    		#visit root_path
    		it { should have_selector('title', :text => "Athlete-Trax | Home") }
		#end
	end	

	describe "About page" do
		before { visit about_path }
		#it "should have the h1 'About Us'" do
			#visit about_path
			it { should have_selector('h1', :text => "About Us") }
		#end
		#it "should have the title 'About Us'" do
			#visit about_path
			it { should have_selector('title', :text => "Athlete-Trax | About Us") }
		#end
	end
	describe "Contact page" do
		before { visit contact_path }
		#it "should have the h1 'Contact'" do
			#visit contact_path
			it { should have_selector('h1', :text => 'Contact') }
		#end
		#it "should have the title 'Contact'" do
			#visit contact_path
			it { should have_selector('title', :text => "Athlete-Trax | Contact") }
		#end
	end
end
