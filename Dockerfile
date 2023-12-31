# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04
USER root
# RUN useradd -l -m -s -R /bin/bash "cris"

# Update the package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add the deadsnakes PPA to get Python 3.10
RUN add-apt-repository -y ppa:deadsnakes/ppa

# Update the package lists again
RUN apt-get update

# Install Python 3.10 and pip
RUN apt-get install -y python3.10 python3-pip python3.10-venv
# RUN apt-get install python3.10-venv

# Set Python 3.10 as the default Python version
RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.10 1

# Set the default working directory
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python packages from requirements.txt
RUN pip3 install -r requirements.txt

# Set the entry pointdocker-machine ip
# USER cris
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
