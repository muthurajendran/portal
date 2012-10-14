class StudentRegistration < ActiveRecord::Base
  belongs_to :placement_search
  belongs_to :student
  belongs_to :company
end
