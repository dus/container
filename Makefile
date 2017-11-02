development:
	git submodule update --init
	docker-compose up --build

development_db:
	docker-compose run web rails db:create
	docker-compose run web rails db:migrate
