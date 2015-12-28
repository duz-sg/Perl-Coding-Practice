#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

my $v = <>; chomp $v;
my $n = <>; chomp $n;
my $arr = <>; chomp $arr;
my @arr = split(/ /, $arr);

for (my $i=0; $i<=$#arr; $i++)
{
    if ( $arr[$i] == $v )
    {
        say $i;
        last;
    }
}

