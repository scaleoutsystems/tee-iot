{
  "name": "devcontainer",
  "dockerFile": "Dockerfile",
  "context": "..",
  "remoteUser": "default",
  // "workspaceFolder": "/tee-iot",
  // "workspaceMount": "source=/path/to/tee-iot,target=/tee-iot,type=bind,consistency=default",
  "extensions": [
    "exiasr.hadolint",
    "yzhang.markdown-all-in-one",
    "ms-python.python",
  ],
  "mounts": [
    "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind,consistency=default",
  ],
  "forwardPorts": [
    8090,
    9000,
    9001,
    8081
  ],
  "runArgs": [
    "--net=host",
  ],
}