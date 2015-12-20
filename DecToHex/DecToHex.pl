#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);

while (1)
{
	say "Input a decimal number, or press ctrl+c to stop:";
	my $dec = <>;
	chomp $dec;
	my $hex = dec2hex($dec);
	say "Decimal number $dec is Hexadecimal number $hex";
}

sub dec2hex
{
	my $input  = shift;
	my @input  = split( //, $input );
	my $output = "";

	my $i = length($input) - 1;
	while ( $i >= 0 )
	{
		my $result;
		my $remainder;
		( $result, $remainder ) = calculate( $i, $input );
		$input = $remainder;
		$output .= $result;
		$i--;
	}
	$output =~ s/^0+//g;
	return $output;
} ## ---------- end sub dec2hex

sub calculate
{
	use integer;
	my $i     = shift;
	my $input = shift;
	my $remainder;

	my $base   = 16**$i;
	my $result = $input / $base;

	$remainder = $input % $base;
	$result    = map_hex($result);
	return ( $result, $remainder );
} ## ---------- end sub calculate

sub map_hex
{
	my $dec = shift;
	my @map = qw( 0 1 2 3 4 5 6 7 8 9 A B C D E F );
	return $map[$dec];
}
