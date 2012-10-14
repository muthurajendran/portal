class AddYearToCompanies < ActiveRecord::Migration
  def self.up
  add_column :companies, :academic_year1 , :integer ,:default=>2011
  add_column :companies, :academic_year2 , :integer ,:default=>2012    
  add_column :pg_companies, :academic_year1 , :integer ,:default=>2011
  add_column :pg_companies, :academic_year2 , :integer ,:default=>2012

  end

  def self.down
  remove_column :companies, :academic_year1
  remove_column :companies, :academic_year2
  remove_column :pg_companies, :academic_year1
  remove_column :pg_companies, :academic_year2

  end
end
