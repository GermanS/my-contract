package MyContract::Form::SignUp;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'login' => (
    type     => 'Email',
    required => 1,
);

has_field 'password' => (
    type     => 'Password',
    required => 1,
);

has_field 'confirm' => (
    type     => 'PasswordConf',
    required => 1,
);

sub validate_confirm {
    my ( $self, $confirm ) = @_;

    my $password = $self -> field( 'password' );

    if( $confirm -> value() ne $password -> value() ) {
        $confirm -> add_error( q{} );
        $password -> add_error( q{} );
    }


    return;
}

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__