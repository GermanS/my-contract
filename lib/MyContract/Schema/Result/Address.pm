package MyContract::Schema::Result::Address;

use strict;
use warnings;

use parent qw(MyContract::Schema::Result);

__PACKAGE__ -> table( 'address' );

__PACKAGE__ -> source_name( 'Address' );

__PACKAGE__ -> add_columns(
    id => {
        data_type         => 'integer',
        is_auto_increment => 1,
    },
    type_id => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    company_id =>{
        data_type   => 'integer',
        is_nullable => 0,
    },
    created => {
        data_type   => 'datetime',
        is_nullable => 0,
    },
    index => {
        data_type   => 'integer',
        is_nullable => 0,
    },
    city => {
        data_type   => 'char',
        is_nullable => 0,
    },
    location => {
        data_type   => 'char',
        is_nullable => 0,
    },
);

__PACKAGE__ -> set_primary_key( 'id' );

__PACKAGE__ -> belongs_to(
    type => 'MyContract::Schema::Result::AddressType', 'type_id'
);

__PACKAGE__ -> belongs_to(
    company => 'MyContract::Schema::Result::Company', 'company_id'
);

1;

__END__