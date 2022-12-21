class MysteryLunchesController < ApplicationController
  def index
    @mystery_lunches = MysteryLunch.all
  end
end
