FROM ubuntu:16.04

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential


# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

COPY myapplication/req.txt /opt/

#RUN pip install -r /opt/req.txt

RUN apt-get install -y python-flask python-cherrypy3

# Copy the application folder inside the container
ADD myapplication /myapplication




# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /myapplication

# Set the default command to execute    
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python server.py --host=0.0.0.0

