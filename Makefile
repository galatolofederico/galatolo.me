update:
	git remote -v | grep public > /dev/null || git remote add public https://github.com/galatolofederico/galatolo.me.git
	git pull public main
	./update-repo.sh https://github.com/galatolofederico/personal-website-next.git
	./update-repo.sh https://github.com/galatolofederico/me.json.git
	./update-repo.sh https://github.com/galatolofederico/cv.git

build:
	docker-compose build personal-website

restart-web:
	docker-compose restart reverse-proxy personal-website cv certbot
