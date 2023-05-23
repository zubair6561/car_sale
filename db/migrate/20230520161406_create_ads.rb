class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :step1_attribute
      t.string :step2_attribute
      t.string :step3_attribute

      t.timestamps
    end
  end
end
