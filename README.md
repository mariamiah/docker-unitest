# Docker Unit Test

- Test the Docker image before shipping it

## Tools used

- container-structure-test

### Installation

```shell
curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64
chmod +x container-structure-test-linux-amd64
sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test
```

#### Setup

- Add a docker file at the root of the project
- Build the image using the file above using `docker-unit-test`
- Add a `unit-test.yaml` file at the project root
- Check for file existence and file content
- Run the tests locally using `container-structure-test test --image docker-unit-test --config unit-test.yaml`

#### Automated Testing of Docker containers

- Add this step to the pipeline

```shell

- name: unit test Docker Image
  shell: |
    container-structure-test test --image {{ docker_image }} --config {{ test_file }}
    if $?
    then
      echo "Test Failed"
      exit 1
    else
      echo "Test Succeeded"
      exit 0
    fi
```