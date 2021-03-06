class CreateHwsInstrumentResourceStoreTable < ActiveRecord::Migration[6.1]
  def self.up
    create_table :instruments_resources_stores do |t|
      t.belongs_to :store, type: :uuid, foreign_key: true
      t.belongs_to :instrument, type: :uuid, foreign_key: true
      t.belongs_to :resource, type: :uuid, foreign_key: true

      t.timestamps
    end

    add_index :instruments_resources_stores, %I[store_id instrument_id], name: 's_i_index'
    add_index :instruments_resources_stores, %I[instrument_id store_id], name: 'i_s_index'
  end

  def self.down
    drop_table :instruments_resources_stores
  end
end
