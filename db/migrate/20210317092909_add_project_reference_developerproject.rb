class AddProjectReferenceDeveloperproject < ActiveRecord::Migration[6.1]
  def change
    add_reference :developerprojects, :project, null: false, foreign_key: true
  end
end
