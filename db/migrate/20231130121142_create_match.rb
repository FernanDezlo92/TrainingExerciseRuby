class CreateMatch < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :day
      t.time :start_time
      t.time :end_time
      t.integer :result_home
      t.integer :result_away
      t.references :round, null: false, foreign_key: true
      t.timestamps
    end
  end
end
