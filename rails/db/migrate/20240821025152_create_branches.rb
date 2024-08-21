# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.string :post_code, null: false
      t.string :phone_number, null: false
      t.string :fax_number, null: false
      t.string :open_hours, null: false
      t.string :closed_days, null: false
      t.string :catch_copy, null: false
      t.text :introduction, null: false
      t.string :street_address, null: false
      t.integer :ieul_branch_id, null: false
      t.references :company, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
