class PgCompaniesController < ApplicationController

    filter_resource_access

    def index
      @pg_companies = PgCompany.all

    end


    def show
      @pg_company = PgCompany.find(params[:id])
    end


    def new
      
      @pg_company = PgCompany.new
    end


    def edit
      @pg_company = PgCompany.find(params[:id])
    end


    def create
      @default=0
      @pg_company = PgCompany.new(params[:pg_company])

          if @pg_company.diploma.blank?
              @pg_company.update_attributes(:diploma => @default)
          end
          
          if @pg_company.puc.blank?
              @pg_company.update_attributes(:puc => @default)
          end
          
          if @pg_company.mtech_be_cgpa.blank?
              @pg_company.update_attributes(:mtech_be_cgpa => @default)
          end
           if @pg_company.mtech_be_per.blank?
                @pg_company.update_attributes(:mtech_be_per => @default)
            end

          if @pg_company.gap_in_edu.blank?
            @pg_company.update_attributes(:gap_in_edu => -1)
          end
          
          if @pg_company.degree.blank?
            @pg_company.update_attributes(:degree => @default)
          end
          
          if @pg_company.preplacement_talk.blank?
              @pg_company.update_attributes(:preplacement_talk => '1910-01-01')
          end
          if @pg_company.test_date.blank?
              @pg_company.update_attributes(:test_date => '1910-01-01')
          end
          if @pg_company.interview_date.blank?
              @pg_company.update_attributes(:interview_date => '1910-01-01')
          end
          if  @pg_company.dob.blank?
              @pg_company.update_attributes(:dob => '1910-01-01')
          end

      if @pg_company.save
        flash[:notice]="PgCompany Created"
        redirect_to(:action =>'index')
        else
        render('new') 
      end
    end


    def update
      @default=0
     
       params[:pg_company][:pg_branch_ids] ||= []
      @pg_company = PgCompany.find(params[:id])

        if @pg_company.update_attributes(params[:pg_company])
          if @pg_company.diploma.blank?
              @pg_company.update_attributes(:diploma => @default)
          end
          if @pg_company.puc.blank?
              @pg_company.update_attributes(:puc => @default)
          end
          if @pg_company.mtech_be_cgpa.blank?
                @pg_company.update_attributes(:mtech_be_cgpa => @default)
          end
          if @pg_company.mtech_be_per.blank?
              @pg_company.update_attributes(:mtech_be_per => @default)
          end

          if @pg_company.gap_in_edu.blank?
            @pg_company.update_attributes(:gap_in_edu => -1)
          end
          
          if @pg_company.degree.blank?
            @pg_company.update_attributes(:degree => @default)
          end

          if @pg_company.reg_date.to_s.blank? || @pg_company.reg_date.to_s == "0001-01-01" 
              @pg_company.update_attributes(:reg_date => '1910-01-01')
          end
          if @pg_company.preplacement_talk.blank? || @pg_company.preplacement_talk.to_s =="0001-01-01"
              @pg_company.update_attributes(:preplacement_talk => '1910-01-01')
          end
          if @pg_company.test_date.blank? || @pg_company.test_date.to_s == "0001-01-01"
              @pg_company.update_attributes(:test_date => '1910-01-01')
          end
          if @pg_company.interview_date.blank? || @pg_company.interview_date.to_s == "0001-01-01"
              @pg_company.update_attributes(:interview_date => '1910-01-01')
          end
          if  @pg_company.dob.blank? || @pg_company.dob.to_s == "0001-01-01"
              @pg_company.update_attributes(:dob => '1910-01-01')
          end


            flash[:notice]="PgCompany updated"
            redirect_to(:action=>'show',:id =>@pg_company.id)
        else
           render('edit')  
      end
    end

     def delete
        @pg_company=PgCompany.find(params[:id])
      end

    def destroy
      PgCompany.find(params[:id]).destroy
       flash[:notice]="PgCompany deleted"
       redirect_to(:action=>'index')
    end

end
