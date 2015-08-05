package MyContract::Form;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(HTML::FormHandler);
with qw(HTML::FormHandler::Widget::Theme::Bootstrap3);

sub process_error {
    my ( $self, $message ) = @_;

    $self -> push_form_errors( $message );

    return;
}

sub localize_meth {
        my ( $self, @message ) = @_;

        my $message = $self -> language_handle() -> maketext( @message );

        return $message;
};

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__