#/usr/bin/perl

package Robot;

use 5.010;
use strict;
use warnings;

use Moose;

extends 'Entity';

has '+name', default => 'Robot';
has '+alive', is => 'ro', default => 0;
has 'functionality', is => 'rw', isa => 'Str', default => 'NO_FUNCTIONALITY',
    writer => '_set_functionality';

# Canonical Moose constructor
# sub BUILD {
#     my ($obj) = @_;
#     $obj->some_meth;
#     # $obj # Not necessary. BUILD does that by itself.
# }

# BUILDARGS is for preparing arguments befor the parent's ->new is called

sub setFunctionality {
    my ($self, $functionality) = @_;
    $self->_set_functionality($functionality) if defined($functionality);
}

override  print => sub {
    my ($self) = @_;
    super();
    say "Functionality: @{[$self->functionality]}";
}
