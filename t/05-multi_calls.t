#!/usr/bin/env perl;
use warnings;
use strict;
use Crypt::XkcdPassword;
use Test::Most;
my $xk = Crypt::XkcdPassword->new;
lives_ok { $xk->make_password };
lives_ok { $xk->make_password };

lives_ok { Crypt::XkcdPassword->make_password()};
lives_ok { Crypt::XkcdPassword->make_password()};

done_testing;