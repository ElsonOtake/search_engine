# frozen_string_literal: true

json.extract! analytic, :id, :created_at, :updated_at
json.url analytic_url(analytic, format: :json)
