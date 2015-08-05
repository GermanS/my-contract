package MyContract::View::HTML;

use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__ -> config(
    ENCODING           => 'utf8',
    TEMPLATE_EXTENSION => '.tt2',
    render_die         => 1,
);

1;

__END__

=head1 NAME

MyContract::View::HTML - TT View for MyContract

=head1 DESCRIPTION

TT View for MyContract.

=head1 SEE ALSO

L<MyContract>

=head1 AUTHOR

german semenkov
german.semenkov@gmail.com

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut