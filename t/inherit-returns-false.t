use strict;
use Test::More tests => 2;
use lib 't/lib';

use vars qw($got_here);

my $res = eval q{
    package MyTest;

    use inherit 'ReturnsFalse';

    $main::got_here++
};
my $error = $@;

is $got_here, undef, "The block did not run to its end.";
like $error, q{/^ReturnsFalse.pm did not return a true value at /}, "A module that returns a false value raises an error";
