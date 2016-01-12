#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;
use Benchmark qw(:all) ;
 

# Count array contents
my @names = qw( John Donald Alice Carlos Bob );
my $count = 0;
map { $count++ } @names;
say $count;

# Find all the names longer than 4 chars
my @out = map { length($_) < 4 ? $_ : () } @names;
say @out;

# Translates a list of numbers to their squared values.
my @numbers = qw/ 0 1 2 3 4 5 6 7 8 9 10 65 66 67/;
my @squares = map { $_ > 3 ? $_ * $_ : () } @numbers;
say "@squares"; 
# Use grep to filter 
my @square2 = map { $_ * $_ } grep { $_ > 3 } @numbers;
say "@square2"; 

cmpthese( 0, {
	default => '
		my @numbers = qw/ 0 1 2 3 4 5 6 7 8 9 10 65 66 67/;
		my @squares = map { $_ > 3 ? $_ * $_ : () } @numbers;
		',
	grep => '
		my @numbers = qw/ 0 1 2 3 4 5 6 7 8 9 10 65 66 67/;
		my @square2 = map { $_ * $_ } grep { $_ > 3 } @numbers;
		',
});


# Transalte numbers to characters
my @char = map(chr, @numbers);
say "@char";

# Order names by their length, for same length, compare alphabetical
my %hash = map { $_ => length($_) } @names;
say Dumper \%hash;
my @sorted = sort { $hash{$a} <=> $hash{$b} or $a cmp $b } keys %hash;
say "@sorted";

# One liner solution using Schwartzian transform
@sorted = ();
@sorted = 
	map  { $_->[0] } 
	sort { $a->[1] <=> $b->[1] or $a->[0] cmp $b->[0] } 
	map  { [ $_ => length($_) ] } @names;
say "@sorted";

cmpthese( 0, {
	hash => '
		my @names = qw( John Donald Alice Carlos Bob );
		@sorted = 
		map  { $_->[0] } 
		sort { $a->[1] <=> $b->[1] or $a->[0] cmp $b->[0] } 
		map  { [ $_ => length($_) ] } @names;',
	array => '
		my @names = qw( John Donald Alice Carlos Bob );
		my %hash = map { $_ => length($_) } @names;
		my @sorted = sort { $hash{$a} <=> $hash{$b} or $a cmp $b } keys %hash;',
});
