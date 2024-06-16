# A development container for Haskell

This is a [DevContainer](https://containers.dev) for Haskell (GHC 9.6.5).

## How to use this

Follow the [Getting Started](https://code.visualstudio.com/docs/remote/containers#_getting-started) instructions to configure Visual Studio Code and Docker for use with DevContainers.

Place the `.devcontainer` directory in the root of your project. The next time you load the project, Visual Studio Code should prompt to re-open the project in a container:

![image](https://user-images.githubusercontent.com/601206/73298150-7bfac580-4215-11ea-81d3-a8fabab98e30.png)

## How does it work

Visual Studio Code supports [DevContainers](https://code.visualstudio.com/docs/remote/containers) (i.e. using a Docker image as a development environment). It automates the hassle of setting up a proper development environment.

Pressing **Reopen in Container** will perform the automated steps to launch the container, and will set up a complete Haskell development environment.

## What's in the box

The container comes with the following (relevant) software pre-installed:

* [`debian:bookworm-slim`](https://hub.docker.com/_/debian) as a base image;
* [GNU Bash](https://www.gnu.org/software/bash/);
* [Git](http://git-scm.com/docs/git-clean);
* [GHCUp](https://www.haskell.org/ghcup/);
* The [Glasgow Haskell Compiler (GHC)](https://www.haskell.org/ghc/);
* The [Haskell Language Server (HLS)](https://github.com/haskell/haskell-language-server);
* [Stack]https://docs.haskellstack.org/en/stable/);
* [Cabal](https://www.haskell.org/cabal/).

Following VSCode extensions are automatically installed after container is started:

- [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell);
- [Haskell GHCi Debugger Adapter](https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode);
- [Integrated Haskell Shell](https://marketplace.visualstudio.com/items?itemName=eriksik2.vscode-ghci);
- [Hoogle for VSCode](https://marketplace.visualstudio.com/items?itemName=jcanero.hoogle-vscode).
