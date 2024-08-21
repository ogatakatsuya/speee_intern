class SalesCount < ActiveHash::Base
    self.data = [
        { id: 1, count: "初めて" },
        { id: 2, count: "2回目" },
        { id: 3, count: "3回以上" }
    ]
    include ActiveHash::Associations
    has_many :reviews
end
