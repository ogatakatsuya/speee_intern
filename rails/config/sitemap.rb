# frozen_string_literal: true

require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://internship-c.sandbox.srv.speee.jp/'

# 不必要な出力を抑制
SitemapGenerator.verbose = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # 店舗一覧
  branches = Branch.all
  # 最後に更新された店舗の更新日時
  branch_last_updated_at = branches.map(&:updated_at).max
  add branches_path, lastmod: branch_last_updated_at

  # TODO: 地域フィルタリング結果
  # URL改善の後に着手

  # 店舗詳細
  Branch.find_each do |branch|
    # 最新の口コミの最新更新日時
    last_updated_review = Review.where(branch_id: branch.id)
                                .order(updated_at: :desc)
                                .first

    # 店舗詳細画面の最終更新日時
    last_updated_at = branch.updated_at
    if last_updated_review && last_updated_at < (last_updated_review.updated_at)
      last_updated_at = last_updated_review.updated_at
    end

    add branch_path(branch), lastmod: last_updated_at
  end

  # 口コミ詳細
  Review.find_each do |review|
    add review_path(review), lastmod: review.updated_at
  end

  # 査定依頼フォーム
  add new_assessment_request_path

  # 査定依頼完了
  add done_assessment_requests_path
end
