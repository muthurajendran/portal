class MtechStudentRegistration < ActiveRecord::Base
  #belongs_to :placement_search
  belongs_to :mtech_student
  belongs_to :pg_company
end
