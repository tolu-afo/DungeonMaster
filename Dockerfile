# Use the official Debian 12 (bookworm) image as the base
FROM debian:12

# Set up environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    python3.11 \
    python3-pip \
    python3-venv \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.11 as the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

# Verify Python, pip, and Poetry installation
RUN python --version && pip --version && poetry --version

# Set up working directory
WORKDIR /app

# Clone the DungeonMaster GitHub repository
RUN git clone https://github.com/tolu-afo/DungeonMaster.git

# Change the working directory to the cloned repository
WORKDIR /app/DungeonMaster

# Initialize Poetry in the project
RUN poetry init -n

# Add behave package using Poetry
RUN poetry add behave

# Install project dependencies
RUN poetry install

# Set entry point for the container (optional, adjust based on use case)
# ENTRYPOINT ["python", "your_script.py"]

# Expose necessary ports (if applicable)
# EXPOSE 8080

# Command to run your application
# CMD ["python", "your_script.py"]
