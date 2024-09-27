# What is this Docker Image?

- **Base Container**: [Alpine](https://hub.docker.com/_/alpine)
- **Programming Language**: [Go(golang)](https://go.dev)
- **Framework**: [Gin](https://github.com/gin-gonic/gin)
- **Library**: [Air](https://github.com/air-verse/air?tab=readme-ov-file)
- **Repository**: [Docker Hub](https://hub.docker.com/repository/docker/bosshie96/golang-air)
- **Source Code**: [Github](https://github.com/Bosshie96/go-air)

We are use this image when start new go project in **Dev/Demo/Tutorial/Learn environments**.

# Requirement:

[Git Bash](https://git-scm.com/downloads)
[Docker Developer tools](https://docs.docker.com/manuals/)

# How to build this Docker Image?

- ## Fastest:

  (Only 1 Command if you want to `build bosshie96/go-air:latest` in parent folder **Bash**)

  ```yaml
  git clone https://github.com/Bosshie96/go-air
  cd go-air

  docker build -f ./Dockerfile -t bosshie96/go-air:latest ./
  ```

  You can edit name tag "bosshie96/go-air:latest"

# How to use this Docker Image?

- ## Fastest:

  **Case 1:** (Only 1 Command if you want to `init new-project` in parent folder)

  ```yaml
  mkdir new-project
  cd new-project
  go mod init new-project

  cat <<EOF > ./docker-compose.yaml
  services:
  go-app:
  	image: bosshie96/go-air:latest
  	volumes:
  	- .:/app
  	ports:
  	- "8080:8080"
  EOF

  cat <<EOF > ./main.go
  package main

  import (
  	"os"

  	"github.com/gin-gonic/gin"
  )

  func main() {
  	r := gin.Default()

  	r.GET("/profile", func(c *gin.Context) {
  		c.JSON(200, gin.H{
  			"profile": "user profile data",
  		})
  	})

  	r.PUT("/profile", func(c *gin.Context) {
  		c.JSON(200, gin.H{
  			"message": "Profile updated",
  		})
  	})

  	port := os.Getenv("PORT")
  	if port == "" {
  		port = "8080"
  	}
  	println("Profile Service listen HTTP on: " + port)
  	r.Run(":" + port)
  }
  EOF

  docker-compose up
  ```

  **Case 2:** (Only 1 Command if want to `run your-exist-project` in project folder)

  ```yaml

  cat <<EOF > ./docker-compose.yaml
  services:
  go-app:
  	image: bosshie96/go-air:latest
  	volumes:
  	- .:/app
  	ports:
  	- "8080:8080"
  EOF

  docker-compose up

  ```

  Edit the file `docker-compose.yaml` to suit your project.

- ## DONE
  After build success, you can run `curl localhost:8080/profile` and edit `main.go` to dev.

## Stars History

![GitHub Repo stars](https://img.shields.io/github/stars/bosshie96/go-air?style=social)
