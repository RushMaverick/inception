# Inception 
[subject](https://cdn.intra.42.fr/pdf/pdf/81505/en.subject.pdf)
## To-Do List
- Set Up a Virtual Machine
- Install Docker and Docker Compose
- Create a Docker Network
- Write Dockerfiles for Each Service
- Configure Docker Compose
- Set Up NGINX with TLS
- Set Up WordPress with php-fpm
- Set Up MariaDB
- Configure Volumes
- Configure Domain Name
- Testing and Validation
## Detailed Instructions
1. Set Up a Virtual Machine
Choose a virtualization platform (e.g., VirtualBox, VMware).
Create a new VM and install either Alpine or Debian as the OS.
2. Install Docker and Docker Compose
Install Docker: Follow the official documentation for installing Docker on your chosen OS.
Install Docker Compose: Follow the Docker documentation to install Docker Compose.
3. Create a Docker Network
Use Docker CLI to create a custom network: docker network create my_network.
4. Write Dockerfiles for Each Service
NGINX: Base your image on Alpine or Debian. Configure NGINX to use TLSv1.2 or TLSv1.3.
WordPress + php-fpm: Use the official WordPress image as a reference, but ensure you customize it for your needs. Do not include NGINX in this container.
MariaDB: Similar to WordPress, reference the official MariaDB image but write your own Dockerfile.
5. Configure Docker Compose
Write a docker-compose.yml that defines services for NGINX, WordPress + php-fpm, and MariaDB.
Use the build: directive to point to Dockerfiles for each service.
Define the networks and volumes accordingly.
6. Set Up NGINX with TLS
Create a self-signed SSL certificate or obtain one from a CA.
Configure NGINX to listen on port 443 and use the SSL certificate.
7. Set Up WordPress with php-fpm
Ensure WordPress is configured to connect to MariaDB.
Use environment variables for database credentials.
8. Set Up MariaDB
Configure MariaDB with a database for WordPress.
Create two users, ensuring the administrator does not have a prohibited username.
9. Configure Volumes
Create two volumes: one for the WordPress database and another for website files.
Ensure these are mounted in /home/your_login/data.
10. Configure Domain Name
Edit your host machine's hosts file to point your custom domain (e.g., your_login.42.fr) to the local IP address.
11. Testing and Validation
Test the entire setup to ensure everything works as expected.
Ensure containers restart on crash.
Validate that you can access your WordPress site through https://your_login.42.fr.
## Additional Notes
For the .env file, store all your environment variables here and reference them in your docker-compose.yml.
Ensure no passwords are hardcoded in Dockerfiles. Use environment variables.
Read about PID 1 issues and Docker best practices to avoid common pitfalls.
By following these steps and ensuring each component is configured correctly, you'll have a fully functional infrastructure set up as per the project requirements.




