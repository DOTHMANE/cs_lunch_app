class MysteryLunchesController < ApplicationController
  def index
    if params[:year].present? && params[:month].present?
      date =  DateTime.new(params[:year].to_i, params[:month].to_i, 1 )
      @mystery_lunches = MysteryLunch.where(created_at: date..date.end_of_month)
    else
      @mystery_lunches = MysteryLunch.current_month
    end
  end
end
