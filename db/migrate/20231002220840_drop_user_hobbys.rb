class DropUserHobbys < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_hobbys
  end
end
