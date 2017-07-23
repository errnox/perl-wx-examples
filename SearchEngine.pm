#/usr/bin/perl

package SearchEngine;

use 5.010;
use strict;
use warnings;

use Moose;
use WWW::Mechanize;

has 'url_base' => (is => 'rw', isa => 'Str',
		   default => 'http://www.google.com/search?q=');
has 'mech' => (is => 'ro', isa => 'Object',
	       default => sub {WWW::Mechanize->new});

sub query {
    my $self = shift;
    my $query = shift;

    $self->mech->get($self->url_base . $query);
    return $self->mech->content;
}

1;
