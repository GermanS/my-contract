package MyContract::Schema::Result::Account;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'account' );

__PACKAGE__ -> source_name( 'Account' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    email => {
        data_type   => 'char',
        size        => 128,
        is_nullable => 0,
    },
    password => {
        data_type   => 'char',
        size        => 32,
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
    active => {
        data_type   => 'boolean',
        is_nullable => 0,
    },
    token => {
        data_type   => 'char',
        size        => 32,
        is_nullable => 1,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> add_unique_constraint( on_email => [ qw(email) ] );

__PACKAGE__ -> has_many(
    changes => 'MyContract::Schema::Result::Changes', { 'foreign.account_id' => 'self.id' }
);

1;

__END__