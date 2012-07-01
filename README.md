leaptime
========

うるう秒

[Script Name]

leapcheck.sh

[Install]

$ apt-get install -y ntp ntpdate

[Description]

stop ntp service,ntpdate [ntp-server] ,start ntp service script

[Examples]
$ ./leapcheck.sh ntp.nict.jp

========

[Script Name]

leapcheckmail.sh

[mail format]
Subject: ntpq leap second report : 2012/05/24 00:56
#"leap=" check 2012/02/01 00:40
 leap=00
#"leap=" check 2012/02/01 00:40
 leap=00
#"leap=" check 2012/02/01 00:56
 leap=00
#"leap=" check 2012/02/02 00:56
 leap=00
#"leap=" check 2012/02/03 00:56
 leap=00

[Description]
LI(Leap Indicator) Flag check and Report mail

[Examples]

$ crontab -l
#0 7,8,9 * * * /root/leapcheckmail.sh

[Script Name]

leapindicator.sh

[Format]

associd=0 status=4615 leap_add_sec, sync_ntp, 1 event, clock_sync,
version="ntpd 4.2.6p2@1.2194-o Sun Oct 17 13:35:13 UTC 2010 (1)",
processor="x86_64", system="Linux/2.6.32-5-amd64", leap=01, stratum=2,
precision=-23, rootdelay=12.162, rootdisp=30.346, refid=133.243.238.164,
reftime=d398f9ac.dd5bc977  Sat, Jun 30 2012 13:06:04.864,
clock=d398fd40.09d25f4a  Sat, Jun 30 2012 13:21:20.038, peer=38985,
tc=10, mintc=3, offset=0.780, frequency=-22.264, sys_jitter=0.716,
clk_jitter=0.369, clk_wander=0.055
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*133.243.238.164 .NICT.           1 u  916 1024  377   12.162    0.780   0.716
ntp_gettime() returns code 1 (INS)
  time d398fd40.0ba9a000  Sat, Jun 30 2012 13:21:20.045, (.045557),
  maximum error 480202 us, estimated error 369 us
ntp_adjtime() returns code 1 (INS)
  modes 0x0 (),
  offset 623.000 us, frequency -22.264 ppm, interval 1 s,
  maximum error 480202 us, estimated error 369 us,
  status 0x4011 (PLL,INS,MODE),
  time constant 10, precision 1.000 us, tolerance 500 ppm,
1341030080
2012年06月30日 13時21分20秒

[Description]
LI Flag check.
start : Sat Jun 30 04:21:27 UTC 2012
end   : Sun Jul  1 00:35:49 UTC 2012

