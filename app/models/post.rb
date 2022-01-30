class Post < ApplicationRecord
   
   validates :place, {presence: true}
   validates :room_name, {presence: true}
   validates :price, {presence: true}
   

   belongs_to :user
   belongs_to :reserve, optional: true
end
