require 'spec_helper'
describe User do
	before do
		  @user = User.create(email: "sardar@yahoo.com", password: "123456789", password_confirmation: "123456789", docu: File.open('features/abc.docx', 'rb'))

	end
	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:password_hash) }
	it { should respond_to(:password_salt) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:docu) }
	it { should be_valid }
end
