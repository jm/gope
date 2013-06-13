## Gope — An easy way to manage `GOPATH`

The `gope` package gives you a nice little set of scripts for managing `GOPATH` across projects.

### Why?

I like to/need to work on several projects at once, so I need several Go workspaces.  Setting `GOPATH` for each one is annoying.  So, I decided to automate it.

### Installation

The easiest way to install it is to simply `curl` the install script from GitHub:

    curl https://raw.github.com/jm/gope/master/install.sh | sh

If you'd like to examine the contents first, then [check it out on GitHub](https://github.com/jm/shin/tree/master/install.sh) or write it to a file first:

    curl https://raw.github.com/jm/gope/master/install.sh > install.sh
    sh install.sh

It'll walk you through a few steps and install `gope`.

#### Manual installation

Don't trust my installer?  No big deal.  Just clone `gope` into `~/.gope/scripts` and source `~/.gope/scripts/gope.sh` in your profile.  You can put it elsewhere, but I can't guarantee it'll work.

### Usage

Gope comes with two scripts: `gope-create` and `gope-init`.  The first creates a Go workspace with the right directories in place:

    $ gope-create goper
    -> Generating project in goper
      Making directories...
      Making .gopath file...
    -> Done.

If you create a `~/.gope/config` file and set a `create_subcommands` variable in it like so:

    create_subcommands="true"

...you can then use the `gope-*` commands as subcommands to `go`:

    myhostname: ~$ go create goper
    -> Generating project in goper
      Making directories...
      Making .gopath file...
    -> Done.

The other script, `gope-init`, will look for a file named simply `.gopath` in the current directory, and if it finds one, will set `GOPATH` to the current directory.  For example:

    $ ls
    $ gope-init
    $ touch .go
    $ gope-init
    GOPATH setup for /Users/jeremymcanally/code/my_go_project

If you have subcommands enabled, then you can use this script as `gope init`.  

If you add an `auto_init` variable to your `~/.gope/config`, `gope` will automatically look for a `.go` file and setup `GOPATH` when you `cd` into a directory.  Like so:

    $ cd gopher/
    GOPATH setup for /Users/jeremymcanally/code/gopher

The `.gopath` file can be blank (which will cause `gope` to simply make `GOPATH` the current directory), but you can also provide a list of paths to add to `GOPATH`.  For example:

    ./vendor
    ~/my_other_relative_path
    /Your/Full/Path

Now your `GOPATH` will be ``pwd`:/full/path/to/vendor:/home/you/my_other_relative_path:/Your/Full/Path`.