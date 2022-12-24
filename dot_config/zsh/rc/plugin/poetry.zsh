#compdef poetry

_poetry_39d648d68405034e_complete()
{
    local com coms cur opts state

    cur=${words[${#words[@]}]}

    # lookup for command
    for word in ${words[@]:1}; do
        if [[ $word != -* ]]; then
            com=$word
            break
        fi
    done

    if [[ ${cur} == --* ]]; then
        state="option"
        opts=("--ansi:Force ANSI output." "--help:Display help for the given command. When no command is given display help for the list command." "--no-ansi:Disable ANSI output." "--no-cache:Disables Poetry source caches." "--no-interaction:Do not ask any interactive question." "--no-plugins:Disables plugins." "--quiet:Do not output any message." "--verbose:Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug." "--version:Display this application version.")
    elif [[ $cur == $com ]]; then
        state="command"
        coms=("about:Shows information about Poetry." "add:Adds a new dependency to pyproject.toml." "build:Builds a package, as a tarball and a wheel by default." "cache clear:Clears Poetry\'s cache." "cache list:List Poetry\'s caches." "check:Checks the validity of the pyproject.toml file." "config:Manages configuration settings." "debug info:Shows debug information." "debug resolve:Debugs dependency resolution." "env info:Displays information about the current environment." "env list:Lists all virtualenvs associated with the current project." "env remove:Remove virtual environments associated with the project." "env use:Activates or creates a new virtualenv for the current project." "export:Exports the lock file to alternative formats." "help:Displays help for a command." "init:Creates a basic pyproject.toml file in the current directory." "install:Installs the project dependencies." "list:Lists commands." "lock:Locks the project dependencies." "new:Creates a new Python project at <path\>." "publish:Publishes a package to a remote repository." "remove:Removes a package from the project dependencies." "run:Runs a command in the appropriate environment." "search:Searches for packages on remote repositories." "self add:Add additional packages to Poetry\'s runtime environment." "self install:Install locked packages \(incl. addons\) required by this Poetry installation." "self lock:Lock the Poetry installation\'s system requirements." "self remove:Remove additional packages from Poetry\'s runtime environment." "self show plugins:Shows information about the currently installed plugins." "self show:Show packages from Poetry\'s runtime environment." "self update:Updates Poetry to the latest version." "shell:Spawns a shell within the virtual environment." "show:Shows information about packages." "source add:Add source configuration for project." "source remove:Remove source configured for the project." "source show:Show information about sources configured for the project." "update:Update the dependencies as according to the pyproject.toml file." "version:Shows the version of the project or bumps it when a valid bump rule is provided.")
    fi

    case $state in
        (command)
            _describe 'command' coms
        ;;
        (option)
            case "$com" in

            (about)
            opts+=()
            ;;

            (add)
            opts+=("--allow-prereleases:Accept prereleases." "--dev:Add as a development dependency. \(Deprecated\)" "--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--editable:Add vcs/path dependencies as editable." "--extras:Extras to activate for the dependency." "--group:The group to add the dependency to." "--lock:Do not perform operations \(only update the lockfile\)." "--optional:Add as an optional dependency." "--platform:Platforms for which the dependency must be installed." "--python:Python version for which the dependency must be installed." "--source:Name of the source to use to install the package.")
            ;;

            (build)
            opts+=("--format:Limit the format to either sdist or wheel.")
            ;;

            (cache clear)
            opts+=("--all:Clear all entries in the cache.")
            ;;

            (cache list)
            opts+=()
            ;;

            (check)
            opts+=()
            ;;

            (config)
            opts+=("--list:List configuration settings." "--local:Set/Get from the project\'s local configuration." "--unset:Unset configuration setting.")
            ;;

            (debug info)
            opts+=()
            ;;

            (debug resolve)
            opts+=("--extras:Extras to activate for the dependency." "--install:Show what would be installed for the current system." "--python:Python version\(s\) to use for resolution." "--tree:Display the dependency tree.")
            ;;

            (env info)
            opts+=("--path:Only display the environment\'s path.")
            ;;

            (env list)
            opts+=("--full-path:Output the full paths of the virtualenvs.")
            ;;

            (env remove)
            opts+=("--all:Remove all managed virtual environments associated with the project.")
            ;;

            (env use)
            opts+=()
            ;;

            (export)
            opts+=("--dev:Include development dependencies. \(Deprecated\)" "--extras:Extra sets of dependencies to include." "--format:Format to export to. Currently, only constraints.txt and requirements.txt are supported." "--only:The only dependency groups to include." "--output:The name of the output file." "--with:The optional dependency groups to include." "--with-credentials:Include credentials for extra indices." "--without:The dependency groups to ignore." "--without-hashes:Exclude hashes from the exported file." "--without-urls:Exclude source repository urls from the exported file.")
            ;;

            (help)
            opts+=()
            ;;

            (init)
            opts+=("--author:Author name of the package." "--dependency:Package to require, with an optional version constraint, e.g. requests:\^2.10.0 or requests=2.11.1." "--description:Description of the package." "--dev-dependency:Package to require for development, with an optional version constraint, e.g. requests:\^2.10.0 or requests=2.11.1." "--license:License of the package." "--name:Name of the package." "--python:Compatible Python versions.")
            ;;

            (install)
            opts+=("--all-extras:Install all extra dependencies." "--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--extras:Extra sets of dependencies to install." "--no-dev:Do not install the development dependencies. \(Deprecated\)" "--no-root:Do not install the root package \(the current project\)." "--only:The only dependency groups to include." "--only-root:Exclude all dependencies." "--remove-untracked:Removes packages not present in the lock file. \(Deprecated\)" "--sync:Synchronize the environment with the locked packages and the specified groups." "--with:The optional dependency groups to include." "--without:The dependency groups to ignore.")
            ;;

            (list)
            opts+=()
            ;;

            (lock)
            opts+=("--check:Check that the poetry.lock file corresponds to the current version of pyproject.toml." "--no-update:Do not update locked versions, only refresh lock file.")
            ;;

            (new)
            opts+=("--name:Set the resulting package name." "--readme:Specify the readme file format. One of md \(default\) or rst" "--src:Use the src layout for the project.")
            ;;

            (publish)
            opts+=("--build:Build the package before publishing." "--cert:Certificate authority to access the repository." "--client-cert:Client certificate to access the repository." "--dry-run:Perform all actions except upload the package." "--password:The password to access the repository." "--repository:The repository to publish the package to." "--skip-existing:Ignore errors from files already existing in the repository." "--username:The username to access the repository.")
            ;;

            (remove)
            opts+=("--dev:Remove a package from the development dependencies. \(Deprecated\)" "--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--group:The group to remove the dependency from.")
            ;;

            (run)
            opts+=()
            ;;

            (search)
            opts+=()
            ;;

            (self add)
            opts+=("--allow-prereleases:Accept prereleases." "--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--editable:Add vcs/path dependencies as editable." "--extras:Extras to activate for the dependency." "--source:Name of the source to use to install the package.")
            ;;

            (self install)
            opts+=("--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--sync:Synchronize the environment with the locked packages and the specified groups.")
            ;;

            (self lock)
            opts+=("--check:Check that the poetry.lock file corresponds to the current version of pyproject.toml." "--no-update:Do not update locked versions, only refresh lock file.")
            ;;

            (self remove)
            opts+=("--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\).")
            ;;

            (self show)
            opts+=("--addons:List only add-on packages installed." "--latest:Show the latest version." "--outdated:Show the latest version but only for packages that are outdated." "--tree:List the dependencies as a tree.")
            ;;

            (self show plugins)
            opts+=()
            ;;

            (self update)
            opts+=("--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--preview:Allow the installation of pre-release versions.")
            ;;

            (shell)
            opts+=()
            ;;

            (show)
            opts+=("--all:Show all packages \(even those not compatible with current system\)." "--latest:Show the latest version." "--no-dev:Do not list the development dependencies. \(Deprecated\)" "--only:The only dependency groups to include." "--outdated:Show the latest version but only for packages that are outdated." "--tree:List the dependencies as a tree." "--why:When showing the full list, or a --tree for a single package, also display why it\'s included." "--with:The optional dependency groups to include." "--without:The dependency groups to ignore.")
            ;;

            (source add)
            opts+=("--default:Set this source as the default \(disable PyPI\). A default source will also be the fallback source if you add other sources." "--secondary:Set this source as secondary.")
            ;;

            (source remove)
            opts+=()
            ;;

            (source show)
            opts+=()
            ;;

            (update)
            opts+=("--dry-run:Output the operations but do not execute anything \(implicitly enables --verbose\)." "--lock:Do not perform operations \(only update the lockfile\)." "--no-dev:Do not update the development dependencies. \(Deprecated\)" "--only:The only dependency groups to include." "--with:The optional dependency groups to include." "--without:The dependency groups to ignore.")
            ;;

            (version)
            opts+=("--dry-run:Do not update pyproject.toml file" "--short:Output the version number only")
            ;;

            esac

            _describe 'option' opts
        ;;
        *)
            # fallback to file completion
            _arguments '*:file:_files'
    esac
}

_poetry_39d648d68405034e_complete "$@"
compdef _poetry_39d648d68405034e_complete /home/cryo/.local/share/pypoetry/venv/bin/poetry