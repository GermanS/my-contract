package MyContract::Form::Contract;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'company' => (
    type     => 'Hidden',
    required => 1,
    noupdate => 1,
);

has_field 'name' => (
    type     => 'Text',
    required => 1,
);

has_field 'data' => (
    type     => 'Text',
    required => 1,
);

__PACKAGE__ -> meta() -> make_immutable();

1;