#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

my $string = <>;

my %diction = map { $_ => 0 } ('a' .. 'z');

my @string = split(//, $string);

for (@string)
{
    my $char = lc($_);
    $diction{$char}++;
}
my $pangram = 1;
for (keys %diction)
{
    my $char = $_;
    if ($diction{$char} == 0)
    {
        say "not pangram";
        $pangram = 0;
        last;
    }
}
say "pangram" if $pangram;
