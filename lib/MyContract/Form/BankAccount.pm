package MyContract::Form::BankAccount;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends qw(MyContract::Form);

has_field 'company' => (
    type     => 'Hidden',
    required => 1,
    noupdate => 1,
);

has_field 'bank' => (
    type     => 'Text',
    required => 1,
);

has_field 'BIC' => (
    type     => 'Integer',
    required => 1,
);

has_field 'current_account' => (
    type     => 'Text',
    required => 1,
);

has_field 'correspondent_account' => (
    type     => 'Text',
    required => 1,
);

__PACKAGE__ -> meta() -> make_immutable();

1;

__END__