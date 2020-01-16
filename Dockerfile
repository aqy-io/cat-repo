FROM centos:7

# Install dependencies
RUN yum install nano -y
RUN yum remove nano -y
RUN yum install nano -y
RUN yum install httpd -y

# Install app1
RUN rm -rf /var/www/html/*
ADD code /var/www/html

# Configure apache
#RUN a2enmod rewrite
#RUN chown -R www-data:www-data /var/www
#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
