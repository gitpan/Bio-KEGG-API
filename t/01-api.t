#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use lib 'lib';
use Bio::KEGG::API;

plan tests => 1;

my $k = Bio::KEGG::API->new();

my $result = $k->database_info(database => 'hsa');
$result =~ s/\s+/ /g;
chop $result;

my $text = "T01001 Homo sapiens (human) KEGG Genes Database hsa Release 72.0+/11-14, Nov 14 Kanehisa Laboratories 30,790 entries";

cmp_ok ( $result, 'eq', $text);
