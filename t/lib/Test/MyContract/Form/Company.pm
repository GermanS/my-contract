package Test::MyContract::Form::Company;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::Company;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::Company -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        name  => 'Company',
        INN   => 12344567890,
        KPP   => 123456789,
        OGRN  => 12345678989011234567890,
        OKONH => 12345678989011234567890,
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

sub test_02_empty_fields :Test( 6 ) {
    my $self = shift;

    my %params = (
        name  => q{},
        INN   => q{},
        KPP   => q{},
        OGRN  => q{},
        OKONH => q{},
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok !$form -> is_valid(), 'company form has errors';

    ok $form -> field( 'name' ) -> has_errors(), 'name field has error';
    ok $form -> field( 'INN' ) -> has_errors(), 'INN field has error';

    ok !$form -> field( 'KPP' ) -> has_errors(), 'KPP field has not error';
    ok !$form -> field( 'OGRN' ) -> has_errors(), 'OGRN field has not error';
    ok !$form -> field( 'OKONH' ) -> has_errors(), 'OKONH field has not error';

    return;
}

1;

__END__