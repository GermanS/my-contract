package Test::MyContract::Form::SignUp;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::SignUp;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::SignUp -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        login    => 'some@example.com',
        password => 'qwerty',
        confirm  => 'qwerty',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 4 ) {
    my $self = shift;

    my %params = (
        login    => q{},
        password => q{},
        confirm  => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'login' ) -> has_errors(), 'login field has error';
    ok $form -> field( 'password' ) -> has_errors(), 'password field has error';
    ok $form -> field( 'confirm' ) -> has_errors(), 'confirm field has error';

    return;
}

sub test_03_login_doesnt_look_like_email :Test( 4 ) {
    my $self = shift;

    my %params = (
        login    => 'login',
        password => 'password',
        confirm  => 'password',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has error';
    ok  $form -> field( 'login' ) -> has_errors(), 'login field has error';
    ok !$form -> field( 'password' ) -> has_errors(), 'password field has not error';
    ok !$form -> field( 'confirm' ) -> has_errors(), 'confirm field has not error';

    return;
}

sub test_04_password_and_confirm_fields_are_different :Test( 4 ) {
    my $self = shift;

    my %params = (
        login    => 'mail@example.com',
        password => 'pass',
        confirm  => 'word',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has error';
    ok !$form -> field( 'login' ) -> has_errors(), 'login field has error';
    ok  $form -> field( 'password' ) -> has_errors(), 'password field has error';
    ok  $form -> field( 'confirm' ) -> has_errors(),  'confirm field has error';

    return;
}

1;

__END__