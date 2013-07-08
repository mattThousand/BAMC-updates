class AddSlugToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :slug, :string
    add_index :tracks, :slug, unique: true
  end
end
