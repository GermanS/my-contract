package MyContract::Schema::Result::AddressType;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'address_type' );

__PACKAGE__ -> source_name( 'AddressType' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    name => {
        data_type   => 'char',
        size        => 1,
        is_nullable => 1,
    }
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> has_many(
    addresses => 'MyContract::Schema::Result::Address',
    { 'foreign.type' => 'self.id' }
);

1;

__END__