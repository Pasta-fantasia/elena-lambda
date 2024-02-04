FROM python:3.11-bookworm

ENV MODULE_NAME=elena_basic
ENV USER=${MODULE_NAME}
ENV CLI=${MODULE_NAME}
ENV USER_HOME=/home/${USER}
# when using pip install --user => ~/.local/bin must be added to PATH
ENV PATH="${PATH}:${USER_HOME}/.local/bin"

# source destination to run pip install
ENV APP_INSTALL_DIR=/opt/${USER}

ENV ELENA_HOME=/home/${USER}/data


## Ensure build-deps
#RUN apt-get update --yes && \
#    apt-get install --yes --no-install-recommends \
#    fonts-dejavu \
#    gfortran \
#    build-essential libssl-dev gcc && \
#    apt-get clean && rm -rf /var/lib/apt/lists/*


# Create a non-root user
RUN set -ex \
    && addgroup --system --gid 1001 ${USER} \
    && adduser  --uid 1001 --gid 1001 ${USER} \
    && mkdir --parents ${APP_INSTALL_DIR} \
    && chown ${USER}:${USER} ${APP_INSTALL_DIR}



# install as user
USER ${USER}
RUN pip install --user --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --user --no-cache-dir git+https://github.com/Pasta-fantasia/elena.git@v2.2.9 \
    git+https://github.com/Pasta-fantasia/elena-basics.git@v0.0.15 \
    git+https://github.com/Pasta-fantasia/elena-notifications-telegram.git@v0.0.1
WORKDIR ${USER_HOME}

#CMD ${MODULE_NAME}
CMD elena
