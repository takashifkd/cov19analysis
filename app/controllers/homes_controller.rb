class HomesController < ApplicationController
  def import
    PcrTest.import(params[:file])
    redirect_to root_url
  end

  def top
    @search = PcrTest.ransack(params[:q])
    @result = @search.result
    @mindate = @search.result.order('date desc').last
    @maxdate = @search.result.order('date desc').first
    @all = PcrTest.all.order(:date)
  end

  # def self.import
  #   CSV.foreach(file.path, headers: true) do |row|
  #     test = find_by(date: row["date"]) || new
  #     test.attributes = row.to_hash.slice(*updatable_attributes)
  #     test.save
  #   end
  # end

  def data
    @pcr = PcrTest.all.order(:date)
  end

  def graph
    # @q = PcrTest.ransack(params[:q])
    # @graph = @q.result(distinct: true)
    @pcrGraph = PcrTest.order(date: :asc)
  end

  def export
  end

  def show
  end
end
