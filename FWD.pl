#!/usr/bin/perl

use strict;

sub recurse {
  my $path = shift;
  my @files = glob "$path/{*,.*}";
  for my $file (@files) {
    if (-d $file) {
      if ($file !~ /\/\.$/ && $file !~ /\/\.\.$/) {
        recurse($file);
      }
    } else {
      print "$file\n" if -w $file;
    }
  }
}

print "Writable files for " . getlogin() . "\n";
recurse($ARGV[0]);
