# frozen_string_literal: true

class Theater < ApplicationRecord
  has_many :shows
  has_and_belongs_to_many :users
  has_and_belongs_to_many :admin_users
end
