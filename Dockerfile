FROM debian:bookworm-slim

ARG GHC_VERSION=9.4.8
ARG STACK_VERSION=recommended
ARG STACK_RESOLVER=nightly
ARG CABAL_VERSION=recommended
ARG HLS_VERSION=recommended

ENV LANG=C.UTF-8 \
    USERNAME=devcontainer \
    USER_UID=1000 \
    USER_GID=1000 \
    DEBIAN_FRONTEND=noninteractive \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=yes \
    BOOTSTRAP_HASKELL_NO_UPGRADE=yes \
    GHC_VERSION=${GHC_VERSION} \
    STACK_VERSION=${STACK_VERSION} \
    STACK_RESOLVER=${STACK_RESOLVER} \
    CABAL_VERSION=${CABAL_VERSION} \
    HLS_VERSION=${HLS_VERSION}

RUN ulimit -n 8192
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends software-properties-common wget && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
        bash \
        build-essential \
        curl \
        git \
        libffi-dev \
        libffi8 \
        libgmp-dev \
        libgmp10 \
        libncurses-dev \
        libncurses5 \
        libtinfo5 \
        sudo \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd -ms /bin/bash -K MAIL_DIR=/dev/null --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} && \
    echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} && \
    chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USER_UID}:${USER_GID}
WORKDIR /home/${USERNAME}

# Add GHCUp and Cabal to the PATH
ENV PATH="/home/${USERNAME}/.local/bin:/home/${USERNAME}/.cabal/bin:/home/${USERNAME}/.ghcup/bin:$PATH"
RUN echo "export PATH=${PATH}" >> /home/${USERNAME}/.profile

# Download and install GHCUp
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Download and install GHC and tooling
RUN ghcup install ghc ${GHC_VERSION} --set
RUN ghcup install cabal ${CABAL_VERSION} --set
RUN ghcup install stack ${STACK_VERSION} --set
RUN ghcup install hls ${HLS_VERSION} --set

# Configure Cabal
RUN cabal update && cabal new-install cabal-install
RUN cabal user-config update -f && \
    sed -i 's/-- ghc-options:/ghc-options: -haddock/g' ~/.cabal/config

# Configure Stack
RUN ((stack ghc -- --version 2>/dev/null) || true) && \
    stack config --system-ghc set system-ghc true --global && \
    stack config --system-ghc set install-ghc false --global && \
    stack config --system-ghc set resolver ${STACK_RESOLVER}
RUN printf "ghc-options:\n  \"\$everything\": -haddock\n" >> /home/${USERNAME}/.stack/config.yaml

# Install useful dependencies
RUN cabal update && \
    cabal install --haddock-hoogle --minimize-conflict-set \
        fsnotify-0.4.1.0 \
        haskell-dap-0.0.16.0 \
        ghci-dap-0.0.22.0 \
        haskell-debug-adapter-0.0.39.0 \
        hlint-3.6.1 \
        apply-refact-0.14.0.0 \
        retrie-1.2.2 \
        hoogle-5.0.18.3 \
        ormolu-0.7.2.0

# Download local Hoogle database
RUN hoogle generate --download --haskell

ENV DEBIAN_FRONTEND=dialog
ENTRYPOINT ["/bin/bash"]
