# Use Fedora as the base image
FROM fedora:latest

# Upgrade the system using dnf
RUN dnf -y upgrade

# Install required applications
RUN dnf -y install tuxpaint vim httpd

# Copy myinfo.html file to the container
COPY myinfo.html /var/www/html/

# Expose port 80/tcp
EXPOSE 80/tcp

# Enable httpd service
RUN systemctl enable httpd

# Set the entrypoint to start httpd in foreground mode
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
