class ContractType < ApplicationRecord
    self.data = [
        { id: 1, type: "専属専任媒介契約" },
        { id: 2, type: "専任媒介契約" },
        { id: 3, type: "一般媒介契約" },
        { id: 4, type: "わからない" }
    ]
end
