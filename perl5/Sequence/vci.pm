#!/usr/bin/perl
use warnings;
use strict;
use Debian::Debhelper::Dh_Lib;

# dh_vci_enable runs after dh_installinit so that it can modify existing
# postinst / prerm scripts.
insert_after("dh_installinit", "dh_vci_enable");

1
