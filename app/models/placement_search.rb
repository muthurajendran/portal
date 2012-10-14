class PlacementSearch < ActiveRecord::Base
  has_many :companies
  has_many :students
  has_many :student_registrations
end
