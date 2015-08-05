package MyContract::Schema::Result::Connection;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'connection' );

__PACKAGE__ -> source_name( 'connection' );

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
    active => {
        data_type   => 'boolean',
        is_nullable => 0,
    },
    surname => {
        data_type   => 'char',
        size        => 32,
        is_nullable => 1,
    },
    name => {
        data_type   => 'char',
        size        => 32,
        is_nullable => 1,
    },
    middle => {
        data_type   => 'char',
        size        => 32,
        is_nullable => 1,
    },
    email => {
        data_type   => 'char',
        size        => 128,
        is_nullable => 0,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> belongs_to(
    company => 'MyContract::Schema::Result::Company', 'company_id'
);

1;

__END__