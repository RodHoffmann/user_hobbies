class CreateUserHobbys < ActiveRecord::Migration[7.0]
  def change
    create_table :user_hobbys do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hobby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
