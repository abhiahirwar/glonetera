class User < ApplicationRecord
  validates_presence_of :username, :first_name, :last_name, :email, :phone
  attr_accessor :username, :first_name, :last_name, :email, :phone
end
