# A development container for Haskell

This is an opinionated pre-built [Dev Container](https://containers.dev) for Haskell (GHC 9.8.4 LTS).

## Features

The development container has the following features:

- **Pre-configured Cabal, Stack and HLS:** Cabal, Stack and HLS come pre-installed and pre-configured.
- **Pre-installed development tools:** The development container comes with a number of generic (Git, Neovim, SSH, etc.) and Haskell-specific (ormolu, implicit-hie, retrie, etc.) development tools pre-installed.
- **Integrated GHCi:** The development container comes with an integrated GHCi-shell.
- **Offline support:** Hoogle and Hackage are included locally in the container, meaning you do not need an internet connection to find definitions or read documentation.

To use the integrated GHCi-shell, press the yellow lambda symbol in the top-right corner. To search Hoogle, press <kbd>Alt</kbd> + <kbd>Shift</kdb> + <kbd>H</kdb>.

## Using with Visual Studio Code

Follow the steps below to use the Dev Container with Visual Studio Code:

1. Follow the [Getting Started](https://code.visualstudio.com/docs/remote/containers#_getting-started) instructions to configure Visual Studio Code and Docker for use with Dev Containers;
2. Copy the `.devcontainer` folder in this repository to the root of your project;
3. Reload the project by opening the command palette (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> or <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>) and executing the command `>Reload Window` or by closing and re-opening Visual Studio Code;
4. Click `Reopen in Container` when Visual Studio Code prompts you (see image below), or by opening the command palette (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> or <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>) and executing the command `>Dev Containers: Reopen in Container` (downloading the image initially make take **a while**);

![image](https://user-images.githubusercontent.com/601206/73298150-7bfac580-4215-11ea-81d3-a8fabab98e30.png)

## How does it work

Visual Studio Code supports [Dev Containers](https://code.visualstudio.com/docs/remote/containers) (i.e. using a Docker image as a development environment). It automates the hassle of setting up a proper development environment.

## Troubleshooting

This section lists some common problems, and possible ways to fix these problems. If you encounter an issue not listed here, or if the fixes listed do not work for you, please [open an issue](https://github.com/marijnvanwezel/haskell-dev-env/issues/new).

- **Definitions from other files are not found.**
    - Try running `stack install` in the project directory.
- **Definitions from dependencies are not found.**
    - Try restarting Visual Studio Code.
- **Stuck on `Processing ../..`.**
    - Try running `stack build` in the project directory.
- **Code completion and/or checking is not working.**
    - Try restarting Visual Studio Code.
    - Try running `stack install` in the project directory.
- **Something else does not work.**
    - Try restarting Visual Studio Code.
    - [Open an issue](https://github.com/marijnvanwezel/haskell-dev-env/issues/new) on GitHub.

## Installed software

The container comes with the following (relevant) software pre-installed:

- [`debian:bookworm-slim`](https://hub.docker.com/_/debian) as a base image;
- [GNU Bash](https://www.gnu.org/software/bash/);
- [Git](https://git-scm.com/);
- [Neovim](https://neovim.io/);
- [GHCUp](https://www.haskell.org/ghcup/);
- The [Glasgow Haskell Compiler (GHC)](https://www.haskell.org/ghc/) (version 9.8.4 LTS);
- The [Haskell Language Server (HLS)](https://github.com/haskell/haskell-language-server);
- [Stack](https://docs.haskellstack.org/en/stable/);
- [Cabal](https://www.haskell.org/cabal/).

The following packages come pre-installed:

- [fsnotify](https://hackage.haskell.org/package/fsnotify) - cross platform library for file creation, modification, and deletion notification;
- [haskell-dap](https://hackage.haskell.org/package/haskell-dap) - Haskell implementation of the DAP interface data;
- [ghci-dap](https://hackage.haskell.org/package/ghci-dap) - a GHCi with DAP machine interface;
- [haskell-debug-adapter](https://hackage.haskell.org/package/haskell-debug-adapter) - a debug adapter for Haskell debugging system;
- [hlint](https://hackage.haskell.org/package/hlint) - gives suggestions on how to improve your source code;
- [apply-refact](https://hackage.haskell.org/package/apply-refact) - perform refactorings specified by the refact library;
- [retrie](https://hackage.haskell.org/package/retrie) - a tool for codemodding Haskell;
- [hoogle](https://hackage.haskell.org/package/hoogle) - a Haskell API search engine;
- [ormolu](https://hackage.haskell.org/package/ormolu) - a formatter for Haskell source code;
- [implicit-hie](https://hackage.haskell.org/package/implicit-hie) - auto-generate a Stack or Cabal multi-component `hie.yaml` file.

Following VSCode extensions are automatically installed after container is started:

- [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell);
- [Haskell GHCi Debugger Adapter](https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode);
- [Integrated Haskell Shell](https://marketplace.visualstudio.com/items?itemName=eriksik2.vscode-ghci);
- [Hoogle for VSCode](https://marketplace.visualstudio.com/items?itemName=jcanero.hoogle-vscode).
