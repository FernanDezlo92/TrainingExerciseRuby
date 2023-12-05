class CreateTeam < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :color
      t.integer :score
      t.references :match, null: false, foreign_key: true
      t.timestamps
    end
  end
end
