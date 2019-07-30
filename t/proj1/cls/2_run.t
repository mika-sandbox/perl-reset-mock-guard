use Test::Spec;
use Test::Mock::Guard qw/mock_guard/;

use Proj1::Cls;

describe 'Proj1::Cls#run' => sub {
    my $guard;

    describe 'inner' => sub {
        before each => sub {
            $guard = mock_guard('Proj1::Cls', +{ run => sub { 1 }});
        };

        it 'returns 1' => sub {
            my $cls = Proj1::Cls->new;
            is $cls->run, 1;
        };

        after each => sub {
          $guard->reset('Proj1::Cls', [qw/run/]);
        };
    };

    describe 'outer' => sub {
        it 'returns "Hello, World"' => sub {
            my $cls = Proj1::Cls->new;
            is $cls->run, "Hello, World";
        };
    };
};

runtests unless caller;