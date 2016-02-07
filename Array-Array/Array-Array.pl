#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;
use Benchmark qw(:all) ;
 
my @strings = qw / 1 2 3 4 5 6 7 8 9 /;
say "@strings";
shiftArrayToRightByN( \@strings, 3 );
say "@strings";

sub shiftArrayToRightByN
{
	my $arr_ref = shift;
	my $n       = shift;
	for ( 1 .. $n )
	{
		unshift @$arr_ref, pop @$arr_ref;
	}
}
