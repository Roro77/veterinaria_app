class Pet < ApplicationRecord
    has_many :histories, dependent: :destroy
    
    def to_s
        name   
    end

    def histories_count
        self.histories.count
    end

    def average_weight
        self.histories.sum(:weight) / self.histories_count
    end
    
    def average_height
        self.histories.sum(:height) / self.histories_count
    end

    def max_height
        self.histories.maximum(:height)
    end

    def max_weight
        self.histories.maximum(:weight)
    end
end
