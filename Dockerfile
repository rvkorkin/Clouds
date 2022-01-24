FROM ubuntu:18.04
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade

RUN pip3 -q install beautifulsoup4
RUN pip3 -q install numpy 
RUN pip3 -q install  matplotlib
RUN pip3 -q install  seaborn 
RUN pip3 -q install  pydot
RUN pip3 -q install jupyterlab


RUN mkdir src
WORKDIR src/
COPY . /src


#RUN 
#   && jupyter labextension install jupyterlab --no-build \
#   && jupyter lab build -y \
#   && jupyter lab clean -y \
#   && rm -rf "/home/${NB_USER}/.cache/yarn" \
#   && rm -rf "/home/${NB_USER}/.node-gyp" \
#   && fix-permissions "${CONDA_DIR}" \
#   && fix-permissions "/home/${NB_USER}"

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
