class SalesCount < ApplicationRecord
    self.data = [
        { id: 1, count: "初めて" },
        { id: 2, count: "2回目" },
        { id: 3, count: "3回以上" }
    ]
end
