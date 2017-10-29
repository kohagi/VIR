#!/usr/bin/perl
#
# encode.pl
#    VIR-USBのdecode.plの逆変換
#
@prev = (0, 0);
$loopcount = 0;

print "#,01,D9";

while (<>) {
    unless (/^([01]),(\d+)/) {
	next;
    }
    $onoff = $1;
    $value = $2;

    if ($prev[$onoff] == $value) {
	$loopcount ++;
	next;
    }

    if ($loopcount > 0) {
	printf(",%02X", (0xC0 | $loopcount)); # 0xC0 = 0b11000000
    }
    $loopcount = 0;
    $prev[$onoff] = $value;

    if (0<=$value && $value <= 127) {
	printf(",%02X", $value);
    } elsif (128<=$value && $value <= 16383) {
	printf(",%02X", ($value >> 8) | 0x80); # 0x80 = 0b10000000
	printf(",%02X", ($value & 0x00FF));
    } else {
	die "format error: "+$value;
    }
}
if ($loopcount > 0) {
    printf(",%02X", (0xC0 | $loopcount)); # 0xC0 = 0b11000000
}
print "\n";
