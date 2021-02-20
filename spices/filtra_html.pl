#!/usr/bin/perl

undef $/; # Read everything
$File =<>; 
$* = 1;  # multine search

$File =~ s/&\#126; /~/g;
$File =~ s/<H3>Abstract:<\/H3>//;
$File =~ s/(Frequently.*)\n/$1\n\n   <p>Changes since last version\n/;
$File =~ s/^[ \t]+$//g;  #Remove the spaces of emtpy lines
$File =~ s/\n\n<P>\n/\n\n/g; #Remove the emtpy lines
$File =~ s/\n[\n]+/\n\n/g; #Remove the emtpy lines
$File =~ s/\/ dmg\//\/~dmg\//g;
$File =~ s/\/&#126; dmg\//\/~dmg\//g;
$File =~ s/([^\"])(http:\/\/csgwww[^ <\n\t]+)/$1<a href=\"$1\">$2<\/a>/g; #Remove the emtpy lines

print $File;

