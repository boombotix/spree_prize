class CreateSpreeEntries < ActiveRecord::Migration
  def change
    create_table :spree_entries do |t|
      t.references :candidate, index: true
      t.references :prize, index: true
    end
  end
end
