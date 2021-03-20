class AddUserReferenceBug < ActiveRecord::Migration[6.1]
  def change
    add_reference :bugs, :user, null: false, foreign_key: true
  end
end