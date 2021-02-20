#!/usr/bin/perl
chdir "/home/dmg/faqs/spices";
print `rcp * dmorales@neumann.uwaterloo.ca:faqs/spices`;
print `rsh neumann -l dmorales "cd faqs/spices;/u/alopez-o/l2h/l2h -split 0 -show_section_numbers spices.tex"`;
print `rcp  dmorales@neumann.uwaterloo.ca:faqs/spices/spices/spices.html /home/dmg/public_html/faqs/spices/index.html`;
print `lynx -dump "http://csg/~dmg/faqs/spices/" > spices.txt`;
