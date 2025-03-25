FROM debian:bookworm-slim

ARG GHC_VERSION=9.8.4
ARG STACK_VERSION=3.1.1
ARG STACK_RESOLVER=lts-23.8
ARG CABAL_VERSION=3.12.1.0
ARG HLS_REF=25c5d82ce09431a1b53dfa1784a276a709f5e479

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=yes \
    BOOTSTRAP_HASKELL_NO_UPGRADE=yes \
    GHC_VERSION=${GHC_VERSION} \
    STACK_VERSION=${STACK_VERSION} \
    STACK_RESOLVER=${STACK_RESOLVER} \
    CABAL_VERSION=${CABAL_VERSION} \
    HLS_REF=${HLS_REF}

RUN ulimit -n 8192
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
        man \
        neovim \
        openssh-client \
        software-properties-common \
        sudo \
        wget \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and install GHCUp
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Add GHCUp to the PATH
ENV PATH=${PATH}:/root/.ghcup/bin

# Download and install GHC and tooling
RUN ghcup install ghc ${GHC_VERSION} --set
RUN ghcup install cabal ${CABAL_VERSION} --set
RUN ghcup install stack ${STACK_VERSION} --set

# Add Cabal to the PATH
ENV PATH=${PATH}:/root/.local/bin:/root/.cabal/bin

# Store PATH in .profile
RUN echo "export PATH=${PATH}" >> /root/.profile

# Configure Cabal
RUN cabal update && cabal new-install cabal-install
RUN cabal user-config update -f && \
    sed -i 's/-- ghc-options:/ghc-options: -haddock/g' ~/.cabal/config

# Configure Stack
RUN ((stack ghc -- --version 2>/dev/null) || true) && \
    stack config --system-ghc set system-ghc true --global && \
    stack config --system-ghc set install-ghc false --global && \
    stack config --system-ghc set resolver ${STACK_RESOLVER}
RUN printf "ghc-options:\n  \"\$everything\": -haddock\n" >> ~/.stack/config.yaml

# Compile HLS from source
RUN ghcup compile hls --ghc ${GHC_VERSION} --git-ref ${HLS_REF} --set

# Install useful dependencies
RUN stack update && \
    stack install --allow-newer \
      fsnotify \
      haskell-dap \
      ghci-dap \
      haskell-debug-adapter \
      hlint \
      apply-refact \
      retrie \
      hoogle \
      ormolu \
      implicit-hie

# Download local Hoogle database
RUN hoogle generate --download --haskell

# Create .ghc configuration folder
RUN mkdir /root/.ghc

# Add empty GHCi history
RUN touch /root/.ghc/ghci_history

# Copy GHCi configuration
COPY ./.ghci /root/.ghc/ghci.conf

# Make the Debian frontend interactive again
ENV DEBIAN_FRONTEND=dialog
