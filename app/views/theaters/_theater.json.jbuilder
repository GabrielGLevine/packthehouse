# frozen_string_literal: true

json.extract! theater, :id, :name, :contact, :created_at, :updated_at
json.url theater_url(theater, format: :json)
