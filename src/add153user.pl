#! /usr/bin/perl -T

use strict;
use warnings;

my $getent = "/usr/bin/getent";
my $echo = "/bin/echo";
my $newusers = "/usr/sbin/newusers";
my $mkdir = "/bin/mkdir";
my $chmod = "/bin/chmod";
my $chown = "/bin/chown";

my $HOME = "/home/";
my $SHELL = "/bin/bash";
my $GROUP = "cs153sp2012";

$ENV{PATH} = "";

if(!@ARGV || scalar(@ARGV) != 2) {
	die "Invalid number of arguments!\n";
}

$ARGV[0] =~ /(\w+)/;
my $user = $1;

$ARGV[1] =~ /(\S+)/;
my $password = $1;

`$getent passwd $user`;
if($? == 0) {
	die "That username already exists.\n";
}

my $userhome = $HOME . $user;

my @args = ("echo", "${user}:${password}::${GROUP}::${userhome}:${SHELL}", "|", "newusers");

`$echo ${user}:${password}::${GROUP}::${userhome}:${SHELL} | $newusers`;

`$mkdir $userhome`;
`$chmod 700 $userhome`;
`$chown $user:$GROUP $userhome`;

print "Added user $user\n";
