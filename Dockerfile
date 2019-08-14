FROM julia:stretch

RUN apt-get update 

RUN apt-get upgrade -yq

RUN apt-get install -yq \
  python3-pip \
  build-essential

RUN pip3 install --upgrade pip

RUN pip install \
  jupyter \
  jupyterlab

RUN jupyter serverextension enable \
  --py jupyterlab \
  --sys-prefix

WORKDIR /srv/app

RUN useradd app \
  --create-home \
  --shell=/bin/bash

RUN chown -R app:app /srv/app

USER app

RUN julia -e "using Pkg; Pkg.add(\"IJulia\")"