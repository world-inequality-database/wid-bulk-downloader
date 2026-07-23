* define WID percentiles and distributional groups

if "$deciles" == "YES" {
    global percentiles "p0p10 p10p20 p20p30 p30p40 p40p50 p50p60 p60p70 p70p80 p80p90 p90p100"
}
else if "$groups" == "YES" {
    global percentiles "p0p50 p50p90 p90p100 p99p100"
}
else if "$g_percentiles" == "YES" {
    global percentiles "p0p1 p1p2 p2p3 p3p4 p4p5 p5p6 p6p7 p7p8 p8p9 p9p10 p10p11 p11p12 p12p13 p13p14 p14p15 p15p16 p16p17 p17p18 p18p19 p19p20 p20p21 p21p22 p22p23 p23p24 p24p25 p25p26 p26p27 p27p28 p28p29 p29p30 p30p31 p31p32 p32p33 p33p34 p34p35 p35p36 p36p37 p37p38 p38p39 p39p40 p40p41 p41p42 p42p43 p43p44 p44p45 p45p46 p46p47 p47p48 p48p49 p49p50 p50p51 p51p52 p52p53 p53p54 p54p55 p55p56 p56p57 p57p58 p58p59 p59p60 p60p61 p61p62 p62p63 p63p64 p64p65 p65p66 p66p67 p67p68 p68p69 p69p70 p70p71 p71p72 p72p73 p73p74 p74p75 p75p76 p76p77 p77p78 p78p79 p79p80   p80p81 p81p82 p82p83 p83p84 p84p85 p85p86 p86p87 p87p88 p88p89 p89p90 p90p91 p91p92 p92p93 p93p94 p94p95 p95p96 p96p97 p97p98 p98p99 p99p99.1 p99.1p99.2 p99.2p99.3 p99.3p99.4 p99.4p99.5 p99.5p99.6 p99.6p99.7 p99.7p99.8 p99.8p99.9 p99.9p99.91 p99.91p99.92 p99.92p99.93 p99.93p99.94 p99.94p99.95 p99.95p99.96 p99.96p99.97 p99.97p99.98 p99.98p99.99 p99.99p99.991 p99.991p99.992 p99.992p99.993 p99.993p99.994 p99.994p99.995 p99.995p99.996 p99.996p99.997 p99.997p99.998 p99.998p99.999  p99.999p100"
}
else {
	if "$use_command" == "YES" {
    global percentiles "_all"
	} 
	else {
	global percentiles	
	}
}

