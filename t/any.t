#!/usr/bin/perl -w

use strict;
use Test;

BEGIN { plan tests => 8 }

use Regexp::Match::Any;


#-------------------
# Simple word match
#-------------------
my @a = qw(foo bar wibble);
my $a = "foo";

#-----------------------
# Simple word not match
#-----------------------
my @b = qw(foo bar wibble);
my $b = "not";

#--------------
# Simple match
#--------------
my @c = qw(http://perl.com http://perl.org http://debian.org);
my $c = "http://perl.org";

#------------------------------------------------------
# Match mail address, URL or something containg an 'a'
#------------------------------------------------------
my @d = (".*\@.*\..*",".*\:\/\/.*\..*",".*a.*");
my $d = "kungfuftr\@cpan.org";


#------------------
# Do some testing!
#------------------
ok($a =~ match_any(@a));
ok(not $b =~ match_any(@b));
ok($c =~ match_any(@c));
ok($d =~ match_any(@d));

# Same again but with references
ok($a =~ match_any(\@a));
ok(not $b =~ match_any(\@b));
ok($c =~ match_any(\@c));
ok($d =~ match_any(\@d));
