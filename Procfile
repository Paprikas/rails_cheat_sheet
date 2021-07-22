release: bundle exec rails db:migrate
web: bundle exec puma -C config/puma_production.rb
worker: bundle exec sidekiq -c 2
