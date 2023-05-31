class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.boolean :closed, default: false
      t.timestamps
    end
  end
  
end
