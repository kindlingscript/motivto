class CheckMeritRankRulesJob < ActiveJob::Base
  queue_as :default

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      Merit.RankRules.new.check_rank_rules
    end
  end
end