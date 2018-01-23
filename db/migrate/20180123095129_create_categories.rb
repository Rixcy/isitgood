class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.string :dimensions
      t.boolean :active, default: true
      t.timestamps null: false
    end
  end
end
