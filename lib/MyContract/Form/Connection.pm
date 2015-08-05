package MyContract::Form::Connection;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'company' => (
    type     => 'Hidden',
    required => 1,
    noupdate => 1,
);

has_field 'email' => (
    type     => 'Email',
    required => 1,
);

has_field 'name' => (
    type     => 'Text',
    required => 0,
);

has_field 'surname' => (
    type     => 'Text',
    required => 0,
);

has_field 'middle' => (
    type     => 'Text',
    required => 0,
);

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__