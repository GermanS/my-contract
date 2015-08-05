package Test::MyContract::Form::Address;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::Address;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::Address -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        company  => 'company',
        index    => '123456',
        city     => 'Moscu',
        location => 'Mira 124',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 5 ) {
    my $self = shift;

    my %params = (
        company  => q{},
        index    => q{},
        city     => q{},
        location => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'company' ) -> has_errors(), 'company field has error';
    ok $form -> field( 'index' ) -> has_errors(), 'index field has error';
    ok $form -> field( 'city' ) -> has_errors(), 'city field has error';
    ok $form -> field( 'location' ) -> has_errors(), 'location field has error';

    return;
}

sub test_03_long_index :Test( 2 ) {
    my $self = shift;

    my %params = (
        index => 1234567
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'index' ) -> has_errors(), 'index field has error';

    return;
}

1;

__END__