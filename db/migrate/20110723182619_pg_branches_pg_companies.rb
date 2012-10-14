class PgBranchesPgCompanies < ActiveRecord::Migration
  def self.up
       create_table :pg_branches_pg_companies, :id=> false do |t|

            t.integer :pg_company_id
            t.integer :pg_branch_id
          t.timestamps
    end
  add_index :pg_branches_pg_companies,[:pg_branch_id,:pg_company_id] 
   end 
    def self.down
      drop_table :pg_branches_pg_companies
    end
end
