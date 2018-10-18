# frozen_string_literal: true

class Theater < ApplicationRecord
  has_many :shows
end
