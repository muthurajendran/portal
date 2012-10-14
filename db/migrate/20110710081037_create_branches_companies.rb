class CreateBranchesCompanies < ActiveRecord::Migration
  def self.up
    create_table :branches_companies, :id=> false do |t|
        t.integer :branch_id
        t.integer :company_id
      t.timestamps
    end
    add_index :branches_companies,[:branch_id,:company_id]  
  end

  def self.down
    drop_table :branches_companies
  end
end
