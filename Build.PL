use strict;
use warnings;

use Module::Build;

use lib qw(lib);

my $build = Module::Build -> new(
    module_name          => 'MyContract',
    dist_abstract        => 'my contract',
    recursive_test_files => 1,
    requires => {
        'Catalyst'                         => '>=5.80025',
        'Catalyst::Action::RenderView'     => 0,
        'Catalyst::Plugin::ConfigLoader'   => 0,
        'Catalyst::Plugin::Static::Simple' => 0,
        'DateTime'                         => 0,
        'DateTime::Format::MySQL'          => 0,
        'DBIx::Class'                      => '>=0.08123',
        'HTML::FormHandler'                => 0,
        'Moose'                            => '>=1.09',
        'namespace::autoclean'             => 0,
        'Test::More'                       => '>=0.94',
    }
);

$build -> create_build_script();