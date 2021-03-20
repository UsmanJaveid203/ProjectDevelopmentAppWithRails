class CreateDeveloperprojects < ActiveRecord::Migration[6.1]
  def change
    create_table :developerprojects do |t|
      t.timestamps
    end
  end
end
