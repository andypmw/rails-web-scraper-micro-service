json.index_jobs @customer.index_jobs do |job|
  json.id job.id.to_s
  json.page_url job.page_url
  json.status job.status
  json.created_at job.created_at
  json.updated_at job.updated_at
end
