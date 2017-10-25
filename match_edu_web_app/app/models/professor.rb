class Professor < ApplicationRecord
    def self.search(search)
        where("name LIKE ? OR school LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end
