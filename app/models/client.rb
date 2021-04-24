class Client < ApplicationRecord
    has_many :pets, dependent: :destroy
    def to_s
        name
    end
end
