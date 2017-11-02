################################################################################
#work on the app in development mode, on a local machine:
################################################################################

git clone git@github.com:dus/container.git
cd container
make development

#in another window (when the containers have started properly)
make development_db

#browse through port 3000:
firefox localhost:3000


################################################################################
#work on the app in production mode, on a local machine:
################################################################################

git clone git@github.com:dus/container.git
cd container
make production

#in another window (when the containers have started properly)
make production_db

#browse through port 80:
firefox localhost:80

















# README
# this solution uses already made containers. A bit more care would be needed in order to use containers in production
# (would probably build them from a standard container, such as debian, and then add ruby, nginx, etc...).
# Would probably host the containers in a private docker repository in amazon.

#for development:
#need to have installed docker and docker-compose

docker-compose up --build
docker-compose run web db:create
docker-compose run web db:migrate
-> go to localhost:3000 and you should access the rails app

#for production environment on local machine (launched with docker compose):
docker-compose -f docker-compose-production.yml up --build 
docker-compose -f docker-compose-production.yml run web rails db:create RAILS_ENV=production
docker-compose -f docker-compose-production.yml run web rails db:migrate RAILS_ENV=production
#the commands related to the database are separated, because the database could be hosted on aws rds

#in production nginx is in front of the rails container. Would need to secure the port exposed by rails, and also share somehow the static content from rails (i.e. the assets)

#if need to build without using cache:
docker-compose -f docker-compose-production.yml build --nocache

#to run command in running container (debugging):
docker exec -it "id of running container" bash
#to get the id:
docker ps -notrunc

#to test kubernetes locally:
#need to have installed minikube (will install a vm locally, with kubernetes support)

minikube start

#to control the cluster:

kubectl ....
kubectl get nodes















#backup

#to build the container:
docker-compose build

#to run it (by default, it runs rails)
docker-compose up

#to run a command:
docker-compose run web <command>

#if need to rebuild the gems (for instance), can build the container:
docker-compose build

#or to run it after rebuilding it:
docker-compose up --build

#if you need to modify in the host directory, you can do it directly.
#However, whichever change that affects the system needs to be done through a command passed to docker-compose

#if you need to create the database:
docker-compose run web rails db:create

#scaffolding:
docker-compose run web rails generate scaffold post title:string

#database migration:
docker-compose run web rails db:migrate
#RAILS_ENV=test docker-compose run web rails db:migrate
docker-compose run web rails db:test:prepare

