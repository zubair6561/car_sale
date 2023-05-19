class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :carmodel
      t.string :city
      t.string :price
      t.string :enginedetail
      t.string :transmissiontype
      t.string :color
      t.string :milage
      t.string :enginecapacity
      t.string :assemblytype

      t.timestamps
    end
  end
end
