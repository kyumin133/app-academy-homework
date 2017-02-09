class AddHouses < ActiveRecord::Migration
  def up
    create_table :houses do |h|
      h.string :address
    end
  end
end
