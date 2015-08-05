package MyContract::Form::Address;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'company' => (
    type     => 'Hidden',
    required => 1,
    noupdate => 1,
);

has_field 'index' => (
    type      => 'Integer',
    required  => 1,
    minlength => 6,
    maxlength => 6,
);

has_field 'city' => (
    type     => 'Text',
    required => 1,
);

has_field 'location' => (
    type     => 'Text',
    required => 1,
);

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__