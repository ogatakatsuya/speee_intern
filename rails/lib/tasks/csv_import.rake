# frozen_string_literal: true

require 'csv'
# 参考にしたサイト
# https://qiita.com/oudon722/items/b1b8f6e683792788a8ed

namespace :csv_import do # rubocop:disable Metrics/BlockLength
  desc 'CSVからデータをインポートする'

  # rake csv_import:prefecture で実行
  task prefecture: :environment do
    path = Rails.root.join 'db/csv/prefecture.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      Prefecture.create!(
        id: row['id'],
        name: row['name']
      )
    end
    puts '完了！'
  end

  # rake csv_import:city で実行
  desc 'CSVから市区町村データをインポートする'
  task city: :environment do
    path = Rails.root.join 'db/csv/city.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      City.create!(
        id: row['id'],
        prefecture_id: row['prefecture_id'],
        name: row['name'],
        yomikata: row['yomikata']
      )
    end
    puts '完了！'
  end

  # rake csv_import:company で実行
  desc 'CSVから会社データをインポートする'
  task company: :environment do
    path = Rails.root.join 'db/csv/company.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      Company.create!(
        id: row['id'],
        name: row['name'],
        logo_url: row['logo_url'],
        ieul_company_id: row['ieul_company_id']
      )
    end
    puts '完了！'
  end

  desc 'CSVから店舗データをインポートする'
  task branch: :environment do
    path = Rails.root.join 'db/csv/branch.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      branch = Branch.create!(
        id: row['id'],
        company_id: row['company_id'],
        city_id: row['city_id'],
        name: row['店舗名'],
        post_code: row['郵便番号'],
        phone_number: row['電話番号'],
        fax_number: row['FAX番号'],
        open_hours: row['営業時間'],
        closed_days: row['定休日'],
        catch_copy: row['キャッチコピー'],
        introduction: row['紹介文'],
        street_address: row['以降住所'],
        ieul_branch_id: row['ieul_店舗id']
      )

      # 査定可能エリア
      row['査定依頼可能エリア'].split(',').each do |city_id|
        AssessableArea.create!(branch_id: branch.id, city_id:)
      end
    end
    puts '完了！'
  end

  # rake csv_import:review で実行
  desc 'CSVから口コミデータをインポートする'
  task review: :environment do
    path = Rails.root.join 'db/csv/review.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      Review.create!(
        id: row['id'],
        city_id: row['city_id'],
        branch_id: row['branch_id'],
        name: row['名前'],
        gender_id: row['gender'],
        age: row['年齢'],
        address: row['住所全部'],
        property_type_id: row['property_type'],
        sales_count_id: row['sales_count'],
        sale_consideration_period: row['売却検討時期'],
        appraisal_request_period: row['査定依頼時期'],
        listing_period: row['売出時期'],
        sale_period: row['売却時期'],
        transfer_period: row['引渡時期'],
        appraisal_price: row['査定価格'],
        sale_price: row['販売価格'],
        discounted: row['値下げしたかどうか'],
        months_to_discount: row['売り出してから何ヶ月後に値下げしたか'],
        discount_price: row['値下げ価格'],
        contract_price: row['成約価格'],
        contract_type_id: row['媒介契約の形態'],
        headline: row['見出し'],
        sale_reason_id: row['売却理由'],
        concerns_at_sale: row['売却時に不安だったこと'],
        chosen_company_reason: row['この会社に決めた理由'],
        company_satisfaction_id: row['不動産会社の対応満足度'],
        company_satisfaction_reason: row['不動産会社の対応満足度の理由'],
        advice_for_future_sellers: row['今後売却する人へのアドバイス'],
        areas_for_improvement: row['不動産会社に改善してほしい点'],
        ieul_store_id: row['ieul_店舗id']
      )
    end
    puts '完了！'
  end
end
