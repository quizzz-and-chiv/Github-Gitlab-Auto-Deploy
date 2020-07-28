FROM docker.pkg.github.com/evoja/docker-git-auto-deploy/gitautodeploy-ch:dv0.17
COPY my.config.json ./config.json
EXPOSE 8080
CMD ["--ssh-keyscan"]
