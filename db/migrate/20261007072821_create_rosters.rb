class CreateRosters < ActiveRecord::Migration[8.1]
  def change
    create_table :rosters do |t|
      t.string :name

      t.timestamps
    end
    add_index :rosters, :name, unique: true
  end
end
