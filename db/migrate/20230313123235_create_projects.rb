# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code, null: false, index: { unique: true }
      t.belongs_to :leader, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
