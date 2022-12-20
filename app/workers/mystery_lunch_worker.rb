class MysteryLunchWorker
  include Sidekiq::Worker

  def perform
    MysteryLunchService.new.process
  end
end
