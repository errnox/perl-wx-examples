#/usr/bin/perl

package MainFrame;

use 5.010;
use strict;
use warnings;

use Wx 0.15 qw[:allclasses];
use Wx qw[:everything];
use base qw(Wx::Frame);

use MultilineDialog;
use MultilineMessage;

sub new {
    my $ref = shift;
    my $self = $ref->SUPER::new( undef, -1, 'Wx Test', [-1, -1], [300, 300],);

    doLayout($self);
    addEvents($self);

    return $self;
}

sub doLayout {
    my($self) = @_;
    $self->{panel} = Wx::Panel->new( $self, -1 );
    $self->{mlBtn} = Wx::Button->new( $self->{panel}, -1, 'Multiline input', [30, 20],
				  [-1, -1], );
}

sub addEvents {
    my $self = shift;

    Wx::Event::EVT_BUTTON($self->{mlBtn}, -1, sub {
;

	# Custom multiline dialog (extending Wx::Dialog)
	my $textEntryDialog = MultilineDialog->new(undef, "Input", "Multiline input");
	$textEntryDialog->Show( 1 );
	$textEntryDialog->Center();
	# $textEntryDialog->SetValue("red\ngreen\nblue");

	# Default wxPerl Dialog
        # my $textEntryDialog = Wx::TextEntryDialog->new($self,
	#     "Your text goes here:\n",
	#     "Multiline input test",
	#     "Default text", wxTE_MULTILINE | wxOK | wxCANCEL | wxCENTRE, wxDefaultPosition)

	if ( $textEntryDialog->ShowModal() == wxID_OK ) {
	    my $input = $textEntryDialog->GetValue();

	    # Default wxPerl message box
	    # Wx::MessageBox( "You entered:\n" . $input,
	    # 		    "Info", wxOK | wxCENTRE, $self );

	    # Custom multiline message box
	    my $multilineMessage = MultilineMessage->new( $self, "Output", "Info" );
	    $multilineMessage->SetValue( $input );
	    $multilineMessage->Show( 1 );
	}
	$textEntryDialog->Destroy();
			  });

}

1;
