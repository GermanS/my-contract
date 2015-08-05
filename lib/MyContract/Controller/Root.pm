package MyContract::Controller::Root;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__ -> config( namespace => '' );

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c -> stash( template => 'index.tt2' );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c -> response -> body( 'Page not found' );
    $c -> response -> status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__ -> meta -> make_immutable;

1;

__END__

=encoding utf-8

=head1 NAME

MyContract::Controller::Root - Root Controller for MyContract

=head1 DESCRIPTION

=head1 METHODS

=head2 index

The root page (/)

=head2 default

Standard 404 error page

=head2 end

Attempt to render a view, if needed.

=head1 AUTHOR

german semenkov
german.semenkov@gmail.com

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
