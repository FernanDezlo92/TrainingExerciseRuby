class CreateMatch < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :result_home
      t.integer :result_away
      t.references :round, null: false, foreign_key: true
      t.timestamps
    end
  end
end
