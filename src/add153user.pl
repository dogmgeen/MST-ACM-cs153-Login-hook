#! /usr/bin/perl -T

# How is this script called from the command line?
#   $ perl add153users.pl <username> <password>

use strict;
use warnings;

my $getent = "/usr/bin/getent";
my $echo = "/bin/echo";
my $useradd = "/usr/sbin/useradd";
my $chmod = "/bin/chmod";

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

my $salt = join '', ('.', '/', 0..9, 'A'..'Z', 'a'..'z')[rand 64, rand 64]; # from http://perldoc.perl.org/functions/crypt.html
my $cryptedpw = crypt($password, $salt);

`$useradd -d $userhome -g $GROUP -m -s $SHELL -p $cryptedpw $user`;

# Make sure members of the group can't read each other's files
`$chmod 700 $userhome`;

print "Added user $user\n";
