package MyContract::Form::Company;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'name' => (
    type     => 'Text',
    required => 1,
);

has_field 'INN' => (
    type     => 'PosInteger',
    required => 1,
);

has_field 'KPP' => (
    type     => 'Text',
    required => 0,
);

has_field 'OGRN' => (
    type     => 'Text',
    required => 0,
);

has_field 'OKPO' => (
    type     => 'Text',
    required => 0,
);

has_field 'OKONH' => (
    type     => 'Text',
    required => 0,
);

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__