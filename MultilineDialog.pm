package MultilineDialog;

use 5.010;
use strict;
use warnings;

use Wx 0.15 qw[:allclasses];
use Wx qw[:everything];
use base 'Wx::Dialog';


my $input;

sub new {
    my($ref, $parent, $title, $caption) = @_;
    my $self = $ref->SUPER::new( $parent, -1, $title, [-1, -1],
    				 [400, 400], wxDEFAULT_DIALOG_STYLE |
    				 wxRESIZE_BORDER | wxOK | wxCANCEL |
				 wxCENTRE,
    				 $caption
	);
    doLayout($self);

    return $self;
}

sub doLayout {
    my $self = shift;
    my $text = Wx::StaticText->new( $self, -1, "Your text here:\n" );
    my $input = Wx::TextCtrl->new( $self, -1, "Default text", [-1, -1], [400, 300],
				   wxTE_MULTILINE | wxHSCROLL);
    my $buttons = $self->CreateButtonSizer(wxOK | wxCANCEL);
    my $sizer = Wx::BoxSizer->new(wxVERTICAL);
    $sizer->Add($text, 0, wxALL, 5);
    $sizer->Add($input, 1, wxEXPAND | wxALL, 5);
    $sizer->Add($buttons, 0, wxEXPAND | wxALL, 5);
    $self->SetSizerAndFit($sizer);
    $self->{input} = $input;
}

sub SetValue {
    my($self, $value) = @_;
    $self->{input} = $value;
}

sub GetValue {
    my $self = shift;
    return $self->{input}->GetValue();
}

1;
