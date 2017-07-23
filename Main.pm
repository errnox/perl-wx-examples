#!/usr/bin/perl

package Main;

use 5.010;
use strict;
use warnings;

use Moose;
# use namespace::autoclean; # Or use 'no Moose;' at the end of every package

use RealTest;
use Entity;
use SearchEngine;
use Robot;

use constant DELIMITER => '-';

main();


sub main {
    my $actor = Entity->new();
    $actor->set_name('John');
    $actor->set_age(35);
    $actor->print();

    delimit();

    my $robot = Robot->new();
    $robot->setFunctionality('Cleaning');
    $robot->print();

    delimit();

    # Test SearchEngine
    # my $searchEngine = SearchEngine->new();
    # say $searchEngine->query('Perl');

    my $test = RealTest->new();
    $test->runTests();

    delimit();
}

sub delimit {
    my ($self) = @_;
    say "\n";
    print DELIMITER x 80;
    say "\n";
}
