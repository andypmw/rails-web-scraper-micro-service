require 'securerandom'

class IndexJobController < ApplicationController
  def index
  end

  def show
  end

  def create
    customer_id = params['customer_id']
    page_url = params['page_url']
    index_job_id = SecureRandom.uuid

    IndexJob.new(
      customer_id: customer_id,
      id: index_job_id,
      page_url: page_url,
      status: :wait
    ).save!
    
    IndexWorker.perform_async(customer_id, index_job_id)

    render status: 201, json: { index_job_id: index_job_id }
  end

  def cancel
  end
end
