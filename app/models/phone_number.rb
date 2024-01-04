class PhoneNumber < ApplicationRecord
  belongs_to :employee
  validates :number, length: { minimum: 10 }

end
