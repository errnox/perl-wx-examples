package MultilineMessage;

use 5.010;
use strict;
use warnings;

use Wx 0.15 qw[:allclasses];
use Wx qw[:everything];
use Wx::Event qw[:everything];
use base 'Wx::Dialog';



my $content;

sub new {
    my($ref, $parent, $title, $caption) = @_;
    my $self = $ref->SUPER::new( $parent, -1, $title, [-1, -1],
    				 [400, 400], wxDEFAULT_DIALOG_STYLE |
    				 wxRESIZE_BORDER | wxOK | wxCANCEL |
				 wxCENTRE,
    				 $caption );
    doLayout($self);

    return $self;
}

sub doLayout {
    my $self = shift;
    my $text = Wx::StaticText->new( $self, -1, "Output:\n" );
    $text->SetForegroundColour( wxRED );

    # my $content = Wx::TextCtrl->new( $self, -1, "Default text", [-1, -1], [400, 300],
    # 				     wxTE_MULTILINE | wxHSCROLL | wxTE_READONLY );

    # my $attr = Wx::TextAttr->new(); # TODO_BEGIN: Uncomment!
    # $attr->SetTextColour( Wx::Colour->new( 0, 255, 0, 0 ) );
    # $attr->SetBackgroundColour( Wx::Colour->new( 0, 0, 0, 0 ) );
    # $attr->SetAlignment( wxTEXT_ALIGNMENT_CENTRE );
    # $content->SetDefaultStyle( $attr ); # TODO_END: Uncommment!

    $self->{listBox} = Wx::ListBox->new( $self, -1, [-1, -1], [400, 300], [] );
    EVT_LISTBOX_DCLICK( $self, $self->{listBox}, \&onListBoxDoubleClick );

    my $buttons = $self->CreateButtonSizer( wxOK );
    my $sizer = Wx::BoxSizer->new( wxVERTICAL );
    $sizer->Add( $text, 0, wxALL, 5 );
    $sizer->Add( $content, 1, wxEXPAND | wxALL, 5 );
    $sizer->Add( $buttons, 0, wxEXPAND | wxALL, 5 );
    $self->SetSizerAndFit( $sizer );
    $self->{content} = $content;
}

sub onListBoxDoubleClick {
    my ( $self, $event ) = @_;
    say "String: " . $event-GetString();
    Wx::MessageDialog( "Your choice: \'" . $event->GetString() . "\'", wxOK | wxCENTRE, $self );
}

sub SetValue {
    my($self, $value) = @_;
    # Just set the value
    # $self->{content}->SetValue( $value );
    # $self->{content}->SetValue(""); # TODO: Uncomment!
    # # Really write the text into the text field (preserve colour colour etc.)
    # $self->{content}->WriteText( $value ); # TODO: Uncomment!

    # Potentially manage visual appearance of text sections
    # my $attr2 = Wx::TextAttr->new();
    # $attr2->SetTextColour( Wx::Colour->new( 0, 255, 255, 0 ) );
    # $attr2->SetBackgroundColour( wxRED );
    # $self->{content}->SetStyle( 0, length $value, $attr2 );

    my @strings = split( "\n", $value );
    # List box solution
    $self->{listBox}->InsertItems( \@strings, 0 );
}

sub GetValue {
    my $self = shift;
    return $self->{content}->GetValue();
}

1;
