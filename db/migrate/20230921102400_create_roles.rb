class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :user_role
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
