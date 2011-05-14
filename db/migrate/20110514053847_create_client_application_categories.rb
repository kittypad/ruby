class CreateClientApplicationCategories < ActiveRecord::Migration
  def self.up
    create_table :client_application_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :client_application_categories
  end
end
