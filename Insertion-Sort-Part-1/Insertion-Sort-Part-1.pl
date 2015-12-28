#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

my $_ar_size = <>;
my $line     = <>;
chomp($line);
my @_ar = split( /\s+/, $line );

sub insertionSort
{
	my $arr = shift;
	my $var = $$arr[-1];
	my $i   = $_ar_size - 1;
	while ( $$arr[ $i - 1 ] >= $var )
	{
		$$arr[$i] = $$arr[ $i - 1 ];
		say join( " ", @{$arr} );
		$i--;
		last if $i == 0;
	}
	$$arr[$i] = $var;
	say join( " ", @{$arr} );
} ## ---------- end sub insertionSort

insertionSort(\@_ar);

