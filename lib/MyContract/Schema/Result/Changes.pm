package MyContract::Shema::Result::Changes;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'changes' );

__PACKAGE__ -> source_name( 'Changes' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    contract_id => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    account_id => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    created => {
        data_type   => 'datetime',
        is_nullable => 0,
    },
    data => {
        data_type   => 'text',
        is_nullable => 0,
    },
    diff => {
        data_type   => 'text',
        is_nullable => 0,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> belongs_to(
    contract => 'MyContract::Schema::Result::Contract', 'contract_id'
);

__PACKAGE__ -> belongs_to(
    author => 'MyContract::Schema::Result::Account', 'account_id'
);

1;

__END__