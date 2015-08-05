package MyContract::Schema::Result::BankAccount;

use strict;
use warnings;

__PACKAGE__ -> table( 'bank_account' );

__PACKAGE__ -> source_name( 'BankAccount' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    company_id => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    created => {
        data_type   => 'datetime',
        is_nullable => 0,
    },
    bank => {
        data_type   => 'varchar',
        size        => 255,
        is_nullable => 0,
    },
    BIC => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    current_account => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    correspondent_account => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    active => {
        data_type   => 'boolean',
        is_nullable => 0,
    },
);

__PACKAGE__ -> set_proimary_key( 'id' );

__PACKAGE__ -> belongs_to(
    company => 'MyContract::Schema::Result::Company', 'company_id'
);

1;

__END__