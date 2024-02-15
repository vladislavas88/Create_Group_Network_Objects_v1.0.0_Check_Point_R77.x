#!/usr/bin/env perl

=pod

=head1 Using the script for create address group objects for Check Point dbedit
#===============================================================================
#
#       FILE: create_group_objects.pl
#
#       USAGE: $ touch ./in_hosts.txt
#		 Organization_User_Computer_10.1.1.1
#		 Organization_User_Computer_10.2.2.2
#		 Organization_User_Computer_10.3.3.3
#		 Organization_User_Computer_10.4.4.4
#		 etc
#
#		$ ./create_group_objects.pl gr_Group_Users1 in_hosts.txt
#
#		$ cat ./group_objects.txt
#		  create network_object_group gr_Group_Users1
#		  addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.1.1.1
#		  addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.2.2.2
#		  addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.3.3.3
#		  addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.4.4.4
#		
#  DESCRIPTION: Create network objects for Check Point dbedit
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0.0
#      CREATED: 13.02.2024 22:48:36
#     REVISION: ---
#===============================================================================
=cut

use strict;
use warnings;
use v5.14;
use utf8;

# Result outFile for dbedit
my $outFile = 'group_objects.txt';

my $createNetworkObjectGroup = "create network_object_groupe ";
my $addelementNetworkObjects = "addelement network_objects ";
my $networkObjects           = "network_objects:";
my $group                    = $ARGV[0];
my $inHosts                  = $ARGV[1];

# Open source inFile for reading
open( FHR, '<', $inHosts ) or die "Couldn't Open file $inHosts" . "$!\n";

#my @ipList = <FHR>;

# Open result outFile for writing
open( FHW, '>', $outFile ) or die "Couldn't Open file $outFile" . "$!\n";

say FHW "$createNetworkObjectGroup" . "$group";
my @hostList = <FHR>;
foreach my $host (@hostList) {
    chomp($host);
    say FHW "$addelementNetworkObjects" . "\'\'" . " " . "$networkObjects" . "$host";

}

# Close the filehandles
close(FHW) or die "$!\n";

say "**********************************************************************************\n";
say "Network objects TXT file: $outFile created successfully!";

my $cpUsage = <<__USAGE__;

***************************************************************************************
* # Create a group object
*
* create network_object_group gr_Group_Users1
*
* # Add the individual elements to the group
*
* addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.1.1.1
*
* addelement network_objects gr_Group_Users1 '' network_objects:Organization_User_Computer_10.2.2.2
*
* update_all
*
* savedb
*
***************************************************************************************

__USAGE__

say $cpUsage;

