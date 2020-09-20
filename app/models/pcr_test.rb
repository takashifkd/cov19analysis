class PcrTest < ApplicationRecord
  validates :date, presence: true
  validates :tested, numericality: { only_integer: true }
  validates :positive, numericality: { only_integer: true }

  scope :date_between, -> from, to {
    if from.present? && to.present?
      where(date: from..to)
    elsif from.present?
      where('date >= ?', from)
    elsif to.present?
      where('date <= ?', to)
    end
  }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      pcr = find_by(date: row["date"]) || new
      pcr.attributes = row.to_hash.slice(*updatable_attributes)
      pcr.save
    end
  end

  def self.updatable_attributes
    ["date", "tested", "positive"]
  end

  def self.chart_date
    select('date, positive').order(date: :asc)
  end
end
