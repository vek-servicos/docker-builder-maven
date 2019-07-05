# vek_docker_image=vekservicos/docker-builder-maven:openjdk-8
# docker build -t $vek_docker_image .
# docker run --rm -it --name ${vek_docker_image} --mount type=bind,source="$(pwd)",target=/vek-app ${vek_docker_image}
# docker run --rm -it -v ~/.aws:/root/.aws -v ~/.m2:/root/.m2 -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/root/.gitconfig -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/vek-app $vek_docker_image

FROM vekservicos/docker-builder-java:openjdk-8 AS java

# Update repository
RUN apt-get update -yqq

# Install Maven
RUN sudo apt-get install -fyqq maven=3.6.*

# Clean environment
RUN sudo apt-get install -fyqq
RUN sudo apt-get autoremove -yqq
# RUN sudo apt-get clean -yqq
RUN sudo apt-get autoclean -yqq
