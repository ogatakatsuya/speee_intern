# frozen_string_literal: true

require 'csv'
# 参考にしたサイト
# https://qiita.com/oudon722/items/b1b8f6e683792788a8ed

namespace :csv_import do
  desc 'CSVからデータをインポートする'

  # rake csv_import:prefecture で実行
  task prefecture: :environment do
    path = Rails.root.join 'db/csv/prefecture.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      Prefecture.create!(name: row['name'])
    end
    puts '完了！'
  end

  # rake csv_import:city で実行
  task city: :environment do
    path = Rails.root.join 'db/csv/city.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      City.create!(prefecture_id: row['prefecture_id'], name: row['name'], yomikata: row['yomikata'])
    end
    puts '完了！'
  end

  # rake csv_import:company で実行
  task company: :environment do
    path = Rails.root.join 'db/csv/company.csv'.to_s
    puts "読み込みpath: #{path}"
    CSV.foreach(path, headers: true) do |row|
      Company.create!(
        name: row["name"], 
        logo_url: row["logo_url"],
        ieul_company_id: row["ieul_company_id"],
      )
    end
    puts '完了！'
  end
end
