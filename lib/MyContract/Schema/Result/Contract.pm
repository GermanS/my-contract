package MyContract::Schema::Result::Contract;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'contract' );

__PACKAGE__ -> source_name( 'Contract' );

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
    name => {
        data_type   => 'char',
        size        => '255',
        is_nullable => 0,
    },
    text => {
        data_type   => 'text',
        is_nullable => 0,
    },
    active => {
        data_type   => 'boolean',
        is_nullable => 0,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> belongs_to(
    company => 'MyContract::Schema::Result::Company', 'company_id'
);

__PACKAGE__ -> has_many(
    changes => 'MyContract::Schema::Result::Changes', { 'foreign.contract_id' = 'self.id' }
);

1;

__END__