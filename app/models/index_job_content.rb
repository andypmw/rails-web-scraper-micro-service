class IndexJobContent
  include Cequel::Record

  belongs_to :index_job
  key :content_order, :int
  column :type, :enum, values: { h1: 1, h2: 2, h3: 3, anchor: 4 }
  column :content, :text
end
