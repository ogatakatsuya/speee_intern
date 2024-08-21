require 'csv'
# 参考にしたサイト
# https://qiita.com/oudon722/items/b1b8f6e683792788a8ed


namespace :csv_import do
    desc "CSVからデータをインポートする"

    # rake csv_import:prefecture で実行
    task prefecture: :environment do
        path = File.join Rails.root, "db/csv/prefecture.csv"
        puts "読み込みpath: #{path}"
        CSV.foreach(path, headers: true) do |row|
            Prefecture.create!(name: row["name"])
        end
        puts "完了！"
    end

    # rake csv_import:city で実行
    task city: :environment do
        path = File.join Rails.root, "db/csv/city.csv"
        puts "読み込みpath: #{path}"
        CSV.foreach(path, headers: true) do |row|
            city = City.create!(prefecture_id: row["prefecture_id"],name: row["name"], yomikata: row["yomikata"])
        end
        puts "完了！"
    end

    # ここから下は無視
    task company: :environment do
    path = File.join Rails.root, "db/csv/company.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
        puts row["name"]
        puts row["logo_url"]
        puts row[""]
    end
    puts "start to create prefecture data"
    end
end
