class AddHouseResidentAssociation < ActiveRecord::Migration
  def change
    drop_table :houses
    create_table :houses do |house|
      house.string :address

    end

    drop_table :people
    create_table :people do |person|
      person.string :name
      person.integer :house_id
    end
  end
end
