task :fetch_total => :environment do
  Coin.total
  Crypto.total
end

task :past_day => :environment do
  Change.save_it
end
