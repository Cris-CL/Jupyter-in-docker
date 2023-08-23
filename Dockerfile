# Use the official Alpine 3.18.3 as the base image
FROM alpine:3.18.3

# Update the package lists and install necessary dependencies
RUN apk update && apk add --no-cache python3 py3-pip py3-virtualenv curl
# RUN apk add --no-cache py3-venv curl


# Set Python 3.10 as the default Python version
RUN ln -sf /usr/bin/python3.10 /usr/bin/python3

# Set the default working directory
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python packages from requirements.txt
# SHELL ["/bin/bash", "-c"]

# RUN py3-pip install --upgrade pip
RUN py3-pip install -r requirements.txt

# Expose the desired port
EXPOSE 8888

# Set the entry point
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
