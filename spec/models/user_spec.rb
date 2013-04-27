require 'spec_helper'
describe User do
	before do
		@user = User.new(email: "user@example.com", password: "foobar", password_hash: "foobar", password_salt: "foobar" )
	end
	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:password_hash) }
	it { should respond_to(:password_salt) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:docu) }
	#it { should be_valid }
end
