#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;

my @names = qw( John Donald Alice Carlos Bob );
my $count = 0;
map  { $count++ } @names;
grep { length $_ < 4 } @names;
my @out = map { length($_) < 4 ? $_ : () } @names;
say $count;
say @out;
