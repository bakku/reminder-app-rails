web: bundle exec puma -C config/puma.rb
worker: COUNT=${AMOUNT_WORKERS} QUEUE=* rake environment resque:work
