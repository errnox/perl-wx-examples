#!/usr/bin/perl

package Entity;

use 5.010;
use strict;
use warnings;

use Moose;

has 'name', is => 'rw', isa => 'Str', default => '', writer => '_set_name';
has 'age', is => 'rw', isa => 'Int', default => 0, writer => '_set_age';
has 'alive', is => 'rw', isa => 'Bool', default => 1,
    writer => '_set_alive';

sub set_alive {
    my ($self) = @_;
    $self->_set_alive(1);
}

sub set_dead {
    my ($self) = @_;
    $self->_set_alive(0);
}

sub set_name {
    my ($self, $name) = @_;
    $self->_set_name($name) if defined($name);
}

sub set_age {
    my ($self, $age) = @_;
    $self->_set_age($age) if defined($age);
}

sub print {
    my ($self) = @_;
    say "Name: @{[$self->name]}\nAge: @{[$self->age]}" if defined($self->name)
	&& defined($self->age);
}

1
