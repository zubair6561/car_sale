class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :city
      t.string :price
      t.string :engine_detail
      t.string :transmission_type
      t.string :color
      t.string :milage
      t.string :engine_capacity
      t.string :assembly_type

      t.timestamps
    end
  end
end
