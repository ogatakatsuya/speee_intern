# frozen_string_literal: true

class CreateAssessableAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :assessable_areas do |t|
      t.references :branch, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
