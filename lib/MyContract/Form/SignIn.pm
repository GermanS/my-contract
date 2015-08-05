package MyContract::Form::SignIn;

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

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__
