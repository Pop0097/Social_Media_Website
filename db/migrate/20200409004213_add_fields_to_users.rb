class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    #adds username to users object
    add_column :users, :username, :string, null: 'false'
    add_index :users, :username, unique: true

    add_column :users, :sex, :string, null: 'false', default: 'Male' #adds sex to users object

    #adds phone number to user object
    add_column :users, :phone_number, :string, null: 'false'
    add_index :users, :phone_number, unique: true

    add_column :users, :birth_year, :integer, null: 'false' #adds birth year to users object
    add_column :users, :birth_month, :string, null: 'false' #adds birth month to users object
    add_column :users, :birth_day, :integer, null: 'false' #adds birth date to users object

    add_column :users, :name, :string, null: 'false' #adds name to users object

    add_column :users, :age, :integer, null: 'false' #adds age to users object
  end
end
