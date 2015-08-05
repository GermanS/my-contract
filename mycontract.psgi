use strict;
use warnings;

use MyContract;

my $app = MyContract->apply_default_middlewares(MyContract->psgi_app);
$app;

