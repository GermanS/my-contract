package Test::MyContract::Controller::Frontend;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use Catalyst::Test qw(MyContract);
use MyContract::Controller::Catalog;
use MyContract::Controller::LogOut;
use MyContract::Controller::LostPassword;
use MyContract::Controller::Profile;
use MyContract::Controller::SignIn;
use MyContract::Controller::SignUp;
use MyContract::Controller::Statistics;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'urls' } = [ qw(
        /
        /catalog
        /logout
        /lostpassword
        /profile
        /signin
        /signup
        /statistics
    ) ];

    return;
}

sub test_01_avialabiity :Test( 9 ) {
    my $self = shift;

    foreach my $url ( @{ $self -> { 'urls' } } ) {
        ok( request( $url ) -> is_success, 'Request should succeed' );
    }

    return;
}

1;

__END__