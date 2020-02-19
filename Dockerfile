FROM ubuntu:16.04

LABEL maintainer="Craig Citro <craigcitro@google.com>"

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        wget \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        scipy \
        sklearn \
        && \
    python -m ipykernel.kernelspec

# --- DO NOT EDIT OR DELETE BETWEEN THE LINES --- #
# These lines will be edited automatically by parameterized_docker_build.sh. #
# COPY _PIP_FILE_ /
# RUN pip --no-cache-dir install /_PIP_FILE_
# RUN rm -f /_PIP_FILE_

# Install TensorFlow CPU version from central repo
# RUN pip --no-cache-dir install \
    #  http://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.0.0-cp27-none-linux_x86_64.whl

RUN pip --no-cache-dir install \    
    https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.14.0-cp27-none-linux_x86_64.whl

# --- ~ DO NOT EDIT OR DELETE BETWEEN THE LINES --- #

# RUN ln -s /usr/bin/python3 /usr/bin/python#

# Install Keras
RUN pip install keras

# Install Gym
RUN pip install gym

# Set up our notebook config.
# COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
# COPY notebooks /notebooks

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
# COPY run_jupyter.sh /
# COPY . .

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8008
COPY examples/ examples/

# Clone DL-Course source
# RUN git clone -q https://github.com/akashs-cuelogic/DL-Course.git dl-courses
WORKDIR examples

#CMD ["/run_jupyter.sh", "--allow-root"]
CMD jupyter notebook --ip=0.0.0.0 --port=8008 --allow-root  