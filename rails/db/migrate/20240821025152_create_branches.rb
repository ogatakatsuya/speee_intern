class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :post_code
      t.string :phone_number
      t.string :fax_number
      t.string :open_hours
      t.string :closed_days
      t.string :catch_copy
      t.text :introduction
      t.string :street_address
      t.integer :ieul_branch_id
      t.references :company, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
