#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

Branch.create(:branch_name=> 'CSE', :dream_option => '8.75')
Branch.create(:branch_name=> 'ISE', :dream_option => '8.75')
Branch.create(:branch_name=> 'EC',  :dream_option => '8.75')
Branch.create(:branch_name=> 'EE',  :dream_option => '8.25')
Branch.create(:branch_name=> 'ME',  :dream_option => '8.25')
Branch.create(:branch_name=> 'CV',  :dream_option => '8.25')
Branch.create(:branch_name=> 'BT',  :dream_option => '8.25')




Company.create(:cmp_name => 'TCS',:dob=>'2010-08-01',:sslc => '60',:puc => '60',:diploma=>'75',:backlogs => '1',:gap_in_edu=>'2',:cgpa => '7.25',:reg_date => '2011-08-1',:preplacement_talk => '2011-08-5',:test_date => '2011-08-5',:interview_date => '2011-08-12',:salary => '20000.00',:company_type => 'both',:extra_req => '',:misc => '')
Company.create(:cmp_name => 'Accenture',:sslc => '70',:puc => '70',:backlogs => '0',:cgpa => '7.75',:reg_date => '2011-09-11',:preplacement_talk => '2011-09-15',:interview_date => '2011-09-22' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2010-08-01',:diploma=>'75',:gap_in_edu=>'2',:test_date => '2011-08-5',:salary => '20000.00')
Company.create(:cmp_name => 'Infosys',:sslc => '60',:puc => '60',:backlogs => '2',:cgpa => '7.25',:reg_date => '2011-08-2',:preplacement_talk => '2011-08-6',:interview_date => '2011-08-13' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2010-04-11',:diploma=>'55',:gap_in_edu=>'1',:test_date => '2011-08-10',:salary => '10000.00')
Company.create(:cmp_name => 'Tech Mahindra',:sslc => '65',:puc => '60',:backlogs => '0',:cgpa => '7.5',:reg_date => '2011-10-1',:preplacement_talk => '2011-10-5',:interview_date => '2011-10-12' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2005-04-21',:diploma=>'70',:gap_in_edu=>'3',:test_date => '2011-01-19',:salary => '17000.00')
Company.create(:cmp_name => 'Omnesis',:sslc => '60',:puc => '60',:backlogs => '0',:cgpa => '7.25',:reg_date => '2011-11-1',:preplacement_talk => '2011-11-5',:interview_date => '2011-11-12' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2003-04-21',:diploma=>'80',:gap_in_edu=>'2',:test_date => '2011-08-22',:salary => '20000.00')
Company.create(:cmp_name => 'Sonata',:sslc => '65',:puc => '60',:backlogs => '0',:cgpa => '7.75',:reg_date => '2011-12-1',:preplacement_talk => '2011-12-5',:interview_date => '2011-12-12' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2010-04-6',:diploma=>'85',:gap_in_edu=>'',:test_date => '2011-03-4',:salary => '30000.00')
Company.create(:cmp_name => 'Exeter',:sslc => '60',:puc => '60',:backlogs => '1',:cgpa => '7.25',:reg_date => '2011-7-1',:preplacement_talk => '2011-07-4',:interview_date => '2011-7-11' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2005-04-1',:diploma=>'90',:gap_in_edu=>'2',:test_date => '2011-08-10',:salary => '10000.00')
Company.create(:cmp_name => 'Emc',:sslc => '80',:puc => '80',:backlogs => '2',:cgpa => '8.0',:reg_date => '2012-1-1',:preplacement_talk => '2012-1-5',:interview_date => '2012-1-12' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2001-04-11',:diploma=>'65',:gap_in_edu=>'',:test_date => '2011-08-30',:salary => '17000.00')
Company.create(:cmp_name => 'Sudex',:sslc => '60',:puc => '60',:backlogs => '1',:cgpa => '8.25',:reg_date => '2011-11-9',:preplacement_talk => '2011-11-15',:interview_date => '2011-11-21' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2003-06-21',:diploma=>'50',:gap_in_edu=>'1',:test_date => '2011-06-10',:salary => '20000.00')
Company.create(:cmp_name => 'L&T',:sslc => '60',:puc => '60',:backlogs => '3',:cgpa => '6.25',:reg_date => '2011-09-3',:preplacement_talk => '2011-09-7',:interview_date => '2011-09-16' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2007-04-10',:diploma=>'55',:gap_in_edu=>'1',:test_date => '2011-08-25',:salary => '18000.00')
Company.create(:cmp_name => 'Jindal',:sslc => '70',:puc => '60',:backlogs => '2',:cgpa => '6.75',:reg_date => '2011-12-1',:preplacement_talk => '2011-12-5',:interview_date => '2011-12-12' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2009-04-12',:diploma=>'85',:gap_in_edu=>'1',:test_date => '2011-08-11',:salary => '10000.00')
Company.create(:cmp_name => 'Source Bits',:sslc => '80',:puc => '80',:backlogs => '3',:cgpa => '7.75',:reg_date => '2012-02-1',:preplacement_talk => '2012-02-5',:interview_date => '2012-02-12' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2010-01-10',:diploma=>'93',:gap_in_edu=>'',:test_date => '2011-11-10',:salary => '50000.00')
Company.create(:cmp_name => 'Google',:sslc => '85',:puc => '75',:backlogs => '0',:cgpa => '8.35',:reg_date => '2011-10-1',:preplacement_talk => '2011-10-5',:interview_date => '2011-10-12' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'2010-03-11',:diploma=>'90',:gap_in_edu=>'1',:test_date => '2011-08-5',:salary => '10000.00')
Company.create(:cmp_name => 'Microsoft',:sslc => '85',:puc => '75',:backlogs => '0',:cgpa => '8.25',:reg_date => '2011-10-2',:preplacement_talk => '2011-10-2',:interview_date => '2011-10-13' ,:company_type => 'core',:extra_req => '',:misc => '',:dob=>'1990-07-16',:diploma=>'',:gap_in_edu=>'',:test_date => '2011-08-10',:salary => '30000.00')
Company.create(:cmp_name => 'Wipro',:sslc => '65',:puc => '65',:backlogs => '0',:cgpa => '7.75',:reg_date => '2011-07-1',:preplacement_talk => '2011-07-5',:interview_date => '2011-07-12' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2002-04-11',:diploma=>'',:gap_in_edu=>'',:test_date => '2011-08-8',:salary => '13000.00')
Company.create(:cmp_name => 'Robosoft',:sslc => '50',:puc => '60',:backlogs => '1',:cgpa => '7.25',:reg_date => '2012-02-3',:preplacement_talk => '2012-02-7',:interview_date => '2012-02-18' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'1996-04-11',:diploma=>'55',:gap_in_edu=>'1',:test_date => '2010-01-10',:salary => '10000.00')
Company.create(:cmp_name => 'Nokia',:sslc => '80',:puc => '60',:backlogs => '1',:cgpa => '7.25',:reg_date => '2011-08-5',:preplacement_talk => '2011-08-10',:interview_date => '2011-08-15' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2010-03-17',:diploma=>'60',:gap_in_edu=>'2',:test_date => '2011-08-26',:salary => '16000.00')
Company.create(:cmp_name => 'Accord',:sslc => '70',:puc => '60',:backlogs => '2',:cgpa => '7.75',:reg_date => '2011-12-10',:preplacement_talk => '2011-12-15',:interview_date => '2011-12-20' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'1995-02-10',:diploma=>'',:gap_in_edu=>'',:test_date => '2010-02-11',:salary => '10000.00')
Company.create(:cmp_name => 'Siemens',:sslc => '70',:puc => '60',:backlogs => '0',:cgpa => '7.50',:reg_date => '2011-09-20',:preplacement_talk => '2011-09-25',:interview_date => '2011-09-29' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2009-04-9',:diploma=>'',:gap_in_edu=>'',:test_date => '2011-03-10',:salary => '35000.00')
Company.create(:cmp_name => 'Hcl',:sslc => '70',:puc => '65',:backlogs => '0',:cgpa => '7.25',:reg_date => '2011-07-13',:preplacement_talk => '2011-07-26',:interview_date => '2011-07-27' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2003-06-1',:diploma=>'70',:gap_in_edu=>'2',:test_date => '2010-011-10',:salary => '30000.00')
Company.create(:cmp_name => 'Hp',:sslc => '70',:puc => '60',:backlogs => '0',:cgpa => '7.25',:reg_date => '2011-08-13',:preplacement_talk => '2011-08-26',:interview_date => '2011-08-27' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2004-04-1',:diploma=>'',:gap_in_edu=>'',:test_date => '2010-05-11',:salary => '10000.00')
Company.create(:cmp_name => 'Patni',:sslc => '60',:puc => '50',:backlogs => '2',:cgpa => '7.0',:reg_date => '2011-11-13',:preplacement_talk => '2011-11-27',:interview_date => '2011-11-28' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2001-03-30',:diploma=>'',:gap_in_edu=>'1',:test_date => '2011-08-17',:salary => '20000.00')
Company.create(:cmp_name => 'Capegemini',:sslc => '60',:puc => '50',:backlogs => '4',:cgpa => '7.0',:reg_date => '2011-9-13',:preplacement_talk => '2011-09-28',:interview_date => '2011-09-29' ,:company_type => 'both',:extra_req => '',:misc => '',:dob=>'2010-04-9',:diploma=>'60',:gap_in_edu=>'',:test_date => '2011-02-10',:salary => '10000.00')

