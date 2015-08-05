package Test::MyContract::Form::Contract;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::Contract;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::Contract -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        company => 1,
        name    => 'Name',
        data    => 'Contact',
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 4 ) {
    my $self = shift;

    my %params = (
        company => q{},
        name    => q{},
        data    => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'form has errors';
    ok $form -> field( 'company' ) -> has_errors(), 'company field has error';
    ok $form -> field( 'name' ) -> has_errors(), 'name field has error';
    ok $form -> field( 'data' ) -> has_errors(), 'data field has error';

    return;
}

1;

__END__