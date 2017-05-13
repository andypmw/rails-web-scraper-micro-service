class Customer
  include Cequel::Record

  key :id, :uuid
  column :name, :text
  column :key_id, :text
  column :key_secret, :text
  column :is_active, :boolean
  timestamps

  has_many :index_jobs
end
