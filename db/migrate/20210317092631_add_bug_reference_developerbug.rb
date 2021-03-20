class AddBugReferenceDeveloperbug < ActiveRecord::Migration[6.1]
  def change
    add_reference :developerbugs, :bug, null: false, foreign_key: true
  end
end
