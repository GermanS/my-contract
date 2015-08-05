package MyContract::Schema;

use strict;
use warnings;

use parent qw(DBIx::Class::Schema);

__PACKAGE__ -> load_namespace(
    default_resultset_class => '+MyContract::Schema::ResultSet'
);

1;

__END__