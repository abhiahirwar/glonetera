class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  validates_presence_of :username, :first_name, :last_name, :email, :phone
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :phone, format: { with: /\d{8,10}/ }

  attr_writer :login
  before_validation :generate_username

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  protected

  def generate_username
    self.username = loop do
      random_username = SecureRandom.random_number(1..99999).to_s.rjust(6,"0")
      random_username = "gt#{random_username}"
      break random_username unless User.exists?(username: random_username)
    end
  end
end
