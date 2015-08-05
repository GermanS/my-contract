package Test::MyContract::Form::SignIn;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::SignIn;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::SignIn -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        login    => 'some@example.com',
        password => 'qwerty',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 3 ) {
    my $self = shift;

    my %params = (
        login    => q{},
        password => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'login' ) -> has_errors(), 'login field has error';
    ok $form -> field( 'password' ) -> has_errors(), 'password field has error';

    return;
}

sub test_03_login_doesnt_look_like_email :Test( 3 ) {
    my $self = shift;

    my %params = (
        login    => 'login',
        password => 'password',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has error';
    ok $form -> field( 'login' ) -> has_errors(), 'login field has error';
    ok !$form -> field( 'password' ) -> has_errors(), 'password field has not error';

    return;
}

1;

__END__