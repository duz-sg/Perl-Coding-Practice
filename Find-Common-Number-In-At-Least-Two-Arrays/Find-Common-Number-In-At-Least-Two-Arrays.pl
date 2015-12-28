#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);


my @a = (1, 3, 5, 7, 9, 11, 15);
my @b = (1, 3, 5, 9, 10, 19);
my @c = (9, 11, 13, 18);

my $d = exists_at_least_two_of_three( \@a, \@b, \@c );

for (@$d)
{
	say "$_";
}

sub exists_at_least_two_of_three
{
	my ($a, $b, $c) = @_;
	my $hash = {};
	for (@$a)
	{
		$hash->{$_} = 2;
	}
	for (@$b)
	{
		$hash->{$_} = ( !$hash->{$_} || $hash->{$_} == 3  ? 3 : 5);
	}
	for (@$c)
	{
		$hash->{$_} = ( !$hash->{$_} || $hash->{$_} == 4  ? 4 : 5);
	}
	my @d;
	for (keys %$hash)
	{
		push @d, $_ if $hash->{$_} == 5;
	}
	return \@d;
}
