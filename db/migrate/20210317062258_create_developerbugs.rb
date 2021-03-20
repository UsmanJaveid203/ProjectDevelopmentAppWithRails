class CreateDeveloperbugs < ActiveRecord::Migration[6.1]
  def change
    create_table :developerbugs do |t|
      t.timestamps
    end
  end
end
