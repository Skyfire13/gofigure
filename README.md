## Gofigure
<img src="https://github.com/Skyfire13/gofigure/blob/master/demo.gif" width="500">

#### Configuring configs with the help of Go

Gofigure is a small bash script that reads key-value pairs
from a .yaml file and generates an interactive drop-down menu
with the help of Gum. 
The keys are the options displayed in the menu, and the values
are the corresponding commands to be executed. I use it to
quickly hop into my different dot files, but keys can be 
assigned really any shell commands.

### Installation
You must have Charmbracelet's "gum" installed along with go. Check out
https://github.com/charmbracelet/gum.
It can be installed from source, or through
the package manager of your choice.

To install Gofigure, simply run:

```make install```

Likewise, you can uninstall with:

```make uninstall```

Or you can fully wipe Gofigure and it's configuration files with:

```make wipe```

This will delete the current gofigure.yaml file, so back it up if you want to save it for later!
