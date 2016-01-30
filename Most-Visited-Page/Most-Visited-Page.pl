#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use feature qw(say);
use Data::Dumper;


my @pages = (
	{ user => 'user1', page => '/home' },
	{ user => 'user1', page => '/home/account' },
	{ user => 'user1', page => '/home/account/profile' },
	{ user => 'user1', page => '/home/account/login' },
	{ user => 'user2', page => '/about' },
	{ user => 'user2', page => '/about/contact' },
);

my %records = ();

for my $page ( @pages )
{
	logRecord( $page->{user}, $page->{page} );
}

for my $user ( sort keys %records )
{
	for my $page ( sort { $records{$user}{$b} <=> $records{$user}{$a} } keys %{ $records{$user} } )
	{
		say "User: $user, Page: $page, Times: $records{$user}{$page}"
	}
}

sub logRecord
{
	my $user = shift;
	my $page = shift;
	$records{$user}{$page} 
		= exists $records{$user}{$page}  
		? $records{$user}{$page} + 1 
		: 1;
	if ( $page =~ /^\/\w+$/ )
	{
		return;
	}
	else
	{
		$page =~ s/\/\w+$//;
		logRecord( $user, $page );
	}
}
