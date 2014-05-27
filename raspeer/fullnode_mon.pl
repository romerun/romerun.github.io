#!/usr/bin/perl
use strict;

my $ppcoind='/home/pi/ppcoind.v0.4';
my $datadir='/home/pi/.ppcoin';
my $ip = '';

for (;;) {
        my $info = `$ppcoind -datadir=$datadir getinfo`;
        if ($info =~ /"ip" : "([^"]+)"/) {
                if ($1 ne '0.0.0.0' and $ip ne $1) {
                        print "IP has changed from $ip to $1\n";
                        system("$ppcoind -datadir=$datadir stop");
                        $ip = $1;
                }
        }

        sleep 60;
}
