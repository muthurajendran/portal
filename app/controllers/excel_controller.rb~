class ExcelController < ApplicationController
   require 'spreadsheet'
  Spreadsheet.client_encoding = 'UTF-8'
  
  def company_excel
     @no = 'N.A'
     
     @company = Company.all
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name Branches Dob Sslc Puc Diploma Max_Backlogs Cgpa Gap_In_Education Salary Reg_Date PrePlacement_Date Test_date Interview_Date Type Extra_Requirement Misc }
    @i=1
    @company.each do |c|
        #sheet1.row(@i).push c.id
        sheet1.row(@i).push c.cmp_name
        @c=[]
     c.branches.each do |r|
       if r
         @c << r.branch_name
        end
      end
        sheet1.row(@i).push @c.to_s
        sheet1.row(@i).push c.dob
        
        temp = c.sslc.to_f
        
        if temp == 0
    		sheet1.row(@i).push @no
        else 
        	sheet1.row(@i).push temp
        end
        
        temp1 = c.puc.to_f
        if temp1 == 0
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push temp1
        end
        
        temp2 = c.diploma.to_f
	if temp2 == 0
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push temp2
        end

        #Branch.find_by_id(s.branch_id).branch_name
        
        if c.backlogs == 100
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push c.backlogs
        end

        #sheet1.row(@i).push c.backlogs
        
        temp3 = c.cgpa.to_f #sheet1.row(@i).set_format(8,fmt)
        sheet1.row(@i).push temp3
        
        if c.gap_in_edu == -1
		sheet1.row(@i).push @no
	else
		sheet1.row(@i).push c.gap_in_edu
	end

        temp4 = c.salary.to_f#sheet1.row(@i).push c.gap_in_edu
        sheet1.row(@i).push temp4
        
        sheet1.row(@i).push c.reg_date
        sheet1.row(@i).push c.preplacement_talk
        sheet1.row(@i).push c.test_date
        sheet1.row(@i).push c.interview_date
        sheet1.row(@i).push c.company_type
        sheet1.row(@i).push c.extra_req
        sheet1.row(@i).push c.misc
        @i+=1
  end 
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end
  
  
  def mtech_student_excel
     @y1= params[:yy1]
     @y2= params[:yy2]
     @year1= @y1.to_i
     @year2= @y2.to_i
      
    @student=MtechStudent.all
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name DoB Reg_No. Sem Branch Academic_Year1 Academic_Year2 Sslc Puc  Diploma BE_Percentage BE_Cgpa Mtech_Cgpa Gap_in_Education Sgpa_Sem1 Sgpa_Sem2 Sgpa_Sem3 Sgpa_Sem4 Active_Backlogs Total_Backlogs Telephone Mobile Email}
    @i=1

  
    @student.each do |s|
     if s.academic_year1==@year1 && s.academic_year2==@year2
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name      
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        temp = s.sslc.to_f
        sheet1.row(@i).push temp
        
        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1
        
        temp2 = s.diploma.to_f
        sheet1.row(@i).push temp2
        
        temp3 = s.mtech_be_per.to_f #sheet1.row(@i).set_format(8,fmt)
        sheet1.row(@i).push temp3
        
        temp4 = s.mtech_be_cgpa.to_f #sheet1.row(@i).set_format(12,fmt)
        sheet1.row(@i).push temp4 #s.mtech_be_cgpa
        
        temp5 = s.mtech_cgpa.to_f #sheet1.row(@i).set_format(13,fmt)
        sheet1.row(@i).push temp5 #s.mtech_cgpa
        
        sheet1.row(@i).push s.gap_in_edu
        
        temp6 = s.sgpa_sem1.to_f #sheet1.row(@i).set_format(15,fmt)
        sheet1.row(@i).push temp6 #s.sgpa_sem1
        
        temp7 = s.sgpa_sem2.to_f #sheet1.row(@i).set_format(16,fmt)
        sheet1.row(@i).push temp7 #s.sgpa_sem2
        
        temp8 = s.sgpa_sem3.to_f #sheet1.row(@i).set_format(17,fmt)
        sheet1.row(@i).push temp8 #s.sgpa_sem3
        
        temp9 = s.sgpa_sem4.to_f #sheet1.row(@i).set_format(18,fmt)
        sheet1.row(@i).push temp9 #s.sgpa_sem4
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
         @i+=1
  end 
  end

 sheet1.row(@i).push "NO OF STUDENTS = #{@i-1}"
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
    
  end
  
  
  def mca_student_excel
     @y1= params[:yy1]
     @y2= params[:yy2]
     @year1= @y1.to_i
     @year2= @y2.to_i
    @student=McaStudent.all
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name DoB Reg_No. Sem Branch Academic_Year1 Academic_Year2 Sslc Puc Degree Diploma Cgpa Gap_in_Education Sgpa_Sem1 Sgpa_Sem2 Sgpa_Sem3 Sgpa_Sem4 Sgpa_Sem5 Sgpa_Sem6 Active_Backlogs Total_Backlogs Telephone Mobile Email}
    @i=1

     @student.each do |s|
    if s.academic_year1==@year1 && s.academic_year2==@year2
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name      
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        temp = s.sslc.to_f
        sheet1.row(@i).push temp#s.sslc
        
        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1#s.puc
        
        temp2 = s.degree.to_f
        sheet1.row(@i).push temp2 #s.degree
        
        temp3 = s.diploma.to_f
        sheet1.row(@i).push temp3 #s.diploma
        
        temp4 = s.mca_cgpa.to_f
        sheet1.row(@i).push temp4 #s.mca_cgpa
        
        sheet1.row(@i).push s.gap_in_edu
        
        temp5 = s.sgpa_sem1.to_f
        sheet1.row(@i).push temp5 #s.sgpa_sem1
        
        temp6 = s.sgpa_sem2.to_f
        sheet1.row(@i).push temp6 #s.sgpa_sem2
        
        temp7 = s.sgpa_sem3.to_f
        sheet1.row(@i).push temp7 #s.sgpa_sem3
        
        temp8 = s.sgpa_sem4.to_f
        sheet1.row(@i).push temp8 #s.sgpa_sem4
        
        temp9 = s.sgpa_sem5.to_f
        sheet1.row(@i).push temp9 #s.sgpa_sem5
        
        temp10 = s.sgpa_sem6.to_f
        sheet1.row(@i).push temp10 #s.sgpa_sem6
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
         @i+=1
  end 
end

 sheet1.row(@i).push "NO OF STUDENTS = #{@i-1}"
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end
  
  def student_excel
   @y1= params[:yy1]
    @y2= params[:yy2]
   @year1=@y1.to_i
   @year2=@y2.to_i
   
   @student=Student.order(:branch_id).all
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Education Sem1 Sem2 Sem3 Sem4 Sem5 Sem6 Sem7 Sem8 CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    
 
    @student.each do |s|
        #sheet1.row(@i).push s.id
   if s.academic_year1==@year1 && s.academic_year2==@year2
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name 
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        
        temp = s.sslc.to_f
        sheet1.row(@i).push temp
        
        
        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1
        
        
        temp2 = s.diploma.to_f
        sheet1.row(@i).push temp2
        
        sheet1.row(@i).push s.gap_in_edu
     
        temp3 = s.sgpa_sem1.to_f #sheet1.row(@i).set_format(12,fmt)
        sheet1.row(@i).push temp3 #s.sgpa_sem1
        
        temp4 = s.sgpa_sem2.to_f #sheet1.row(@i).set_format(13,fmt)
        sheet1.row(@i).push temp4#s.sgpa_sem2
        
        temp5 = s.sgpa_sem3.to_f #sheet1.row(@i).set_format(14,fmt)
        sheet1.row(@i).push temp5 #s.sgpa_sem3

        temp6 = s.sgpa_sem4.to_f #sheet1.row(@i).set_format(15,fmt)
        sheet1.row(@i).push temp6 #s.sgpa_sem4
        
        temp7 = s.sgpa_sem5.to_f #sheet1.row(@i).set_format(16,fmt)
        sheet1.row(@i).push temp7 #s.sgpa_sem5
        
        temp8 = s.sgpa_sem6.to_f #sheet1.row(@i).set_format(17,fmt)
        sheet1.row(@i).push temp8 #s.sgpa_sem6
        
        temp9 = s.sgpa_sem7.to_f #sheet1.row(@i).set_format(18,fmt)
        sheet1.row(@i).push temp9 #s.sgpa_sem7
        
        temp10 = s.sgpa_sem8.to_f #sheet1.row(@i).set_format(19,fmt)
        sheet1.row(@i).push temp10 #s.sgpa_sem8

        temp11 = s.cgpa.to_f #sheet1.row(@i).set_format(20,fmt)
        sheet1.row(@i).push temp11 #s.cgpa
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
        @i+=1
   end
end   

 
  sheet1.row(@i).push "NO OF STUDENTS = #{@i-1}"
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
end

def res1_excel
  @e=params[:ew]
         @e1=@e.to_i
    @student=$student1
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{ Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Education CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        if @e1==0
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        elsif @e1==1 || @e1==2
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name
        end
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        temp=s.sslc.to_f        
        sheet1.row(@i).push temp

        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1

        temp2 = s.diploma.to_f
        sheet1.row(@i).push temp2


        sheet1.row(@i).push s.gap_in_edu
        
        
         if @e1==0
          temp11 = s.cgpa.to_f #sheet1.row(@i).set_format(20,fmt)
         elsif @e1==1
         temp11 = s.mtech_cgpa.to_f
         else
         temp11=s.mca_cgpa.to_f
         end
        sheet1.row(@i).push temp11
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
        @i+=1
  end 
 
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end
  
  
  def res2_excel
  @e=params[:es]
         @e1=@e.to_i
    @student=$student1
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{ Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Eduaction CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        if @e1==0
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        elsif @e1==1 || @e1==2
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name
        end
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        temp = s.sslc.to_f
        sheet1.row(@i).push temp #s.sslc
        
        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1 #s.puc
        
        temp2 = s.diploma.to_f
        sheet1.row(@i).push temp2 #s.diploma
        
        
        sheet1.row(@i).push s.gap_in_edu
        
   if @e1==0
          temp11 = s.cgpa.to_f #sheet1.row(@i).set_format(20,fmt)
         elsif @e1==1
         temp11 = s.mtech_cgpa.to_f
         else
         temp11=s.mca_cgpa.to_f
         end
        sheet1.row(@i).push temp11 #s.cgpa
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
        @i+=1
  end 
 
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
       
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end
  
  
def res3_excel_company
    @company =$company3
    @no = 'N.A'

    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name Branches Dob Sslc Puc Diploma Max_Backlogs Cgpa Gap_In_Education Salary Reg_Date PrePlacement_Date Test_date Interview_Date Type Extra_Requirement Misc }
    @i=1
    @company.each do |c|
        #sheet1.row(@i).push c.id
        sheet1.row(@i).push c.cmp_name
        @c=[]
     c.branches.each do |r|
       if r
         @c<< r.branch_name
        end
      end
        sheet1.row(@i).push @c.to_s
        sheet1.row(@i).push c.dob
        
        temp = c.sslc.to_f
        
        if temp == 0
    		sheet1.row(@i).push @no
        else 
        	sheet1.row(@i).push temp
        end
        
        temp1 = c.puc.to_f
        if temp1 == 0
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push temp1
        end
        
        temp2 = c.diploma.to_f
	if temp2 == 0
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push temp2
        end

        #Branch.find_by_id(s.branch_id).branch_name
        
        if c.backlogs == 100
                sheet1.row(@i).push @no
        else
                sheet1.row(@i).push c.backlogs
        end

        #sheet1.row(@i).push c.backlogs
        
        temp3 = c.cgpa.to_f #sheet1.row(@i).set_format(8,fmt)
        sheet1.row(@i).push temp3
        
        if c.gap_in_edu == -1
		sheet1.row(@i).push @no
	else
		sheet1.row(@i).push c.gap_in_edu
	end

        temp4 = c.salary.to_f#sheet1.row(@i).push c.gap_in_edu
        sheet1.row(@i).push temp4
        
        sheet1.row(@i).push c.reg_date
        sheet1.row(@i).push c.preplacement_talk
        sheet1.row(@i).push c.test_date
        sheet1.row(@i).push c.interview_date
        sheet1.row(@i).push c.company_type
        sheet1.row(@i).push c.extra_req
        sheet1.row(@i).push c.misc
        @i+=1
  end 
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end

  
 def res4_excel
@e=params[:ew]
         @e1=@e.to_i
    @student=$student1
    book = Spreadsheet::Workbook.new
    fmt = Spreadsheet::Format.new(:number_format => '0.00')
    sheet1 = book.create_worksheet
    # old one ---->>>>>>> sheet1.row(0).concat %w{Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma GAP_IN_EDU CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    #new one below
   if @e1==0
     sheet1.row(0).concat %w{Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Education Sem1 Sem2 Sem3 Sem4 Sem5 Sem6 Sem7 Sem8 CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
  elsif @e1==1
      sheet1.row(0).concat %w{Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Education Sem1 Sem2 Sem3 Sem4 CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email BEpercentage BEcgpa}
  else
      sheet1.row(0).concat %w{Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Education Sem1 Sem2 Sem3 Sem4 Sem5 Sem6 CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email Degree}
 end

    @i=1
    @student.each do |s|
    #sheet1.row(@i).push s.id
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
         if @e1==0
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        elsif @e1==1 || @e1==2
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name
        end
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        
        
        temp = s.sslc.to_f
        sheet1.row(@i).push temp
        
        
        temp1 = s.puc.to_f
        sheet1.row(@i).push temp1
        
        
        temp2 = s.diploma.to_f
        sheet1.row(@i).push temp2
        
        sheet1.row(@i).push s.gap_in_edu
     
        temp3 = s.sgpa_sem1.to_f #sheet1.row(@i).set_format(12,fmt)
        sheet1.row(@i).push temp3 #s.sgpa_sem1
        
        temp4 = s.sgpa_sem2.to_f #sheet1.row(@i).set_format(13,fmt)
        sheet1.row(@i).push temp4#s.sgpa_sem2
        
        temp5 = s.sgpa_sem3.to_f #sheet1.row(@i).set_format(14,fmt)
        sheet1.row(@i).push temp5 #s.sgpa_sem3

        temp6 = s.sgpa_sem4.to_f #sheet1.row(@i).set_format(15,fmt)
        sheet1.row(@i).push temp6 #s.sgpa_sem4
          if @e1==0 || @e1==2
        temp7 = s.sgpa_sem5.to_f #sheet1.row(@i).set_format(16,fmt)
        sheet1.row(@i).push temp7 #s.sgpa_sem5
        
        temp8 = s.sgpa_sem6.to_f #sheet1.row(@i).set_format(17,fmt)
        sheet1.row(@i).push temp8 #s.sgpa_sem6
         if @e1==0
        temp9 = s.sgpa_sem7.to_f #sheet1.row(@i).set_format(18,fmt)
        sheet1.row(@i).push temp9 #s.sgpa_sem7
        
        temp10 = s.sgpa_sem8.to_f #sheet1.row(@i).set_format(19,fmt)
        sheet1.row(@i).push temp10 #s.sgpa_sem8
        end
         end
         if @e1==0
        temp11 = s.cgpa.to_f #sheet1.row(@i).set_format(20,fmt)
         elsif @e1==1
       temp11 = s.mtech_cgpa.to_f
         else
        temp11=s.mca_cgpa.to_f
        end
        sheet1.row(@i).push temp11 #s.cgpa
        
        sheet1.row(@i).push s.active_backlog
        sheet1.row(@i).push s.total_backlogs
        sheet1.row(@i).push s.telephone
        sheet1.row(@i).push s.mobile
        sheet1.row(@i).push s.email
         if @e1==1
          temp12= s.mtech_be_per.to_f
          sheet1.row(@i).push temp12
           temp12= s.mtech_be_cgpa.to_f
          sheet1.row(@i).push temp12
          end
         if @e1==2
   temp12= s.degree.to_f
 sheet1.row(@i).push temp12
end
        @i+=1
   
    
    end 
  sheet1.row(0).height = 18

  format = Spreadsheet::Format.new :color => :blue,
                                   :weight => :bold,
                                   :size => 12
  sheet1.row(0).default_format = format

  #bold = Spreadsheet::Format.new :weight => :bold
  #4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    #book.write "/home/nmamit/Desktop/#{params[:filename]}file.xls"
     #redirect_to(:action => 'index')
     
     
     require 'stringio'
     data = StringIO.new ''
     book.write data
      if !params[:filename].blank?
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"#{params[:filename]}.xls"
     else
     send_data data.string.bytes.to_a.pack("C*"), :type => 'application/excel', :disposition => 'attachment', :filename =>"untitled.xls"
      end
  end
end
