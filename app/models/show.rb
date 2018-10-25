# frozen_string_literal: true

class Show < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :theater
  validates :name, :theater, :location, :time, :price, :link, presence: true
  validate :date_in_range
  validates_uniqueness_of :name, conditions: -> { where("created_at > DATETIME('now', '-12 hours')") }

  def formatted_time
    time.strftime('%B %e, %l:%M %p')
  end

  def formatted_price
    number_to_currency(price, unit: '$')
  end

  def formatted_industry_price
    number_to_currency(industry_price, unit: '$')
  end

  def theater_name
    theater&.name
  end

  def date_in_range
    if time.present? && (time < Time.zone.now || time > Time.zone.now + 1.day)
      errors.add(:show_time, "can't be past or more than a day in advance.")
    end
  end
end
