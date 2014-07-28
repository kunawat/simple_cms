class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible
  
  has_many :pages

  validates_presence_of :name
  validates_length_of :name, :within => 1..255

  scope :visible , where(:visible => true)
  scope :invisible , where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?","%#{query}%"])}

end
