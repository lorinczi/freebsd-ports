#!/usr/bin/perl -w
#
# Copyright (c) 2004  IMG SRC, Inc.  All rights reserved.
#
# $Id: check_pgcluster.pl,v 1.2 2004/02/25 06:09:25 kuriyama Exp $
#
# Plugin for nagios.
#
# Prepare pgr_current_replicator() function before using.
#
# % psql -U pgsql -d template1
# template1=# create function pgr_current_replicator () returns text as 'pgr_current_replicator' language internal with (isStrict);
# CREATE FUNCTION
# template1=#
#
# define command{
# 	command_name	check_pgcluster
# 	command_line	$USER1$/check_pgcluster -H $HOSTADDRESS$ -p $ARG1$ -w $ARG2$
# 	}
#
# define service{
# 	use		generic-service
# 	host_name	cluster1.example.org
# 	service_description	PGCLUSTER
# 	check_command	check_pgcluster!5432!replicator.example.org:8777
# }

use strict;
use Getopt::Std;
use DBI;

my %O;
getopts('H:p:U:P:w:', \%O);

$O{p} ||= 5432;
$O{U} ||= "";
$O{P} ||= "";
usage() if (not $O{H} or not $O{w});

my $dbh = DBI->connect("dbi:Pg:dbname=template1;host=$O{H};port=$O{p}", $O{U}, $O{P});

die if (not $dbh);

my $sth = $dbh->prepare("select pgr_current_replicator()") or die;
$sth->execute or die;
my @r = $sth->fetchrow_array;
$sth->finish;

$dbh->disconnect;

my $ret = 0;
if ($r[0] ne $O{w}) {
  $ret = 1;
  $ret = 2 if (length($r[0]) < 1);
}

my %STATUS = (2 => "CRITICAL", 1 => "WARNING", 0 => "OK");
printf "PGCLUSTER %s: %s\n", $STATUS{$ret}, $r[0];
exit $ret;

# ============================================================
sub usage {
  print "Usage: check_pgcluster -H host [-p dbport] [-U dbuser] [-P dbpass] -w <primary replication server:port>\n";
  exit(3);
}

