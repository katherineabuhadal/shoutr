class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.belongs_to :user, index: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
