FROM mcr.microsoft.com/devcontainers/python:3.11

# Install LaTeX, Manim dependencies and other necessary tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-lang-european \
        latexmk \
        ffmpeg \
        libcairo2-dev \
        libpango1.0-dev \
        pkg-config \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Manim globally
RUN pip install --no-cache-dir manim
