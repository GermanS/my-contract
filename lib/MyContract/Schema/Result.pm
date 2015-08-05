package MyContract::Schema::Resut;

use strict;
use warnings;

use parent qw(DBIx::Class);

__PACKAGE__ -> load_components( qw(Core PK::Auto) );


1;

__END__