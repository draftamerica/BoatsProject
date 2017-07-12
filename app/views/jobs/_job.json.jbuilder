json.extract! job, :id, :user_id, :containers, :description, :cost, :origin, :destination, :created_at, :updated_at
json.url job_url(job, format: :json)
