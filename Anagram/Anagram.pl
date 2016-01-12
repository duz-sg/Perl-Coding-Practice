#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;
use Benchmark qw(:all) ;
 
my @strings = qw / listen mary slam value army silent incest insect /;
my %log     = ();

for my $str (@strings)
{
	my $key = join( '', sort split( '', $str ) );
	if ( exists $log{$key} )
	{
		say "$str is anagram of: $log{$key}";
	}
	else
	{
		$log{$key} = $str;
		say "$str";
	}
}

