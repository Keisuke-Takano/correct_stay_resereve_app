class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_of_people
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
