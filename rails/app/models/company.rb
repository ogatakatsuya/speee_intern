class Company < ApplicationRecord
    has_many :branches, dependent: :destroy
    validates :name, presence: true
    validates :logo_url, presence: true
    validates :ieul_company_id, presence: true
end
