class AddColumn < ActiveRecord::Migration
  def change
    add_column :tools, :name, :string
  end

end
