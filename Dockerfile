# Use fed base container
FROM ghcr.io/scaleoutsystems/fedn/fedn:develop

# Install requirements
COPY ./requirements.txt /tmp/requirements.txt
RUN /venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt