class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.belongs_to :user
      t.belongs_to :place
      t.datetime :arrived_at, null: false
      t.datetime :left_at
      t.timestamps
    end
  end
end
