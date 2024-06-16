# A development container for Haskell

This is an opinionated pre-built [Dev Container](https://containers.dev) for Haskell (GHC 9.6.5).

## Using with Visual Studio Code

Follow the steps below to use the Dev Container with Visual Studio Code:

1. Follow the [Getting Started](https://code.visualstudio.com/docs/remote/containers#_getting-started) instructions to configure Visual Studio Code and Docker for use with Dev Containers;
2. Copy the `.devcontainer` folder in this repository to the root of your project;
3. Reload the project opening the command palette (`Ctrl` + `Shift` + `P` or `Cmd` + `Shift` + `P`) and executing the command `>Reload Window` or by closing and re-opening Visual Studio Code;
4. Click `Reopen in Container` when Visual Studio Code prompts you (see image below), or by opening the command palette (`Ctrl` + `Shift` + `P` or `Cmd` + `Shift` + `P`) and executing the command `>Dev Containers: Reopen in Container`;
5. (Optional) Copy the `.ghci` file in this repository to the root of your project.

![image](https://user-images.githubusercontent.com/601206/73298150-7bfac580-4215-11ea-81d3-a8fabab98e30.png)

## How does it work

Visual Studio Code supports [Dev Containers](https://code.visualstudio.com/docs/remote/containers) (i.e. using a Docker image as a development environment). It automates the hassle of setting up a proper development environment.

## What's in the box

The container comes with the following (relevant) software pre-installed:

* [`debian:bookworm-slim`](https://hub.docker.com/_/debian) as a base image;
* [GNU Bash](https://www.gnu.org/software/bash/);
* [Git](http://git-scm.com/docs/git-clean);
* [GHCUp](https://www.haskell.org/ghcup/);
* The [Glasgow Haskell Compiler (GHC)](https://www.haskell.org/ghc/) (version 9.6.5);
* The [Haskell Language Server (HLS)](https://github.com/haskell/haskell-language-server);
* [Stack](https://docs.haskellstack.org/en/stable/);
* [Cabal](https://www.haskell.org/cabal/).

Following VSCode extensions are automatically installed after container is started:

- [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell);
- [Haskell GHCi Debugger Adapter](https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode);
- [Integrated Haskell Shell](https://marketplace.visualstudio.com/items?itemName=eriksik2.vscode-ghci);
- [Hoogle for VSCode](https://marketplace.visualstudio.com/items?itemName=jcanero.hoogle-vscode).
