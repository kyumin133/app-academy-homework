class AddPeople < ActiveRecord::Migration
  def up
    create_table :people do |p|
      p.string :name
      p.integer :house_id
    end
  end
end
