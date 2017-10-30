#!/usr/bin/perl
#
# irkitdata2virsend
#	IRKitのデータを入力して、VIRに送信する
# 
$vir_unit = 38.02*1000*2;  # 38.02kHzの分周(2倍)でカウント
$irkit_unit = 2*1000*1000; # 2MHzでカウント

$in = join("",<>);
# while (<>) {
#     $in .= $_;
#     break if /\[/;
# }
unless ($in =~ /^.*data[\D]*([\d,]+).*$/) {
    die "Format error";
}
@D = split(/,/, $1);
$onoff = 1;

open(POUT, "|encode.pl |V-IR S") || die;

while (@D) {
      $value = shift(@D);
      printf(POUT "%d,%d\n", $onoff, $value*$vir_unit/$irkit_unit);
      $onoff ^=1;
}
