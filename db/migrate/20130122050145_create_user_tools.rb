class CreateUserTools < ActiveRecord::Migration
  def change
    create_table :user_tools do |t|

      t.timestamps
    end
  end
end
