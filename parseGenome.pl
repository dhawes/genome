#!/usr/bin/perl

use strict;

while(<>)
{
    chomp();
    for(my $i = 0; $i < length($_); $i++)
    {
        my $c = substr($_, $i, 1);
        if($c =~ /[A-Za-z]/)
        {
            print "$c\n";
        }
    }
}

exit 0;
