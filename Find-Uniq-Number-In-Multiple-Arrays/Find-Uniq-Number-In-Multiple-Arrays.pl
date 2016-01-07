#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

my @a = (1, 3, 5, 7, 9, 11, 15, 19);
my @b = (1, 3, 5, 9, 10, 19);
my @c = (9, 11, 13, 15, 18);

my $d = exists_in_one_only( \@a, \@b, \@c );

say "@$d";

sub exists_in_one_only
{
	my ( $a, $b, $c ) = @_;
	my $hash = {};
	my @d    = ();
	for ( @$a, @$b, @$c )
	{
		$hash->{$_} = $hash->{$_} ? $hash->{$_} + 1 : 1 
	}
	for (keys %$hash)
	{
		push @d, $_ if $hash->{$_} == 1;
	}
	return \@d;
}
