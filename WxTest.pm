package WxTest;

use base qw(Wx::App);

use MainFrame;

sub OnInit {
    my $mainFrame = MainFrame->new;
    $mainFrame->Show( 1 );
}

1;
