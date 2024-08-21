# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :yomikata, null: false

      t.timestamps
    end
  end
end
