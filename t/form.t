use strict;
use warnings;

use lib qw(t/lib);
use Test::MyContract::Form::SignIn;
use Test::MyContract::Form::SignUp;


use Test::MyContract::Form::Address;
use Test::MyContract::Form::BankAccount;
use Test::MyContract::Form::Company;
use Test::MyContract::Form::Connection;
use Test::MyContract::Form::Contract;

Test::Class -> runtests();