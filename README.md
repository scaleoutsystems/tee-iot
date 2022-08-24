# CASA IoT in Trusted Execution Environment
In this PoC we mock a use case in which reducer and combiner run on an enclave in a cloud environment, while a classic human activity recognition training task ([CASA](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+from+Continuous+Ambient+Sensor+Data)) is run on an IoT board. This PoC is intended to be used with [Intel SGX](https://www.intel.com/content/www/us/en/developer/tools/software-guard-extensions/overview.html) and it was tested using [Azure Confidential Computing](https://azure.microsoft.com/en-us/solutions/confidential-compute/).

# Table of Contents
- [CASA IoT in Trusted Execution Environment](#casa-iot-in-trusted-execution-environment)
- [Table of Contents](#table-of-contents)
  - [Running the PoC](#running-the-poc)
    - [Get data and setup the environment](#get-data-and-setup-the-environment)
    - [Deploy the PoC](#deploy-the-poc)
    - [Running the PoC](#running-the-poc-1)
    - [Clean up](#clean-up)

## Running the PoC

### Get data and setup the environment
First, download the data by running:

```bash
bin/get_data.sh
```

Then, init the Python virtual environment by running:

```bash
bin/init_venv.sh
```
> **Note** this command was tested with Python 3.8

Now you can generate the seed model by running:

```
client/entrypoint init_seed
```

The next step is to build the compute package:

```
bin/build_package.sh
```

### Deploy the PoC
```bash
sudo docker-compose up -d
```
> **Note** you may need to login into Scaleout's GitHub registry to access ghcr.io/scaleoutsystems/tee-gc/fedn:latest

### Running the PoC
The reducer UI is now available on `https://localhost:8090`. The quickest way to upload `package.tar.gz` and `seed.npz` is via REST API.

```bash
# Upload package
curl -k -X POST \
    -F file=@package.tar.gz \
    -F helper="keras" \
    https://localhost:8090/context

# Upload seed
curl -k -X POST \
    -F seed=@seed.npz \
    https://localhost:8090/models
```

Now navigate to https://localhost:8090 and start the experiment using the UI.

### Clean up
You can release resources by running the following: `sudo docker-compose down`.