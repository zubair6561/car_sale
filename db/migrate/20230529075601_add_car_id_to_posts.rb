class AddCarIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :car, null: false, foreign_key: true
  end
end
