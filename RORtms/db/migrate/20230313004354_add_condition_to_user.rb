class AddConditionToUser < ActiveRecord::Migration[7.0]
  def change
    execute "UPDATE users SET confirmed = false WHERE confirmed IS NULL;"
    execute "ALTER TABLE users ALTER COLUMN confirmed SET DEFAULT false, ALTER COLUMN confirmed SET NOT NULL;"
    execute "ALTER TABLE users ALTER COLUMN last_name SET NOT NULL;"
    execute "ALTER TABLE users ALTER COLUMN first_name SET NOT NULL;"
  end
end
