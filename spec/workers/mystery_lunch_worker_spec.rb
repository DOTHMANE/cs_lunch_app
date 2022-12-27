require "rails_helper"
require "fugit"

RSpec.describe "sidekiq-scheduler" do
  sidekiq_file = File.join(Rails.root, "config", "sidekiq_scheduler.yml")
  schedule = YAML.load_file(sidekiq_file)['default']

  describe "cron syntax" do
      it "#{schedule["cron"]} has correct cron syntax" do
        expect { Fugit.do_parse(schedule["cron"]) }.not_to raise_error
      end
  end

  describe "job classes" do
      it "#{schedule["class"]} class in /jobs" do
        expect { schedule["class"].constantize }.not_to raise_error
      end
  end
end
