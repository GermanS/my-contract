package MyContract::Schema::Result::Company;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'company' );

__PACKAGE__ -> source_name( 'Company' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    created => {
        data_type   => 'datetime',
        is_nullable => 0,
    },
    name => {
        data_type   => 'char',
        size        => '255',
        is_nullable => 0,
    },
    INN => {
        data_type   => 'integer',
        size        => 12,
        is_nullable => 0,
    },
    KPP => {
        data_type   => 'integer',
        is_nullable => 1,
    },
    OGRN => {
        data_type   => 'integer',
        is_nullable => 1,
    },
    OKPO => {
        data_type   => 'integer',
        is_nullable => 1,
    },
    OKONH => {
        data_type   => 'integer',
        is_nullable => 1,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> add_unique_constraint( on_INN => [ qw(INN) ] );

__PACKAGE__ -> has_many(
    addresses => 'MyContract::Schema::Result::Address', { 'foreign.company_id' => 'self.id' }
);

__PACKAGE__ -> has_many(
    bank_accounts => 'MyContract::Schema::Result::BankAccount', { 'foreign.company_id' => 'self.id' }
);

__PACKAGE__ -> has_many(
    connections => 'MyContract::Schema::Result::Connection', { 'foreign.company_id' => 'self.id' }
);

__PACKAGE__ -> has_many(
    contracts => 'MyContract::Schema::Result::Contract', { 'foreign.company_id' => 'self.id' }
);

1;

__END__