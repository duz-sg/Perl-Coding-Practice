#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

#          ArrRef       ArrRef, 0, Arr Size 
sub qsort (\@) { _qsort( $_[0], 0, $#{ $_[0] } ) }

sub _qsort
{
	my ( $array, $low, $high ) = @_;
	say "_qsort LOW $low, HIGH $high";
	if ( $low < $high )
	{
		my $mid = partition( $array, $low, $high );
		say "_qsort_LOW  LOW $low HIGH $mid-1";
		_qsort( $array, $low,     $mid - 1 );
		say "_qsort_HIGH LOW $mid+1 HIGH $high";
		_qsort( $array, $mid + 1, $high    );
	}
}

sub partition
{
	my ( $array, $low, $high ) = @_;
	say "START PARTITION LOW $low HIGH $high";
	say "@$array";
	my $x = $$array[$high];
	my $i = $low - 1;
	say "Last Element $x, LOW-1 $i";
	for my $j ( $low .. $high - 1 )
	{
		say "LOOP $low .. $high-1, NOW J $j, I $i";
		if ( $$array[$j] <= $x )
		{
			$i++;
			say "$$array[$j] <= $x, I $i, J $j SWAP";	
			say "@$array";
			@$array[ $i, $j ] = @$array[ $j, $i ];
			say "@$array";
		}
	}
	$i++;
	say "I $i, HIGH $high SWAP";	
	say "@$array";
	@$array[ $i, $high ] = @$array[ $high, $i ];
	say "@$array";
	say "END PARTITION MID $i";
	say "=======================";
	return $i;
}

my @array = ( 4, 2, 1, 5, 3 );
qsort @array;
print "@array\n";
