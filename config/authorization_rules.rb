authorization do
  
   
   role :guest do
     has_permission_on [:home], :to => [:index]
      has_permission_on [:students,:mtech_students,:mca_students], :to => [:new,:create]
       has_permission_on [:user_sessions], :to => [:new, :destroy, :create,:delete]
       has_permission_on [:users], :to=>[:user, :user_mtech, :user_mca, :edit,:new, :create]
   end
   
  role :admin do
    has_permission_on [:students,:companies,:dashboards,:notices,:events,:guests,:volunteers, :companies,:students_registrations,:users,:user_sessions,:admin,:branches,:home, :admin_news,:mtech_students,:mtech_student_registrations, :pg_branches, :pg_companies, :mca_students, :mca_students_registrations], :to => [:index, :change,:show, :list, :new, :destroy, :delete, :create, :edit,:edits, :update, :students_registrations]
     has_permission_on [:users], :to=>[:home_admin,:home_admin1]
      has_permission_on [:user_sessions], :to=>[:logged_in]
  end
  
   role :student do
      has_permission_on [:students,:branch,:user_sessions], :to => [:index,:edits, :show, :list, :new, :destroy, :create, :edit, :update]
       has_permission_on [:users], :to => [:edit, :update]
        has_permission_on [:students_registrations], :to => [:index,:register,:unregister, :show_placed]
        has_permission_on [:users], :to=>[:home_student]
         has_permission_on [:user_sessions], :to=>[:logged_in]
        
    end
    role :mtech_student do
       has_permission_on [:mtech_students,:pg_companies,:pg_branches,:user_sessions], :to => [:index,:edits, :show, :list, :new, :destroy, :create, :edit, :update]
        has_permission_on [:users], :to => [:edit, :update]
         has_permission_on [:mtech_student_registrations], :to => [:index,:register,:unregister, :show_placed]
         has_permission_on [:users], :to=>[:home_mtech]
          has_permission_on [:user_sessions], :to=>[:logged_in]
    end
    role :mca_student do
       has_permission_on [:pg_companies,:mca_students,:user_sessions,:mca_students_registrations], :to => [:index,:edits, :show, :list, :new, :destroy, :create, :edit, :update]
        has_permission_on [:users], :to => [:edit, :update]
         has_permission_on [:mca_students_registrations], :to => [:index,:register,:unregister, :show_placed]
         has_permission_on [:users], :to=>[:home_mca]
          has_permission_on [:user_sessions], :to=>[:logged_in]
    end
    role :placement do
      has_permission_on [:students,:dashboards,:notices,:events,:guests,:volunteers, :companies,:students_registrations,:users,:user_sessions,:admin,:branches,:home, :admin_news,:mtech_students,:mtech_student_registrations, :pg_branches, :pg_companies, :mca_students, :mca_students_registrations], :to => [:index, :change,:show, :list, :new, :destroy, :delete, :create, :edit,:edits, :update, :students_registrations]
       has_permission_on [:users], :to=>[:home_admin,:home_placement]
        has_permission_on [:user_sessions], :to=>[:logged_in]
    end
   
                                                                                                                                                   
    
end
