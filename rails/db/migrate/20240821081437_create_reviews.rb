class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.integer :gender_id, null: false
      t.integer :age, null: false
      t.string :address, null: false
      t.integer :property_type_id, null: false
      t.integer :sales_count_id, null: false
      t.date :sale_consideration_period, null: false
      t.date :appraisal_request_period, null: false
      t.date :listing_period, null: false
      t.date :sale_period, null: false
      t.date :transfer_period, null: false
      t.bigint :appraisal_price, null: false
      t.bigint :sale_price, null: false
      t.boolean :discounted, null: false
      t.integer :months_to_discount
      t.bigint :discount_price
      t.bigint :contract_price, null: false
      t.integer :contract_type_id, null: false
      t.string :headline, null: false
      t.integer :sale_reason_id, null: false
      t.text :concerns_at_sale, null: false
      t.text :chosen_company_reason, null: false
      t.integer :company_satisfaction_id, null: false
      t.text :company_satisfaction_reason, null: false
      t.text :advice_for_future_sellers, null: false
      t.text :areas_for_improvement, null: false
      t.boolean :public, null: false, default: false
      t.integer :ieul_store_id, null: false

      t.timestamps
    end
  end
end
