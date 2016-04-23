class Gram < ActiveRecord::Base
  validates_presence_of :title, :description, :location_code
  validates_length_of :description, minimum: 10

  belongs_to :user
end
