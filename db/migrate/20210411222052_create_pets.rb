class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :breed
      t.date :birthday

      t.timestamps
    end
  end
end
