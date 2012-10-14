class CompaniesController < ApplicationController

  filter_resource_access
  
  def index
    @companies = Company.all
   
  end

 
  def show
    @company = Company.find(params[:id])
  end

  
  def new
    @company = Company.new
  end

 
  def edit
    @company = Company.find(params[:id])
  end

 
  def create
    @default=0
    @max = 100
    @company = Company.new(params[:company])
        if @company.sslc.blank?
            @company.sslc = @default
        end

        if @company.diploma.blank?
            @company.diploma = @default
        end
        if @company.puc.blank?
            @company.puc = @default
        end
        
        if @company.backlogs.blank?
	         @company.backlogs = @max
        end

        if @company.gap_in_edu.blank?
          @company.gap_in_edu = -1
        end
        
        
        if @company.preplacement_talk.blank?
            @company.preplacement_talk = '1980-01-01'
        end
        if @company.test_date.blank?
            @company.test_date = '1980-01-01'
        end
        if @company.interview_date.blank?
            @company.interview_date = '1980-01-01'
        end
        if  @company.dob.blank?
            @company.dob = '1980-01-01'
        end
        
    if @company.save
      flash[:notice]="Company Created"
      redirect_to(:action =>'index')
      else
      render('new') 
    end
  end

 
  def update
    @default = 0
    @max = 100
    params[:company][:branch_ids] ||= []
    
    @company = Company.find(params[:id])
    
      if @company.update_attributes(params[:company])
	if @company.sslc.blank?
		@company.update_attributes(:sslc => @default)
	end
        if @company.diploma.blank?
            @company.update_attributes(:diploma => @default)
        end
        if @company.puc.blank?
            @company.update_attributes(:puc => @default)
        end
       
        if @company.gap_in_edu.blank?
          @company.update_attributes(:gap_in_edu => -1)
        end
        
	if @company.backlogs.blank?
		@company.update_attributes(:backlogs => @max) 
	end
	        
        if @company.reg_date.to_s.blank? || @company.reg_date.to_s == "0001-01-01" 
            @company.update_attributes(:reg_date => '1980-01-01')
        end
        if @company.preplacement_talk.blank? || @company.preplacement_talk.to_s =="0001-01-01"
            @company.update_attributes(:preplacement_talk => '1980-01-01')
        end
        if @company.test_date.blank? || @company.test_date.to_s == "0001-01-01"
            @company.update_attributes(:test_date => '1980-01-01')
        end
        if @company.interview_date.blank? || @company.interview_date.to_s == "0001-01-01"
            @company.update_attributes(:interview_date => '1980-01-01')
        end
        if  @company.dob.blank? || @company.dob.to_s == "0001-01-01"
            @company.update_attributes(:dob => '1980-01-01')
        end
        
        
          flash[:notice]="Company updated"
          redirect_to(:action=>'show',:id =>@company.id)
      else
         render('edit')  
    end
  end

   def delete
      @company=Company.find(params[:id])
    end
  
  def destroy
    Company.find(params[:id]).destroy
     flash[:notice]="Company deleted"
     redirect_to(:action=>'index')
  end

end
