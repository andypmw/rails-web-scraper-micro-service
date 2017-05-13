class IndexJob
  include Cequel::Record

  belongs_to :customer
  key :id, :uuid, order: :desc
  column :page_url, :text
  column :status, :enum, values: { wait: 1, process: 2, success: 3, fail: 4 }
  timestamps

  has_many :index_jobs_contents
end
