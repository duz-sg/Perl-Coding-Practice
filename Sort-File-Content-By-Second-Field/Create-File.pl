#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

# Create a file big enough for testing
# Stop the program manually 
open( FILE, ">Random.txt" );
while (1)
{
	print FILE "
Bob 12
Jane 48
Mark 3
Tashi 54";
}
close(FILE);
