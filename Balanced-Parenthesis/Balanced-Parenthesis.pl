#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;

isBalanced("a(bcd)d[");
isBalanced("(kjds(hfkj)sd)hf");
isBalanced("{[]}(){}");
isBalanced("{[]}(){]");
isBalanced("{[}]");      # This should output FALSE

isBalancedStack("a(bcd)d[");
isBalancedStack("(kjds(hfkj)sd)hf");
isBalancedStack("{[]}(){}");
isBalancedStack("{[]}(){]");
isBalancedStack("{[}]");      # This should output FALSE

sub isBalanced
{
	my $str  = shift;
	my %hash = (
		b  => 0,
		sb => 0,
		cb => 0,
	);
	my @arr = split( //, $str );
	for my $char (@arr)
	{
		if ( $char eq '(' )
		{
			$hash{b} = $hash{b} ? $hash{b} + 1 : 1; 
		}
		if ( $char eq ')' )
		{
			$hash{b} = $hash{b} ? $hash{b} - 1 : -1; 
		}
		if ( $char eq '[' )
		{
			$hash{sb} = $hash{sb} ? $hash{sb} + 1 : 1; 
		}
		if ( $char eq ']' )
		{
			$hash{sb} = $hash{sb} ? $hash{sb} - 1 : -1; 
		}
		if ( $char eq '{' )
		{
			$hash{cb} = $hash{cb} ? $hash{cb} + 1 : 1; 
		}
		if ( $char eq '}' )
		{
			$hash{cb} = $hash{cb} ? $hash{cb} - 1 : -1; 
		}
	}
	if ( $hash{b} == 0 && $hash{sb} == 0 && $hash{cb} == 0 )
	{
		say "$str: True";
	}
	else
	{
		say "$str: False";
	}
}

sub isBalancedStack
{
	my $str   = shift;
	my @arr   = split( //, $str );
	my @stack = ();
	my %hash  = (
		')' => '(',
		']' => '[',
		'}' => '{',
	);
	my $balance = 1;
	for my $char (@arr)
	{
		if ( $char =~ /[\(\{\[]/ )
		{
			push @stack, $char;
		}
		if ( exists $hash{$char} )
		{
			$balance = pop @stack eq $hash{$char} ? 1 : 0;
		}
	}
	my $result = $balance && !@stack ? 'True' : 'False';
	say "$str: $result";
}
