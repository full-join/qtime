# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :google_id, null: false
      t.timestamps
    end
  end
end
