#!/usr/bin/perl

undef $/; # Read everything
$File =<>; 
$* = 1;  # multine search

#$ParrafoFinal = <<END
#
#(C) 1995 Daniel M. Germán
#
#
#END
#   ;

$ParrafoFinal = "";

$File =~ s/\.ca\/~ /\.ca\/~/g;
#$File =~ s/\n[ \t]*\[IMAGE\][\s*\n/\n/g;
$File =~ s/\[IMAGE\]//g;
$File =~ s/ABSTRACT://;
$File =~ s/ / /g;
#$File =~ s/(Frequently.*)\n/$1\n\n   Changes since last version\n/;
$File =~ s/^[ \t]+$//g;  #Remove the spaces of emtpy lines
$File =~ s/\n[\n]+/\n\n/g; #Remove the emtpy lines
$File =~ s/^[ \t]+([0-9]+ [^ \t])/$1/g;

$File =~ s/(http:\/\/[^ \n]+)([ \n]+)\1/$1$2/g;
$File =~ s/\[[0-9]+\]//g;  # Remove Lynx references
$File =~ /^References$/;
$Principio = $` . $&;
$File = $';


#print $File;

$File =~ s/([0-9]+)\n[ ]+/$1 /g;
#print $File;

$Final = $Principio . ($File . $ParrafoFinal);
$Final =~ /References\n\n   1\./;
$Final = $`;


print $Final;
