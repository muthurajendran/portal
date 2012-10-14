class McaStudentsRegistration < ActiveRecord::Base
  #belongs_to :placement_search
    belongs_to :mca_student
    belongs_to :pg_company
end
