class Reserve < ApplicationRecord

    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validates :number_of_people, {presence: true}
    
    belongs_to :user
    belongs_to :post
end
