class CreateAtionTextTable < ActiveRecord::Migration[7.1]
  def up
    execute "CREATE TABLE ation_text_tables (id #{primary_key_type} PRIMARY KEY, name VARCHAR NOT NULL, body TEXT, record_type VARCHAR NOT NULL, record_id #{foreign_key_type} NOT NULL, created_at TIMESTAMP NOT NULL, updated_at TIMESTAMP NOT NULL, UNIQUE (record_type, record_id, name))"
  end

  def down
    drop_table :ation_text_tables
  end

  private

  def primary_key_type
    Rails.configuration.generators.options[Rails.configuration.generators.orm][:primary_key_type] || 'BIGSERIAL'
  end

  def foreign_key_type
    Rails.configuration.generators.options[Rails.configuration.generators.orm][:foreign_key_type] || 'BIGINT'
  end
end
