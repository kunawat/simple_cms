class AdminUser < ActiveRecord::Base
  
  attr_accessible :first_name, :last_name, :username
  
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  EMAIL_REGEX =/^[A-Z0-9.+-_%]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :first_name
  validates_length_of :first_name, :within => 1..25
  validates_presence_of :last_name
  validates_length_of :last_name, :within => 1..25
  validates_presence_of :username
  validates_length_of :username, :within => 6..25
  validates_uniqueness_of :username

  
  #sexyValidation
  validates :email, :presence=> true, :length => {:within => 1..100}, :format=> EMAIL_REGEX, :confirmation=>true
#  validates_length_of :email, :within => 1..100
 # validates_format_of :email, :with=> EMAIL_REGEX
  #validates_confirmation_of :email

  scope :named , lambda{ |first,last| where(:first_name=> first, :last_name=> last)}
end
