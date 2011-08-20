class ExcelController < ApplicationController
   require 'spreadsheet'
  Spreadsheet.client_encoding = 'UTF-8'
  
  def company_excel
    
     @company = Company.all
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Id Name Branches Dob Sslc Puc Diploma Max_Backlogs Cgpa Gap Salary Reg_Date PrePlacement_Date Test_date Interview_Date Type Extra_Requirement Misc }
    @i=1
    @company.each do |c|
        sheet1.row(@i).push c.id
        sheet1.row(@i).push c.cmp_name
        @c=[]
     c.branches.each do |r|
       if r
         @c<<r.branch_name
        end
      end
        sheet1.row(@i).push @c.to_s
        sheet1.row(@i).push c.dob
        sheet1.row(@i).push c.sslc
        sheet1.row(@i).push c.puc
        sheet1.row(@i).push c.diploma #Branch.find_by_id(s.branch_id).branch_name
        sheet1.row(@i).push c.backlogs
        sheet1.row(@i).push c.cgpa
        sheet1.row(@i).push c.gap_in_edu
        sheet1.row(@i).push c.salary
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
      
    @student=MtechStudent.all
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name DoB Reg_No. Sem Branch Academic_Year1 Academic_Year2 Sslc Puc  Diploma BE_Percentage BE_Cgpa Mtech_Cgpa Gap_in_Edu Sgpa_Sem1 Sgpa_Sem2 Sgpa_Sem3 Sgpa_Sem4 Active_Backlogs Total_Backlogs Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name      
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.mtech_be_per
        sheet1.row(@i).push s.mtech_be_cgpa
        sheet1.row(@i).push s.mtech_cgpa
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.sgpa_sem1
        sheet1.row(@i).push s.sgpa_sem2
        sheet1.row(@i).push s.sgpa_sem3
        sheet1.row(@i).push s.sgpa_sem4
        
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
    @student=McaStudent.all
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name DoB Reg_No. Sem Branch Academic_Year1 Academic_Year2 Sslc Puc Degree Diploma Cgpa Gap_in_Edu Sgpa_Sem1 Sgpa_Sem2 Sgpa_Sem3 Sgpa_Sem4 Sgpa_Sem5 Sgpa_Sem6 Active_Backlogs Total_Backlogs Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push PgBranch.find_by_id(s.pg_branch_id).branch_name      
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.degree
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.mca_cgpa
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.sgpa_sem1
        sheet1.row(@i).push s.sgpa_sem2
        sheet1.row(@i).push s.sgpa_sem3
        sheet1.row(@i).push s.sgpa_sem4
        sheet1.row(@i).push s.sgpa_sem5
        sheet1.row(@i).push s.sgpa_sem6
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
   @student=Student.order(:branch_id).all
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{SL_No. Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma Gap_In_Edu Sem1 Sem2 Sem3 Sem4 Sem5 Sem6 Sem7 Sem8 CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.id
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name 
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.sgpa_sem1
        sheet1.row(@i).push s.sgpa_sem2
        sheet1.row(@i).push s.sgpa_sem3
        sheet1.row(@i).push s.sgpa_sem4
        sheet1.row(@i).push s.sgpa_sem5
        sheet1.row(@i).push s.sgpa_sem6
        sheet1.row(@i).push s.sgpa_sem7
        sheet1.row(@i).push s.sgpa_sem8
        sheet1.row(@i).push s.cgpa
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
  
    @student=$student1
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{SL_No. Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma GAPINEDU CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.id
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.cgpa
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
    @student=$student1
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{SL_No. Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma GAPINEDU CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.id
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.cgpa
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Id Company_Name Branches DOB Sslc Puc Diploma Cgpa Gap Salary Reg_Date PrePlacement_Date Interview_Date Type Extra_Requirement Misc }
    @i=1
    @company.each do |c|
        sheet1.row(@i).push c.id
        sheet1.row(@i).push c.cmp_name
        @c=[]
        c.branches.each do |r|
         @c<<r.branch_name
        end
        sheet1.row(@i).push @c.to_s
        sheet1.row(@i).push c.dob
        sheet1.row(@i).push c.sslc
        sheet1.row(@i).push c.puc
        sheet1.row(@i).push c.diploma#Branch.find_by_id(s.branch_id).branch_name
        sheet1.row(@i).push c.cgpa
        sheet1.row(@i).push c.gap_in_edu
        sheet1.row(@i).push c.salary
        sheet1.row(@i).push c.reg_date
        sheet1.row(@i).push c.preplacement_talk
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
    @student=$student1
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{SL_No. Name DOB USN Sem Branch Start_Year End_Year SSLC PUC Diploma GAPINEDU CGPA ACTIVE_BACKLOGS TOTAL_BACKLOGS Telephone Mobile Email}
    @i=1
    @student.each do |s|
        sheet1.row(@i).push s.id
        sheet1.row(@i).push s.name
        sheet1.row(@i).push s.dob
        sheet1.row(@i).push s.reg_no
        sheet1.row(@i).push s.sem
        sheet1.row(@i).push Branch.find_by_id(s.branch_id).branch_name
        sheet1.row(@i).push s.academic_year1
        sheet1.row(@i).push s.academic_year2
        sheet1.row(@i).push s.sslc
        sheet1.row(@i).push s.puc
        sheet1.row(@i).push s.diploma
        sheet1.row(@i).push s.gap_in_edu
        sheet1.row(@i).push s.cgpa
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

  bold = Spreadsheet::Format.new :weight => :bold
  4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
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
