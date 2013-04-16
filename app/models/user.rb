class User < ActiveRecord::Base
  
  has_attached_file :docu, :url => "/assets/users/:id/original/:basename.:extension",
  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_presence :docu
  validates_attachment_size :docu, :less_than => 5.megabytes
  validates_attachment_content_type :docu, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
  attr_accessible :email, :password_hash, :password_salt, :docu
  attr_accessible :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password
   
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
