package Regexp::Match::Any;

use strict;
use warnings;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

$Regexp::Match::Any::VERSION    = 0.02;
@ISA                            = qw(Exporter);
@EXPORT                         = qw(&match_any);
@EXPORT_OK                      = qw(&match_any);

sub match_any {
  my $ref;
  unless(ref($_[0])){
    $ref = \@_;
  }else{
    $ref = $_[0];
  }
  my $regex = join('|', @{$ref});
  return qr/$regex/;
}
__END__

=head1 NAME

  Regexp::Match::Any - Match many regexes against a variable

 
=head1 CHANGES
  
  Version 0.02: Pass match_any() both arrays and array references


=head1 SYNOPSIS

  use Regexp::Match::Any;
  my @array = qw(foo bar wibble);
  my $var = "foo";
  if($var =~ match_any(\@array)){
    print "It matched\n";
  }else{
    print "It didn't match\n";
  }


=head1 DESCRIPTION

  This module allows you to pass the match_any() function an array of regexs (or reference to the array)
  and then will match the variable against any of them. This is quite handy for things such as 
  swear word listings or to use regexs stored within a file or database. For good programming
  practice you should always pass an array reference.


=head1 AUTHOR

  Scott McWhirter <scott@kungfuftr.com>


=head1 COPYRIGHT

  Copyright (c) 2001, Scott McWhirter. All Rights Reserved.  This module is
  free software. It may be used, redistributed and/or modified under the
  terms of the Perl Artistic License. 
  ( see http://www.perl.com/perl/misc/Artistic.html )

