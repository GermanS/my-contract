package Test::MyContract::Form::Connection;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::Connection;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::Connection -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        company => 1,
        surname => 'Surname',
        name    => 'Some Name',
        middle  => 'Middle',
        email   => 'mail@example.com',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 6 ) {
    my $self = shift;

    my %params = (
        company => q{},
        surname => q{},
        name    => q{},
        middle  => q{},
        email   => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'company' ) -> has_errors(), 'company field has error';
    ok $form -> field( 'email' ) -> has_errors(), 'email field has error';

    ok !$form -> field( 'surname' ) -> has_errors(), 'surname field has error';
    ok !$form -> field( 'name' ) -> has_errors(), 'name field has error';
    ok !$form -> field( 'middle' ) -> has_errors(), 'middle field has error';

    return;
}

1;

__END__