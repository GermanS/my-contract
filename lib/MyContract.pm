package MyContract;

use Moose;
use namespace::autoclean;
use Catalyst::Runtime;
use Catalyst qw(
    -Debug
    ConfigLoader
    Static::Simple
);

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__ -> config(
    name => 'MyContract',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    # Send X-Catalyst header
    enable_catalyst_header => 1,
);

__PACKAGE__ -> setup();

1;

__END__
