#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;


my $users = [
	{
		name  => 'John',
		score => 10,
	},
	{
		name  => 'Bob',
		score => 1,
	},
	{
		name  => 'Carlos',
		score => 5
	},
	{
		name  => 'Alice',
		score => 5,
	},
	{
		name  => 'Allan',
		score => 5,
	},
	{
		name  => 'Donald',
		score => 7
	}
];


my %hash = map { $_->{name} => $_->{score} } @$users; 
for ( sort { $hash{$a} <=> $hash{$b} } keys %hash )
{
	say $_;
}
