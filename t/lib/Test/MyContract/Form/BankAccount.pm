package Test::MyContract::Form::BankAccount;

use strict;
use warnings;

use Test::More;
use base qw(Test::Class);

use MyContract::Form::BankAccount;

sub setup :Test( setup ) {
    my $self = shift;

    $self -> { 'form' } = MyContract::Form::BankAccount -> new();

    return;
}

sub form { my $self = shift; return $self -> { 'form' }; }

sub test_01_without_errors :Test( 1 ) {
    my $self = shift;

    my %params = (
        company               => 1,
        bank                  => 'Bank Name',
        BIC                   => 123456789,
        current_account       => 123456789890112345678909,
        correspondent_account => 123456789890112345678909,
    );

    my $form = $self -> form();
    $form -> process( \%params );

    ok $form -> is_valid(), 'valid form';

    return;
}

1;

__END__