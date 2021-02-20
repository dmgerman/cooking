#!/usr/bin/perl

open (IN, "spices.txt") || die " I can't find spices.txt file\n";


while (<IN>)
{
    if (/Ver\./)
    {
	# i found it
	chop $_;
	die "Illegal Abstract [$_]\n" unless (/Ver\. ([0-9\.]+) \(([^\)]+)\)/);
	$Version = $1;
	$Date = $2;

	print <<END
From: dmg@csg.uwaterloo.ca (Daniel M. German)
Newsgroups: rec.food.cooking,rec.food.veg,rec.food.preserving,rec.answers,news.answers
Subject: Flavouring the World, the FAQ about SPICES Ver. $Version
Followup-To: rec.food.cooking,rec.food.veg,rec.food.preserving
Summary: This posting answers commonly asked questions about Spices: 
	their nature, use, and storage.
Approved: news-answers-request@MIT.EDU


Archive-name: food/spices
Posting-Frequency: monthly
Version: $Version
URL: http://csgwww.uwaterloo.ca/~dmg/faqs/spices/index.html
Last-modified: $Date

END
    ;
	exit;
    }
}
die "Illegal spices.txt file\n";
