class AddContactsToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :primary_contact, :string
    add_column :cars, :secondary_contact, :string
  end
end
