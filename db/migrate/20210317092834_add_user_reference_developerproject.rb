class AddUserReferenceDeveloperproject < ActiveRecord::Migration[6.1]
  def change
    add_reference :developerprojects, :user, null: false, foreign_key: true
  end
end
