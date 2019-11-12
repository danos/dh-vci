# dh-vci

## Overview

This repository contains the Debian Helper for the Vyatta Component
Infrastructure (VCI) - dh-vci.  It is used when packaging a VCI
component to ensure the relevant 'dotComponent' files in the debian
directory will be installed to the correct location when the package
is installed, and that deb-vci-helper will be run post-installation.
deb-vci-helper (in 'vci' repository) converts the 'dotComponent' file
into the various DBUS and systemd service files required for the VCI
component to function correctly.

## Invoking dh-vci

Debian Helper functionality should be documented elsewhere, but
unfortunately there's no one 'true' source of documentation.  As the
barest of guides, a VCI component should have something like this in its
rules file:

```
%:
	dh $@ --with=vci
```

This causes vci.pm (installed to perl5/Sequence/) to be loaded, which inserts
a call to "dh_vci_enable" into the install sequence after installinit.

### dh_vci_enable

This is an executable, also written in perl, which processes any .component
file for each package being built.  It has built-in 'pod' documentation, and
you can run 'pod2text dh_vci_enable' to view this.  In summary though, this
script finds any <package>.component files in the debian directory and
ensures that they are installed as /lib/vci/components/<package>.component.

It also calls the Debian/DebHelper/Dh_Lib.pm:autoscript() function twice to
set up calls to deb-vci-helper to be run during component installation
(postinst) or removal (prerm).  deb-vci-helper converts the 'dotComponent'
file into the various service files needed for the component to run.

See vci repository documentation for full details of deb-vci-helper function.
