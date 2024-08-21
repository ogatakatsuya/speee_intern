# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :logo_url, null: false
      t.integer :ieul_company_id, null: false

      t.timestamps
    end
  end
end
