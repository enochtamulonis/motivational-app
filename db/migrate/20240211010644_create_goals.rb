class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|

      t.timestamps
    end
  end
end
