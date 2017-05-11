class IndexJob
  include Cequel::Record

  belongs_to :customer
  column :id, :uuid, order: :desc
  column :status, :enum, values: { wait: 1, process: 2, success: 3, fail: 4 }
  timestamps
end
