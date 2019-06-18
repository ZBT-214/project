class App < ApplicationRecord
	has_many :versions, dependent: :destroy
	accepts_nested_attributes_for :versions
	belongs_to :user
	accepts_nested_attributes_for :user
end
