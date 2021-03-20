class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :type 
      t.string :status 
      t.string :description
      t.timestamps
    end
  end
end