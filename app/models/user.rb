class User < ActiveRecord::Base
  attr_accessible :file
  has_attached_file :docu, :url => "/assets/users/:id/original/:basename.:extension",
  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment :docu, :presence => { :message => "File is required" }
  validates_attachment_size :docu, :less_than => 5.megabytes
  validates_attachment_content_type :docu, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
  attr_accessible :email, :password_hash, :password_salt, :docu
  attr_accessible :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
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
