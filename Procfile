web: bundle exec puma -C config/puma.rb
worker: COUNT=${AMOUNT_WORKERS} QUEUE=* rails environment resque:work
clock: ruby clock.rb
