class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_format_of   :email, with: /@/

  validates_uniqueness_of  :email, case_sensitive: false  #wind@meme.com vs WIND@meme.com

  before_save { self.email = email.downcase }
  before_validation

  has_secure_password

  has_many :grams
end
