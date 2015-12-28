#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;

$t = <STDIN>;
chomp $t;
for my $a0 (0..$t-1){
    $n = <STDIN>;
    chomp $n;
    check_decent($n);
}

sub check_decent($n)
{
	use integer;
	my $n = shift;
	if ( $n % 3 == 0 )
	{
		my $five = ( $n / 3 ) * 3;
		print "5" x $five . "\n";
		return 0;
	}
	elsif ( $n % 3 == 1 && $n >= 10 )
	{
		$n -= 10;
		my $five = ( $n / 3 ) * 3;
		print "5" x $five . "3" x 10 . "\n";
	}
	elsif ( $n % 3 == 2 && $n >= 5 )
	{
		$n -= 5;
		my $five = ( $n / 3 ) * 3;
		print "5" x $five . "3" x 5 . "\n";
	}
	else
	{
		print "-1\n";
	}
} 

