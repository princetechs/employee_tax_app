class Employee < ApplicationRecord
    validates :employee_id, :first_name, :last_name, :email, :doj, :salary, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "should be a valid email address" }
  
    has_many :phone_numbers, dependent: :destroy
end
  