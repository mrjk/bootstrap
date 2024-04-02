# Home Bootstrapping

There are two way of bootstraping home:

* Anonymous home:
  * The idea is to deploy tools and configs quickly, wihtout the need of traking changes
  * Ideally this deployments requires only public repositories
  * Footprint should be minimal
  * Ideally this deployment is generic and agnostic
* Own home:
  * The idea is to create your own workspace, with your favorite tools and configs.
  * This deployement should requires public tools and private repos (for personal or secrets)
  * Footprint is here, but things are correctly organized
  * This deployment is opiniated and can be quite complex
 
Depending the deployment the idea is to always be DRY, so the `Own home` deployment should be achivable from the `Anonymouse home` deployment.

## Implementation

### Anonymouse home


* Tools:
  * asf/mise:
    * Install any programs from an extensible list of plugins.
    * This provides access to a large collection of programs
    * Provides:
      * direnv
      * go-task
     
  * shellhook:
    * Provides hook mechanism for shell (bash for now)
    * Provides an install API: completion, man, bin, PATH, symlink, shell_init shell_logout shell_interactive

### Own home

* Tools:
  * yadm
    * Scope: Home files and template, bootstrap script
* Opinion tools:
  * idmgr
  * dot/ellipsis:
    * Manage shell file deployemnt on a module basis


## Requirement matrix

* Install and manage packages for Home Apps:
  * asdf
    * Sourced: ???
  * mise
    * Sourced: App only
* Install and manage Shell configs:
  * ellipisis
    * Sourced: ??
  * dot
    * Sourced: ??
  * basher
    * Sourced: NO
    * Inject itself in bashrc in it's install script
    * Only simple packages, but anything can be a package dependning 
    * Code is complex
    * Packages
    * Installation:
      * PATH: Add shim path: export PATH=\"\$HOME/.basher/bin:\$PATH\"   ##$basher_keyword
      * SHELL: eval \"\$(basher init - $shell_type)\ ##$basher_keyword
        * ./bin/basher init - bash
          * 

 43     echo "export PATH=\"\$HOME/.basher/bin:\$PATH\"   ##$basher_keyword"
 44     # shellcheck disable=SC2086
 45     echo "eval \"\$(basher init - $shell_type)\"             ##$basher_keyword"


  * 
  * bpkg
    * Sourced: NOPE (https://www.basher.it/authors/)
* Install and manage Home files:
  * yadm
    * Sourced: Yes if placed to specific paths
  * vcsh
    * Sourced: Yes if placed to specific paths



