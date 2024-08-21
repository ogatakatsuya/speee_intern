class PropertyType < ActiveHash::Base
    self.data = [
        { id: 1, type: "マンション" },
        { id: 2, type: "戸建て" },
        { id: 3, type: "土地" }
    ]  
    include ActiveHash::Associations
    has_many :reviews
end
