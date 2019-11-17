
# Define uma validação para formatação de email
class EmailValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
	  unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
		record.errors[attribute] << (options[:message] || "não é um email válido")
	  end
	end
end

class Platform < ApplicationRecord

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, email: true

end
