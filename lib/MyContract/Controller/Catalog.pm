package MyContract::Controller::Catalog;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c -> response -> body('Matched MyContract::Controller::Catalog in Catalog.');
}

__PACKAGE__ -> meta -> make_immutable;

1;

__END__

=encoding utf8

=head1 NAME

MyContract::Controller::Catalog - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=head2 index

=head1 AUTHOR

german semenkov
german.semenkov@gmail.com

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut