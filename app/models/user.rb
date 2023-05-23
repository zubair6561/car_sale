class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:identifier]
  attr_accessor :identifier

  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :firstname, :lastname, :username, length: { maximum: 30 }
  validates :password,  length: { minimum: 8 },
                        format: { with: /\A(?=.*[A-Z])(?=.*\W)/,
                                  message: 'must be at least 8 characters long with one uppercase letter and a special character' }
  validates :contact_number, presence: true,
                             uniqueness: true, length: { minimum: 11, maximum: 15 }
  def self.find_by_email_or_phone(identifier)
    where('email = :identifier OR contact_number = :identifier', identifier: identifier).first
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (identifier = conditions.delete(:identifier))
      where(conditions.to_h).where(['contact_number = :value OR lower(email) = :value', { value: identifier.downcase }]).first
    elsif conditions.key?(:phone_number) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end

