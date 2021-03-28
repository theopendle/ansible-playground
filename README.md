# ansible-playground

This project serves to create a minimal playground for writing and testing ansible playbooks.

## Architecture

![Architecure](./doc/architecture.png)

This solution takes teh form of two docker containers:

1. The ansible server: runs ansible and is used to execute the playbooks
2. The target server: empty CentOS container in to be configured by the ansible playbooks

## How to use

### Run the environment

Use the following commands to build and run the environment:

```bash
docker-compose build
docker-compose up
```

### Provide an ansible playbook

The environment includes a volume mounted on you local `/tmp/playbooks`. To provide an ansible playbook, simply copy it to that location:

```bash
cp <you-playbook-path> /tmp/playbooks/
```

For example:

```bash
cp ansible-server/httpd_playbook.yaml /tmp/playbooks/
```

### Trigger execution

Once your playbook is in the volume directory, you can tell the ansible-server container to execute it using the `run_playbook` bash script:

```bash
./run_playbook <your-playbook-name>
```
For example:

```bash
./run_playbook httpd_playbook.yaml
```

The output from the execution of the playbook will be printed to the console.

### Testing the result

If your playbook completes successfully, you can test the result by interacting with the ansible-target container. The `httpd_playbook.yaml` example file installs and runs a httpd server with a customized default page. You can test it by accessing the `http://localhost:6080` URL in your browser.

By default the HTTP and HTTPS ports are exposed on `6080` and `6443` respectively. If you wish to expose other ports, you will have to modify the `ansible-target/Dockerfile` file.