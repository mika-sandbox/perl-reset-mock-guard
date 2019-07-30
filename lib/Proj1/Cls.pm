package Proj1::Cls;
use strict;
use warnings;
use utf8;
use Mouse;

sub run {
  my ($self, ) = @_;
  return "Hello, World";
}

__PACKAGE__->meta->make_immutable;