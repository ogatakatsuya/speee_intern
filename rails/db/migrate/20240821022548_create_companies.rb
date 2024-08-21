# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo_url
      t.integer :ieul_company_id

      t.timestamps
    end
  end
end
