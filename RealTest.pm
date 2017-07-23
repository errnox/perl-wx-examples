#!/usr/bin/perl

package RealTest;

use 5.010;
use strict;
use warnings;

use Cwd;
use autodie;
use IO::Handle;
use Data::Dumper;

use WxTest;


sub new {
    my ($class) = @_;
    my $self = {

    };
    bless $self, $class;
    return $self;
}

sub runTests {
# evaluateInput();
# printReverse();
# printReverse2();
# handleContext();
# demonstrateHeredoc();
# demonstrateUtf8();
# demonstrateRanges();
# doLoop();
# parseFile();
# showStaticTyping();
# printTime();
# iterateThroughArray();
# rootAroundInSymbolTable();

# my $inputFile = 'input.txt';
# writeToFile($inputFile);
# readFromFile($inputFile);

# testReferenceCounting();

# my %nestedDataStructure = (
# 	breakfast => { entree => 'eggs',   side => 'hash browns' },
# 	lunch     => { entree => 'panini', side => 'apple' },
# 	dinner    => { entree => 'steak', side => 'avocado salad' },
# 	);
# debugNestedDataStructure(\%nestedDataStructure);

    my $wxTest = WxTest->new;
    $wxTest->MainLoop;
}

sub evaluateInput {
    my $rest = $ARGV[0] % 2;
    if ($rest) {
	say "UNEVAL";
    } else {
	say "EVAL";
    }
}

sub printReverse {
    while (<STDIN>) {
	chomp;
	say scalar reverse;
    }
}

sub printReverse2 {
    while (<>) {
	chomp;
	say scalar reverse;
    }
}

sub handleContext {
    my @colors = ("red", "green", "blue", "orange");
    my $otherColors = @colors; # Impose scalar context
    for my $color (@colors) {
	say $color;
    }
}

# sub demonstrateHeredoc {
#     print <<"  HEREDOC_OR_SOMETHING_ELSE" # Whitespaces! See below...

# Lorem ipsum...

#      ...something...


#          ...enven more...


#   HEREDOC_OR_SOMETHING_ELSE
# }

sub demonstrateUtf8 {
    my $textfile = "utf8Example.txt";
    open(my $filehandle, "<:utf8", $textfile) or die "$!";
    my $unicodeString = <$filehandle>;
    say $unicodeString;
    # say "\x{00fe}"
}

sub demonstrateRanges {
    my @chars = 'a' .. 'z';
    my @numbers = 0 .. 9;
    say "Chars: @chars";
    say "Numbers: @numbers";
}

sub doLoop {
    foreach (1 .. 10) {
	my $sf = $_ + 1;
	say "$_ * $sf = " , $_ * ($_ + 1);
    }
}

sub parseFile {
    my $textfile = "input.txt";
    open(my $filehandle, $textfile) or die "$!";
    while (my $line = <$filehandle>) {
	next if $line =~ m/\A\/\//;
	last if $line =~ m/\A#\+END/;
	say $line;
    }
}

sub showStaticTyping {
    my $string = "This is a simple string.";
    ++$string for 1 .. 10; # Numeric operation on a string scalar
    my $enhancedString = ++$string;
    say $enhancedString;
}

sub printTime {
    say localtime();
}

sub iterateThroughArray {
    # my @colors = ("red", "green", "blue", "orange", "yellow"); # Simple assigning
    my @colors = qw(red green blue orange yellow); # Advanced assigning
    while (my ($index, $value) = each @colors) {
	say "#$index: $value";
    }
}

sub rootAroundInSymbolTable {
    # Rooting around in the Symbol Tables
    foreach my $key (keys %Entity::) {
	say "$key   -   %Entitiy::($key)";
    }
}

sub writeToFile {
    my ($filename) = @_;
    open my $filehandle, '>>', $filename;
    my ($second, $minute, $hour, $dayOfYear, $dayLightSavings) = localtime();
    $filehandle->say("Time: $hour:$minute:$second");
    close $filehandle;
}

sub readFromFile {
    my ($filename) = @_;
    open my $filehandle, '<', $filename;
    while (my $line = <$filehandle>) {
	print $line;
    }
}

sub testReferenceCounting {
    {
	my $something = 'something';
	say 'I am the value of something.'
    }
    # Reference to $something is deleted here.
    # So it can be safely used in this scope and subscopes of this scope.

    {
	my $something = 'something';
	say 'I am the value of something else.'
    }
    my $something = 'something';
    say 'I am the value of something completelely else.'

}

sub debugNestedDataStructure {
    my ($datastructure) = @_;
    print Dumper($datastructure);
}

1
