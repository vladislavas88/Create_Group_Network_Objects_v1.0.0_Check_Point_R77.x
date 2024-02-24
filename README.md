Using the script for create address group objects for Check Point dbedit
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
