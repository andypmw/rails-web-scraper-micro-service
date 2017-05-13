require 'securerandom'
require 'uri'

class IndexJobController < ApplicationController
  def say_hi
    render status: 200, json: {
      message: 'WebScraper micro service',
      maintainer: 'Andy Primawan',
      readme: 'https://github.com/andypmw/rails-web-scraper-micro-service'
    }
  end

  def show_customers_jobs
    @customer = Customer.find(params['customer_id'])
    index_jobs = Customer.find(params['customer_id']).index_jobs
    render status: 200, template: 'index_job/show_customers_jobs', formats: :json
  end

  def show_an_index_job
    @job = Customer.find(params['customer_id']).index_jobs.find(params['index_job_id'])
    render status: 200, template: 'index_job/show_an_index_job', formats: :json
  end

  def create
    customer_id = params['customer_id']
    page_url = params['page_url']
    index_job_id = SecureRandom.uuid

    if customer_id.nil? or page_url.nil?
      render status: 400, json: { 
        status: 400, 
        error: 'Bad Request', 
        message: 'You must supply customer_id and page_url' 
      } and return
    end

    unless page_url =~ /\A#{URI.regexp(['http', 'https'])}\z/
      render status: 400, json: { 
        status: 400, 
        error: 'Bad Request', 
        message: 'You must supply valid HTTP or HTTPS page_url' 
      } and return
    end

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
