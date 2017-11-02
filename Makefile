development:
	git submodule update --init
	docker-compose up --build

development_db:
	docker-compose run web rails db:create
	docker-compose run web rails db:migrate

production:
	docker-compose -f docker-compose-production.yml up --build

production_db:
	docker-compose -f docker-compose-production.yml run web rails db:create RAILS_ENV=production
	docker-compose -f docker-compose-production.yml run web rails db:migrate RAILS_ENV=production
	docker-compose -f docker-compose-production.yml run web rails assets:precompile RAILS_ENV=production
