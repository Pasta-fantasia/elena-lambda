# elena-docker

Elena running in a docker container first version.

- Set your secrets.yaml configuration on local_data directory.
- Review strategies.yaml to your convenience.
- Use ./build to create the container image
- Use ./start to run elena

As it's now it'll work out-of the box on OSX. 

On Linux a chmod configuration over local_data dir is necessary:
```
chmod a+w local_data/
```