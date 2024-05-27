FROM python:3.13-rc-bullseye

# Upgrades pip to the latest version
RUN python -m pip install --upgrade pip

# Sets the working directory inside the container where our app will run
WORKDIR /app

# Copy the top-level files in your service's directory
# Modify these instructions to do that
COPY requirements.txt .

# Installs all the python packages listed in our requirements.txt file
RUN python -m pip install -r requirements.txt

# Copy the entire project into the container
COPY . .

# This is the command that runs when the docker container starts
CMD uvicorn api.main:app --host 0.0.0.0 --port 8000 --forwarded-allow-ips "*"
