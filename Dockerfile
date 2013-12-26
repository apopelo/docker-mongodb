FROM ubuntu:12.04

MAINTAINER Andrey Popelo andrey@popelo.com


# Install Mongodb
ENV MONGODB_VERSION 2.0.0
ENV MONGODB mongodb-linux-x86_64-$MONGODB_VERSION
ADD http://downloads.mongodb.org/linux/$MONGODB.tgz /opt/$MONGODB.tgz
RUN tar -C /opt --extract --file /opt/$MONGODB.tgz
RUN ln -s /opt/$MONGODB /opt/mongodb

# Create directory for MongoDB database
RUN mkdir -p /data/db

# mongod
EXPOSE 27017

# web console
EXPOSE 28017

# run mongod
CMD ["/opt/mongodb/bin/mongod", "--dbpath", "/data/db"]
