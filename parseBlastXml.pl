#!/usr/bin/perl

use XML::LibXML;

my $parser = XML::LibXML->new();
my $doc    = $parser->parse_file($ARGV[0]);
my $i = 0;

foreach my $hit ($doc->findnodes('/BlastOutput/BlastOutput_iterations/Iteration/Iteration_hits/Hit'))
{
    #print STDERR ++$i;
    # description
    my($desc) = $hit->findnodes('./Hit_def');
    # max score
    my($maxScore) = $hit->findnodes('./Hit_hsps/Hsp/Hsp_bit-score');
    # total score
    my($totalScore) = $hit->findnodes('./Hit_hsps/Hsp/Hsp_bit-score');
    # query cover
    my($len) = $hit->findnodes('./Hit_hsps/Hsp/Hsp_align-len');
    my($identity) = $hit->findnodes('./Hit_hsps/Hsp/Hsp_identity');
    my $ident = ($identity->to_literal * 100) / $len->to_literal;
    # e value
    my($eValue) = $hit->findnodes('./Hit_hsps/Hsp/Hsp_evalue');
    # accession
    my($accession) = $hit->findnodes('./Hit_accession');
#    print "\"description\"", ",",
#          "\"max score\"", ",",
#          "\"total score\"", ",",
#          "\"e value\"", ",",
#          "\"ident\"", ",",
#          "\"accession\"",
    print "\"", $desc->to_literal, "\"", ",",
          "\"", $maxScore->to_literal, "\"", ",",
          "\"", $totalScore->to_literal, "\"", ",",
          "\"", $eValue->to_literal, "\"", ",",
          "\"", $ident, "\"", ",",
          "\"", $accession->to_literal, "\"",
          "\n";
}
