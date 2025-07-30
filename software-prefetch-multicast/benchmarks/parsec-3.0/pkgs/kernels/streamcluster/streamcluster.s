
streamcluster:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64 
    2004:	48 83 ec 08          	sub    $0x8,%rsp
    2008:	48 8b 05 d9 cf 00 00 	mov    0xcfd9(%rip),%rax        # efe8 <__gmon_start__>
    200f:	48 85 c0             	test   %rax,%rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	callq  *%rax
    2016:	48 83 c4 08          	add    $0x8,%rsp
    201a:	c3                   	retq   

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 52 ce 00 00    	pushq  0xce52(%rip)        # ee78 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	f2 ff 25 53 ce 00 00 	bnd jmpq *0xce53(%rip)        # ee80 <_GLOBAL_OFFSET_TABLE_+0x10>
    202d:	0f 1f 00             	nopl   (%rax)
    2030:	f3 0f 1e fa          	endbr64 
    2034:	68 00 00 00 00       	pushq  $0x0
    2039:	f2 e9 e1 ff ff ff    	bnd jmpq 2020 <.plt>
    203f:	90                   	nop
    2040:	f3 0f 1e fa          	endbr64 
    2044:	68 01 00 00 00       	pushq  $0x1
    2049:	f2 e9 d1 ff ff ff    	bnd jmpq 2020 <.plt>
    204f:	90                   	nop
    2050:	f3 0f 1e fa          	endbr64 
    2054:	68 02 00 00 00       	pushq  $0x2
    2059:	f2 e9 c1 ff ff ff    	bnd jmpq 2020 <.plt>
    205f:	90                   	nop
    2060:	f3 0f 1e fa          	endbr64 
    2064:	68 03 00 00 00       	pushq  $0x3
    2069:	f2 e9 b1 ff ff ff    	bnd jmpq 2020 <.plt>
    206f:	90                   	nop
    2070:	f3 0f 1e fa          	endbr64 
    2074:	68 04 00 00 00       	pushq  $0x4
    2079:	f2 e9 a1 ff ff ff    	bnd jmpq 2020 <.plt>
    207f:	90                   	nop
    2080:	f3 0f 1e fa          	endbr64 
    2084:	68 05 00 00 00       	pushq  $0x5
    2089:	f2 e9 91 ff ff ff    	bnd jmpq 2020 <.plt>
    208f:	90                   	nop
    2090:	f3 0f 1e fa          	endbr64 
    2094:	68 06 00 00 00       	pushq  $0x6
    2099:	f2 e9 81 ff ff ff    	bnd jmpq 2020 <.plt>
    209f:	90                   	nop
    20a0:	f3 0f 1e fa          	endbr64 
    20a4:	68 07 00 00 00       	pushq  $0x7
    20a9:	f2 e9 71 ff ff ff    	bnd jmpq 2020 <.plt>
    20af:	90                   	nop
    20b0:	f3 0f 1e fa          	endbr64 
    20b4:	68 08 00 00 00       	pushq  $0x8
    20b9:	f2 e9 61 ff ff ff    	bnd jmpq 2020 <.plt>
    20bf:	90                   	nop
    20c0:	f3 0f 1e fa          	endbr64 
    20c4:	68 09 00 00 00       	pushq  $0x9
    20c9:	f2 e9 51 ff ff ff    	bnd jmpq 2020 <.plt>
    20cf:	90                   	nop
    20d0:	f3 0f 1e fa          	endbr64 
    20d4:	68 0a 00 00 00       	pushq  $0xa
    20d9:	f2 e9 41 ff ff ff    	bnd jmpq 2020 <.plt>
    20df:	90                   	nop
    20e0:	f3 0f 1e fa          	endbr64 
    20e4:	68 0b 00 00 00       	pushq  $0xb
    20e9:	f2 e9 31 ff ff ff    	bnd jmpq 2020 <.plt>
    20ef:	90                   	nop
    20f0:	f3 0f 1e fa          	endbr64 
    20f4:	68 0c 00 00 00       	pushq  $0xc
    20f9:	f2 e9 21 ff ff ff    	bnd jmpq 2020 <.plt>
    20ff:	90                   	nop
    2100:	f3 0f 1e fa          	endbr64 
    2104:	68 0d 00 00 00       	pushq  $0xd
    2109:	f2 e9 11 ff ff ff    	bnd jmpq 2020 <.plt>
    210f:	90                   	nop
    2110:	f3 0f 1e fa          	endbr64 
    2114:	68 0e 00 00 00       	pushq  $0xe
    2119:	f2 e9 01 ff ff ff    	bnd jmpq 2020 <.plt>
    211f:	90                   	nop
    2120:	f3 0f 1e fa          	endbr64 
    2124:	68 0f 00 00 00       	pushq  $0xf
    2129:	f2 e9 f1 fe ff ff    	bnd jmpq 2020 <.plt>
    212f:	90                   	nop
    2130:	f3 0f 1e fa          	endbr64 
    2134:	68 10 00 00 00       	pushq  $0x10
    2139:	f2 e9 e1 fe ff ff    	bnd jmpq 2020 <.plt>
    213f:	90                   	nop
    2140:	f3 0f 1e fa          	endbr64 
    2144:	68 11 00 00 00       	pushq  $0x11
    2149:	f2 e9 d1 fe ff ff    	bnd jmpq 2020 <.plt>
    214f:	90                   	nop
    2150:	f3 0f 1e fa          	endbr64 
    2154:	68 12 00 00 00       	pushq  $0x12
    2159:	f2 e9 c1 fe ff ff    	bnd jmpq 2020 <.plt>
    215f:	90                   	nop
    2160:	f3 0f 1e fa          	endbr64 
    2164:	68 13 00 00 00       	pushq  $0x13
    2169:	f2 e9 b1 fe ff ff    	bnd jmpq 2020 <.plt>
    216f:	90                   	nop
    2170:	f3 0f 1e fa          	endbr64 
    2174:	68 14 00 00 00       	pushq  $0x14
    2179:	f2 e9 a1 fe ff ff    	bnd jmpq 2020 <.plt>
    217f:	90                   	nop
    2180:	f3 0f 1e fa          	endbr64 
    2184:	68 15 00 00 00       	pushq  $0x15
    2189:	f2 e9 91 fe ff ff    	bnd jmpq 2020 <.plt>
    218f:	90                   	nop
    2190:	f3 0f 1e fa          	endbr64 
    2194:	68 16 00 00 00       	pushq  $0x16
    2199:	f2 e9 81 fe ff ff    	bnd jmpq 2020 <.plt>
    219f:	90                   	nop
    21a0:	f3 0f 1e fa          	endbr64 
    21a4:	68 17 00 00 00       	pushq  $0x17
    21a9:	f2 e9 71 fe ff ff    	bnd jmpq 2020 <.plt>
    21af:	90                   	nop
    21b0:	f3 0f 1e fa          	endbr64 
    21b4:	68 18 00 00 00       	pushq  $0x18
    21b9:	f2 e9 61 fe ff ff    	bnd jmpq 2020 <.plt>
    21bf:	90                   	nop
    21c0:	f3 0f 1e fa          	endbr64 
    21c4:	68 19 00 00 00       	pushq  $0x19
    21c9:	f2 e9 51 fe ff ff    	bnd jmpq 2020 <.plt>
    21cf:	90                   	nop
    21d0:	f3 0f 1e fa          	endbr64 
    21d4:	68 1a 00 00 00       	pushq  $0x1a
    21d9:	f2 e9 41 fe ff ff    	bnd jmpq 2020 <.plt>
    21df:	90                   	nop
    21e0:	f3 0f 1e fa          	endbr64 
    21e4:	68 1b 00 00 00       	pushq  $0x1b
    21e9:	f2 e9 31 fe ff ff    	bnd jmpq 2020 <.plt>
    21ef:	90                   	nop
    21f0:	f3 0f 1e fa          	endbr64 
    21f4:	68 1c 00 00 00       	pushq  $0x1c
    21f9:	f2 e9 21 fe ff ff    	bnd jmpq 2020 <.plt>
    21ff:	90                   	nop
    2200:	f3 0f 1e fa          	endbr64 
    2204:	68 1d 00 00 00       	pushq  $0x1d
    2209:	f2 e9 11 fe ff ff    	bnd jmpq 2020 <.plt>
    220f:	90                   	nop
    2210:	f3 0f 1e fa          	endbr64 
    2214:	68 1e 00 00 00       	pushq  $0x1e
    2219:	f2 e9 01 fe ff ff    	bnd jmpq 2020 <.plt>
    221f:	90                   	nop
    2220:	f3 0f 1e fa          	endbr64 
    2224:	68 1f 00 00 00       	pushq  $0x1f
    2229:	f2 e9 f1 fd ff ff    	bnd jmpq 2020 <.plt>
    222f:	90                   	nop
    2230:	f3 0f 1e fa          	endbr64 
    2234:	68 20 00 00 00       	pushq  $0x20
    2239:	f2 e9 e1 fd ff ff    	bnd jmpq 2020 <.plt>
    223f:	90                   	nop
    2240:	f3 0f 1e fa          	endbr64 
    2244:	68 21 00 00 00       	pushq  $0x21
    2249:	f2 e9 d1 fd ff ff    	bnd jmpq 2020 <.plt>
    224f:	90                   	nop
    2250:	f3 0f 1e fa          	endbr64 
    2254:	68 22 00 00 00       	pushq  $0x22
    2259:	f2 e9 c1 fd ff ff    	bnd jmpq 2020 <.plt>
    225f:	90                   	nop
    2260:	f3 0f 1e fa          	endbr64 
    2264:	68 23 00 00 00       	pushq  $0x23
    2269:	f2 e9 b1 fd ff ff    	bnd jmpq 2020 <.plt>
    226f:	90                   	nop
    2270:	f3 0f 1e fa          	endbr64 
    2274:	68 24 00 00 00       	pushq  $0x24
    2279:	f2 e9 a1 fd ff ff    	bnd jmpq 2020 <.plt>
    227f:	90                   	nop
    2280:	f3 0f 1e fa          	endbr64 
    2284:	68 25 00 00 00       	pushq  $0x25
    2289:	f2 e9 91 fd ff ff    	bnd jmpq 2020 <.plt>
    228f:	90                   	nop
    2290:	f3 0f 1e fa          	endbr64 
    2294:	68 26 00 00 00       	pushq  $0x26
    2299:	f2 e9 81 fd ff ff    	bnd jmpq 2020 <.plt>
    229f:	90                   	nop
    22a0:	f3 0f 1e fa          	endbr64 
    22a4:	68 27 00 00 00       	pushq  $0x27
    22a9:	f2 e9 71 fd ff ff    	bnd jmpq 2020 <.plt>
    22af:	90                   	nop
    22b0:	f3 0f 1e fa          	endbr64 
    22b4:	68 28 00 00 00       	pushq  $0x28
    22b9:	f2 e9 61 fd ff ff    	bnd jmpq 2020 <.plt>
    22bf:	90                   	nop

Disassembly of section .plt.got:

00000000000022c0 <__cxa_finalize@plt>:
    22c0:	f3 0f 1e fa          	endbr64 
    22c4:	f2 ff 25 05 cd 00 00 	bnd jmpq *0xcd05(%rip)        # efd0 <__cxa_finalize@GLIBC_2.2.5>
    22cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000022d0 <__printf_chk@plt>:
    22d0:	f3 0f 1e fa          	endbr64 
    22d4:	f2 ff 25 ad cb 00 00 	bnd jmpq *0xcbad(%rip)        # ee88 <__printf_chk@GLIBC_2.3.4>
    22db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022e0 <_Znam@plt>:
    22e0:	f3 0f 1e fa          	endbr64 
    22e4:	f2 ff 25 a5 cb 00 00 	bnd jmpq *0xcba5(%rip)        # ee90 <_Znam@GLIBCXX_3.4>
    22eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000022f0 <pthread_mutex_trylock@plt>:
    22f0:	f3 0f 1e fa          	endbr64 
    22f4:	f2 ff 25 9d cb 00 00 	bnd jmpq *0xcb9d(%rip)        # ee98 <pthread_mutex_trylock@GLIBC_2.2.5>
    22fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002300 <pthread_cond_broadcast@plt>:
    2300:	f3 0f 1e fa          	endbr64 
    2304:	f2 ff 25 95 cb 00 00 	bnd jmpq *0xcb95(%rip)        # eea0 <pthread_cond_broadcast@GLIBC_2.3.2>
    230b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002310 <pthread_join@plt>:
    2310:	f3 0f 1e fa          	endbr64 
    2314:	f2 ff 25 8d cb 00 00 	bnd jmpq *0xcb8d(%rip)        # eea8 <pthread_join@GLIBC_2.2.5>
    231b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002320 <memset@plt>:
    2320:	f3 0f 1e fa          	endbr64 
    2324:	f2 ff 25 85 cb 00 00 	bnd jmpq *0xcb85(%rip)        # eeb0 <memset@GLIBC_2.2.5>
    232b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002330 <pthread_create@plt>:
    2330:	f3 0f 1e fa          	endbr64 
    2334:	f2 ff 25 7d cb 00 00 	bnd jmpq *0xcb7d(%rip)        # eeb8 <pthread_create@GLIBC_2.2.5>
    233b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002340 <__assert_fail@plt>:
    2340:	f3 0f 1e fa          	endbr64 
    2344:	f2 ff 25 75 cb 00 00 	bnd jmpq *0xcb75(%rip)        # eec0 <__assert_fail@GLIBC_2.2.5>
    234b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002350 <calloc@plt>:
    2350:	f3 0f 1e fa          	endbr64 
    2354:	f2 ff 25 6d cb 00 00 	bnd jmpq *0xcb6d(%rip)        # eec8 <calloc@GLIBC_2.2.5>
    235b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002360 <pthread_mutex_unlock@plt>:
    2360:	f3 0f 1e fa          	endbr64 
    2364:	f2 ff 25 65 cb 00 00 	bnd jmpq *0xcb65(%rip)        # eed0 <pthread_mutex_unlock@GLIBC_2.2.5>
    236b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002370 <lrand48@plt>:
    2370:	f3 0f 1e fa          	endbr64 
    2374:	f2 ff 25 5d cb 00 00 	bnd jmpq *0xcb5d(%rip)        # eed8 <lrand48@GLIBC_2.2.5>
    237b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002380 <log@plt>:
    2380:	f3 0f 1e fa          	endbr64 
    2384:	f2 ff 25 55 cb 00 00 	bnd jmpq *0xcb55(%rip)        # eee0 <log@GLIBC_2.29>
    238b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002390 <memcpy@plt>:
    2390:	f3 0f 1e fa          	endbr64 
    2394:	f2 ff 25 4d cb 00 00 	bnd jmpq *0xcb4d(%rip)        # eee8 <memcpy@GLIBC_2.14>
    239b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023a0 <__strcpy_chk@plt>:
    23a0:	f3 0f 1e fa          	endbr64 
    23a4:	f2 ff 25 45 cb 00 00 	bnd jmpq *0xcb45(%rip)        # eef0 <__strcpy_chk@GLIBC_2.3.4>
    23ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023b0 <__cxa_atexit@plt>:
    23b0:	f3 0f 1e fa          	endbr64 
    23b4:	f2 ff 25 3d cb 00 00 	bnd jmpq *0xcb3d(%rip)        # eef8 <__cxa_atexit@GLIBC_2.2.5>
    23bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023c0 <fclose@plt>:
    23c0:	f3 0f 1e fa          	endbr64 
    23c4:	f2 ff 25 35 cb 00 00 	bnd jmpq *0xcb35(%rip)        # ef00 <fclose@GLIBC_2.2.5>
    23cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023d0 <_Znwm@plt>:
    23d0:	f3 0f 1e fa          	endbr64 
    23d4:	f2 ff 25 2d cb 00 00 	bnd jmpq *0xcb2d(%rip)        # ef08 <_Znwm@GLIBCXX_3.4>
    23db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023e0 <_ZdlPvm@plt>:
    23e0:	f3 0f 1e fa          	endbr64 
    23e4:	f2 ff 25 25 cb 00 00 	bnd jmpq *0xcb25(%rip)        # ef10 <_ZdlPvm@CXXABI_1.3.9>
    23eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023f0 <__stack_chk_fail@plt>:
    23f0:	f3 0f 1e fa          	endbr64 
    23f4:	f2 ff 25 1d cb 00 00 	bnd jmpq *0xcb1d(%rip)        # ef18 <__stack_chk_fail@GLIBC_2.4>
    23fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002400 <pthread_mutex_destroy@plt>:
    2400:	f3 0f 1e fa          	endbr64 
    2404:	f2 ff 25 15 cb 00 00 	bnd jmpq *0xcb15(%rip)        # ef20 <pthread_mutex_destroy@GLIBC_2.2.5>
    240b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002410 <fflush@plt>:
    2410:	f3 0f 1e fa          	endbr64 
    2414:	f2 ff 25 0d cb 00 00 	bnd jmpq *0xcb0d(%rip)        # ef28 <fflush@GLIBC_2.2.5>
    241b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002420 <fopen@plt>:
    2420:	f3 0f 1e fa          	endbr64 
    2424:	f2 ff 25 05 cb 00 00 	bnd jmpq *0xcb05(%rip)        # ef30 <fopen@GLIBC_2.2.5>
    242b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002430 <free@plt>:
    2430:	f3 0f 1e fa          	endbr64 
    2434:	f2 ff 25 fd ca 00 00 	bnd jmpq *0xcafd(%rip)        # ef38 <free@GLIBC_2.2.5>
    243b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002440 <pthread_cond_init@plt>:
    2440:	f3 0f 1e fa          	endbr64 
    2444:	f2 ff 25 f5 ca 00 00 	bnd jmpq *0xcaf5(%rip)        # ef40 <pthread_cond_init@GLIBC_2.3.2>
    244b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002450 <exit@plt>:
    2450:	f3 0f 1e fa          	endbr64 
    2454:	f2 ff 25 ed ca 00 00 	bnd jmpq *0xcaed(%rip)        # ef48 <exit@GLIBC_2.2.5>
    245b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002460 <fputc@plt>:
    2460:	f3 0f 1e fa          	endbr64 
    2464:	f2 ff 25 e5 ca 00 00 	bnd jmpq *0xcae5(%rip)        # ef50 <fputc@GLIBC_2.2.5>
    246b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002470 <_ZdaPv@plt>:
    2470:	f3 0f 1e fa          	endbr64 
    2474:	f2 ff 25 dd ca 00 00 	bnd jmpq *0xcadd(%rip)        # ef58 <_ZdaPv@GLIBCXX_3.4>
    247b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002480 <malloc@plt>:
    2480:	f3 0f 1e fa          	endbr64 
    2484:	f2 ff 25 d5 ca 00 00 	bnd jmpq *0xcad5(%rip)        # ef60 <malloc@GLIBC_2.2.5>
    248b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002490 <strtol@plt>:
    2490:	f3 0f 1e fa          	endbr64 
    2494:	f2 ff 25 cd ca 00 00 	bnd jmpq *0xcacd(%rip)        # ef68 <strtol@GLIBC_2.2.5>
    249b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024a0 <pthread_mutex_lock@plt>:
    24a0:	f3 0f 1e fa          	endbr64 
    24a4:	f2 ff 25 c5 ca 00 00 	bnd jmpq *0xcac5(%rip)        # ef70 <pthread_mutex_lock@GLIBC_2.2.5>
    24ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024b0 <pthread_mutex_init@plt>:
    24b0:	f3 0f 1e fa          	endbr64 
    24b4:	f2 ff 25 bd ca 00 00 	bnd jmpq *0xcabd(%rip)        # ef78 <pthread_mutex_init@GLIBC_2.2.5>
    24bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024c0 <fread@plt>:
    24c0:	f3 0f 1e fa          	endbr64 
    24c4:	f2 ff 25 b5 ca 00 00 	bnd jmpq *0xcab5(%rip)        # ef80 <fread@GLIBC_2.2.5>
    24cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024d0 <pthread_cond_wait@plt>:
    24d0:	f3 0f 1e fa          	endbr64 
    24d4:	f2 ff 25 ad ca 00 00 	bnd jmpq *0xcaad(%rip)        # ef88 <pthread_cond_wait@GLIBC_2.3.2>
    24db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024e0 <_ZNSt8ios_base4InitC1Ev@plt>:
    24e0:	f3 0f 1e fa          	endbr64 
    24e4:	f2 ff 25 a5 ca 00 00 	bnd jmpq *0xcaa5(%rip)        # ef90 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    24eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000024f0 <puts@plt>:
    24f0:	f3 0f 1e fa          	endbr64 
    24f4:	f2 ff 25 9d ca 00 00 	bnd jmpq *0xca9d(%rip)        # ef98 <puts@GLIBC_2.2.5>
    24fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002500 <feof@plt>:
    2500:	f3 0f 1e fa          	endbr64 
    2504:	f2 ff 25 95 ca 00 00 	bnd jmpq *0xca95(%rip)        # efa0 <feof@GLIBC_2.2.5>
    250b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002510 <__fprintf_chk@plt>:
    2510:	f3 0f 1e fa          	endbr64 
    2514:	f2 ff 25 8d ca 00 00 	bnd jmpq *0xca8d(%rip)        # efa8 <__fprintf_chk@GLIBC_2.3.4>
    251b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002520 <srand48@plt>:
    2520:	f3 0f 1e fa          	endbr64 
    2524:	f2 ff 25 85 ca 00 00 	bnd jmpq *0xca85(%rip)        # efb0 <srand48@GLIBC_2.2.5>
    252b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002530 <ferror@plt>:
    2530:	f3 0f 1e fa          	endbr64 
    2534:	f2 ff 25 7d ca 00 00 	bnd jmpq *0xca7d(%rip)        # efb8 <ferror@GLIBC_2.2.5>
    253b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002540 <pthread_cond_destroy@plt>:
    2540:	f3 0f 1e fa          	endbr64 
    2544:	f2 ff 25 75 ca 00 00 	bnd jmpq *0xca75(%rip)        # efc0 <pthread_cond_destroy@GLIBC_2.3.2>
    254b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002550 <fwrite@plt>:
    2550:	f3 0f 1e fa          	endbr64 
    2554:	f2 ff 25 6d ca 00 00 	bnd jmpq *0xca6d(%rip)        # efc8 <fwrite@GLIBC_2.2.5>
    255b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000002560 <main>:
  contcenters(&centers);
  outcenterIDs( &centers, centerIDs, outfile);
}

int main(int argc, char **argv)
{
    2560:	f3 0f 1e fa          	endbr64 
    2564:	41 57                	push   %r15
    2566:	41 56                	push   %r14
    2568:	41 55                	push   %r13
    256a:	41 54                	push   %r12
    256c:	55                   	push   %rbp
    256d:	48 89 f5             	mov    %rsi,%rbp
    2570:	53                   	push   %rbx
    2571:	89 fb                	mov    %edi,%ebx
  char *outfilename = new char[MAXNAMESIZE];
    2573:	bf 00 04 00 00       	mov    $0x400,%edi
{
    2578:	48 83 ec 28          	sub    $0x28,%rsp
  char *outfilename = new char[MAXNAMESIZE];
    257c:	e8 5f fd ff ff       	callq  22e0 <_Znam@plt>
  char *infilename = new char[MAXNAMESIZE];
    2581:	bf 00 04 00 00       	mov    $0x400,%edi
  char *outfilename = new char[MAXNAMESIZE];
    2586:	49 89 c5             	mov    %rax,%r13
  char *infilename = new char[MAXNAMESIZE];
    2589:	e8 52 fd ff ff       	callq  22e0 <_Znam@plt>

# ifdef __va_arg_pack
__fortify_function int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
    258e:	ba 31 00 00 00       	mov    $0x31,%edx
    2593:	be 01 00 00 00       	mov    $0x1,%esi
    2598:	48 8b 0d 81 ca 00 00 	mov    0xca81(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    259f:	48 8d 3d 7a 9d 00 00 	lea    0x9d7a(%rip),%rdi        # c320 <_IO_stdin_used+0x320>
    25a6:	49 89 c6             	mov    %rax,%r14
    25a9:	e8 a2 ff ff ff       	callq  2550 <fwrite@plt>

#ifdef PARSEC_VERSION
#define __PARSEC_STRING(x) #x
#define __PARSEC_XSTRING(x) __PARSEC_STRING(x)
        fprintf(stderr,"PARSEC Benchmark Suite Version "__PARSEC_XSTRING(PARSEC_VERSION)"\n");
	fflush(NULL);
    25ae:	31 ff                	xor    %edi,%edi
    25b0:	e8 5b fe ff ff       	callq  2410 <fflush@plt>
#endif //PARSEC_VERSION
#ifdef ENABLE_PARSEC_HOOKS
  __parsec_bench_begin(__parsec_streamcluster);
#endif

  if (argc<10) {
    25b5:	83 fb 09             	cmp    $0x9,%ebx
    25b8:	0f 8e 34 01 00 00    	jle    26f2 <main+0x192>

#ifdef __USE_EXTERN_INLINES
__extern_inline int
__NTH (atoi (const char *__nptr))
{
  return (int) strtol (__nptr, (char **) NULL, 10);
    25be:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
    25c2:	ba 0a 00 00 00       	mov    $0xa,%edx
    25c7:	31 f6                	xor    %esi,%esi
    25c9:	e8 c2 fe ff ff       	callq  2490 <strtol@plt>
    25ce:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
    25d2:	ba 0a 00 00 00       	mov    $0xa,%edx
    25d7:	31 f6                	xor    %esi,%esi
    exit(1);
  }



  kmin = atoi(argv[1]);
    25d9:	48 98                	cltq   
    25db:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    25e0:	e8 ab fe ff ff       	callq  2490 <strtol@plt>
    25e5:	48 8b 7d 18          	mov    0x18(%rbp),%rdi
    25e9:	ba 0a 00 00 00       	mov    $0xa,%edx
    25ee:	31 f6                	xor    %esi,%esi
  kmax = atoi(argv[2]);
    25f0:	48 98                	cltq   
    25f2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    25f7:	e8 94 fe ff ff       	callq  2490 <strtol@plt>
    25fc:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
    2600:	ba 0a 00 00 00       	mov    $0xa,%edx
    2605:	31 f6                	xor    %esi,%esi
    2607:	49 89 c7             	mov    %rax,%r15
    260a:	e8 81 fe ff ff       	callq  2490 <strtol@plt>
    260f:	48 8b 7d 28          	mov    0x28(%rbp),%rdi
    2613:	ba 0a 00 00 00       	mov    $0xa,%edx
    2618:	31 f6                	xor    %esi,%esi
  dim = atoi(argv[3]);
  n = atoi(argv[4]);
    261a:	48 63 d8             	movslq %eax,%rbx
    261d:	e8 6e fe ff ff       	callq  2490 <strtol@plt>
    2622:	48 8b 7d 30          	mov    0x30(%rbp),%rdi
    2626:	ba 0a 00 00 00       	mov    $0xa,%edx
    262b:	31 f6                	xor    %esi,%esi
  chunksize = atoi(argv[5]);
    262d:	48 98                	cltq   
    262f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2634:	e8 57 fe ff ff       	callq  2490 <strtol@plt>
#endif

__fortify_function char *
__NTH (strcpy (char *__restrict __dest, const char *__restrict __src))
{
  return __builtin___strcpy_chk (__dest, __src, __bos (__dest));
    2639:	48 8b 75 38          	mov    0x38(%rbp),%rsi
    263d:	ba 00 04 00 00       	mov    $0x400,%edx
    2642:	4c 89 f7             	mov    %r14,%rdi
  clustersize = atoi(argv[6]);
    2645:	4c 63 e0             	movslq %eax,%r12
    2648:	e8 53 fd ff ff       	callq  23a0 <__strcpy_chk@plt>
    264d:	48 8b 75 40          	mov    0x40(%rbp),%rsi
    2651:	ba 00 04 00 00       	mov    $0x400,%edx
    2656:	4c 89 ef             	mov    %r13,%rdi
    2659:	e8 42 fd ff ff       	callq  23a0 <__strcpy_chk@plt>
    265e:	48 8b 7d 48          	mov    0x48(%rbp),%rdi
    2662:	ba 0a 00 00 00       	mov    $0xa,%edx
    2667:	31 f6                	xor    %esi,%esi
    2669:	e8 22 fe ff ff       	callq  2490 <strtol@plt>
  fprintf(stderr,"TBB version. Number of divisions: %d\n",NUM_DIVISIONS);
  tbb::task_scheduler_init init(nproc);
#endif


  srand48(SEED);
    266e:	bf 01 00 00 00       	mov    $0x1,%edi
    2673:	89 05 8f ca 00 00    	mov    %eax,0xca8f(%rip)        # f108 <_ZL5nproc>
    2679:	e8 a2 fe ff ff       	callq  2520 <srand48@plt>
  PStream* stream;
  if( n > 0 ) {
    stream = new SimStream(n);
    267e:	bf 10 00 00 00       	mov    $0x10,%edi
  if( n > 0 ) {
    2683:	48 85 db             	test   %rbx,%rbx
    2686:	7e 55                	jle    26dd <main+0x17d>
    stream = new SimStream(n);
    2688:	e8 43 fd ff ff       	callq  23d0 <_Znwm@plt>
    268d:	48 89 c5             	mov    %rax,%rbp
  SimStream(long n_ ) {
    2690:	48 8d 05 09 c5 00 00 	lea    0xc509(%rip),%rax        # eba0 <_ZTV9SimStream+0x10>
    2697:	48 89 45 00          	mov    %rax,0x0(%rbp)
    n = n_;
    269b:	48 89 5d 08          	mov    %rbx,0x8(%rbp)

#ifdef ENABLE_PARSEC_HOOKS
  __parsec_roi_begin();
#endif

  streamCluster(stream, kmin, kmax, dim, chunksize, clustersize, outfilename );
    269f:	48 83 ec 08          	sub    $0x8,%rsp
    26a3:	4d 89 e1             	mov    %r12,%r9
    26a6:	44 89 f9             	mov    %r15d,%ecx
    26a9:	48 89 ef             	mov    %rbp,%rdi
    26ac:	41 55                	push   %r13
    26ae:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    26b3:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    26b8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    26bd:	e8 ee 77 00 00       	callq  9eb0 <_Z13streamClusterP7PStreamllillPc>

#ifdef ENABLE_PARSEC_HOOKS
  __parsec_roi_end();
#endif

  delete stream;
    26c2:	48 8b 55 00          	mov    0x0(%rbp),%rdx
    26c6:	48 89 ef             	mov    %rbp,%rdi
    26c9:	ff 52 20             	callq  *0x20(%rdx)
#ifdef ENABLE_PARSEC_HOOKS
  __parsec_bench_end();
#endif
  
  return 0;
}
    26cc:	48 83 c4 38          	add    $0x38,%rsp
    26d0:	31 c0                	xor    %eax,%eax
    26d2:	5b                   	pop    %rbx
    26d3:	5d                   	pop    %rbp
    26d4:	41 5c                	pop    %r12
    26d6:	41 5d                	pop    %r13
    26d8:	41 5e                	pop    %r14
    26da:	41 5f                	pop    %r15
    26dc:	c3                   	retq   
    stream = new FileStream(infilename);
    26dd:	e8 ee fc ff ff       	callq  23d0 <_Znwm@plt>
    26e2:	4c 89 f6             	mov    %r14,%rsi
    26e5:	48 89 c7             	mov    %rax,%rdi
    26e8:	48 89 c5             	mov    %rax,%rbp
    26eb:	e8 70 88 00 00       	callq  af60 <_ZN10FileStreamC1EPc>
    26f0:	eb ad                	jmp    269f <main+0x13f>
    26f2:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
    26f6:	48 8b 3d 23 c9 00 00 	mov    0xc923(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    26fd:	48 8d 15 54 9c 00 00 	lea    0x9c54(%rip),%rdx        # c358 <_IO_stdin_used+0x358>
    2704:	31 c0                	xor    %eax,%eax
    2706:	be 01 00 00 00       	mov    $0x1,%esi
    270b:	e8 00 fe ff ff       	callq  2510 <__fprintf_chk@plt>
    2710:	ba 2e 00 00 00       	mov    $0x2e,%edx
    2715:	48 8b 0d 04 c9 00 00 	mov    0xc904(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    271c:	be 01 00 00 00       	mov    $0x1,%esi
    2721:	48 8d 3d 70 9c 00 00 	lea    0x9c70(%rip),%rdi        # c398 <_IO_stdin_used+0x398>
    2728:	e8 23 fe ff ff       	callq  2550 <fwrite@plt>
    272d:	ba 2e 00 00 00       	mov    $0x2e,%edx
    2732:	48 8b 0d e7 c8 00 00 	mov    0xc8e7(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2739:	be 01 00 00 00       	mov    $0x1,%esi
    273e:	48 8d 3d 83 9c 00 00 	lea    0x9c83(%rip),%rdi        # c3c8 <_IO_stdin_used+0x3c8>
    2745:	e8 06 fe ff ff       	callq  2550 <fwrite@plt>
    274a:	ba 2c 00 00 00       	mov    $0x2c,%edx
    274f:	48 8b 0d ca c8 00 00 	mov    0xc8ca(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2756:	be 01 00 00 00       	mov    $0x1,%esi
    275b:	48 8d 3d 96 9c 00 00 	lea    0x9c96(%rip),%rdi        # c3f8 <_IO_stdin_used+0x3f8>
    2762:	e8 e9 fd ff ff       	callq  2550 <fwrite@plt>
    2767:	ba 25 00 00 00       	mov    $0x25,%edx
    276c:	48 8b 0d ad c8 00 00 	mov    0xc8ad(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2773:	be 01 00 00 00       	mov    $0x1,%esi
    2778:	48 8d 3d a9 9c 00 00 	lea    0x9ca9(%rip),%rdi        # c428 <_IO_stdin_used+0x428>
    277f:	e8 cc fd ff ff       	callq  2550 <fwrite@plt>
    2784:	ba 38 00 00 00       	mov    $0x38,%edx
    2789:	48 8b 0d 90 c8 00 00 	mov    0xc890(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2790:	be 01 00 00 00       	mov    $0x1,%esi
    2795:	48 8d 3d b4 9c 00 00 	lea    0x9cb4(%rip),%rdi        # c450 <_IO_stdin_used+0x450>
    279c:	e8 af fd ff ff       	callq  2550 <fwrite@plt>
    27a1:	ba 36 00 00 00       	mov    $0x36,%edx
    27a6:	48 8b 0d 73 c8 00 00 	mov    0xc873(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    27ad:	be 01 00 00 00       	mov    $0x1,%esi
    27b2:	48 8d 3d d7 9c 00 00 	lea    0x9cd7(%rip),%rdi        # c490 <_IO_stdin_used+0x490>
    27b9:	e8 92 fd ff ff       	callq  2550 <fwrite@plt>
    27be:	ba 24 00 00 00       	mov    $0x24,%edx
    27c3:	48 8b 0d 56 c8 00 00 	mov    0xc856(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    27ca:	be 01 00 00 00       	mov    $0x1,%esi
    27cf:	48 8d 3d f2 9c 00 00 	lea    0x9cf2(%rip),%rdi        # c4c8 <_IO_stdin_used+0x4c8>
    27d6:	e8 75 fd ff ff       	callq  2550 <fwrite@plt>
    27db:	ba 1b 00 00 00       	mov    $0x1b,%edx
    27e0:	48 8b 0d 39 c8 00 00 	mov    0xc839(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    27e7:	be 01 00 00 00       	mov    $0x1,%esi
    27ec:	48 8d 3d 97 9a 00 00 	lea    0x9a97(%rip),%rdi        # c28a <_IO_stdin_used+0x28a>
    27f3:	e8 58 fd ff ff       	callq  2550 <fwrite@plt>
    27f8:	ba 28 00 00 00       	mov    $0x28,%edx
    27fd:	48 8b 0d 1c c8 00 00 	mov    0xc81c(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2804:	be 01 00 00 00       	mov    $0x1,%esi
    2809:	48 8d 3d e0 9c 00 00 	lea    0x9ce0(%rip),%rdi        # c4f0 <_IO_stdin_used+0x4f0>
    2810:	e8 3b fd ff ff       	callq  2550 <fwrite@plt>
    2815:	48 8b 35 04 c8 00 00 	mov    0xc804(%rip),%rsi        # f020 <stderr@@GLIBC_2.2.5>
    281c:	bf 0a 00 00 00       	mov    $0xa,%edi
    2821:	e8 3a fc ff ff       	callq  2460 <fputc@plt>
    2826:	ba 4c 00 00 00       	mov    $0x4c,%edx
    282b:	be 01 00 00 00       	mov    $0x1,%esi
    2830:	48 8b 0d e9 c7 00 00 	mov    0xc7e9(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    2837:	48 8d 3d e2 9c 00 00 	lea    0x9ce2(%rip),%rdi        # c520 <_IO_stdin_used+0x520>
    283e:	e8 0d fd ff ff       	callq  2550 <fwrite@plt>
    exit(1);
    2843:	bf 01 00 00 00       	mov    $0x1,%edi
    2848:	e8 03 fc ff ff       	callq  2450 <exit@plt>
    284d:	0f 1f 00             	nopl   (%rax)

0000000000002850 <_GLOBAL__sub_I__Z11isIdenticalPfS_i>:
}
    2850:	f3 0f 1e fa          	endbr64 
    2854:	48 83 ec 08          	sub    $0x8,%rsp
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    2858:	48 8d 3d c9 c8 00 00 	lea    0xc8c9(%rip),%rdi        # f128 <_ZStL8__ioinit>
    285f:	e8 7c fc ff ff       	callq  24e0 <_ZNSt8ios_base4InitC1Ev@plt>
    2864:	48 8b 3d 8d c7 00 00 	mov    0xc78d(%rip),%rdi        # eff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    286b:	48 83 c4 08          	add    $0x8,%rsp
    286f:	48 8d 15 92 c7 00 00 	lea    0xc792(%rip),%rdx        # f008 <__dso_handle>
    2876:	48 8d 35 ab c8 00 00 	lea    0xc8ab(%rip),%rsi        # f128 <_ZStL8__ioinit>
    287d:	e9 2e fb ff ff       	jmpq   23b0 <__cxa_atexit@plt>
    2882:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2889:	00 00 00 
    288c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002890 <_start>:
    2890:	f3 0f 1e fa          	endbr64 
    2894:	31 ed                	xor    %ebp,%ebp
    2896:	49 89 d1             	mov    %rdx,%r9
    2899:	5e                   	pop    %rsi
    289a:	48 89 e2             	mov    %rsp,%rdx
    289d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    28a1:	50                   	push   %rax
    28a2:	54                   	push   %rsp
    28a3:	4c 8d 05 36 8b 00 00 	lea    0x8b36(%rip),%r8        # b3e0 <__libc_csu_fini>
    28aa:	48 8d 0d bf 8a 00 00 	lea    0x8abf(%rip),%rcx        # b370 <__libc_csu_init>
    28b1:	48 8d 3d a8 fc ff ff 	lea    -0x358(%rip),%rdi        # 2560 <main>
    28b8:	ff 15 22 c7 00 00    	callq  *0xc722(%rip)        # efe0 <__libc_start_main@GLIBC_2.2.5>
    28be:	f4                   	hlt    
    28bf:	90                   	nop

00000000000028c0 <deregister_tm_clones>:
    28c0:	48 8d 3d 49 c7 00 00 	lea    0xc749(%rip),%rdi        # f010 <__TMC_END__>
    28c7:	48 8d 05 42 c7 00 00 	lea    0xc742(%rip),%rax        # f010 <__TMC_END__>
    28ce:	48 39 f8             	cmp    %rdi,%rax
    28d1:	74 15                	je     28e8 <deregister_tm_clones+0x28>
    28d3:	48 8b 05 fe c6 00 00 	mov    0xc6fe(%rip),%rax        # efd8 <_ITM_deregisterTMCloneTable>
    28da:	48 85 c0             	test   %rax,%rax
    28dd:	74 09                	je     28e8 <deregister_tm_clones+0x28>
    28df:	ff e0                	jmpq   *%rax
    28e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    28e8:	c3                   	retq   
    28e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000028f0 <register_tm_clones>:
    28f0:	48 8d 3d 19 c7 00 00 	lea    0xc719(%rip),%rdi        # f010 <__TMC_END__>
    28f7:	48 8d 35 12 c7 00 00 	lea    0xc712(%rip),%rsi        # f010 <__TMC_END__>
    28fe:	48 29 fe             	sub    %rdi,%rsi
    2901:	48 c1 fe 03          	sar    $0x3,%rsi
    2905:	48 89 f0             	mov    %rsi,%rax
    2908:	48 c1 e8 3f          	shr    $0x3f,%rax
    290c:	48 01 c6             	add    %rax,%rsi
    290f:	48 d1 fe             	sar    %rsi
    2912:	74 14                	je     2928 <register_tm_clones+0x38>
    2914:	48 8b 05 d5 c6 00 00 	mov    0xc6d5(%rip),%rax        # eff0 <_ITM_registerTMCloneTable>
    291b:	48 85 c0             	test   %rax,%rax
    291e:	74 08                	je     2928 <register_tm_clones+0x38>
    2920:	ff e0                	jmpq   *%rax
    2922:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2928:	c3                   	retq   
    2929:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002930 <__do_global_dtors_aux>:
    2930:	f3 0f 1e fa          	endbr64 
    2934:	80 3d ed c6 00 00 00 	cmpb   $0x0,0xc6ed(%rip)        # f028 <completed.7970>
    293b:	75 2b                	jne    2968 <__do_global_dtors_aux+0x38>
    293d:	55                   	push   %rbp
    293e:	48 83 3d 8a c6 00 00 	cmpq   $0x0,0xc68a(%rip)        # efd0 <__cxa_finalize@GLIBC_2.2.5>
    2945:	00 
    2946:	48 89 e5             	mov    %rsp,%rbp
    2949:	74 0c                	je     2957 <__do_global_dtors_aux+0x27>
    294b:	48 8b 3d b6 c6 00 00 	mov    0xc6b6(%rip),%rdi        # f008 <__dso_handle>
    2952:	e8 69 f9 ff ff       	callq  22c0 <__cxa_finalize@plt>
    2957:	e8 64 ff ff ff       	callq  28c0 <deregister_tm_clones>
    295c:	c6 05 c5 c6 00 00 01 	movb   $0x1,0xc6c5(%rip)        # f028 <completed.7970>
    2963:	5d                   	pop    %rbp
    2964:	c3                   	retq   
    2965:	0f 1f 00             	nopl   (%rax)
    2968:	c3                   	retq   
    2969:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002970 <frame_dummy>:
    2970:	f3 0f 1e fa          	endbr64 
    2974:	e9 77 ff ff ff       	jmpq   28f0 <register_tm_clones>
    2979:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002980 <_Z11isIdenticalPfS_i>:
{
    2980:	f3 0f 1e fa          	endbr64 
  int a = 0;
    2984:	45 31 c0             	xor    %r8d,%r8d
    2987:	41 39 d0             	cmp    %edx,%r8d
    298a:	b8 01 00 00 00       	mov    $0x1,%eax
    298f:	0f 9d c1             	setge  %cl
    2992:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  while (equal && a < D) {
    2998:	85 c0                	test   %eax,%eax
    299a:	74 24                	je     29c0 <_Z11isIdenticalPfS_i+0x40>
    299c:	84 c9                	test   %cl,%cl
    299e:	75 20                	jne    29c0 <_Z11isIdenticalPfS_i+0x40>
    if (i[a] != j[a]) equal = 0;
    29a0:	31 c0                	xor    %eax,%eax
    29a2:	f3 0f 10 07          	movss  (%rdi),%xmm0
    29a6:	0f 2e 06             	ucomiss (%rsi),%xmm0
    29a9:	7a ed                	jp     2998 <_Z11isIdenticalPfS_i+0x18>
    29ab:	75 eb                	jne    2998 <_Z11isIdenticalPfS_i+0x18>
    else a++;
    29ad:	41 83 c0 01          	add    $0x1,%r8d
    29b1:	48 83 c7 04          	add    $0x4,%rdi
    29b5:	48 83 c6 04          	add    $0x4,%rsi
    29b9:	eb cc                	jmp    2987 <_Z11isIdenticalPfS_i+0x7>
    29bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
}
    29c0:	c3                   	retq   
    29c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    29c8:	00 00 00 00 
    29cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000029d0 <_Z7shuffleP6Points>:
{
    29d0:	f3 0f 1e fa          	endbr64 
  for (i=0;i<points->num-1;i++) {
    29d4:	48 83 3f 01          	cmpq   $0x1,(%rdi)
    29d8:	0f 8e 8a 00 00 00    	jle    2a68 <_Z7shuffleP6Points+0x98>
{
    29de:	55                   	push   %rbp
    29df:	48 89 fd             	mov    %rdi,%rbp
    29e2:	53                   	push   %rbx
  for (i=0;i<points->num-1;i++) {
    29e3:	31 db                	xor    %ebx,%ebx
{
    29e5:	48 83 ec 08          	sub    $0x8,%rsp
    29e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    j=(lrand48()%(points->num - i)) + i;
    29f0:	e8 7b f9 ff ff       	callq  2370 <lrand48@plt>
    29f5:	4c 8b 45 00          	mov    0x0(%rbp),%r8
    temp = points->p[i];
    29f9:	48 8b 4d 10          	mov    0x10(%rbp),%rcx
    29fd:	48 89 de             	mov    %rbx,%rsi
    j=(lrand48()%(points->num - i)) + i;
    2a00:	48 99                	cqto   
    temp = points->p[i];
    2a02:	48 c1 e6 05          	shl    $0x5,%rsi
    j=(lrand48()%(points->num - i)) + i;
    2a06:	4d 89 c2             	mov    %r8,%r10
    temp = points->p[i];
    2a09:	48 01 ce             	add    %rcx,%rsi
  for (i=0;i<points->num-1;i++) {
    2a0c:	49 83 e8 01          	sub    $0x1,%r8
    j=(lrand48()%(points->num - i)) + i;
    2a10:	49 29 da             	sub    %rbx,%r10
    temp = points->p[i];
    2a13:	f3 0f 10 0e          	movss  (%rsi),%xmm1
    2a17:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    j=(lrand48()%(points->num - i)) + i;
    2a1b:	49 f7 fa             	idiv   %r10
    temp = points->p[i];
    2a1e:	48 8b 7e 10          	mov    0x10(%rsi),%rdi
    2a22:	f3 0f 10 46 18       	movss  0x18(%rsi),%xmm0
    j=(lrand48()%(points->num - i)) + i;
    2a27:	48 01 da             	add    %rbx,%rdx
  for (i=0;i<points->num-1;i++) {
    2a2a:	48 83 c3 01          	add    $0x1,%rbx
    points->p[i] = points->p[j];
    2a2e:	48 c1 e2 05          	shl    $0x5,%rdx
    2a32:	48 01 ca             	add    %rcx,%rdx
    2a35:	f3 0f 6f 12          	movdqu (%rdx),%xmm2
    2a39:	0f 11 16             	movups %xmm2,(%rsi)
    2a3c:	f3 0f 6f 5a 10       	movdqu 0x10(%rdx),%xmm3
    2a41:	0f 11 5e 10          	movups %xmm3,0x10(%rsi)
    points->p[j] = temp;
    2a45:	f3 0f 11 0a          	movss  %xmm1,(%rdx)
    2a49:	4c 89 4a 08          	mov    %r9,0x8(%rdx)
    2a4d:	48 89 7a 10          	mov    %rdi,0x10(%rdx)
    2a51:	f3 0f 11 42 18       	movss  %xmm0,0x18(%rdx)
  for (i=0;i<points->num-1;i++) {
    2a56:	49 39 d8             	cmp    %rbx,%r8
    2a59:	7f 95                	jg     29f0 <_Z7shuffleP6Points+0x20>
}
    2a5b:	48 83 c4 08          	add    $0x8,%rsp
    2a5f:	5b                   	pop    %rbx
    2a60:	5d                   	pop    %rbp
    2a61:	c3                   	retq   
    2a62:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2a68:	c3                   	retq   
    2a69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002a70 <_Z10intshufflePii>:
{
    2a70:	f3 0f 1e fa          	endbr64 
    2a74:	41 55                	push   %r13
    2a76:	41 54                	push   %r12
  for (i=0;i<length;i++) {
    2a78:	4c 63 e6             	movslq %esi,%r12
{
    2a7b:	55                   	push   %rbp
    2a7c:	53                   	push   %rbx
    2a7d:	48 83 ec 08          	sub    $0x8,%rsp
  for (i=0;i<length;i++) {
    2a81:	4d 85 e4             	test   %r12,%r12
    2a84:	0f 8e 3b 01 00 00    	jle    2bc5 <_Z10intshufflePii+0x155>
    2a8a:	4c 89 e0             	mov    %r12,%rax
    2a8d:	48 89 fb             	mov    %rdi,%rbx
    2a90:	31 ed                	xor    %ebp,%ebp
    2a92:	83 e0 03             	and    $0x3,%eax
    2a95:	0f 84 80 00 00 00    	je     2b1b <_Z10intshufflePii+0xab>
    2a9b:	48 83 f8 01          	cmp    $0x1,%rax
    2a9f:	74 4a                	je     2aeb <_Z10intshufflePii+0x7b>
    2aa1:	48 83 f8 02          	cmp    $0x2,%rax
    2aa5:	74 1b                	je     2ac2 <_Z10intshufflePii+0x52>
    j=(lrand48()%(length - i))+i;
    2aa7:	e8 c4 f8 ff ff       	callq  2370 <lrand48@plt>
    temp = intarray[i];
    2aac:	8b 0b                	mov    (%rbx),%ecx
  for (i=0;i<length;i++) {
    2aae:	bd 01 00 00 00       	mov    $0x1,%ebp
    j=(lrand48()%(length - i))+i;
    2ab3:	48 99                	cqto   
    2ab5:	49 f7 fc             	idiv   %r12
    intarray[i]=intarray[j];
    2ab8:	48 8d 34 93          	lea    (%rbx,%rdx,4),%rsi
    2abc:	8b 3e                	mov    (%rsi),%edi
    2abe:	89 3b                	mov    %edi,(%rbx)
    intarray[j]=temp;
    2ac0:	89 0e                	mov    %ecx,(%rsi)
    j=(lrand48()%(length - i))+i;
    2ac2:	e8 a9 f8 ff ff       	callq  2370 <lrand48@plt>
    2ac7:	4d 89 e1             	mov    %r12,%r9
    temp = intarray[i];
    2aca:	44 8b 04 ab          	mov    (%rbx,%rbp,4),%r8d
    j=(lrand48()%(length - i))+i;
    2ace:	49 29 e9             	sub    %rbp,%r9
    2ad1:	48 99                	cqto   
    2ad3:	49 f7 f9             	idiv   %r9
    2ad6:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    2ad9:	4c 8d 14 93          	lea    (%rbx,%rdx,4),%r10
    2add:	45 8b 1a             	mov    (%r10),%r11d
    2ae0:	44 89 1c ab          	mov    %r11d,(%rbx,%rbp,4)
  for (i=0;i<length;i++) {
    2ae4:	48 83 c5 01          	add    $0x1,%rbp
    intarray[j]=temp;
    2ae8:	45 89 02             	mov    %r8d,(%r10)
    j=(lrand48()%(length - i))+i;
    2aeb:	e8 80 f8 ff ff       	callq  2370 <lrand48@plt>
    2af0:	4c 89 e1             	mov    %r12,%rcx
    temp = intarray[i];
    2af3:	44 8b 2c ab          	mov    (%rbx,%rbp,4),%r13d
    j=(lrand48()%(length - i))+i;
    2af7:	48 29 e9             	sub    %rbp,%rcx
    2afa:	48 99                	cqto   
    2afc:	48 f7 f9             	idiv   %rcx
    2aff:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    2b02:	48 8d 04 93          	lea    (%rbx,%rdx,4),%rax
    2b06:	8b 30                	mov    (%rax),%esi
    2b08:	89 34 ab             	mov    %esi,(%rbx,%rbp,4)
  for (i=0;i<length;i++) {
    2b0b:	48 83 c5 01          	add    $0x1,%rbp
    intarray[j]=temp;
    2b0f:	44 89 28             	mov    %r13d,(%rax)
  for (i=0;i<length;i++) {
    2b12:	4c 39 e5             	cmp    %r12,%rbp
    2b15:	0f 84 aa 00 00 00    	je     2bc5 <_Z10intshufflePii+0x155>
    j=(lrand48()%(length - i))+i;
    2b1b:	e8 50 f8 ff ff       	callq  2370 <lrand48@plt>
    2b20:	4d 89 e0             	mov    %r12,%r8
    temp = intarray[i];
    2b23:	8b 3c ab             	mov    (%rbx,%rbp,4),%edi
  for (i=0;i<length;i++) {
    2b26:	4c 8d 6d 01          	lea    0x1(%rbp),%r13
    j=(lrand48()%(length - i))+i;
    2b2a:	49 29 e8             	sub    %rbp,%r8
    2b2d:	48 99                	cqto   
    2b2f:	49 f7 f8             	idiv   %r8
    2b32:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    2b35:	4c 8d 0c 93          	lea    (%rbx,%rdx,4),%r9
    2b39:	45 8b 11             	mov    (%r9),%r10d
    2b3c:	44 89 14 ab          	mov    %r10d,(%rbx,%rbp,4)
    intarray[j]=temp;
    2b40:	41 89 39             	mov    %edi,(%r9)
    j=(lrand48()%(length - i))+i;
    2b43:	e8 28 f8 ff ff       	callq  2370 <lrand48@plt>
    2b48:	4c 89 e1             	mov    %r12,%rcx
    temp = intarray[i];
    2b4b:	46 8b 1c ab          	mov    (%rbx,%r13,4),%r11d
    j=(lrand48()%(length - i))+i;
    2b4f:	4c 29 e9             	sub    %r13,%rcx
    2b52:	48 99                	cqto   
    2b54:	48 f7 f9             	idiv   %rcx
    2b57:	4c 01 ea             	add    %r13,%rdx
    intarray[i]=intarray[j];
    2b5a:	48 8d 04 93          	lea    (%rbx,%rdx,4),%rax
    2b5e:	8b 30                	mov    (%rax),%esi
    2b60:	42 89 34 ab          	mov    %esi,(%rbx,%r13,4)
  for (i=0;i<length;i++) {
    2b64:	4c 8d 6d 02          	lea    0x2(%rbp),%r13
    intarray[j]=temp;
    2b68:	44 89 18             	mov    %r11d,(%rax)
    j=(lrand48()%(length - i))+i;
    2b6b:	e8 00 f8 ff ff       	callq  2370 <lrand48@plt>
    2b70:	4d 89 e0             	mov    %r12,%r8
    temp = intarray[i];
    2b73:	42 8b 3c ab          	mov    (%rbx,%r13,4),%edi
    j=(lrand48()%(length - i))+i;
    2b77:	4d 29 e8             	sub    %r13,%r8
    2b7a:	48 99                	cqto   
    2b7c:	49 f7 f8             	idiv   %r8
    2b7f:	4c 01 ea             	add    %r13,%rdx
    intarray[i]=intarray[j];
    2b82:	4c 8d 0c 93          	lea    (%rbx,%rdx,4),%r9
    2b86:	45 8b 11             	mov    (%r9),%r10d
    2b89:	46 89 14 ab          	mov    %r10d,(%rbx,%r13,4)
  for (i=0;i<length;i++) {
    2b8d:	4c 8d 6d 03          	lea    0x3(%rbp),%r13
    2b91:	48 83 c5 04          	add    $0x4,%rbp
    intarray[j]=temp;
    2b95:	41 89 39             	mov    %edi,(%r9)
    j=(lrand48()%(length - i))+i;
    2b98:	e8 d3 f7 ff ff       	callq  2370 <lrand48@plt>
    2b9d:	4c 89 e1             	mov    %r12,%rcx
    temp = intarray[i];
    2ba0:	46 8b 1c ab          	mov    (%rbx,%r13,4),%r11d
    j=(lrand48()%(length - i))+i;
    2ba4:	4c 29 e9             	sub    %r13,%rcx
    2ba7:	48 99                	cqto   
    2ba9:	48 f7 f9             	idiv   %rcx
    2bac:	4c 01 ea             	add    %r13,%rdx
    intarray[i]=intarray[j];
    2baf:	48 8d 04 93          	lea    (%rbx,%rdx,4),%rax
    2bb3:	8b 30                	mov    (%rax),%esi
    2bb5:	42 89 34 ab          	mov    %esi,(%rbx,%r13,4)
    intarray[j]=temp;
    2bb9:	44 89 18             	mov    %r11d,(%rax)
  for (i=0;i<length;i++) {
    2bbc:	4c 39 e5             	cmp    %r12,%rbp
    2bbf:	0f 85 56 ff ff ff    	jne    2b1b <_Z10intshufflePii+0xab>
}
    2bc5:	48 83 c4 08          	add    $0x8,%rsp
    2bc9:	5b                   	pop    %rbx
    2bca:	5d                   	pop    %rbp
    2bcb:	41 5c                	pop    %r12
    2bcd:	41 5d                	pop    %r13
    2bcf:	c3                   	retq   

0000000000002bd0 <_Z4dist5PointS_i>:
{
    2bd0:	f3 0f 1e fa          	endbr64 
    2bd4:	53                   	push   %rbx
    2bd5:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
    2bda:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  for (i=0;i<dim;i++)
    2bdf:	85 ff                	test   %edi,%edi
    2be1:	0f 8e 89 03 00 00    	jle    2f70 <_Z4dist5PointS_i+0x3a0>
    2be7:	8d 47 ff             	lea    -0x1(%rdi),%eax
    2bea:	83 f8 02             	cmp    $0x2,%eax
    2bed:	0f 86 83 03 00 00    	jbe    2f76 <_Z4dist5PointS_i+0x3a6>
    2bf3:	89 fe                	mov    %edi,%esi
    2bf5:	c1 ee 02             	shr    $0x2,%esi
    2bf8:	83 fe 04             	cmp    $0x4,%esi
    2bfb:	0f 86 7d 03 00 00    	jbe    2f7e <_Z4dist5PointS_i+0x3ae>
    2c01:	8d 4e fb             	lea    -0x5(%rsi),%ecx
    2c04:	4c 89 c0             	mov    %r8,%rax
    2c07:	4c 89 ca             	mov    %r9,%rdx
    2c0a:	45 31 d2             	xor    %r10d,%r10d
    2c0d:	83 e1 fc             	and    $0xfffffffc,%ecx
  float result=0.0;
    2c10:	66 0f ef c9          	pxor   %xmm1,%xmm1
    2c14:	8d 59 04             	lea    0x4(%rcx),%ebx
    2c17:	eb 0a                	jmp    2c23 <_Z4dist5PointS_i+0x53>
    2c19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2c20:	45 89 da             	mov    %r11d,%r10d
    2c23:	0f 10 38             	movups (%rax),%xmm7
    2c26:	0f 10 02             	movups (%rdx),%xmm0
    2c29:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    2c30:	0f 18 88 00 01 00 00 	prefetcht0 0x100(%rax)
    2c37:	0f 10 6a 10          	movups 0x10(%rdx),%xmm5
    2c3b:	0f 10 70 10          	movups 0x10(%rax),%xmm6
    2c3f:	48 83 c2 40          	add    $0x40,%rdx
    2c43:	48 83 c0 40          	add    $0x40,%rax
    2c47:	0f 5c c7             	subps  %xmm7,%xmm0
    2c4a:	44 0f 10 5a e0       	movups -0x20(%rdx),%xmm11
    2c4f:	0f 10 78 f0          	movups -0x10(%rax),%xmm7
    2c53:	45 8d 5a 04          	lea    0x4(%r10),%r11d
    2c57:	0f 5c ee             	subps  %xmm6,%xmm5
    2c5a:	44 0f 10 60 e0       	movups -0x20(%rax),%xmm12
    2c5f:	0f 59 c0             	mulps  %xmm0,%xmm0
    2c62:	45 0f 5c dc          	subps  %xmm12,%xmm11
    2c66:	0f 59 ed             	mulps  %xmm5,%xmm5
    2c69:	45 0f 59 db          	mulps  %xmm11,%xmm11
    2c6d:	f3 0f 58 c8          	addss  %xmm0,%xmm1
    2c71:	0f 28 d8             	movaps %xmm0,%xmm3
    2c74:	0f 28 e0             	movaps %xmm0,%xmm4
    2c77:	0f c6 d8 55          	shufps $0x55,%xmm0,%xmm3
    2c7b:	0f 15 e0             	unpckhps %xmm0,%xmm4
    2c7e:	0f c6 c0 ff          	shufps $0xff,%xmm0,%xmm0
    2c82:	44 0f 28 cd          	movaps %xmm5,%xmm9
    2c86:	44 0f c6 cd 55       	shufps $0x55,%xmm5,%xmm9
    2c8b:	44 0f 28 d5          	movaps %xmm5,%xmm10
    2c8f:	f3 0f 58 cb          	addss  %xmm3,%xmm1
    2c93:	44 0f 15 d5          	unpckhps %xmm5,%xmm10
    2c97:	45 0f 28 f3          	movaps %xmm11,%xmm14
    2c9b:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    2ca0:	45 0f 28 fb          	movaps %xmm11,%xmm15
    2ca4:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    2ca8:	f3 0f 58 cc          	addss  %xmm4,%xmm1
    2cac:	f3 0f 58 c8          	addss  %xmm0,%xmm1
    2cb0:	0f 10 42 f0          	movups -0x10(%rdx),%xmm0
    2cb4:	0f 5c c7             	subps  %xmm7,%xmm0
    2cb7:	f3 0f 58 cd          	addss  %xmm5,%xmm1
    2cbb:	0f c6 ed ff          	shufps $0xff,%xmm5,%xmm5
    2cbf:	0f 59 c0             	mulps  %xmm0,%xmm0
    2cc2:	f3 41 0f 58 c9       	addss  %xmm9,%xmm1
    2cc7:	f3 41 0f 58 ca       	addss  %xmm10,%xmm1
    2ccc:	0f 28 d8             	movaps %xmm0,%xmm3
    2ccf:	0f 28 e0             	movaps %xmm0,%xmm4
    2cd2:	0f c6 d8 55          	shufps $0x55,%xmm0,%xmm3
    2cd6:	0f 15 e0             	unpckhps %xmm0,%xmm4
    2cd9:	f3 0f 58 cd          	addss  %xmm5,%xmm1
    2cdd:	f3 41 0f 58 cb       	addss  %xmm11,%xmm1
    2ce2:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    2ce7:	f3 41 0f 58 ce       	addss  %xmm14,%xmm1
    2cec:	f3 41 0f 58 cf       	addss  %xmm15,%xmm1
    2cf1:	f3 41 0f 58 cb       	addss  %xmm11,%xmm1
    2cf6:	f3 0f 58 c8          	addss  %xmm0,%xmm1
    2cfa:	0f c6 c0 ff          	shufps $0xff,%xmm0,%xmm0
    2cfe:	f3 0f 58 cb          	addss  %xmm3,%xmm1
    2d02:	f3 0f 58 cc          	addss  %xmm4,%xmm1
    2d06:	f3 0f 58 c8          	addss  %xmm0,%xmm1
  for (i=0;i<dim;i++)
    2d0a:	41 39 ca             	cmp    %ecx,%r10d
    2d0d:	0f 85 0d ff ff ff    	jne    2c20 <_Z4dist5PointS_i+0x50>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2d13:	0f 10 32             	movups (%rdx),%xmm6
    2d16:	0f 10 28             	movups (%rax),%xmm5
    2d19:	41 89 db             	mov    %ebx,%r11d
    2d1c:	44 8d 53 01          	lea    0x1(%rbx),%r10d
    2d20:	41 f7 d3             	not    %r11d
    2d23:	b9 10 00 00 00       	mov    $0x10,%ecx
    2d28:	0f 5c f5             	subps  %xmm5,%xmm6
    2d2b:	41 01 f3             	add    %esi,%r11d
    2d2e:	41 83 e3 03          	and    $0x3,%r11d
    2d32:	0f 59 f6             	mulps  %xmm6,%xmm6
    2d35:	0f 28 c6             	movaps %xmm6,%xmm0
    2d38:	44 0f 28 c6          	movaps %xmm6,%xmm8
    2d3c:	44 0f 28 ce          	movaps %xmm6,%xmm9
    2d40:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    2d44:	44 0f c6 c6 55       	shufps $0x55,%xmm6,%xmm8
    2d49:	44 0f 15 ce          	unpckhps %xmm6,%xmm9
    2d4d:	0f c6 f6 ff          	shufps $0xff,%xmm6,%xmm6
    2d51:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    2d56:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    2d5b:	f3 0f 58 c6          	addss  %xmm6,%xmm0
  for (i=0;i<dim;i++)
    2d5f:	44 39 d6             	cmp    %r10d,%esi
    2d62:	0f 86 a5 01 00 00    	jbe    2f0d <_Z4dist5PointS_i+0x33d>
    2d68:	45 85 db             	test   %r11d,%r11d
    2d6b:	0f 84 9f 00 00 00    	je     2e10 <_Z4dist5PointS_i+0x240>
    2d71:	41 83 fb 01          	cmp    $0x1,%r11d
    2d75:	74 4e                	je     2dc5 <_Z4dist5PointS_i+0x1f5>
    2d77:	41 83 fb 02          	cmp    $0x2,%r11d
    2d7b:	0f 85 0e 02 00 00    	jne    2f8f <_Z4dist5PointS_i+0x3bf>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2d81:	44 0f 10 3c 0a       	movups (%rdx,%rcx,1),%xmm15
    2d86:	0f 10 3c 08          	movups (%rax,%rcx,1),%xmm7
    2d8a:	41 83 c2 01          	add    $0x1,%r10d
    2d8e:	48 83 c1 10          	add    $0x10,%rcx
    2d92:	44 0f 5c ff          	subps  %xmm7,%xmm15
    2d96:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    2d9a:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    2d9f:	41 0f 28 df          	movaps %xmm15,%xmm3
    2da3:	41 0f 28 e7          	movaps %xmm15,%xmm4
    2da7:	41 0f c6 df 55       	shufps $0x55,%xmm15,%xmm3
    2dac:	41 0f 15 e7          	unpckhps %xmm15,%xmm4
    2db0:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    2db5:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    2db9:	f3 0f 58 e0          	addss  %xmm0,%xmm4
    2dbd:	41 0f 28 c7          	movaps %xmm15,%xmm0
    2dc1:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    2dc5:	0f 10 0c 0a          	movups (%rdx,%rcx,1),%xmm1
    2dc9:	0f 10 34 08          	movups (%rax,%rcx,1),%xmm6
    2dcd:	41 83 c2 01          	add    $0x1,%r10d
    2dd1:	48 83 c1 10          	add    $0x10,%rcx
    2dd5:	0f 5c ce             	subps  %xmm6,%xmm1
    2dd8:	0f 59 c9             	mulps  %xmm1,%xmm1
    2ddb:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    2ddf:	44 0f 28 c1          	movaps %xmm1,%xmm8
    2de3:	44 0f 28 c9          	movaps %xmm1,%xmm9
    2de7:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    2dec:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    2df0:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    2df4:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    2df9:	f3 44 0f 58 c8       	addss  %xmm0,%xmm9
    2dfe:	0f 28 c1             	movaps %xmm1,%xmm0
    2e01:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
  for (i=0;i<dim;i++)
    2e06:	44 39 d6             	cmp    %r10d,%esi
    2e09:	0f 86 fe 00 00 00    	jbe    2f0d <_Z4dist5PointS_i+0x33d>
    2e0f:	90                   	nop
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2e10:	44 0f 10 1c 08       	movups (%rax,%rcx,1),%xmm11
    2e15:	44 0f 10 14 0a       	movups (%rdx,%rcx,1),%xmm10
    2e1a:	41 83 c2 04          	add    $0x4,%r10d
    2e1e:	44 0f 10 7c 0a 10    	movups 0x10(%rdx,%rcx,1),%xmm15
    2e24:	0f 10 7c 08 10       	movups 0x10(%rax,%rcx,1),%xmm7
    2e29:	45 0f 5c d3          	subps  %xmm11,%xmm10
    2e2d:	0f 10 4c 0a 20       	movups 0x20(%rdx,%rcx,1),%xmm1
    2e32:	0f 10 74 08 20       	movups 0x20(%rax,%rcx,1),%xmm6
    2e37:	44 0f 5c ff          	subps  %xmm7,%xmm15
    2e3b:	44 0f 10 5c 08 30    	movups 0x30(%rax,%rcx,1),%xmm11
    2e41:	0f 5c ce             	subps  %xmm6,%xmm1
    2e44:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    2e48:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    2e4c:	0f 59 c9             	mulps  %xmm1,%xmm1
    2e4f:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    2e54:	45 0f 28 ea          	movaps %xmm10,%xmm13
    2e58:	45 0f 28 f2          	movaps %xmm10,%xmm14
    2e5c:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    2e61:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    2e65:	41 0f 28 df          	movaps %xmm15,%xmm3
    2e69:	41 0f 28 e7          	movaps %xmm15,%xmm4
    2e6d:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    2e72:	41 0f 15 e7          	unpckhps %xmm15,%xmm4
    2e76:	44 0f 28 c1          	movaps %xmm1,%xmm8
    2e7a:	44 0f 28 c9          	movaps %xmm1,%xmm9
    2e7e:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    2e83:	41 0f c6 df 55       	shufps $0x55,%xmm15,%xmm3
    2e88:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    2e8d:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    2e91:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    2e96:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    2e9b:	44 0f 10 54 0a 30    	movups 0x30(%rdx,%rcx,1),%xmm10
    2ea1:	48 83 c1 40          	add    $0x40,%rcx
    2ea5:	45 0f 5c d3          	subps  %xmm11,%xmm10
    2ea9:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    2eae:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    2eb3:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    2eb7:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    2ebb:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    2ebf:	45 0f 28 ea          	movaps %xmm10,%xmm13
    2ec3:	45 0f 28 f2          	movaps %xmm10,%xmm14
    2ec7:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    2ecc:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    2ed0:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    2ed5:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    2ed9:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    2edd:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    2ee2:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    2ee7:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    2eeb:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    2ef0:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    2ef5:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    2efa:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    2eff:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
  for (i=0;i<dim;i++)
    2f04:	44 39 d6             	cmp    %r10d,%esi
    2f07:	0f 87 03 ff ff ff    	ja     2e10 <_Z4dist5PointS_i+0x240>
    2f0d:	89 f8                	mov    %edi,%eax
    2f0f:	83 e0 fc             	and    $0xfffffffc,%eax
    2f12:	39 f8                	cmp    %edi,%eax
    2f14:	74 54                	je     2f6a <_Z4dist5PointS_i+0x39a>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f16:	48 63 f0             	movslq %eax,%rsi
  for (i=0;i<dim;i++)
    2f19:	8d 50 01             	lea    0x1(%rax),%edx
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f1c:	f3 45 0f 10 3c b1    	movss  (%r9,%rsi,4),%xmm15
    2f22:	f3 45 0f 5c 3c b0    	subss  (%r8,%rsi,4),%xmm15
    2f28:	f3 45 0f 59 ff       	mulss  %xmm15,%xmm15
    2f2d:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
  for (i=0;i<dim;i++)
    2f32:	39 d7                	cmp    %edx,%edi
    2f34:	7e 34                	jle    2f6a <_Z4dist5PointS_i+0x39a>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f36:	48 63 da             	movslq %edx,%rbx
  for (i=0;i<dim;i++)
    2f39:	83 c0 02             	add    $0x2,%eax
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f3c:	f3 41 0f 10 3c 99    	movss  (%r9,%rbx,4),%xmm7
    2f42:	f3 41 0f 5c 3c 98    	subss  (%r8,%rbx,4),%xmm7
    2f48:	f3 0f 59 ff          	mulss  %xmm7,%xmm7
    2f4c:	f3 0f 58 c7          	addss  %xmm7,%xmm0
  for (i=0;i<dim;i++)
    2f50:	39 c7                	cmp    %eax,%edi
    2f52:	7e 16                	jle    2f6a <_Z4dist5PointS_i+0x39a>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f54:	48 98                	cltq   
    2f56:	f3 41 0f 10 14 81    	movss  (%r9,%rax,4),%xmm2
    2f5c:	f3 41 0f 5c 14 80    	subss  (%r8,%rax,4),%xmm2
    2f62:	f3 0f 59 d2          	mulss  %xmm2,%xmm2
    2f66:	f3 0f 58 c2          	addss  %xmm2,%xmm0
}
    2f6a:	5b                   	pop    %rbx
    2f6b:	c3                   	retq   
    2f6c:	0f 1f 40 00          	nopl   0x0(%rax)
  float result=0.0;
    2f70:	66 0f ef c0          	pxor   %xmm0,%xmm0
}
    2f74:	5b                   	pop    %rbx
    2f75:	c3                   	retq   
  float result=0.0;
    2f76:	66 0f ef c0          	pxor   %xmm0,%xmm0
  for (i=0;i<dim;i++)
    2f7a:	31 c0                	xor    %eax,%eax
    2f7c:	eb 98                	jmp    2f16 <_Z4dist5PointS_i+0x346>
    2f7e:	4c 89 c0             	mov    %r8,%rax
    2f81:	4c 89 ca             	mov    %r9,%rdx
    2f84:	66 0f ef c9          	pxor   %xmm1,%xmm1
    2f88:	31 db                	xor    %ebx,%ebx
    2f8a:	e9 84 fd ff ff       	jmpq   2d13 <_Z4dist5PointS_i+0x143>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    2f8f:	44 0f 10 52 10       	movups 0x10(%rdx),%xmm10
    2f94:	44 0f 10 58 10       	movups 0x10(%rax),%xmm11
    2f99:	b9 20 00 00 00       	mov    $0x20,%ecx
    2f9e:	44 8d 53 02          	lea    0x2(%rbx),%r10d
    2fa2:	45 0f 5c d3          	subps  %xmm11,%xmm10
    2fa6:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    2faa:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    2faf:	45 0f 28 ea          	movaps %xmm10,%xmm13
    2fb3:	45 0f 28 f2          	movaps %xmm10,%xmm14
    2fb7:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    2fbc:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    2fc0:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    2fc5:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    2fca:	f3 44 0f 58 f0       	addss  %xmm0,%xmm14
    2fcf:	41 0f 28 c2          	movaps %xmm10,%xmm0
    2fd3:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
  for (i=0;i<dim;i++)
    2fd8:	e9 a4 fd ff ff       	jmpq   2d81 <_Z4dist5PointS_i+0x1b1>
    2fdd:	0f 1f 00             	nopl   (%rax)

0000000000002fe0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t>:
{
    2fe0:	f3 0f 1e fa          	endbr64 
    2fe4:	41 57                	push   %r15
    2fe6:	41 56                	push   %r14
    2fe8:	49 89 fe             	mov    %rdi,%r14
    2feb:	41 55                	push   %r13
    2fed:	41 54                	push   %r12
    2fef:	55                   	push   %rbp
    2ff0:	53                   	push   %rbx
    2ff1:	89 d3                	mov    %edx,%ebx
    2ff3:	48 83 ec 78          	sub    $0x78,%rsp
    2ff7:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    2ffc:	48 89 cf             	mov    %rcx,%rdi
    2fff:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
    3004:	89 54 24 5c          	mov    %edx,0x5c(%rsp)
    3008:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
    300d:	f3 0f 11 44 24 58    	movss  %xmm0,0x58(%rsp)
  pthread_barrier_wait(barrier);
    3013:	e8 38 81 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  long bsize = points->num/nproc;
    3018:	48 63 05 e9 c0 00 00 	movslq 0xc0e9(%rip),%rax        # f108 <_ZL5nproc>
    301f:	49 8b 36             	mov    (%r14),%rsi
  long k1 = bsize * pid;
    3022:	48 63 fb             	movslq %ebx,%rdi
    3025:	48 89 fd             	mov    %rdi,%rbp
    3028:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
  long bsize = points->num/nproc;
    302d:	48 89 c1             	mov    %rax,%rcx
    3030:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    3035:	48 89 f0             	mov    %rsi,%rax
    3038:	48 99                	cqto   
    303a:	48 f7 f9             	idiv   %rcx
  if( pid == nproc-1 ) k2 = points->num;
    303d:	83 e9 01             	sub    $0x1,%ecx
  long k1 = bsize * pid;
    3040:	48 0f af e8          	imul   %rax,%rbp
  long k2 = k1 + bsize;
    3044:	48 01 e8             	add    %rbp,%rax
    3047:	39 f9                	cmp    %edi,%ecx
  for( int k = k1; k < k2; k++ )    {
    3049:	4c 63 c5             	movslq %ebp,%r8
  long k2 = k1 + bsize;
    304c:	48 0f 45 f0          	cmovne %rax,%rsi
  for( int k = k1; k < k2; k++ )    {
    3050:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  long k2 = k1 + bsize;
    3055:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
  for( int k = k1; k < k2; k++ )    {
    305a:	4c 39 c6             	cmp    %r8,%rsi
    305d:	0f 8e 16 04 00 00    	jle    3479 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x499>
    float distance = dist(points->p[k],points->p[0],points->dim);
    3063:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
    3068:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
    306d:	49 89 f2             	mov    %rsi,%r10
    3070:	49 c1 e2 05          	shl    $0x5,%r10
    3074:	45 8b 4b 08          	mov    0x8(%r11),%r9d
    3078:	49 8b 6b 10          	mov    0x10(%r11),%rbp
    307c:	49 c1 e4 05          	shl    $0x5,%r12
    3080:	45 89 cb             	mov    %r9d,%r11d
    3083:	4a 8d 44 25 48       	lea    0x48(%rbp,%r12,1),%rax
    3088:	4e 8d 74 15 48       	lea    0x48(%rbp,%r10,1),%r14
    308d:	41 c1 eb 02          	shr    $0x2,%r11d
    3091:	45 8d 79 ff          	lea    -0x1(%r9),%r15d
    3095:	45 8d 6b fb          	lea    -0x5(%r11),%r13d
    3099:	41 83 e5 fc          	and    $0xfffffffc,%r13d
    309d:	41 8d 5d 04          	lea    0x4(%r13),%ebx
    30a1:	89 5c 24 10          	mov    %ebx,0x10(%rsp)
    30a5:	44 89 cb             	mov    %r9d,%ebx
    30a8:	83 e3 fc             	and    $0xfffffffc,%ebx
    30ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    30b0:	0f 18 08             	prefetcht0 (%rax)
    30b3:	48 8b 78 c0          	mov    -0x40(%rax),%rdi
    30b7:	4c 8b 45 08          	mov    0x8(%rbp),%r8
  for (i=0;i<dim;i++)
    30bb:	45 85 c9             	test   %r9d,%r9d
    30be:	0f 8e de 08 00 00    	jle    39a2 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9c2>
    30c4:	41 83 ff 02          	cmp    $0x2,%r15d
    30c8:	0f 86 dd 08 00 00    	jbe    39ab <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9cb>
    30ce:	4c 89 c2             	mov    %r8,%rdx
    30d1:	48 89 f9             	mov    %rdi,%rcx
    30d4:	41 83 fb 04          	cmp    $0x4,%r11d
    30d8:	0f 86 d8 08 00 00    	jbe    39b6 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9d6>
    30de:	31 f6                	xor    %esi,%esi
  float result=0.0;
    30e0:	66 0f ef c0          	pxor   %xmm0,%xmm0
    30e4:	eb 0d                	jmp    30f3 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x113>
    30e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    30ed:	00 00 00 
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    30f0:	44 89 d6             	mov    %r10d,%esi
    30f3:	0f 10 19             	movups (%rcx),%xmm3
    30f6:	0f 10 3a             	movups (%rdx),%xmm7
    30f9:	0f 18 89 00 01 00 00 	prefetcht0 0x100(%rcx)
    3100:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    3107:	0f 10 49 10          	movups 0x10(%rcx),%xmm1
    310b:	0f 10 6a 10          	movups 0x10(%rdx),%xmm5
    310f:	48 83 c1 40          	add    $0x40,%rcx
    3113:	48 83 c2 40          	add    $0x40,%rdx
    3117:	0f 5c df             	subps  %xmm7,%xmm3
    311a:	44 0f 10 51 e0       	movups -0x20(%rcx),%xmm10
    311f:	44 0f 10 5a e0       	movups -0x20(%rdx),%xmm11
    3124:	44 8d 56 04          	lea    0x4(%rsi),%r10d
    3128:	0f 5c cd             	subps  %xmm5,%xmm1
    312b:	44 0f 10 79 f0       	movups -0x10(%rcx),%xmm15
    3130:	45 0f 5c d3          	subps  %xmm11,%xmm10
    3134:	0f 59 db             	mulps  %xmm3,%xmm3
    3137:	0f 59 c9             	mulps  %xmm1,%xmm1
    313a:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    313e:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3142:	0f 28 e3             	movaps %xmm3,%xmm4
    3145:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3149:	44 0f 28 c1          	movaps %xmm1,%xmm8
    314d:	44 0f 28 c9          	movaps %xmm1,%xmm9
    3151:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    3156:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    315a:	45 0f 28 ea          	movaps %xmm10,%xmm13
    315e:	45 0f 28 f2          	movaps %xmm10,%xmm14
    3162:	f3 0f 58 e0          	addss  %xmm0,%xmm4
    3166:	0f 28 c3             	movaps %xmm3,%xmm0
    3169:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    316e:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    3172:	0f 15 c3             	unpckhps %xmm3,%xmm0
    3175:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    3179:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    317d:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3181:	0f 10 5a f0          	movups -0x10(%rdx),%xmm3
    3185:	44 0f 5c fb          	subps  %xmm3,%xmm15
    3189:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    318d:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    3191:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    3195:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    319a:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    319f:	41 0f 28 d7          	movaps %xmm15,%xmm2
    31a3:	41 0f 28 e7          	movaps %xmm15,%xmm4
    31a7:	41 0f c6 d7 55       	shufps $0x55,%xmm15,%xmm2
    31ac:	41 0f 15 e7          	unpckhps %xmm15,%xmm4
    31b0:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    31b4:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    31b9:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    31be:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    31c3:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    31c8:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    31cd:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    31d2:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    31d7:	f3 0f 58 c2          	addss  %xmm2,%xmm0
    31db:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    31df:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
  for (i=0;i<dim;i++)
    31e4:	44 39 ee             	cmp    %r13d,%esi
    31e7:	0f 85 03 ff ff ff    	jne    30f0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x110>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    31ed:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
    31f2:	44 89 64 24 0c       	mov    %r12d,0xc(%rsp)
    31f7:	0f 10 09             	movups (%rcx),%xmm1
    31fa:	0f 10 2a             	movups (%rdx),%xmm5
    31fd:	be 10 00 00 00       	mov    $0x10,%esi
    3202:	44 8b 54 24 0c       	mov    0xc(%rsp),%r10d
    3207:	0f 5c cd             	subps  %xmm5,%xmm1
    320a:	45 89 d4             	mov    %r10d,%r12d
    320d:	41 83 c2 01          	add    $0x1,%r10d
    3211:	41 f7 d4             	not    %r12d
    3214:	0f 59 c9             	mulps  %xmm1,%xmm1
    3217:	45 01 dc             	add    %r11d,%r12d
    321a:	41 83 e4 03          	and    $0x3,%r12d
    321e:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    3222:	44 0f 28 c1          	movaps %xmm1,%xmm8
    3226:	44 0f 28 c9          	movaps %xmm1,%xmm9
    322a:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    322f:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    3233:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    3237:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    323c:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    3241:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  for (i=0;i<dim;i++)
    3245:	45 39 d3             	cmp    %r10d,%r11d
    3248:	0f 86 a7 01 00 00    	jbe    33f5 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x415>
    324e:	45 85 e4             	test   %r12d,%r12d
    3251:	0f 84 a1 00 00 00    	je     32f8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x318>
    3257:	41 83 fc 01          	cmp    $0x1,%r12d
    325b:	74 4e                	je     32ab <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x2cb>
    325d:	41 83 fc 02          	cmp    $0x2,%r12d
    3261:	0f 85 e9 0c 00 00    	jne    3f50 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf70>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3267:	44 0f 10 3c 31       	movups (%rcx,%rsi,1),%xmm15
    326c:	0f 10 1c 32          	movups (%rdx,%rsi,1),%xmm3
    3270:	41 83 c2 01          	add    $0x1,%r10d
    3274:	48 83 c6 10          	add    $0x10,%rsi
    3278:	44 0f 5c fb          	subps  %xmm3,%xmm15
    327c:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    3280:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3285:	41 0f 28 d7          	movaps %xmm15,%xmm2
    3289:	41 0f 28 e7          	movaps %xmm15,%xmm4
    328d:	41 0f c6 d7 55       	shufps $0x55,%xmm15,%xmm2
    3292:	41 0f 15 e7          	unpckhps %xmm15,%xmm4
    3296:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    329b:	f3 0f 58 c2          	addss  %xmm2,%xmm0
    329f:	f3 0f 58 e0          	addss  %xmm0,%xmm4
    32a3:	41 0f 28 c7          	movaps %xmm15,%xmm0
    32a7:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    32ab:	0f 10 0c 31          	movups (%rcx,%rsi,1),%xmm1
    32af:	0f 10 2c 32          	movups (%rdx,%rsi,1),%xmm5
    32b3:	41 83 c2 01          	add    $0x1,%r10d
    32b7:	48 83 c6 10          	add    $0x10,%rsi
    32bb:	0f 5c cd             	subps  %xmm5,%xmm1
    32be:	0f 59 c9             	mulps  %xmm1,%xmm1
    32c1:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    32c5:	44 0f 28 c1          	movaps %xmm1,%xmm8
    32c9:	44 0f 28 c9          	movaps %xmm1,%xmm9
    32cd:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    32d2:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    32d6:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    32da:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    32df:	f3 44 0f 58 c8       	addss  %xmm0,%xmm9
    32e4:	0f 28 c1             	movaps %xmm1,%xmm0
    32e7:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
  for (i=0;i<dim;i++)
    32ec:	45 39 d3             	cmp    %r10d,%r11d
    32ef:	0f 86 00 01 00 00    	jbe    33f5 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x415>
    32f5:	0f 1f 00             	nopl   (%rax)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    32f8:	44 0f 10 1c 32       	movups (%rdx,%rsi,1),%xmm11
    32fd:	44 0f 10 14 31       	movups (%rcx,%rsi,1),%xmm10
    3302:	41 83 c2 04          	add    $0x4,%r10d
    3306:	44 0f 10 7c 31 10    	movups 0x10(%rcx,%rsi,1),%xmm15
    330c:	0f 10 5c 32 10       	movups 0x10(%rdx,%rsi,1),%xmm3
    3311:	45 0f 5c d3          	subps  %xmm11,%xmm10
    3315:	0f 10 4c 31 20       	movups 0x20(%rcx,%rsi,1),%xmm1
    331a:	0f 10 6c 32 20       	movups 0x20(%rdx,%rsi,1),%xmm5
    331f:	44 0f 5c fb          	subps  %xmm3,%xmm15
    3323:	44 0f 10 5c 32 30    	movups 0x30(%rdx,%rsi,1),%xmm11
    3329:	0f 5c cd             	subps  %xmm5,%xmm1
    332c:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    3330:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    3334:	0f 59 c9             	mulps  %xmm1,%xmm1
    3337:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    333c:	45 0f 28 ea          	movaps %xmm10,%xmm13
    3340:	45 0f 28 f2          	movaps %xmm10,%xmm14
    3344:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    3349:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    334d:	41 0f 28 d7          	movaps %xmm15,%xmm2
    3351:	41 0f 28 e7          	movaps %xmm15,%xmm4
    3355:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    335a:	41 0f 15 e7          	unpckhps %xmm15,%xmm4
    335e:	44 0f 28 c1          	movaps %xmm1,%xmm8
    3362:	44 0f 28 c9          	movaps %xmm1,%xmm9
    3366:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    336b:	41 0f c6 d7 55       	shufps $0x55,%xmm15,%xmm2
    3370:	44 0f c6 c1 55       	shufps $0x55,%xmm1,%xmm8
    3375:	44 0f 15 c9          	unpckhps %xmm1,%xmm9
    3379:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    337e:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    3383:	44 0f 10 54 31 30    	movups 0x30(%rcx,%rsi,1),%xmm10
    3389:	48 83 c6 40          	add    $0x40,%rsi
    338d:	45 0f 5c d3          	subps  %xmm11,%xmm10
    3391:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3396:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    339b:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    339f:	f3 0f 58 c2          	addss  %xmm2,%xmm0
    33a3:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    33a7:	45 0f 28 ea          	movaps %xmm10,%xmm13
    33ab:	45 0f 28 f2          	movaps %xmm10,%xmm14
    33af:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    33b4:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    33b8:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    33bd:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    33c1:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    33c5:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    33ca:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    33cf:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    33d3:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    33d8:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    33dd:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    33e2:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    33e7:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
  for (i=0;i<dim;i++)
    33ec:	45 39 d3             	cmp    %r10d,%r11d
    33ef:	0f 87 03 ff ff ff    	ja     32f8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x318>
    33f5:	89 de                	mov    %ebx,%esi
    33f7:	44 39 cb             	cmp    %r9d,%ebx
    33fa:	74 56                	je     3452 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x472>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    33fc:	48 63 d6             	movslq %esi,%rdx
  for (i=0;i<dim;i++)
    33ff:	8d 4e 01             	lea    0x1(%rsi),%ecx
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3402:	f3 44 0f 10 3c 97    	movss  (%rdi,%rdx,4),%xmm15
    3408:	f3 45 0f 5c 3c 90    	subss  (%r8,%rdx,4),%xmm15
    340e:	f3 45 0f 59 ff       	mulss  %xmm15,%xmm15
    3413:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
  for (i=0;i<dim;i++)
    3418:	41 39 c9             	cmp    %ecx,%r9d
    341b:	7e 35                	jle    3452 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x472>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    341d:	4c 63 e1             	movslq %ecx,%r12
  for (i=0;i<dim;i++)
    3420:	83 c6 02             	add    $0x2,%esi
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3423:	f3 42 0f 10 1c a7    	movss  (%rdi,%r12,4),%xmm3
    3429:	f3 43 0f 5c 1c a0    	subss  (%r8,%r12,4),%xmm3
    342f:	f3 0f 59 db          	mulss  %xmm3,%xmm3
    3433:	f3 0f 58 c3          	addss  %xmm3,%xmm0
  for (i=0;i<dim;i++)
    3437:	41 39 f1             	cmp    %esi,%r9d
    343a:	7e 16                	jle    3452 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x472>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    343c:	48 63 f6             	movslq %esi,%rsi
    343f:	f3 0f 10 3c b7       	movss  (%rdi,%rsi,4),%xmm7
    3444:	f3 41 0f 5c 3c b0    	subss  (%r8,%rsi,4),%xmm7
    344a:	f3 0f 59 ff          	mulss  %xmm7,%xmm7
    344e:	f3 0f 58 c7          	addss  %xmm7,%xmm0
    points->p[k].cost = distance * points->p[k].weight;
    3452:	f3 0f 59 40 b8       	mulss  -0x48(%rax),%xmm0
    3457:	0f 18 48 f8          	prefetcht0 -0x8(%rax)
    345b:	0f 18 48 10          	prefetcht0 0x10(%rax)
    points->p[k].assign=0;
    345f:	48 c7 40 c8 00 00 00 	movq   $0x0,-0x38(%rax)
    3466:	00 
    3467:	48 83 c0 20          	add    $0x20,%rax
    points->p[k].cost = distance * points->p[k].weight;
    346b:	f3 0f 11 40 b0       	movss  %xmm0,-0x50(%rax)
  for( int k = k1; k < k2; k++ )    {
    3470:	4c 39 f0             	cmp    %r14,%rax
    3473:	0f 85 37 fc ff ff    	jne    30b0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xd0>
  if( pid==0 )   {
    3479:	44 8b 54 24 5c       	mov    0x5c(%rsp),%r10d
    347e:	45 85 d2             	test   %r10d,%r10d
    3481:	0f 84 40 05 00 00    	je     39c7 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9e7>
  pthread_barrier_wait(barrier);
    3487:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
      pthread_mutex_lock(&mutex);
    348c:	4c 8d 35 2d bc 00 00 	lea    0xbc2d(%rip),%r14        # f0c0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5mutex>
  pthread_barrier_wait(barrier);
    3493:	e8 b8 7c 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid != 0 ) { // we are not the master threads. we wait until a center is opened.
    3498:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    349d:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
    34a2:	48 c1 e0 05          	shl    $0x5,%rax
    34a6:	48 c1 e3 05          	shl    $0x5,%rbx
    34aa:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    34af:	48 89 5c 24 50       	mov    %rbx,0x50(%rsp)
    34b4:	0f 1f 40 00          	nopl   0x0(%rax)
      pthread_mutex_lock(&mutex);
    34b8:	4c 89 f7             	mov    %r14,%rdi
    34bb:	e8 e0 ef ff ff       	callq  24a0 <pthread_mutex_lock@plt>
      while(!open) pthread_cond_wait(&cond,&mutex);
    34c0:	80 3d 31 bc 00 00 00 	cmpb   $0x0,0xbc31(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
    34c7:	75 1f                	jne    34e8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x508>
    34c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    34d0:	4c 89 f6             	mov    %r14,%rsi
    34d3:	48 8d 3d a6 bb 00 00 	lea    0xbba6(%rip),%rdi        # f080 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4cond>
    34da:	e8 f1 ef ff ff       	callq  24d0 <pthread_cond_wait@plt>
    34df:	80 3d 12 bc 00 00 00 	cmpb   $0x0,0xbc12(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
    34e6:	74 e8                	je     34d0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x4f0>
      pthread_mutex_unlock(&mutex);
    34e8:	4c 89 f7             	mov    %r14,%rdi
    34eb:	e8 70 ee ff ff       	callq  2360 <pthread_mutex_unlock@plt>
      if( i >= points->num ) break;
    34f0:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    34f5:	4c 63 3d ec bb 00 00 	movslq 0xbbec(%rip),%r15        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    34fc:	4c 3b 3f             	cmp    (%rdi),%r15
    34ff:	0f 8d c5 0e 00 00    	jge    43ca <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x13ea>
      for( int k = k1; k < k2; k++ )
    3505:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
    350a:	48 39 6c 24 28       	cmp    %rbp,0x28(%rsp)
    350f:	0f 8e 51 04 00 00    	jle    3966 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x986>
	  float distance = dist(points->p[i],points->p[k],points->dim);
    3515:	44 8b 4f 08          	mov    0x8(%rdi),%r9d
    3519:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    351d:	4d 89 fc             	mov    %r15,%r12
    3520:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
    3525:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    352a:	49 c1 e4 05          	shl    $0x5,%r12
    352e:	41 8d 51 ff          	lea    -0x1(%r9),%edx
    3532:	44 89 cb             	mov    %r9d,%ebx
    3535:	4d 01 c4             	add    %r8,%r12
    3538:	4b 8d 74 18 48       	lea    0x48(%r8,%r11,1),%rsi
    353d:	45 89 cb             	mov    %r9d,%r11d
    3540:	89 54 24 0c          	mov    %edx,0xc(%rsp)
    3544:	4f 8d 6c 28 48       	lea    0x48(%r8,%r13,1),%r13
    3549:	41 c1 eb 02          	shr    $0x2,%r11d
    354d:	83 e3 fc             	and    $0xfffffffc,%ebx
    3550:	41 8d 4b fb          	lea    -0x5(%r11),%ecx
    3554:	83 e1 fc             	and    $0xfffffffc,%ecx
    3557:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    355b:	83 c1 04             	add    $0x4,%ecx
    355e:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
    3562:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3568:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
    356d:	0f 18 0e             	prefetcht0 (%rsi)
    3570:	4c 8b 46 c0          	mov    -0x40(%rsi),%r8
  for (i=0;i<dim;i++)
    3574:	45 85 c9             	test   %r9d,%r9d
    3577:	0f 8e 03 04 00 00    	jle    3980 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9a0>
    357d:	83 7c 24 0c 02       	cmpl   $0x2,0xc(%rsp)
    3582:	0f 86 fe 03 00 00    	jbe    3986 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9a6>
    3588:	4c 89 c0             	mov    %r8,%rax
    358b:	48 89 fa             	mov    %rdi,%rdx
    358e:	41 83 fb 04          	cmp    $0x4,%r11d
    3592:	0f 86 f9 03 00 00    	jbe    3991 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x9b1>
    3598:	31 c9                	xor    %ecx,%ecx
  float result=0.0;
    359a:	66 0f ef c9          	pxor   %xmm1,%xmm1
    359e:	eb 03                	jmp    35a3 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x5c3>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    35a0:	44 89 d1             	mov    %r10d,%ecx
    35a3:	0f 10 12             	movups (%rdx),%xmm2
    35a6:	0f 10 00             	movups (%rax),%xmm0
    35a9:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    35b0:	0f 18 88 00 01 00 00 	prefetcht0 0x100(%rax)
    35b7:	0f 10 70 10          	movups 0x10(%rax),%xmm6
    35bb:	0f 10 7a 30          	movups 0x30(%rdx),%xmm7
    35bf:	48 83 c0 40          	add    $0x40,%rax
    35c3:	48 83 c2 40          	add    $0x40,%rdx
    35c7:	0f 5c d0             	subps  %xmm0,%xmm2
    35ca:	44 0f 10 42 d0       	movups -0x30(%rdx),%xmm8
    35cf:	44 0f 10 62 e0       	movups -0x20(%rdx),%xmm12
    35d4:	44 8d 51 04          	lea    0x4(%rcx),%r10d
    35d8:	44 0f 10 68 e0       	movups -0x20(%rax),%xmm13
    35dd:	44 0f 5c c6          	subps  %xmm6,%xmm8
    35e1:	0f 59 d2             	mulps  %xmm2,%xmm2
    35e4:	45 0f 5c e5          	subps  %xmm13,%xmm12
    35e8:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    35ec:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    35f0:	f3 0f 58 ca          	addss  %xmm2,%xmm1
    35f4:	0f 28 ea             	movaps %xmm2,%xmm5
    35f7:	0f c6 ea 55          	shufps $0x55,%xmm2,%xmm5
    35fb:	45 0f 28 d0          	movaps %xmm8,%xmm10
    35ff:	45 0f 28 d8          	movaps %xmm8,%xmm11
    3603:	f3 0f 58 e9          	addss  %xmm1,%xmm5
    3607:	0f 28 ca             	movaps %xmm2,%xmm1
    360a:	45 0f c6 d0 55       	shufps $0x55,%xmm8,%xmm10
    360f:	45 0f 15 d8          	unpckhps %xmm8,%xmm11
    3613:	0f 15 ca             	unpckhps %xmm2,%xmm1
    3616:	0f c6 d2 ff          	shufps $0xff,%xmm2,%xmm2
    361a:	45 0f 28 fc          	movaps %xmm12,%xmm15
    361e:	41 0f 28 dc          	movaps %xmm12,%xmm3
    3622:	45 0f c6 fc 55       	shufps $0x55,%xmm12,%xmm15
    3627:	41 0f 15 dc          	unpckhps %xmm12,%xmm3
    362b:	f3 0f 58 cd          	addss  %xmm5,%xmm1
    362f:	f3 0f 58 ca          	addss  %xmm2,%xmm1
    3633:	0f 10 50 f0          	movups -0x10(%rax),%xmm2
    3637:	0f 5c fa             	subps  %xmm2,%xmm7
    363a:	f3 41 0f 58 c8       	addss  %xmm8,%xmm1
    363f:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    3644:	0f 59 ff             	mulps  %xmm7,%xmm7
    3647:	f3 41 0f 58 ca       	addss  %xmm10,%xmm1
    364c:	f3 41 0f 58 cb       	addss  %xmm11,%xmm1
    3651:	0f 28 e7             	movaps %xmm7,%xmm4
    3654:	0f 28 ef             	movaps %xmm7,%xmm5
    3657:	0f c6 e7 55          	shufps $0x55,%xmm7,%xmm4
    365b:	0f 15 ef             	unpckhps %xmm7,%xmm5
    365e:	f3 41 0f 58 c8       	addss  %xmm8,%xmm1
    3663:	f3 41 0f 58 cc       	addss  %xmm12,%xmm1
    3668:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    366d:	f3 41 0f 58 cf       	addss  %xmm15,%xmm1
    3672:	f3 0f 58 cb          	addss  %xmm3,%xmm1
    3676:	f3 41 0f 58 cc       	addss  %xmm12,%xmm1
    367b:	f3 0f 58 cf          	addss  %xmm7,%xmm1
    367f:	0f c6 ff ff          	shufps $0xff,%xmm7,%xmm7
    3683:	f3 0f 58 cc          	addss  %xmm4,%xmm1
    3687:	f3 0f 58 cd          	addss  %xmm5,%xmm1
    368b:	f3 0f 58 cf          	addss  %xmm7,%xmm1
  for (i=0;i<dim;i++)
    368f:	3b 4c 24 10          	cmp    0x10(%rsp),%ecx
    3693:	0f 85 07 ff ff ff    	jne    35a0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x5c0>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3699:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
    369d:	89 6c 24 18          	mov    %ebp,0x18(%rsp)
    36a1:	44 0f 10 02          	movups (%rdx),%xmm8
    36a5:	0f 10 30             	movups (%rax),%xmm6
    36a8:	b9 10 00 00 00       	mov    $0x10,%ecx
    36ad:	44 8b 54 24 18       	mov    0x18(%rsp),%r10d
    36b2:	44 0f 5c c6          	subps  %xmm6,%xmm8
    36b6:	44 89 d5             	mov    %r10d,%ebp
    36b9:	41 83 c2 01          	add    $0x1,%r10d
    36bd:	f7 d5                	not    %ebp
    36bf:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    36c3:	44 01 dd             	add    %r11d,%ebp
    36c6:	83 e5 03             	and    $0x3,%ebp
    36c9:	41 0f 28 c0          	movaps %xmm8,%xmm0
    36cd:	45 0f 28 c8          	movaps %xmm8,%xmm9
    36d1:	45 0f 28 d0          	movaps %xmm8,%xmm10
    36d5:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    36d9:	45 0f c6 c8 55       	shufps $0x55,%xmm8,%xmm9
    36de:	45 0f 15 d0          	unpckhps %xmm8,%xmm10
    36e2:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    36e7:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    36ec:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    36f1:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
  for (i=0;i<dim;i++)
    36f6:	45 39 d3             	cmp    %r10d,%r11d
    36f9:	0f 86 e6 01 00 00    	jbe    38e5 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x905>
    36ff:	85 ed                	test   %ebp,%ebp
    3701:	0f 84 e9 00 00 00    	je     37f0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x810>
    3707:	83 fd 01             	cmp    $0x1,%ebp
    370a:	0f 84 8d 00 00 00    	je     379d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x7bd>
    3710:	83 fd 02             	cmp    $0x2,%ebp
    3713:	74 4e                	je     3763 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x783>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3715:	44 0f 10 5a 10       	movups 0x10(%rdx),%xmm11
    371a:	44 0f 10 60 10       	movups 0x10(%rax),%xmm12
    371f:	b9 20 00 00 00       	mov    $0x20,%ecx
    3724:	44 8b 54 24 18       	mov    0x18(%rsp),%r10d
    3729:	45 0f 5c dc          	subps  %xmm12,%xmm11
    372d:	41 83 c2 02          	add    $0x2,%r10d
    3731:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3735:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    373a:	45 0f 28 f3          	movaps %xmm11,%xmm14
    373e:	45 0f 28 fb          	movaps %xmm11,%xmm15
    3742:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    3747:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    374b:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    3750:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    3755:	f3 44 0f 58 f8       	addss  %xmm0,%xmm15
    375a:	41 0f 28 c3          	movaps %xmm11,%xmm0
    375e:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3763:	0f 10 1c 0a          	movups (%rdx,%rcx,1),%xmm3
    3767:	0f 10 3c 08          	movups (%rax,%rcx,1),%xmm7
    376b:	41 83 c2 01          	add    $0x1,%r10d
    376f:	48 83 c1 10          	add    $0x10,%rcx
    3773:	0f 5c df             	subps  %xmm7,%xmm3
    3776:	0f 59 db             	mulps  %xmm3,%xmm3
    3779:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    377d:	0f 28 e3             	movaps %xmm3,%xmm4
    3780:	0f 28 eb             	movaps %xmm3,%xmm5
    3783:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3787:	0f 15 eb             	unpckhps %xmm3,%xmm5
    378a:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    378e:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3792:	f3 0f 58 e8          	addss  %xmm0,%xmm5
    3796:	0f 28 c3             	movaps %xmm3,%xmm0
    3799:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    379d:	0f 10 0c 0a          	movups (%rdx,%rcx,1),%xmm1
    37a1:	44 0f 10 04 08       	movups (%rax,%rcx,1),%xmm8
    37a6:	41 83 c2 01          	add    $0x1,%r10d
    37aa:	48 83 c1 10          	add    $0x10,%rcx
    37ae:	41 0f 5c c8          	subps  %xmm8,%xmm1
    37b2:	0f 59 c9             	mulps  %xmm1,%xmm1
    37b5:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    37b9:	44 0f 28 c9          	movaps %xmm1,%xmm9
    37bd:	44 0f 28 d1          	movaps %xmm1,%xmm10
    37c1:	44 0f c6 c9 55       	shufps $0x55,%xmm1,%xmm9
    37c6:	44 0f 15 d1          	unpckhps %xmm1,%xmm10
    37ca:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    37ce:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    37d3:	f3 44 0f 58 d0       	addss  %xmm0,%xmm10
    37d8:	0f 28 c1             	movaps %xmm1,%xmm0
    37db:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
  for (i=0;i<dim;i++)
    37e0:	45 39 d3             	cmp    %r10d,%r11d
    37e3:	0f 86 fc 00 00 00    	jbe    38e5 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x905>
    37e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    37f0:	44 0f 10 24 08       	movups (%rax,%rcx,1),%xmm12
    37f5:	44 0f 10 1c 0a       	movups (%rdx,%rcx,1),%xmm11
    37fa:	41 83 c2 04          	add    $0x4,%r10d
    37fe:	0f 10 5c 0a 10       	movups 0x10(%rdx,%rcx,1),%xmm3
    3803:	0f 10 7c 08 10       	movups 0x10(%rax,%rcx,1),%xmm7
    3808:	45 0f 5c dc          	subps  %xmm12,%xmm11
    380c:	0f 10 4c 0a 20       	movups 0x20(%rdx,%rcx,1),%xmm1
    3811:	44 0f 10 44 08 20    	movups 0x20(%rax,%rcx,1),%xmm8
    3817:	0f 5c df             	subps  %xmm7,%xmm3
    381a:	44 0f 10 64 08 30    	movups 0x30(%rax,%rcx,1),%xmm12
    3820:	41 0f 5c c8          	subps  %xmm8,%xmm1
    3824:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3828:	0f 59 db             	mulps  %xmm3,%xmm3
    382b:	0f 59 c9             	mulps  %xmm1,%xmm1
    382e:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3833:	45 0f 28 f3          	movaps %xmm11,%xmm14
    3837:	45 0f 28 fb          	movaps %xmm11,%xmm15
    383b:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    3840:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    3844:	0f 28 e3             	movaps %xmm3,%xmm4
    3847:	0f 28 eb             	movaps %xmm3,%xmm5
    384a:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    384f:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3853:	0f 15 eb             	unpckhps %xmm3,%xmm5
    3856:	44 0f 28 c9          	movaps %xmm1,%xmm9
    385a:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    385f:	44 0f c6 c9 55       	shufps $0x55,%xmm1,%xmm9
    3864:	44 0f 28 d1          	movaps %xmm1,%xmm10
    3868:	44 0f 15 d1          	unpckhps %xmm1,%xmm10
    386c:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3871:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3876:	44 0f 10 5c 0a 30    	movups 0x30(%rdx,%rcx,1),%xmm11
    387c:	48 83 c1 40          	add    $0x40,%rcx
    3880:	45 0f 5c dc          	subps  %xmm12,%xmm11
    3884:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3888:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    388c:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3890:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3894:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    3898:	45 0f 28 f3          	movaps %xmm11,%xmm14
    389c:	45 0f 28 fb          	movaps %xmm11,%xmm15
    38a0:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    38a5:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    38a9:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    38ad:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    38b1:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    38b5:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    38ba:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    38bf:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    38c3:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    38c8:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    38cd:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    38d2:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    38d7:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
  for (i=0;i<dim;i++)
    38dc:	45 39 d3             	cmp    %r10d,%r11d
    38df:	0f 87 0b ff ff ff    	ja     37f0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x810>
    38e5:	89 d8                	mov    %ebx,%eax
    38e7:	44 39 cb             	cmp    %r9d,%ebx
    38ea:	74 51                	je     393d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x95d>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    38ec:	48 63 d0             	movslq %eax,%rdx
  for (i=0;i<dim;i++)
    38ef:	8d 68 01             	lea    0x1(%rax),%ebp
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    38f2:	f3 0f 10 1c 97       	movss  (%rdi,%rdx,4),%xmm3
    38f7:	f3 41 0f 5c 1c 90    	subss  (%r8,%rdx,4),%xmm3
    38fd:	f3 0f 59 db          	mulss  %xmm3,%xmm3
    3901:	f3 0f 58 c3          	addss  %xmm3,%xmm0
  for (i=0;i<dim;i++)
    3905:	41 39 e9             	cmp    %ebp,%r9d
    3908:	7e 33                	jle    393d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x95d>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    390a:	48 63 cd             	movslq %ebp,%rcx
  for (i=0;i<dim;i++)
    390d:	83 c0 02             	add    $0x2,%eax
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3910:	f3 0f 10 3c 8f       	movss  (%rdi,%rcx,4),%xmm7
    3915:	f3 41 0f 5c 3c 88    	subss  (%r8,%rcx,4),%xmm7
    391b:	f3 0f 59 ff          	mulss  %xmm7,%xmm7
    391f:	f3 0f 58 c7          	addss  %xmm7,%xmm0
  for (i=0;i<dim;i++)
    3923:	41 39 c1             	cmp    %eax,%r9d
    3926:	7e 15                	jle    393d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x95d>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3928:	48 98                	cltq   
    392a:	f3 0f 10 14 87       	movss  (%rdi,%rax,4),%xmm2
    392f:	f3 41 0f 5c 14 80    	subss  (%r8,%rax,4),%xmm2
    3935:	f3 0f 59 d2          	mulss  %xmm2,%xmm2
    3939:	f3 0f 58 c2          	addss  %xmm2,%xmm0
	  if( distance*points->p[k].weight < points->p[k].cost )
    393d:	f3 0f 59 46 b8       	mulss  -0x48(%rsi),%xmm0
    3942:	f3 0f 10 66 d0       	movss  -0x30(%rsi),%xmm4
    3947:	0f 18 4e 10          	prefetcht0 0x10(%rsi)
    394b:	0f 2f e0             	comiss %xmm0,%xmm4
    394e:	76 09                	jbe    3959 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x979>
	      points->p[k].assign=i;
    3950:	4c 89 7e c8          	mov    %r15,-0x38(%rsi)
	      points->p[k].cost = distance * points->p[k].weight;
    3954:	f3 0f 11 46 d0       	movss  %xmm0,-0x30(%rsi)
      for( int k = k1; k < k2; k++ )
    3959:	48 83 c6 20          	add    $0x20,%rsi
    395d:	4c 39 ee             	cmp    %r13,%rsi
    3960:	0f 85 02 fc ff ff    	jne    3568 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x588>
      pthread_barrier_wait(barrier);
    3966:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
    396b:	48 89 df             	mov    %rbx,%rdi
    396e:	e8 dd 77 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
      pthread_barrier_wait(barrier);
    3973:	48 89 df             	mov    %rbx,%rdi
    3976:	e8 d5 77 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    } 
    397b:	e9 38 fb ff ff       	jmpq   34b8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x4d8>
  float result=0.0;
    3980:	66 0f ef c0          	pxor   %xmm0,%xmm0
    3984:	eb b7                	jmp    393d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x95d>
    3986:	66 0f ef c0          	pxor   %xmm0,%xmm0
  for (i=0;i<dim;i++)
    398a:	31 c0                	xor    %eax,%eax
    398c:	e9 5b ff ff ff       	jmpq   38ec <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x90c>
    3991:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%rsp)
    3998:	00 
    3999:	66 0f ef c9          	pxor   %xmm1,%xmm1
    399d:	e9 ff fc ff ff       	jmpq   36a1 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x6c1>
  float result=0.0;
    39a2:	66 0f ef c0          	pxor   %xmm0,%xmm0
    39a6:	e9 a7 fa ff ff       	jmpq   3452 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x472>
    39ab:	66 0f ef c0          	pxor   %xmm0,%xmm0
  for (i=0;i<dim;i++)
    39af:	31 f6                	xor    %esi,%esi
    39b1:	e9 46 fa ff ff       	jmpq   33fc <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x41c>
    39b6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
    39bd:	00 
    39be:	66 0f ef c0          	pxor   %xmm0,%xmm0
    39c2:	e9 30 f8 ff ff       	jmpq   31f7 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x217>
    *kcenter = 1;
    39c7:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
    costs = (double*)malloc(sizeof(double)*nproc);
    39cc:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    *kcenter = 1;
    39d1:	49 c7 00 01 00 00 00 	movq   $0x1,(%r8)
    costs = (double*)malloc(sizeof(double)*nproc);
    39d8:	48 c1 e7 03          	shl    $0x3,%rdi
    39dc:	e8 9f ea ff ff       	callq  2480 <malloc@plt>
  pthread_barrier_wait(barrier);
    39e1:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    costs = (double*)malloc(sizeof(double)*nproc);
    39e6:	48 89 05 03 b7 00 00 	mov    %rax,0xb703(%rip)        # f0f0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5costs>
  pthread_barrier_wait(barrier);
    39ed:	e8 5e 77 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    for(i = 1; i < points->num; i++ )  {
    39f2:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
    39f7:	c7 05 e7 b6 00 00 01 	movl   $0x1,0xb6e7(%rip)        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    39fe:	00 00 00 
    3a01:	49 83 39 01          	cmpq   $0x1,(%r9)
    3a05:	0f 8e 98 05 00 00    	jle    3fa3 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xfc3>
    3a0b:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
    3a10:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
    3a15:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
    3a1a:	49 c1 e3 05          	shl    $0x5,%r11
    3a1e:	49 c1 e4 05          	shl    $0x5,%r12
    3a22:	49 83 c3 48          	add    $0x48,%r11
    3a26:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
    3a2b:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
    3a30:	eb 1b                	jmp    3a4d <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xa6d>
    3a32:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3a38:	83 c1 01             	add    $0x1,%ecx
    3a3b:	89 0d a7 b6 00 00    	mov    %ecx,0xb6a7(%rip)        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    3a41:	4c 63 c9             	movslq %ecx,%r9
    3a44:	4c 3b 0b             	cmp    (%rbx),%r9
    3a47:	0f 8d 56 05 00 00    	jge    3fa3 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xfc3>
      bool to_open = ((float)lrand48()/(float)INT_MAX)<(points->p[i].cost/z);
    3a4d:	e8 1e e9 ff ff       	callq  2370 <lrand48@plt>
    3a52:	66 0f ef c0          	pxor   %xmm0,%xmm0
    3a56:	8b 0d 8c b6 00 00    	mov    0xb68c(%rip),%ecx        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    3a5c:	f3 48 0f 2a c0       	cvtsi2ss %rax,%xmm0
    3a61:	f3 0f 59 05 4f 8b 00 	mulss  0x8b4f(%rip),%xmm0        # c5b8 <_ZTS10FileStream+0x10>
    3a68:	00 
    3a69:	4c 63 e9             	movslq %ecx,%r13
    3a6c:	49 c1 e5 05          	shl    $0x5,%r13
    3a70:	4c 03 6b 10          	add    0x10(%rbx),%r13
    3a74:	f3 41 0f 10 6d 18    	movss  0x18(%r13),%xmm5
    3a7a:	f3 0f 5e 6c 24 58    	divss  0x58(%rsp),%xmm5
      if( to_open )  {
    3a80:	0f 2f e8             	comiss %xmm0,%xmm5
    3a83:	76 b3                	jbe    3a38 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xa58>
	(*kcenter)++;
    3a85:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
	pthread_mutex_lock(&mutex);
    3a8a:	48 8d 3d 2f b6 00 00 	lea    0xb62f(%rip),%rdi        # f0c0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5mutex>
	(*kcenter)++;
    3a91:	49 83 07 01          	addq   $0x1,(%r15)
	pthread_mutex_lock(&mutex);
    3a95:	e8 06 ea ff ff       	callq  24a0 <pthread_mutex_lock@plt>
	pthread_mutex_unlock(&mutex);
    3a9a:	48 8d 3d 1f b6 00 00 	lea    0xb61f(%rip),%rdi        # f0c0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5mutex>
	open = true;
    3aa1:	c6 05 50 b6 00 00 01 	movb   $0x1,0xb650(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
	pthread_mutex_unlock(&mutex);
    3aa8:	e8 b3 e8 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
	pthread_cond_broadcast(&cond);
    3aad:	48 8d 3d cc b5 00 00 	lea    0xb5cc(%rip),%rdi        # f080 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4cond>
    3ab4:	e8 47 e8 ff ff       	callq  2300 <pthread_cond_broadcast@plt>
	for( int k = k1; k < k2; k++ )  {
    3ab9:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3abe:	48 39 54 24 28       	cmp    %rdx,0x28(%rsp)
    3ac3:	0f 8e 60 04 00 00    	jle    3f29 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf49>
	  float distance = dist(points->p[i],points->p[k],points->dim);
    3ac9:	44 8b 53 08          	mov    0x8(%rbx),%r10d
    3acd:	48 8b 6b 10          	mov    0x10(%rbx),%rbp
    3ad1:	48 89 5c 24 50       	mov    %rbx,0x50(%rsp)
    3ad6:	4c 63 25 0b b6 00 00 	movslq 0xb60b(%rip),%r12        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    3add:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    3ae2:	45 89 d3             	mov    %r10d,%r11d
    3ae5:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
    3aea:	45 8d 7a ff          	lea    -0x1(%r10),%r15d
    3aee:	41 c1 eb 02          	shr    $0x2,%r11d
    3af2:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
    3af7:	49 c1 e4 05          	shl    $0x5,%r12
    3afb:	48 8d 74 0d 00       	lea    0x0(%rbp,%rcx,1),%rsi
    3b00:	41 8d 43 fb          	lea    -0x5(%r11),%eax
    3b04:	49 01 ec             	add    %rbp,%r12
    3b07:	4e 8d 74 35 48       	lea    0x48(%rbp,%r14,1),%r14
    3b0c:	44 89 d5             	mov    %r10d,%ebp
    3b0f:	83 e0 fc             	and    $0xfffffffc,%eax
    3b12:	83 e5 fc             	and    $0xfffffffc,%ebp
    3b15:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    3b19:	83 c0 04             	add    $0x4,%eax
    3b1c:	89 44 24 18          	mov    %eax,0x18(%rsp)
    3b20:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi
    3b25:	0f 18 0e             	prefetcht0 (%rsi)
    3b28:	4c 8b 46 c0          	mov    -0x40(%rsi),%r8
  for (i=0;i<dim;i++)
    3b2c:	45 85 d2             	test   %r10d,%r10d
    3b2f:	0f 8e 01 09 00 00    	jle    4436 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1456>
    3b35:	41 83 ff 02          	cmp    $0x2,%r15d
    3b39:	0f 86 63 0a 00 00    	jbe    45a2 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15c2>
    3b3f:	4c 89 c0             	mov    %r8,%rax
    3b42:	48 89 fa             	mov    %rdi,%rdx
    3b45:	41 83 fb 04          	cmp    $0x4,%r11d
    3b49:	0f 86 5e 0a 00 00    	jbe    45ad <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15cd>
    3b4f:	45 31 c9             	xor    %r9d,%r9d
  float result=0.0;
    3b52:	66 0f ef c0          	pxor   %xmm0,%xmm0
    3b56:	eb 0b                	jmp    3b63 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xb83>
    3b58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    3b5f:	00 
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3b60:	41 89 d9             	mov    %ebx,%r9d
    3b63:	0f 10 08             	movups (%rax),%xmm1
    3b66:	44 0f 10 02          	movups (%rdx),%xmm8
    3b6a:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    3b71:	0f 18 88 00 01 00 00 	prefetcht0 0x100(%rax)
    3b78:	0f 10 5a 20          	movups 0x20(%rdx),%xmm3
    3b7c:	0f 10 78 20          	movups 0x20(%rax),%xmm7
    3b80:	48 83 c2 40          	add    $0x40,%rdx
    3b84:	48 83 c0 40          	add    $0x40,%rax
    3b88:	44 0f 5c c1          	subps  %xmm1,%xmm8
    3b8c:	44 0f 10 5a d0       	movups -0x30(%rdx),%xmm11
    3b91:	0f 10 48 f0          	movups -0x10(%rax),%xmm1
    3b95:	41 8d 59 04          	lea    0x4(%r9),%ebx
    3b99:	44 0f 10 60 d0       	movups -0x30(%rax),%xmm12
    3b9e:	0f 5c df             	subps  %xmm7,%xmm3
    3ba1:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    3ba5:	45 0f 5c dc          	subps  %xmm12,%xmm11
    3ba9:	0f 59 db             	mulps  %xmm3,%xmm3
    3bac:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3bb0:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    3bb5:	45 0f 28 c8          	movaps %xmm8,%xmm9
    3bb9:	45 0f c6 c8 55       	shufps $0x55,%xmm8,%xmm9
    3bbe:	0f 28 e3             	movaps %xmm3,%xmm4
    3bc1:	0f 28 eb             	movaps %xmm3,%xmm5
    3bc4:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3bc8:	0f 15 eb             	unpckhps %xmm3,%xmm5
    3bcb:	f3 44 0f 58 c8       	addss  %xmm0,%xmm9
    3bd0:	41 0f 28 c0          	movaps %xmm8,%xmm0
    3bd4:	45 0f 28 f3          	movaps %xmm11,%xmm14
    3bd8:	41 0f 15 c0          	unpckhps %xmm8,%xmm0
    3bdc:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    3be1:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    3be6:	45 0f 28 fb          	movaps %xmm11,%xmm15
    3bea:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    3bee:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    3bf3:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    3bf8:	44 0f 10 42 f0       	movups -0x10(%rdx),%xmm8
    3bfd:	44 0f 5c c1          	subps  %xmm1,%xmm8
    3c01:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3c06:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    3c0b:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    3c0f:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    3c14:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3c19:	45 0f 28 c8          	movaps %xmm8,%xmm9
    3c1d:	45 0f 28 d0          	movaps %xmm8,%xmm10
    3c21:	45 0f c6 c8 55       	shufps $0x55,%xmm8,%xmm9
    3c26:	45 0f 15 d0          	unpckhps %xmm8,%xmm10
    3c2a:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3c2f:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3c33:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    3c37:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3c3b:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    3c3f:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3c43:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    3c48:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    3c4d:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    3c52:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    3c57:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
  for (i=0;i<dim;i++)
    3c5c:	44 3b 4c 24 0c       	cmp    0xc(%rsp),%r9d
    3c61:	0f 85 f9 fe ff ff    	jne    3b60 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xb80>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3c67:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
    3c6c:	44 0f 10 1a          	movups (%rdx),%xmm11
    3c70:	44 0f 10 20          	movups (%rax),%xmm12
    3c74:	44 89 eb             	mov    %r13d,%ebx
    3c77:	45 8d 4d 01          	lea    0x1(%r13),%r9d
    3c7b:	f7 d3                	not    %ebx
    3c7d:	b9 10 00 00 00       	mov    $0x10,%ecx
    3c82:	45 0f 5c dc          	subps  %xmm12,%xmm11
    3c86:	44 01 db             	add    %r11d,%ebx
    3c89:	83 e3 03             	and    $0x3,%ebx
    3c8c:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3c90:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3c95:	45 0f 28 f3          	movaps %xmm11,%xmm14
    3c99:	45 0f 28 fb          	movaps %xmm11,%xmm15
    3c9d:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    3ca2:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    3ca6:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    3cab:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    3cb0:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3cb5:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
  for (i=0;i<dim;i++)
    3cba:	45 39 cb             	cmp    %r9d,%r11d
    3cbd:	0f 86 d5 01 00 00    	jbe    3e98 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xeb8>
    3cc3:	85 db                	test   %ebx,%ebx
    3cc5:	0f 84 e5 00 00 00    	je     3db0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xdd0>
    3ccb:	83 fb 01             	cmp    $0x1,%ebx
    3cce:	0f 84 87 00 00 00    	je     3d5b <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xd7b>
    3cd4:	83 fb 02             	cmp    $0x2,%ebx
    3cd7:	74 3b                	je     3d14 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xd34>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3cd9:	0f 10 5a 10          	movups 0x10(%rdx),%xmm3
    3cdd:	0f 10 78 10          	movups 0x10(%rax),%xmm7
    3ce1:	b9 20 00 00 00       	mov    $0x20,%ecx
    3ce6:	45 8d 4d 02          	lea    0x2(%r13),%r9d
    3cea:	0f 5c df             	subps  %xmm7,%xmm3
    3ced:	0f 59 db             	mulps  %xmm3,%xmm3
    3cf0:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3cf4:	0f 28 e3             	movaps %xmm3,%xmm4
    3cf7:	0f 28 eb             	movaps %xmm3,%xmm5
    3cfa:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3cfe:	0f 15 eb             	unpckhps %xmm3,%xmm5
    3d01:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3d05:	f3 0f 58 e8          	addss  %xmm0,%xmm5
    3d09:	0f 28 c3             	movaps %xmm3,%xmm0
    3d0c:	0f c6 c3 ff          	shufps $0xff,%xmm3,%xmm0
    3d10:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    3d14:	44 0f 10 04 0a       	movups (%rdx,%rcx,1),%xmm8
    3d19:	0f 10 0c 08          	movups (%rax,%rcx,1),%xmm1
    3d1d:	41 83 c1 01          	add    $0x1,%r9d
    3d21:	48 83 c1 10          	add    $0x10,%rcx
    3d25:	44 0f 5c c1          	subps  %xmm1,%xmm8
    3d29:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    3d2d:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    3d32:	45 0f 28 c8          	movaps %xmm8,%xmm9
    3d36:	45 0f 28 d0          	movaps %xmm8,%xmm10
    3d3a:	45 0f c6 c8 55       	shufps $0x55,%xmm8,%xmm9
    3d3f:	45 0f 15 d0          	unpckhps %xmm8,%xmm10
    3d43:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    3d48:	f3 44 0f 58 d0       	addss  %xmm0,%xmm10
    3d4d:	41 0f 28 c0          	movaps %xmm8,%xmm0
    3d51:	41 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm0
    3d56:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    3d5b:	44 0f 10 1c 0a       	movups (%rdx,%rcx,1),%xmm11
    3d60:	44 0f 10 24 08       	movups (%rax,%rcx,1),%xmm12
    3d65:	41 83 c1 01          	add    $0x1,%r9d
    3d69:	48 83 c1 10          	add    $0x10,%rcx
    3d6d:	45 0f 5c dc          	subps  %xmm12,%xmm11
    3d71:	45 0f 59 db          	mulps  %xmm11,%xmm11
    3d75:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3d7a:	45 0f 28 f3          	movaps %xmm11,%xmm14
    3d7e:	45 0f 28 fb          	movaps %xmm11,%xmm15
    3d82:	45 0f c6 f3 55       	shufps $0x55,%xmm11,%xmm14
    3d87:	45 0f 15 fb          	unpckhps %xmm11,%xmm15
    3d8b:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    3d90:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    3d95:	f3 44 0f 58 f8       	addss  %xmm0,%xmm15
    3d9a:	41 0f 28 c3          	movaps %xmm11,%xmm0
    3d9e:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
  for (i=0;i<dim;i++)
    3da3:	45 39 cb             	cmp    %r9d,%r11d
    3da6:	0f 86 ec 00 00 00    	jbe    3e98 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xeb8>
    3dac:	0f 1f 40 00          	nopl   0x0(%rax)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3db0:	0f 10 3c 08          	movups (%rax,%rcx,1),%xmm7
    3db4:	0f 10 1c 0a          	movups (%rdx,%rcx,1),%xmm3
    3db8:	41 83 c1 04          	add    $0x4,%r9d
    3dbc:	0f 10 4c 0a 10       	movups 0x10(%rdx,%rcx,1),%xmm1
    3dc1:	0f 10 74 08 10       	movups 0x10(%rax,%rcx,1),%xmm6
    3dc6:	0f 5c df             	subps  %xmm7,%xmm3
    3dc9:	44 0f 10 64 0a 20    	movups 0x20(%rdx,%rcx,1),%xmm12
    3dcf:	44 0f 10 6c 08 20    	movups 0x20(%rax,%rcx,1),%xmm13
    3dd5:	0f 5c ce             	subps  %xmm6,%xmm1
    3dd8:	0f 10 7c 08 30       	movups 0x30(%rax,%rcx,1),%xmm7
    3ddd:	45 0f 5c e5          	subps  %xmm13,%xmm12
    3de1:	0f 59 db             	mulps  %xmm3,%xmm3
    3de4:	0f 59 c9             	mulps  %xmm1,%xmm1
    3de7:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    3deb:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3def:	0f 28 e3             	movaps %xmm3,%xmm4
    3df2:	0f 28 eb             	movaps %xmm3,%xmm5
    3df5:	0f c6 e3 55          	shufps $0x55,%xmm3,%xmm4
    3df9:	0f 15 eb             	unpckhps %xmm3,%xmm5
    3dfc:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    3e00:	44 0f 28 d1          	movaps %xmm1,%xmm10
    3e04:	44 0f c6 d1 55       	shufps $0x55,%xmm1,%xmm10
    3e09:	44 0f 28 d9          	movaps %xmm1,%xmm11
    3e0d:	45 0f 28 fc          	movaps %xmm12,%xmm15
    3e11:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3e15:	44 0f 15 d9          	unpckhps %xmm1,%xmm11
    3e19:	0f 10 64 0a 30       	movups 0x30(%rdx,%rcx,1),%xmm4
    3e1e:	45 0f c6 fc 55       	shufps $0x55,%xmm12,%xmm15
    3e23:	48 83 c1 40          	add    $0x40,%rcx
    3e27:	0f 5c e7             	subps  %xmm7,%xmm4
    3e2a:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    3e2e:	0f 59 e4             	mulps  %xmm4,%xmm4
    3e31:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3e35:	41 0f 28 dc          	movaps %xmm12,%xmm3
    3e39:	41 0f 15 dc          	unpckhps %xmm12,%xmm3
    3e3d:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    3e41:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    3e45:	0f 28 ec             	movaps %xmm4,%xmm5
    3e48:	44 0f 28 c4          	movaps %xmm4,%xmm8
    3e4c:	0f c6 ec 55          	shufps $0x55,%xmm4,%xmm5
    3e50:	44 0f 15 c4          	unpckhps %xmm4,%xmm8
    3e54:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    3e59:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    3e5e:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    3e62:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
    3e67:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    3e6c:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    3e71:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    3e75:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
    3e7a:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    3e7e:	0f c6 e4 ff          	shufps $0xff,%xmm4,%xmm4
    3e82:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    3e86:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    3e8b:	f3 0f 58 c4          	addss  %xmm4,%xmm0
  for (i=0;i<dim;i++)
    3e8f:	45 39 cb             	cmp    %r9d,%r11d
    3e92:	0f 87 18 ff ff ff    	ja     3db0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xdd0>
    3e98:	89 e8                	mov    %ebp,%eax
    3e9a:	44 39 d5             	cmp    %r10d,%ebp
    3e9d:	74 55                	je     3ef4 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf14>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3e9f:	48 63 d0             	movslq %eax,%rdx
  for (i=0;i<dim;i++)
    3ea2:	44 8d 68 01          	lea    0x1(%rax),%r13d
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3ea6:	f3 0f 10 0c 97       	movss  (%rdi,%rdx,4),%xmm1
    3eab:	f3 41 0f 5c 0c 90    	subss  (%r8,%rdx,4),%xmm1
    3eb1:	f3 0f 59 c9          	mulss  %xmm1,%xmm1
    3eb5:	f3 0f 58 c1          	addss  %xmm1,%xmm0
  for (i=0;i<dim;i++)
    3eb9:	45 39 ea             	cmp    %r13d,%r10d
    3ebc:	7e 36                	jle    3ef4 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf14>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3ebe:	49 63 dd             	movslq %r13d,%rbx
  for (i=0;i<dim;i++)
    3ec1:	83 c0 02             	add    $0x2,%eax
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3ec4:	f3 0f 10 34 9f       	movss  (%rdi,%rbx,4),%xmm6
    3ec9:	f3 41 0f 5c 34 98    	subss  (%r8,%rbx,4),%xmm6
    3ecf:	f3 0f 59 f6          	mulss  %xmm6,%xmm6
    3ed3:	f3 0f 58 c6          	addss  %xmm6,%xmm0
  for (i=0;i<dim;i++)
    3ed7:	41 39 c2             	cmp    %eax,%r10d
    3eda:	7e 18                	jle    3ef4 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf14>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3edc:	48 98                	cltq   
    3ede:	f3 44 0f 10 0c 87    	movss  (%rdi,%rax,4),%xmm9
    3ee4:	f3 45 0f 5c 0c 80    	subss  (%r8,%rax,4),%xmm9
    3eea:	f3 45 0f 59 c9       	mulss  %xmm9,%xmm9
    3eef:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
	  if( distance*points->p[k].weight < points->p[k].cost )  {
    3ef4:	f3 0f 59 46 b8       	mulss  -0x48(%rsi),%xmm0
    3ef9:	f3 44 0f 10 56 d0    	movss  -0x30(%rsi),%xmm10
    3eff:	0f 18 4e 10          	prefetcht0 0x10(%rsi)
    3f03:	44 0f 2f d0          	comiss %xmm0,%xmm10
    3f07:	76 0e                	jbe    3f17 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf37>
	    points->p[k].assign=i;
    3f09:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
	    points->p[k].cost = distance * points->p[k].weight;
    3f0e:	f3 0f 11 46 d0       	movss  %xmm0,-0x30(%rsi)
	    points->p[k].assign=i;
    3f13:	48 89 46 c8          	mov    %rax,-0x38(%rsi)
	for( int k = k1; k < k2; k++ )  {
    3f17:	48 83 c6 20          	add    $0x20,%rsi
    3f1b:	4c 39 f6             	cmp    %r14,%rsi
    3f1e:	0f 85 fc fb ff ff    	jne    3b20 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xb40>
    3f24:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
	pthread_barrier_wait(barrier);
    3f29:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
    3f2e:	48 89 ef             	mov    %rbp,%rdi
    3f31:	e8 1a 72 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
	pthread_barrier_wait(barrier);
    3f36:	48 89 ef             	mov    %rbp,%rdi
	open = false;
    3f39:	c6 05 b8 b1 00 00 00 	movb   $0x0,0xb1b8(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
	pthread_barrier_wait(barrier);
    3f40:	e8 0b 72 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    3f45:	8b 0d 9d b1 00 00    	mov    0xb19d(%rip),%ecx        # f0e8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE1i>
    3f4b:	e9 e8 fa ff ff       	jmpq   3a38 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xa58>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    3f50:	44 0f 10 51 10       	movups 0x10(%rcx),%xmm10
    3f55:	44 0f 10 5a 10       	movups 0x10(%rdx),%xmm11
    3f5a:	be 20 00 00 00       	mov    $0x20,%esi
    3f5f:	44 8b 54 24 0c       	mov    0xc(%rsp),%r10d
    3f64:	45 0f 5c d3          	subps  %xmm11,%xmm10
    3f68:	41 83 c2 02          	add    $0x2,%r10d
    3f6c:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    3f70:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    3f75:	45 0f 28 ea          	movaps %xmm10,%xmm13
    3f79:	45 0f 28 f2          	movaps %xmm10,%xmm14
    3f7d:	45 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm13
    3f82:	45 0f 15 f2          	unpckhps %xmm10,%xmm14
    3f86:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    3f8b:	f3 44 0f 58 f0       	addss  %xmm0,%xmm14
    3f90:	41 0f 28 c2          	movaps %xmm10,%xmm0
    3f94:	41 0f c6 c2 ff       	shufps $0xff,%xmm10,%xmm0
    3f99:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
  for (i=0;i<dim;i++)
    3f9e:	e9 c4 f2 ff ff       	jmpq   3267 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x287>
    pthread_mutex_lock(&mutex);
    3fa3:	48 8d 3d 16 b1 00 00 	lea    0xb116(%rip),%rdi        # f0c0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5mutex>
    3faa:	e8 f1 e4 ff ff       	callq  24a0 <pthread_mutex_lock@plt>
    pthread_mutex_unlock(&mutex);
    3faf:	48 8d 3d 0a b1 00 00 	lea    0xb10a(%rip),%rdi        # f0c0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5mutex>
    open = true;
    3fb6:	c6 05 3b b1 00 00 01 	movb   $0x1,0xb13b(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
    pthread_mutex_unlock(&mutex);
    3fbd:	e8 9e e3 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
    pthread_cond_broadcast(&cond);
    3fc2:	48 8d 3d b7 b0 00 00 	lea    0xb0b7(%rip),%rdi        # f080 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4cond>
    3fc9:	e8 32 e3 ff ff       	callq  2300 <pthread_cond_broadcast@plt>
  pthread_barrier_wait(barrier);
    3fce:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    3fd3:	e8 78 71 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  open = false;
    3fd8:	c6 05 19 b1 00 00 00 	movb   $0x0,0xb119(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
  for( int k = k1; k < k2; k++ )  {
    3fdf:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    3fe4:	48 39 74 24 28       	cmp    %rsi,0x28(%rsp)
    3fe9:	0f 8e 88 06 00 00    	jle    4677 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1697>
    3fef:	45 31 d2             	xor    %r10d,%r10d
    3ff2:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
    mytotal += points->p[k].cost;
    3ff7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    3ffc:	66 0f ef c0          	pxor   %xmm0,%xmm0
    4000:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
    4005:	4d 89 dc             	mov    %r11,%r12
    4008:	4c 8b 47 10          	mov    0x10(%rdi),%r8
    400c:	4d 89 df             	mov    %r11,%r15
    400f:	49 8d 53 01          	lea    0x1(%r11),%rdx
    4013:	49 f7 d4             	not    %r12
    4016:	49 c1 e7 05          	shl    $0x5,%r15
    401a:	4d 01 f4             	add    %r14,%r12
    401d:	f3 43 0f 5a 44 38 18 	cvtss2sd 0x18(%r8,%r15,1),%xmm0
    4024:	f2 0f 58 05 9c 85 00 	addsd  0x859c(%rip),%xmm0        # c5c8 <_ZTS10FileStream+0x20>
    402b:	00 
    402c:	41 83 e4 07          	and    $0x7,%r12d
  for( int k = k1; k < k2; k++ )  {
    4030:	49 39 d6             	cmp    %rdx,%r14
    4033:	0f 8e d2 01 00 00    	jle    420b <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x122b>
    4039:	4d 85 e4             	test   %r12,%r12
    403c:	0f 84 fd 00 00 00    	je     413f <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x115f>
    4042:	49 83 fc 01          	cmp    $0x1,%r12
    4046:	0f 84 ce 00 00 00    	je     411a <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x113a>
    404c:	49 83 fc 02          	cmp    $0x2,%r12
    4050:	0f 84 aa 00 00 00    	je     4100 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1120>
    4056:	49 83 fc 03          	cmp    $0x3,%r12
    405a:	0f 84 84 00 00 00    	je     40e4 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1104>
    4060:	49 83 fc 04          	cmp    $0x4,%r12
    4064:	74 62                	je     40c8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x10e8>
    4066:	49 83 fc 05          	cmp    $0x5,%r12
    406a:	74 40                	je     40ac <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x10cc>
    406c:	49 83 fc 06          	cmp    $0x6,%r12
    4070:	74 1e                	je     4090 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x10b0>
    mytotal += points->p[k].cost;
    4072:	48 c1 e2 05          	shl    $0x5,%rdx
    4076:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    407b:	f3 45 0f 5a 5c 10 18 	cvtss2sd 0x18(%r8,%rdx,1),%xmm11
    4082:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    4087:	f2 41 0f 58 c3       	addsd  %xmm11,%xmm0
  for( int k = k1; k < k2; k++ )  {
    408c:	48 83 c2 02          	add    $0x2,%rdx
    mytotal += points->p[k].cost;
    4090:	49 89 d5             	mov    %rdx,%r13
    4093:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    4098:	48 83 c2 01          	add    $0x1,%rdx
    409c:	49 c1 e5 05          	shl    $0x5,%r13
    40a0:	f3 47 0f 5a 64 28 18 	cvtss2sd 0x18(%r8,%r13,1),%xmm12
    40a7:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
    40ac:	48 89 d0             	mov    %rdx,%rax
    40af:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    40b4:	48 83 c2 01          	add    $0x1,%rdx
    40b8:	48 c1 e0 05          	shl    $0x5,%rax
    40bc:	f3 45 0f 5a 6c 00 18 	cvtss2sd 0x18(%r8,%rax,1),%xmm13
    40c3:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    40c8:	48 89 d3             	mov    %rdx,%rbx
    40cb:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    40d0:	48 83 c2 01          	add    $0x1,%rdx
    40d4:	48 c1 e3 05          	shl    $0x5,%rbx
    40d8:	f3 45 0f 5a 74 18 18 	cvtss2sd 0x18(%r8,%rbx,1),%xmm14
    40df:	f2 41 0f 58 c6       	addsd  %xmm14,%xmm0
    40e4:	48 89 d5             	mov    %rdx,%rbp
    40e7:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    40ec:	48 83 c2 01          	add    $0x1,%rdx
    40f0:	48 c1 e5 05          	shl    $0x5,%rbp
    40f4:	f3 45 0f 5a 7c 28 18 	cvtss2sd 0x18(%r8,%rbp,1),%xmm15
    40fb:	f2 41 0f 58 c7       	addsd  %xmm15,%xmm0
    4100:	48 89 d1             	mov    %rdx,%rcx
    4103:	66 0f ef db          	pxor   %xmm3,%xmm3
    4107:	48 83 c2 01          	add    $0x1,%rdx
    410b:	48 c1 e1 05          	shl    $0x5,%rcx
    410f:	f3 41 0f 5a 5c 08 18 	cvtss2sd 0x18(%r8,%rcx,1),%xmm3
    4116:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
    411a:	49 89 d1             	mov    %rdx,%r9
    411d:	66 0f ef e4          	pxor   %xmm4,%xmm4
    4121:	48 83 c2 01          	add    $0x1,%rdx
    4125:	49 c1 e1 05          	shl    $0x5,%r9
    4129:	f3 43 0f 5a 64 08 18 	cvtss2sd 0x18(%r8,%r9,1),%xmm4
    4130:	f2 0f 58 c4          	addsd  %xmm4,%xmm0
  for( int k = k1; k < k2; k++ )  {
    4134:	48 39 54 24 28       	cmp    %rdx,0x28(%rsp)
    4139:	0f 8e cc 00 00 00    	jle    420b <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x122b>
    mytotal += points->p[k].cost;
    413f:	66 0f ef ff          	pxor   %xmm7,%xmm7
    4143:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
    4147:	66 0f ef d2          	pxor   %xmm2,%xmm2
    414b:	48 89 d6             	mov    %rdx,%rsi
    414e:	48 c1 e6 05          	shl    $0x5,%rsi
    4152:	48 c1 e7 05          	shl    $0x5,%rdi
    4156:	4c 8d 5a 02          	lea    0x2(%rdx),%r11
    415a:	66 0f ef ed          	pxor   %xmm5,%xmm5
    415e:	f3 41 0f 5a 7c 30 18 	cvtss2sd 0x18(%r8,%rsi,1),%xmm7
    4165:	f2 0f 58 c7          	addsd  %xmm7,%xmm0
    4169:	49 c1 e3 05          	shl    $0x5,%r11
    416d:	f3 41 0f 5a 54 38 18 	cvtss2sd 0x18(%r8,%rdi,1),%xmm2
    4174:	f3 43 0f 5a 6c 18 18 	cvtss2sd 0x18(%r8,%r11,1),%xmm5
    417b:	4c 8d 62 03          	lea    0x3(%rdx),%r12
    417f:	4c 8d 72 04          	lea    0x4(%rdx),%r14
    4183:	66 0f ef c9          	pxor   %xmm1,%xmm1
    4187:	49 c1 e4 05          	shl    $0x5,%r12
    418b:	49 c1 e6 05          	shl    $0x5,%r14
    418f:	4c 8d 7a 05          	lea    0x5(%rdx),%r15
    4193:	66 0f ef f6          	pxor   %xmm6,%xmm6
    4197:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
    419b:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    41a0:	49 c1 e7 05          	shl    $0x5,%r15
    41a4:	4c 8d 6a 06          	lea    0x6(%rdx),%r13
    41a8:	f3 47 0f 5a 44 20 18 	cvtss2sd 0x18(%r8,%r12,1),%xmm8
    41af:	f3 43 0f 5a 4c 30 18 	cvtss2sd 0x18(%r8,%r14,1),%xmm1
    41b6:	f3 43 0f 5a 74 38 18 	cvtss2sd 0x18(%r8,%r15,1),%xmm6
    41bd:	49 c1 e5 05          	shl    $0x5,%r13
    41c1:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    41c6:	48 8d 42 07          	lea    0x7(%rdx),%rax
    41ca:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    41cf:	48 83 c2 08          	add    $0x8,%rdx
    41d3:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
    41d7:	f3 47 0f 5a 4c 28 18 	cvtss2sd 0x18(%r8,%r13,1),%xmm9
    41de:	48 c1 e0 05          	shl    $0x5,%rax
    41e2:	f3 45 0f 5a 54 00 18 	cvtss2sd 0x18(%r8,%rax,1),%xmm10
    41e9:	f2 41 0f 58 c0       	addsd  %xmm8,%xmm0
    41ee:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    41f2:	f2 0f 58 c6          	addsd  %xmm6,%xmm0
    41f6:	f2 41 0f 58 c1       	addsd  %xmm9,%xmm0
    41fb:	f2 41 0f 58 c2       	addsd  %xmm10,%xmm0
  for( int k = k1; k < k2; k++ )  {
    4200:	48 39 54 24 28       	cmp    %rdx,0x28(%rsp)
    4205:	0f 8f 34 ff ff ff    	jg     413f <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x115f>
  costs[pid] = mytotal;
    420b:	4c 8b 05 de ae 00 00 	mov    0xaede(%rip),%r8        # f0f0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5costs>
  pthread_barrier_wait(barrier);
    4212:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  costs[pid] = mytotal;
    4217:	f2 43 0f 11 04 10    	movsd  %xmm0,(%r8,%r10,1)
  pthread_barrier_wait(barrier);
    421d:	e8 2e 6f 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid == 0 )
    4222:	44 8b 54 24 5c       	mov    0x5c(%rsp),%r10d
    4227:	45 85 d2             	test   %r10d,%r10d
    422a:	0f 85 e1 01 00 00    	jne    4411 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1431>
      totalcost=z*(*kcenter);
    4230:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
    4235:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    423a:	66 0f ef c0          	pxor   %xmm0,%xmm0
      for( int i = 0; i < nproc; i++ )
    423e:	44 8b 05 c3 ae 00 00 	mov    0xaec3(%rip),%r8d        # f108 <_ZL5nproc>
    4245:	48 8b 3d a4 ae 00 00 	mov    0xaea4(%rip),%rdi        # f0f0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5costs>
      totalcost=z*(*kcenter);
    424c:	f3 4c 0f 2a 1b       	cvtsi2ssq (%rbx),%xmm11
    4251:	f3 44 0f 59 5c 24 58 	mulss  0x58(%rsp),%xmm11
    4258:	f3 41 0f 5a c3       	cvtss2sd %xmm11,%xmm0
    425d:	f2 0f 11 05 9b ae 00 	movsd  %xmm0,0xae9b(%rip)        # f100 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE9totalcost>
    4264:	00 
      for( int i = 0; i < nproc; i++ )
    4265:	45 85 c0             	test   %r8d,%r8d
    4268:	0f 8e 2a 03 00 00    	jle    4598 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15b8>
    426e:	41 83 f8 01          	cmp    $0x1,%r8d
    4272:	0f 84 1c 04 00 00    	je     4694 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x16b4>
    4278:	44 89 c6             	mov    %r8d,%esi
    427b:	d1 ee                	shr    %esi
    427d:	83 fe 04             	cmp    $0x4,%esi
    4280:	0f 86 b9 01 00 00    	jbe    443f <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x145f>
    4286:	44 8d 66 fb          	lea    -0x5(%rsi),%r12d
    428a:	48 89 fd             	mov    %rdi,%rbp
    428d:	31 c9                	xor    %ecx,%ecx
    428f:	41 83 e4 fc          	and    $0xfffffffc,%r12d
    4293:	45 8d 4c 24 04       	lea    0x4(%r12),%r9d
    4298:	41 f6 c4 04          	test   $0x4,%r12b
    429c:	74 5f                	je     42fd <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x131d>
	  totalcost += costs[i];
    429e:	f2 44 0f 10 27       	movsd  (%rdi),%xmm12
    42a3:	f2 44 0f 10 6f 08    	movsd  0x8(%rdi),%xmm13
    42a9:	48 8d 6f 40          	lea    0x40(%rdi),%rbp
    42ad:	b9 04 00 00 00       	mov    $0x4,%ecx
    42b2:	f2 44 0f 10 77 10    	movsd  0x10(%rdi),%xmm14
    42b8:	f2 44 0f 10 7f 18    	movsd  0x18(%rdi),%xmm15
    42be:	0f 18 8f d0 01 00 00 	prefetcht0 0x1d0(%rdi)
    42c5:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
    42ca:	f2 0f 10 5f 20       	movsd  0x20(%rdi),%xmm3
    42cf:	f2 0f 10 67 28       	movsd  0x28(%rdi),%xmm4
    42d4:	f2 0f 10 7f 30       	movsd  0x30(%rdi),%xmm7
    42d9:	f2 0f 10 57 38       	movsd  0x38(%rdi),%xmm2
    42de:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    42e3:	f2 41 0f 58 c6       	addsd  %xmm14,%xmm0
    42e8:	f2 41 0f 58 c7       	addsd  %xmm15,%xmm0
    42ed:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
    42f1:	f2 0f 58 c4          	addsd  %xmm4,%xmm0
    42f5:	f2 0f 58 c7          	addsd  %xmm7,%xmm0
    42f9:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
    42fd:	f2 0f 10 6d 00       	movsd  0x0(%rbp),%xmm5
    4302:	f2 44 0f 10 45 08    	movsd  0x8(%rbp),%xmm8
    4308:	4c 8d 5d 40          	lea    0x40(%rbp),%r11
    430c:	0f 18 8d d0 01 00 00 	prefetcht0 0x1d0(%rbp)
    4313:	f2 0f 10 4d 10       	movsd  0x10(%rbp),%xmm1
    4318:	f2 0f 10 75 18       	movsd  0x18(%rbp),%xmm6
    431d:	4d 89 de             	mov    %r11,%r14
    4320:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
    4324:	f2 44 0f 10 4d 20    	movsd  0x20(%rbp),%xmm9
    432a:	f2 44 0f 10 55 28    	movsd  0x28(%rbp),%xmm10
    4330:	f2 44 0f 10 5d 30    	movsd  0x30(%rbp),%xmm11
    4336:	f2 44 0f 10 65 38    	movsd  0x38(%rbp),%xmm12
    433c:	f2 41 0f 58 c0       	addsd  %xmm8,%xmm0
    4341:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    4345:	f2 0f 58 c6          	addsd  %xmm6,%xmm0
    4349:	f2 41 0f 58 c1       	addsd  %xmm9,%xmm0
    434e:	f2 41 0f 58 c2       	addsd  %xmm10,%xmm0
    4353:	f2 41 0f 58 c3       	addsd  %xmm11,%xmm0
    4358:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
      for( int i = 0; i < nproc; i++ )
    435d:	44 39 e1             	cmp    %r12d,%ecx
    4360:	0f 84 df 00 00 00    	je     4445 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1465>
	  totalcost += costs[i];
    4366:	f2 44 0f 10 6d 40    	movsd  0x40(%rbp),%xmm13
    436c:	f2 44 0f 10 75 48    	movsd  0x48(%rbp),%xmm14
    4372:	83 c1 08             	add    $0x8,%ecx
    4375:	0f 18 8d 10 02 00 00 	prefetcht0 0x210(%rbp)
    437c:	f2 45 0f 10 7b 10    	movsd  0x10(%r11),%xmm15
    4382:	f2 41 0f 10 5b 18    	movsd  0x18(%r11),%xmm3
    4388:	48 83 ed 80          	sub    $0xffffffffffffff80,%rbp
    438c:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    4391:	f2 41 0f 10 63 20    	movsd  0x20(%r11),%xmm4
    4397:	f2 41 0f 10 7b 28    	movsd  0x28(%r11),%xmm7
    439d:	66 41 0f 10 6b 30    	movupd 0x30(%r11),%xmm5
    43a3:	f2 41 0f 58 c6       	addsd  %xmm14,%xmm0
    43a8:	f2 41 0f 58 c7       	addsd  %xmm15,%xmm0
    43ad:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
    43b1:	f2 0f 58 c4          	addsd  %xmm4,%xmm0
    43b5:	f2 0f 58 c7          	addsd  %xmm7,%xmm0
    43b9:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
    43bd:	66 0f 15 ed          	unpckhpd %xmm5,%xmm5
    43c1:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
      for( int i = 0; i < nproc; i++ )
    43c5:	e9 33 ff ff ff       	jmpq   42fd <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x131d>
  pthread_barrier_wait(barrier);
    43ca:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    43cf:	e8 7c 6d 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  open = false;
    43d4:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
  for( int k = k1; k < k2; k++ )  {
    43d9:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  open = false;
    43de:	c6 05 13 ad 00 00 00 	movb   $0x0,0xad13(%rip)        # f0f8 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE4open>
  for( int k = k1; k < k2; k++ )  {
    43e5:	4e 8d 14 f5 00 00 00 	lea    0x0(,%r14,8),%r10
    43ec:	00 
    43ed:	48 39 44 24 28       	cmp    %rax,0x28(%rsp)
    43f2:	0f 8f fa fb ff ff    	jg     3ff2 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1012>
  costs[pid] = mytotal;
    43f8:	48 8b 3d f1 ac 00 00 	mov    0xacf1(%rip),%rdi        # f0f0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5costs>
    43ff:	4a c7 04 f7 00 00 00 	movq   $0x0,(%rdi,%r14,8)
    4406:	00 
  pthread_barrier_wait(barrier);
    4407:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    440c:	e8 3f 6d 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  pthread_barrier_wait(barrier);
    4411:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    4416:	e8 35 6d 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  return(totalcost);
    441b:	66 0f ef c0          	pxor   %xmm0,%xmm0
    441f:	f2 0f 5a 05 d9 ac 00 	cvtsd2ss 0xacd9(%rip),%xmm0        # f100 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE9totalcost>
    4426:	00 
}
    4427:	48 83 c4 78          	add    $0x78,%rsp
    442b:	5b                   	pop    %rbx
    442c:	5d                   	pop    %rbp
    442d:	41 5c                	pop    %r12
    442f:	41 5d                	pop    %r13
    4431:	41 5e                	pop    %r14
    4433:	41 5f                	pop    %r15
    4435:	c3                   	retq   
  float result=0.0;
    4436:	66 0f ef c0          	pxor   %xmm0,%xmm0
    443a:	e9 b5 fa ff ff       	jmpq   3ef4 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xf14>
      for( int i = 0; i < nproc; i++ )
    443f:	49 89 fe             	mov    %rdi,%r14
    4442:	45 31 c9             	xor    %r9d,%r9d
    4445:	f2 45 0f 10 06       	movsd  (%r14),%xmm8
    444a:	45 89 cf             	mov    %r9d,%r15d
    444d:	45 8d 51 01          	lea    0x1(%r9),%r10d
    4451:	4d 8d 6e 10          	lea    0x10(%r14),%r13
    4455:	41 f7 d7             	not    %r15d
	  totalcost += costs[i];
    4458:	f2 41 0f 10 4e 08    	movsd  0x8(%r14),%xmm1
    445e:	f2 41 0f 58 c0       	addsd  %xmm8,%xmm0
    4463:	41 01 f7             	add    %esi,%r15d
    4466:	41 83 e7 07          	and    $0x7,%r15d
    446a:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
      for( int i = 0; i < nproc; i++ )
    446e:	44 39 d6             	cmp    %r10d,%esi
    4471:	0f 86 07 01 00 00    	jbe    457e <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x159e>
    4477:	45 85 ff             	test   %r15d,%r15d
    447a:	0f 84 39 01 00 00    	je     45b9 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15d9>
    4480:	41 83 ff 01          	cmp    $0x1,%r15d
    4484:	0f 84 d2 00 00 00    	je     455c <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x157c>
    448a:	41 83 ff 02          	cmp    $0x2,%r15d
    448e:	0f 84 ac 00 00 00    	je     4540 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1560>
    4494:	41 83 ff 03          	cmp    $0x3,%r15d
    4498:	0f 84 86 00 00 00    	je     4524 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1544>
    449e:	41 83 ff 04          	cmp    $0x4,%r15d
    44a2:	74 62                	je     4506 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1526>
    44a4:	41 83 ff 05          	cmp    $0x5,%r15d
    44a8:	74 3e                	je     44e8 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1508>
    44aa:	41 83 ff 06          	cmp    $0x6,%r15d
    44ae:	74 1a                	je     44ca <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x14ea>
	  totalcost += costs[i];
    44b0:	66 41 0f 10 75 00    	movupd 0x0(%r13),%xmm6
    44b6:	45 8d 51 02          	lea    0x2(%r9),%r10d
    44ba:	4d 8d 6e 20          	lea    0x20(%r14),%r13
    44be:	f2 0f 58 c6          	addsd  %xmm6,%xmm0
    44c2:	66 0f 15 f6          	unpckhpd %xmm6,%xmm6
    44c6:	f2 0f 58 c6          	addsd  %xmm6,%xmm0
    44ca:	f2 45 0f 10 55 00    	movsd  0x0(%r13),%xmm10
    44d0:	f2 45 0f 10 5d 08    	movsd  0x8(%r13),%xmm11
    44d6:	41 83 c2 01          	add    $0x1,%r10d
    44da:	49 83 c5 10          	add    $0x10,%r13
    44de:	f2 41 0f 58 c2       	addsd  %xmm10,%xmm0
    44e3:	f2 41 0f 58 c3       	addsd  %xmm11,%xmm0
    44e8:	f2 45 0f 10 65 00    	movsd  0x0(%r13),%xmm12
    44ee:	f2 45 0f 10 6d 08    	movsd  0x8(%r13),%xmm13
    44f4:	41 83 c2 01          	add    $0x1,%r10d
    44f8:	49 83 c5 10          	add    $0x10,%r13
    44fc:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
    4501:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    4506:	f2 45 0f 10 75 00    	movsd  0x0(%r13),%xmm14
    450c:	f2 45 0f 10 7d 08    	movsd  0x8(%r13),%xmm15
    4512:	41 83 c2 01          	add    $0x1,%r10d
    4516:	49 83 c5 10          	add    $0x10,%r13
    451a:	f2 41 0f 58 c6       	addsd  %xmm14,%xmm0
    451f:	f2 41 0f 58 c7       	addsd  %xmm15,%xmm0
    4524:	f2 41 0f 10 5d 00    	movsd  0x0(%r13),%xmm3
    452a:	f2 41 0f 10 65 08    	movsd  0x8(%r13),%xmm4
    4530:	41 83 c2 01          	add    $0x1,%r10d
    4534:	49 83 c5 10          	add    $0x10,%r13
    4538:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
    453c:	f2 0f 58 c4          	addsd  %xmm4,%xmm0
    4540:	f2 41 0f 10 7d 00    	movsd  0x0(%r13),%xmm7
    4546:	f2 41 0f 10 6d 08    	movsd  0x8(%r13),%xmm5
    454c:	41 83 c2 01          	add    $0x1,%r10d
    4550:	49 83 c5 10          	add    $0x10,%r13
    4554:	f2 0f 58 c7          	addsd  %xmm7,%xmm0
    4558:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
    455c:	f2 41 0f 10 55 00    	movsd  0x0(%r13),%xmm2
    4562:	f2 45 0f 10 45 08    	movsd  0x8(%r13),%xmm8
    4568:	41 83 c2 01          	add    $0x1,%r10d
    456c:	49 83 c5 10          	add    $0x10,%r13
    4570:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
    4574:	f2 41 0f 58 c0       	addsd  %xmm8,%xmm0
      for( int i = 0; i < nproc; i++ )
    4579:	44 39 d6             	cmp    %r10d,%esi
    457c:	77 3b                	ja     45b9 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15d9>
    457e:	44 89 c0             	mov    %r8d,%eax
    4581:	83 e0 fe             	and    $0xfffffffe,%eax
    4584:	44 39 c0             	cmp    %r8d,%eax
    4587:	74 07                	je     4590 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15b0>
	  totalcost += costs[i];
    4589:	48 98                	cltq   
    458b:	f2 0f 58 04 c7       	addsd  (%rdi,%rax,8),%xmm0
      for( int i = 0; i < nproc; i++ )
    4590:	f2 0f 11 05 68 ab 00 	movsd  %xmm0,0xab68(%rip)        # f100 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE9totalcost>
    4597:	00 
      free(costs);
    4598:	e8 93 de ff ff       	callq  2430 <free@plt>
    459d:	e9 6f fe ff ff       	jmpq   4411 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1431>
  for (i=0;i<dim;i++)
    45a2:	31 c0                	xor    %eax,%eax
  float result=0.0;
    45a4:	66 0f ef c0          	pxor   %xmm0,%xmm0
    45a8:	e9 f2 f8 ff ff       	jmpq   3e9f <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xebf>
  for (i=0;i<dim;i++)
    45ad:	45 31 ed             	xor    %r13d,%r13d
    45b0:	66 0f ef c0          	pxor   %xmm0,%xmm0
    45b4:	e9 b3 f6 ff ff       	jmpq   3c6c <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0xc8c>
	  totalcost += costs[i];
    45b9:	f2 41 0f 10 4d 00    	movsd  0x0(%r13),%xmm1
    45bf:	f2 41 0f 10 75 08    	movsd  0x8(%r13),%xmm6
    45c5:	41 83 c2 08          	add    $0x8,%r10d
    45c9:	49 83 ed 80          	sub    $0xffffffffffffff80,%r13
    45cd:	f2 45 0f 10 4d 90    	movsd  -0x70(%r13),%xmm9
    45d3:	f2 45 0f 10 55 98    	movsd  -0x68(%r13),%xmm10
    45d9:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    45dd:	f2 45 0f 10 5d a0    	movsd  -0x60(%r13),%xmm11
    45e3:	f2 45 0f 10 65 a8    	movsd  -0x58(%r13),%xmm12
    45e9:	f2 45 0f 10 6d b0    	movsd  -0x50(%r13),%xmm13
    45ef:	f2 45 0f 10 75 b8    	movsd  -0x48(%r13),%xmm14
    45f5:	f2 45 0f 10 7d c0    	movsd  -0x40(%r13),%xmm15
    45fb:	f2 41 0f 10 5d c8    	movsd  -0x38(%r13),%xmm3
    4601:	f2 0f 58 c6          	addsd  %xmm6,%xmm0
    4605:	f2 41 0f 10 65 d0    	movsd  -0x30(%r13),%xmm4
    460b:	f2 41 0f 10 7d d8    	movsd  -0x28(%r13),%xmm7
    4611:	f2 41 0f 10 6d e0    	movsd  -0x20(%r13),%xmm5
    4617:	f2 41 0f 10 55 e8    	movsd  -0x18(%r13),%xmm2
    461d:	f2 45 0f 10 45 f0    	movsd  -0x10(%r13),%xmm8
    4623:	f2 41 0f 10 4d f8    	movsd  -0x8(%r13),%xmm1
    4629:	f2 41 0f 58 c1       	addsd  %xmm9,%xmm0
    462e:	f2 41 0f 58 c2       	addsd  %xmm10,%xmm0
    4633:	f2 41 0f 58 c3       	addsd  %xmm11,%xmm0
    4638:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
    463d:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    4642:	f2 41 0f 58 c6       	addsd  %xmm14,%xmm0
    4647:	f2 41 0f 58 c7       	addsd  %xmm15,%xmm0
    464c:	f2 0f 58 c3          	addsd  %xmm3,%xmm0
    4650:	f2 0f 58 c4          	addsd  %xmm4,%xmm0
    4654:	f2 0f 58 c7          	addsd  %xmm7,%xmm0
    4658:	f2 0f 58 c5          	addsd  %xmm5,%xmm0
    465c:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
    4660:	f2 41 0f 58 c0       	addsd  %xmm8,%xmm0
    4665:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
      for( int i = 0; i < nproc; i++ )
    4669:	44 39 d6             	cmp    %r10d,%esi
    466c:	0f 87 47 ff ff ff    	ja     45b9 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15d9>
    4672:	e9 07 ff ff ff       	jmpq   457e <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x159e>
  costs[pid] = mytotal;
    4677:	48 8b 15 72 aa 00 00 	mov    0xaa72(%rip),%rdx        # f0f0 <_ZZ7pspeedyP6PointsfPliP16parsec_barrier_tE5costs>
  pthread_barrier_wait(barrier);
    467e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  costs[pid] = mytotal;
    4683:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
  pthread_barrier_wait(barrier);
    468a:	e8 c1 6a 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid == 0 )
    468f:	e9 9c fb ff ff       	jmpq   4230 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x1250>
      for( int i = 0; i < nproc; i++ )
    4694:	31 c0                	xor    %eax,%eax
    4696:	e9 ee fe ff ff       	jmpq   4589 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t+0x15a9>
    469b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000046a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>:
{
    46a0:	f3 0f 1e fa          	endbr64 
    46a4:	41 57                	push   %r15
    46a6:	41 56                	push   %r14
    46a8:	49 89 f6             	mov    %rsi,%r14
    46ab:	41 55                	push   %r13
    46ad:	41 54                	push   %r12
    46af:	55                   	push   %rbp
    46b0:	53                   	push   %rbx
    46b1:	89 cb                	mov    %ecx,%ebx
  long k1 = bsize * pid;
    46b3:	48 63 eb             	movslq %ebx,%rbp
{
    46b6:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    46bd:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
    46c2:	4c 89 c7             	mov    %r8,%rdi
    46c5:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
    46ca:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    46cf:	89 4c 24 34          	mov    %ecx,0x34(%rsp)
    46d3:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
    46d8:	f2 0f 11 44 24 18    	movsd  %xmm0,0x18(%rsp)
  pthread_barrier_wait(barrier);
    46de:	e8 6d 6a 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  long bsize = points->num/nproc;
    46e3:	4d 8b 3e             	mov    (%r14),%r15
    46e6:	48 63 35 1b aa 00 00 	movslq 0xaa1b(%rip),%rsi        # f108 <_ZL5nproc>
    46ed:	4c 89 f8             	mov    %r15,%rax
  if( pid == nproc-1 ) k2 = points->num;
    46f0:	44 8d 46 ff          	lea    -0x1(%rsi),%r8d
  long bsize = points->num/nproc;
    46f4:	48 89 f1             	mov    %rsi,%rcx
    46f7:	48 99                	cqto   
    46f9:	48 f7 fe             	idiv   %rsi
  long k1 = bsize * pid;
    46fc:	48 0f af e8          	imul   %rax,%rbp
  long bsize = points->num/nproc;
    4700:	49 89 c5             	mov    %rax,%r13
  long k1 = bsize * pid;
    4703:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
  if( pid == nproc-1 ) k2 = points->num;
    4708:	41 39 d8             	cmp    %ebx,%r8d
    470b:	0f 84 8e 18 00 00    	je     5f9f <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18ff>
  long k2 = k1 + bsize;
    4711:	4c 8d 3c 28          	lea    (%rax,%rbp,1),%r15
  int stride = *numcenters+2;
    4715:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
    471a:	4d 8b 11             	mov    (%r9),%r10
    471d:	41 8d 6a 02          	lea    0x2(%r10),%ebp
  if( stride % cl != 0 ) { 
    4721:	41 89 eb             	mov    %ebp,%r11d
    4724:	41 c1 fb 1f          	sar    $0x1f,%r11d
    4728:	41 c1 eb 1e          	shr    $0x1e,%r11d
    472c:	46 8d 64 1d 00       	lea    0x0(%rbp,%r11,1),%r12d
    4731:	41 83 e4 03          	and    $0x3,%r12d
    4735:	45 39 dc             	cmp    %r11d,%r12d
    4738:	74 14                	je     474e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xae>
    stride = cl * ( stride / cl + 1);
    473a:	41 83 c2 05          	add    $0x5,%r10d
    473e:	85 ed                	test   %ebp,%ebp
    4740:	41 0f 48 ea          	cmovs  %r10d,%ebp
    4744:	c1 fd 02             	sar    $0x2,%ebp
    4747:	8d 2c ad 04 00 00 00 	lea    0x4(,%rbp,4),%ebp
  int K = stride -2 ; // K==*numcenters
    474e:	8b 74 24 34          	mov    0x34(%rsp),%esi
    4752:	48 63 5c 24 58       	movslq 0x58(%rsp),%rbx
    4757:	44 8d 75 fe          	lea    -0x2(%rbp),%r14d
    475b:	44 89 74 24 70       	mov    %r14d,0x70(%rsp)
  if( pid==0 )    { 
    4760:	89 f0                	mov    %esi,%eax
    4762:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
    4767:	48 63 dd             	movslq %ebp,%rbx
    476a:	0f af c5             	imul   %ebp,%eax
    476d:	48 c1 e3 03          	shl    $0x3,%rbx
    4771:	4c 63 e0             	movslq %eax,%r12
    4774:	89 44 24 74          	mov    %eax,0x74(%rsp)
    4778:	4a 8d 14 e5 00 00 00 	lea    0x0(,%r12,8),%rdx
    477f:	00 
    4780:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    4785:	85 f6                	test   %esi,%esi
    4787:	0f 84 1f 18 00 00    	je     5fac <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x190c>
  pthread_barrier_wait(barrier);
    478d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4792:	e8 b9 69 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    4797:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
    479c:	0f 8e 1b 19 00 00    	jle    60bd <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1a1d>
    47a2:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    if( is_center[i] ) {
    47a7:	4c 8b 15 6a a9 00 00 	mov    0xa96a(%rip),%r10        # f118 <_ZL9is_center>
  int count = 0;
    47ae:	31 c9                	xor    %ecx,%ecx
      center_table[i] = count++;
    47b0:	4c 8b 1d 59 a9 00 00 	mov    0xa959(%rip),%r11        # f110 <_ZL12center_table>
    47b7:	48 89 f2             	mov    %rsi,%rdx
    47ba:	48 f7 d2             	not    %rdx
    47bd:	4c 01 fa             	add    %r15,%rdx
    47c0:	83 e2 07             	and    $0x7,%edx
    if( is_center[i] ) {
    47c3:	41 80 3c 32 00       	cmpb   $0x0,(%r10,%rsi,1)
    47c8:	0f 85 2f 04 00 00    	jne    4bfd <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x55d>
  for( int i = k1; i < k2; i++ ) {
    47ce:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    47d3:	48 83 c0 01          	add    $0x1,%rax
    47d7:	49 39 c7             	cmp    %rax,%r15
    47da:	0f 8e 48 01 00 00    	jle    4928 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x288>
    47e0:	48 85 d2             	test   %rdx,%rdx
    47e3:	0f 84 9f 00 00 00    	je     4888 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1e8>
    47e9:	48 83 fa 01          	cmp    $0x1,%rdx
    47ed:	74 7e                	je     486d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1cd>
    47ef:	48 83 fa 02          	cmp    $0x2,%rdx
    47f3:	74 69                	je     485e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1be>
    47f5:	48 83 fa 03          	cmp    $0x3,%rdx
    47f9:	74 51                	je     484c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1ac>
    47fb:	48 83 fa 04          	cmp    $0x4,%rdx
    47ff:	74 3c                	je     483d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19d>
    4801:	48 83 fa 05          	cmp    $0x5,%rdx
    4805:	74 27                	je     482e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18e>
    4807:	48 83 fa 06          	cmp    $0x6,%rdx
    480b:	74 0f                	je     481c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17c>
    if( is_center[i] ) {
    480d:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4812:	0f 85 20 19 00 00    	jne    6138 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1a98>
  for( int i = k1; i < k2; i++ ) {
    4818:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    481c:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4821:	74 07                	je     482a <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18a>
      center_table[i] = count++;
    4823:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    4827:	83 c1 01             	add    $0x1,%ecx
  for( int i = k1; i < k2; i++ ) {
    482a:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    482e:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4833:	0f 85 51 18 00 00    	jne    608a <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19ea>
  for( int i = k1; i < k2; i++ ) {
    4839:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    483d:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4842:	0f 85 03 18 00 00    	jne    604b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19ab>
  for( int i = k1; i < k2; i++ ) {
    4848:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    484c:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4851:	74 07                	je     485a <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1ba>
      center_table[i] = count++;
    4853:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    4857:	83 c1 01             	add    $0x1,%ecx
  for( int i = k1; i < k2; i++ ) {
    485a:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    485e:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4863:	0f 85 fb 0e 00 00    	jne    5764 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x10c4>
  for( int i = k1; i < k2; i++ ) {
    4869:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    486d:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    4872:	74 07                	je     487b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1db>
      center_table[i] = count++;
    4874:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    4878:	83 c1 01             	add    $0x1,%ecx
  for( int i = k1; i < k2; i++ ) {
    487b:	48 83 c0 01          	add    $0x1,%rax
    487f:	49 39 c7             	cmp    %rax,%r15
    4882:	0f 8e a0 00 00 00    	jle    4928 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x288>
    if( is_center[i] ) {
    4888:	41 80 3c 02 00       	cmpb   $0x0,(%r10,%rax,1)
    488d:	74 07                	je     4896 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1f6>
      center_table[i] = count++;
    488f:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    4893:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    4896:	41 80 7c 02 01 00    	cmpb   $0x0,0x1(%r10,%rax,1)
    489c:	4c 8d 70 01          	lea    0x1(%rax),%r14
    48a0:	74 07                	je     48a9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x209>
      center_table[i] = count++;
    48a2:	43 89 0c b3          	mov    %ecx,(%r11,%r14,4)
    48a6:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    48a9:	43 80 7c 32 01 00    	cmpb   $0x0,0x1(%r10,%r14,1)
    48af:	49 8d 46 01          	lea    0x1(%r14),%rax
    48b3:	74 07                	je     48bc <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x21c>
      center_table[i] = count++;
    48b5:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    48b9:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    48bc:	43 80 7c 32 02 00    	cmpb   $0x0,0x2(%r10,%r14,1)
    48c2:	49 8d 7e 02          	lea    0x2(%r14),%rdi
    48c6:	74 07                	je     48cf <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x22f>
      center_table[i] = count++;
    48c8:	41 89 0c bb          	mov    %ecx,(%r11,%rdi,4)
    48cc:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    48cf:	43 80 7c 32 03 00    	cmpb   $0x0,0x3(%r10,%r14,1)
    48d5:	4d 8d 46 03          	lea    0x3(%r14),%r8
    48d9:	74 07                	je     48e2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x242>
      center_table[i] = count++;
    48db:	43 89 0c 83          	mov    %ecx,(%r11,%r8,4)
    48df:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    48e2:	43 80 7c 32 04 00    	cmpb   $0x0,0x4(%r10,%r14,1)
    48e8:	4d 8d 4e 04          	lea    0x4(%r14),%r9
    48ec:	74 07                	je     48f5 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x255>
      center_table[i] = count++;
    48ee:	43 89 0c 8b          	mov    %ecx,(%r11,%r9,4)
    48f2:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    48f5:	43 80 7c 32 05 00    	cmpb   $0x0,0x5(%r10,%r14,1)
    48fb:	49 8d 76 05          	lea    0x5(%r14),%rsi
    48ff:	74 07                	je     4908 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x268>
      center_table[i] = count++;
    4901:	41 89 0c b3          	mov    %ecx,(%r11,%rsi,4)
    4905:	83 c1 01             	add    $0x1,%ecx
    if( is_center[i] ) {
    4908:	43 80 7c 32 06 00    	cmpb   $0x0,0x6(%r10,%r14,1)
    490e:	49 8d 56 06          	lea    0x6(%r14),%rdx
    4912:	74 07                	je     491b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x27b>
      center_table[i] = count++;
    4914:	41 89 0c 93          	mov    %ecx,(%r11,%rdx,4)
    4918:	83 c1 01             	add    $0x1,%ecx
  for( int i = k1; i < k2; i++ ) {
    491b:	49 8d 46 07          	lea    0x7(%r14),%rax
    491f:	49 39 c7             	cmp    %rax,%r15
    4922:	0f 8f 60 ff ff ff    	jg     4888 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1e8>
  work_mem[pid*stride] = count;
    4928:	66 0f ef c0          	pxor   %xmm0,%xmm0
    492c:	4c 8b 15 3d a7 00 00 	mov    0xa73d(%rip),%r10        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
  pthread_barrier_wait(barrier);
    4933:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  work_mem[pid*stride] = count;
    4938:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
    493c:	f2 43 0f 11 04 e2    	movsd  %xmm0,(%r10,%r12,8)
  pthread_barrier_wait(barrier);
    4942:	e8 09 68 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid == 0 ) {
    4947:	44 8b 64 24 34       	mov    0x34(%rsp),%r12d
    494c:	45 85 e4             	test   %r12d,%r12d
    494f:	0f 85 ba 02 00 00    	jne    4c0f <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x56f>
    for( int p = 0; p < nproc; p++ ) {
    4955:	8b 0d ad a7 00 00    	mov    0xa7ad(%rip),%ecx        # f108 <_ZL5nproc>
    495b:	85 c9                	test   %ecx,%ecx
    495d:	0f 8e ac 02 00 00    	jle    4c0f <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x56f>
    4963:	89 cf                	mov    %ecx,%edi
    4965:	4c 8b 35 04 a7 00 00 	mov    0xa704(%rip),%r14        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    496c:	45 31 c9             	xor    %r9d,%r9d
    int accum = 0;
    496f:	45 31 c0             	xor    %r8d,%r8d
    4972:	83 e7 07             	and    $0x7,%edi
    4975:	0f 84 f2 00 00 00    	je     4a6d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x3cd>
    497b:	83 ff 01             	cmp    $0x1,%edi
    497e:	0f 84 c3 00 00 00    	je     4a47 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x3a7>
    4984:	83 ff 02             	cmp    $0x2,%edi
    4987:	0f 84 9d 00 00 00    	je     4a2a <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x38a>
    498d:	83 ff 03             	cmp    $0x3,%edi
    4990:	74 7b                	je     4a0d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x36d>
    4992:	83 ff 04             	cmp    $0x4,%edi
    4995:	74 59                	je     49f0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x350>
    4997:	83 ff 05             	cmp    $0x5,%edi
    499a:	74 37                	je     49d3 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x333>
    499c:	83 ff 06             	cmp    $0x6,%edi
    499f:	74 15                	je     49b6 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x316>
      int tmp = (int)work_mem[p*stride];
    49a1:	f2 45 0f 2c 06       	cvttsd2si (%r14),%r8d
    for( int p = 0; p < nproc; p++ ) {
    49a6:	41 b9 01 00 00 00    	mov    $0x1,%r9d
      work_mem[p*stride] = accum;
    49ac:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    49b3:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    49b6:	66 0f ef c9          	pxor   %xmm1,%xmm1
      int tmp = (int)work_mem[p*stride];
    49ba:	f2 41 0f 2c 36       	cvttsd2si (%r14),%esi
    for( int p = 0; p < nproc; p++ ) {
    49bf:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    49c3:	f2 41 0f 2a c8       	cvtsi2sd %r8d,%xmm1
      accum += tmp;
    49c8:	41 01 f0             	add    %esi,%r8d
      work_mem[p*stride] = accum;
    49cb:	f2 41 0f 11 0e       	movsd  %xmm1,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    49d0:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    49d3:	66 0f ef d2          	pxor   %xmm2,%xmm2
      int tmp = (int)work_mem[p*stride];
    49d7:	f2 41 0f 2c 16       	cvttsd2si (%r14),%edx
    for( int p = 0; p < nproc; p++ ) {
    49dc:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    49e0:	f2 41 0f 2a d0       	cvtsi2sd %r8d,%xmm2
      accum += tmp;
    49e5:	41 01 d0             	add    %edx,%r8d
      work_mem[p*stride] = accum;
    49e8:	f2 41 0f 11 16       	movsd  %xmm2,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    49ed:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    49f0:	66 0f ef db          	pxor   %xmm3,%xmm3
      int tmp = (int)work_mem[p*stride];
    49f4:	f2 41 0f 2c 06       	cvttsd2si (%r14),%eax
    for( int p = 0; p < nproc; p++ ) {
    49f9:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    49fd:	f2 41 0f 2a d8       	cvtsi2sd %r8d,%xmm3
      accum += tmp;
    4a02:	41 01 c0             	add    %eax,%r8d
      work_mem[p*stride] = accum;
    4a05:	f2 41 0f 11 1e       	movsd  %xmm3,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4a0a:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4a0d:	66 0f ef e4          	pxor   %xmm4,%xmm4
      int tmp = (int)work_mem[p*stride];
    4a11:	f2 45 0f 2c 16       	cvttsd2si (%r14),%r10d
    for( int p = 0; p < nproc; p++ ) {
    4a16:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    4a1a:	f2 41 0f 2a e0       	cvtsi2sd %r8d,%xmm4
      accum += tmp;
    4a1f:	45 01 d0             	add    %r10d,%r8d
      work_mem[p*stride] = accum;
    4a22:	f2 41 0f 11 26       	movsd  %xmm4,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4a27:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4a2a:	66 0f ef ed          	pxor   %xmm5,%xmm5
      int tmp = (int)work_mem[p*stride];
    4a2e:	f2 45 0f 2c 26       	cvttsd2si (%r14),%r12d
    for( int p = 0; p < nproc; p++ ) {
    4a33:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    4a37:	f2 41 0f 2a e8       	cvtsi2sd %r8d,%xmm5
      accum += tmp;
    4a3c:	45 01 e0             	add    %r12d,%r8d
      work_mem[p*stride] = accum;
    4a3f:	f2 41 0f 11 2e       	movsd  %xmm5,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4a44:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4a47:	66 0f ef f6          	pxor   %xmm6,%xmm6
      int tmp = (int)work_mem[p*stride];
    4a4b:	f2 45 0f 2c 1e       	cvttsd2si (%r14),%r11d
    for( int p = 0; p < nproc; p++ ) {
    4a50:	41 83 c1 01          	add    $0x1,%r9d
      work_mem[p*stride] = accum;
    4a54:	f2 41 0f 2a f0       	cvtsi2sd %r8d,%xmm6
      accum += tmp;
    4a59:	45 01 d8             	add    %r11d,%r8d
      work_mem[p*stride] = accum;
    4a5c:	f2 41 0f 11 36       	movsd  %xmm6,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4a61:	49 01 de             	add    %rbx,%r14
    4a64:	44 39 c9             	cmp    %r9d,%ecx
    4a67:	0f 84 dc 00 00 00    	je     4b49 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x4a9>
      work_mem[p*stride] = accum;
    4a6d:	66 0f ef ff          	pxor   %xmm7,%xmm7
      int tmp = (int)work_mem[p*stride];
    4a71:	f2 41 0f 2c 3e       	cvttsd2si (%r14),%edi
      work_mem[p*stride] = accum;
    4a76:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    for( int p = 0; p < nproc; p++ ) {
    4a7b:	41 83 c1 08          	add    $0x8,%r9d
      work_mem[p*stride] = accum;
    4a7f:	f2 41 0f 2a f8       	cvtsi2sd %r8d,%xmm7
    4a84:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    4a89:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    4a8e:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    4a93:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    4a98:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    4a9d:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
      accum += tmp;
    4aa2:	41 01 f8             	add    %edi,%r8d
      work_mem[p*stride] = accum;
    4aa5:	f2 41 0f 11 3e       	movsd  %xmm7,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4aaa:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4aad:	f2 45 0f 2a c0       	cvtsi2sd %r8d,%xmm8
      int tmp = (int)work_mem[p*stride];
    4ab2:	f2 41 0f 2c 36       	cvttsd2si (%r14),%esi
      work_mem[p*stride] = accum;
    4ab7:	f2 45 0f 11 06       	movsd  %xmm8,(%r14)
      accum += tmp;
    4abc:	49 01 de             	add    %rbx,%r14
    4abf:	41 01 f0             	add    %esi,%r8d
      int tmp = (int)work_mem[p*stride];
    4ac2:	f2 41 0f 2c 16       	cvttsd2si (%r14),%edx
      work_mem[p*stride] = accum;
    4ac7:	f2 45 0f 2a c8       	cvtsi2sd %r8d,%xmm9
      accum += tmp;
    4acc:	41 01 d0             	add    %edx,%r8d
      work_mem[p*stride] = accum;
    4acf:	f2 45 0f 11 0e       	movsd  %xmm9,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4ad4:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4ad7:	f2 45 0f 2a d0       	cvtsi2sd %r8d,%xmm10
      int tmp = (int)work_mem[p*stride];
    4adc:	f2 41 0f 2c 06       	cvttsd2si (%r14),%eax
      work_mem[p*stride] = accum;
    4ae1:	f2 45 0f 11 16       	movsd  %xmm10,(%r14)
      accum += tmp;
    4ae6:	49 01 de             	add    %rbx,%r14
    4ae9:	41 01 c0             	add    %eax,%r8d
      int tmp = (int)work_mem[p*stride];
    4aec:	f2 45 0f 2c 16       	cvttsd2si (%r14),%r10d
      work_mem[p*stride] = accum;
    4af1:	f2 45 0f 2a d8       	cvtsi2sd %r8d,%xmm11
      accum += tmp;
    4af6:	45 01 d0             	add    %r10d,%r8d
      work_mem[p*stride] = accum;
    4af9:	f2 45 0f 11 1e       	movsd  %xmm11,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4afe:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4b01:	f2 45 0f 2a e0       	cvtsi2sd %r8d,%xmm12
      int tmp = (int)work_mem[p*stride];
    4b06:	f2 45 0f 2c 26       	cvttsd2si (%r14),%r12d
      work_mem[p*stride] = accum;
    4b0b:	f2 45 0f 11 26       	movsd  %xmm12,(%r14)
      accum += tmp;
    4b10:	49 01 de             	add    %rbx,%r14
    4b13:	45 01 e0             	add    %r12d,%r8d
      int tmp = (int)work_mem[p*stride];
    4b16:	f2 45 0f 2c 1e       	cvttsd2si (%r14),%r11d
      work_mem[p*stride] = accum;
    4b1b:	f2 45 0f 2a e8       	cvtsi2sd %r8d,%xmm13
      accum += tmp;
    4b20:	45 01 d8             	add    %r11d,%r8d
      work_mem[p*stride] = accum;
    4b23:	f2 45 0f 11 2e       	movsd  %xmm13,(%r14)
    for( int p = 0; p < nproc; p++ ) {
    4b28:	49 01 de             	add    %rbx,%r14
      work_mem[p*stride] = accum;
    4b2b:	f2 45 0f 2a f0       	cvtsi2sd %r8d,%xmm14
      int tmp = (int)work_mem[p*stride];
    4b30:	f2 41 0f 2c 3e       	cvttsd2si (%r14),%edi
      work_mem[p*stride] = accum;
    4b35:	f2 45 0f 11 36       	movsd  %xmm14,(%r14)
      accum += tmp;
    4b3a:	49 01 de             	add    %rbx,%r14
    4b3d:	41 01 f8             	add    %edi,%r8d
    for( int p = 0; p < nproc; p++ ) {
    4b40:	44 39 c9             	cmp    %r9d,%ecx
    4b43:	0f 85 24 ff ff ff    	jne    4a6d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x3cd>
  pthread_barrier_wait(barrier);
    4b49:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4b4e:	e8 fd 65 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    4b53:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
    4b58:	0f 8f bb 00 00 00    	jg     4c19 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x579>
  memset(switch_membership + k1, 0, (k2-k1)*sizeof(bool));
    4b5e:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
  return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
    4b63:	4c 89 ea             	mov    %r13,%rdx
    4b66:	31 f6                	xor    %esi,%esi
    4b68:	48 03 3d b1 a5 00 00 	add    0xa5b1(%rip),%rdi        # f120 <_ZL17switch_membership>
    4b6f:	e8 ac d7 ff ff       	callq  2320 <memset@plt>
  memset(work_mem+pid*stride, 0, stride*sizeof(double));
    4b74:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
    4b79:	48 89 da             	mov    %rbx,%rdx
    4b7c:	31 f6                	xor    %esi,%esi
    4b7e:	4c 8b 35 eb a4 00 00 	mov    0xa4eb(%rip),%r14        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    4b85:	4b 8d 3c 26          	lea    (%r14,%r12,1),%rdi
    4b89:	e8 92 d7 ff ff       	callq  2320 <memset@plt>
  if( pid== 0 ) memset(work_mem+nproc*stride,0,stride*sizeof(double));
    4b8e:	8b 05 74 a5 00 00    	mov    0xa574(%rip),%eax        # f108 <_ZL5nproc>
    4b94:	31 f6                	xor    %esi,%esi
    4b96:	48 89 da             	mov    %rbx,%rdx
    4b99:	0f af c5             	imul   %ebp,%eax
    4b9c:	48 98                	cltq   
    4b9e:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
    4ba2:	e8 79 d7 ff ff       	callq  2320 <memset@plt>
  pthread_barrier_wait(barrier);
    4ba7:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4bac:	e8 9f 65 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  double* gl_lower = &work_mem[nproc*stride];
    4bb1:	0f af 2d 50 a5 00 00 	imul   0xa550(%rip),%ebp        # f108 <_ZL5nproc>
  double* lower = &work_mem[pid*stride];
    4bb8:	4c 8b 35 b1 a4 00 00 	mov    0xa4b1(%rip),%r14        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    4bbf:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
  double* gl_lower = &work_mem[nproc*stride];
    4bc4:	4c 63 cd             	movslq %ebp,%r9
    4bc7:	4b 8d 34 ce          	lea    (%r14,%r9,8),%rsi
    4bcb:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
  for ( i = k1; i < k2; i++ ) {
    4bd0:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
    4bd5:	0f 8f 53 02 00 00    	jg     4e2e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x78e>
  pthread_barrier_wait(barrier);
    4bdb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4be0:	e8 6b 65 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for ( int i = k1; i < k2; i++ ) {
    4be5:	4c 8b 15 84 a4 00 00 	mov    0xa484(%rip),%r10        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
  pthread_barrier_wait(barrier);
    4bec:	66 0f ef db          	pxor   %xmm3,%xmm3
    4bf0:	66 0f ef c9          	pxor   %xmm1,%xmm1
  double cost_of_opening_x = 0;
    4bf4:	66 0f ef d2          	pxor   %xmm2,%xmm2
    4bf8:	e9 ac 08 00 00       	jmpq   54a9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xe09>
      center_table[i] = count++;
    4bfd:	41 c7 04 b3 00 00 00 	movl   $0x0,(%r11,%rsi,4)
    4c04:	00 
    4c05:	b9 01 00 00 00       	mov    $0x1,%ecx
    4c0a:	e9 bf fb ff ff       	jmpq   47ce <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x12e>
  pthread_barrier_wait(barrier);
    4c0f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4c14:	e8 37 65 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    4c19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    if( is_center[i] ) {
    4c1e:	48 8b 0d f3 a4 00 00 	mov    0xa4f3(%rip),%rcx        # f118 <_ZL9is_center>
      center_table[i] += (int)work_mem[pid*stride];
    4c25:	4c 8b 35 44 a4 00 00 	mov    0xa444(%rip),%r14        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    4c2c:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    4c31:	48 89 f2             	mov    %rsi,%rdx
    4c34:	4c 8b 05 d5 a4 00 00 	mov    0xa4d5(%rip),%r8        # f110 <_ZL12center_table>
    4c3b:	48 f7 d2             	not    %rdx
    4c3e:	4f 8d 24 0e          	lea    (%r14,%r9,1),%r12
    4c42:	4c 01 fa             	add    %r15,%rdx
    4c45:	83 e2 07             	and    $0x7,%edx
    if( is_center[i] ) {
    4c48:	80 3c 31 00          	cmpb   $0x0,(%rcx,%rsi,1)
    4c4c:	74 0a                	je     4c58 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x5b8>
      center_table[i] += (int)work_mem[pid*stride];
    4c4e:	f2 41 0f 2c 04 24    	cvttsd2si (%r12),%eax
    4c54:	41 01 04 b0          	add    %eax,(%r8,%rsi,4)
  for( int i = k1; i < k2; i++ ) {
    4c58:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    4c5d:	48 83 c0 01          	add    $0x1,%rax
    4c61:	4c 39 f8             	cmp    %r15,%rax
    4c64:	0f 8d 6a 01 00 00    	jge    4dd4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x734>
    4c6a:	48 85 d2             	test   %rdx,%rdx
    4c6d:	0f 84 ab 00 00 00    	je     4d1e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x67e>
    4c73:	48 83 fa 01          	cmp    $0x1,%rdx
    4c77:	0f 84 84 00 00 00    	je     4d01 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x661>
    4c7d:	48 83 fa 02          	cmp    $0x2,%rdx
    4c81:	74 6a                	je     4ced <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x64d>
    4c83:	48 83 fa 03          	cmp    $0x3,%rdx
    4c87:	74 50                	je     4cd9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x639>
    4c89:	48 83 fa 04          	cmp    $0x4,%rdx
    4c8d:	74 3c                	je     4ccb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x62b>
    4c8f:	48 83 fa 05          	cmp    $0x5,%rdx
    4c93:	74 28                	je     4cbd <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x61d>
    4c95:	48 83 fa 06          	cmp    $0x6,%rdx
    4c99:	74 0e                	je     4ca9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x609>
    if( is_center[i] ) {
    4c9b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4c9f:	0f 85 9f 14 00 00    	jne    6144 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1aa4>
  for( int i = k1; i < k2; i++ ) {
    4ca5:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4ca9:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4cad:	74 0a                	je     4cb9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x619>
      center_table[i] += (int)work_mem[pid*stride];
    4caf:	f2 41 0f 2c 3c 24    	cvttsd2si (%r12),%edi
    4cb5:	41 01 3c 80          	add    %edi,(%r8,%rax,4)
  for( int i = k1; i < k2; i++ ) {
    4cb9:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4cbd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4cc1:	0f 85 b4 13 00 00    	jne    607b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19db>
  for( int i = k1; i < k2; i++ ) {
    4cc7:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4ccb:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4ccf:	0f 85 67 13 00 00    	jne    603c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x199c>
  for( int i = k1; i < k2; i++ ) {
    4cd5:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4cd9:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4cdd:	74 0a                	je     4ce9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x649>
      center_table[i] += (int)work_mem[pid*stride];
    4cdf:	f2 41 0f 2c 14 24    	cvttsd2si (%r12),%edx
    4ce5:	41 01 14 80          	add    %edx,(%r8,%rax,4)
  for( int i = k1; i < k2; i++ ) {
    4ce9:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4ced:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4cf1:	74 0a                	je     4cfd <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x65d>
      center_table[i] += (int)work_mem[pid*stride];
    4cf3:	f2 45 0f 2c 14 24    	cvttsd2si (%r12),%r10d
    4cf9:	45 01 14 80          	add    %r10d,(%r8,%rax,4)
  for( int i = k1; i < k2; i++ ) {
    4cfd:	48 83 c0 01          	add    $0x1,%rax
    if( is_center[i] ) {
    4d01:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4d05:	74 0a                	je     4d11 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x671>
      center_table[i] += (int)work_mem[pid*stride];
    4d07:	f2 45 0f 2c 1c 24    	cvttsd2si (%r12),%r11d
    4d0d:	45 01 1c 80          	add    %r11d,(%r8,%rax,4)
  for( int i = k1; i < k2; i++ ) {
    4d11:	48 83 c0 01          	add    $0x1,%rax
    4d15:	4c 39 f8             	cmp    %r15,%rax
    4d18:	0f 8d b6 00 00 00    	jge    4dd4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x734>
    if( is_center[i] ) {
    4d1e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
    4d22:	74 0a                	je     4d2e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x68e>
      center_table[i] += (int)work_mem[pid*stride];
    4d24:	f2 41 0f 2c 3c 24    	cvttsd2si (%r12),%edi
    4d2a:	41 01 3c 80          	add    %edi,(%r8,%rax,4)
    if( is_center[i] ) {
    4d2e:	80 7c 01 01 00       	cmpb   $0x0,0x1(%rcx,%rax,1)
    4d33:	4c 8d 48 01          	lea    0x1(%rax),%r9
    4d37:	74 0a                	je     4d43 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x6a3>
      center_table[i] += (int)work_mem[pid*stride];
    4d39:	f2 41 0f 2c 04 24    	cvttsd2si (%r12),%eax
    4d3f:	43 01 04 88          	add    %eax,(%r8,%r9,4)
    if( is_center[i] ) {
    4d43:	42 80 7c 09 01 00    	cmpb   $0x0,0x1(%rcx,%r9,1)
    4d49:	49 8d 71 01          	lea    0x1(%r9),%rsi
    4d4d:	74 0a                	je     4d59 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x6b9>
      center_table[i] += (int)work_mem[pid*stride];
    4d4f:	f2 41 0f 2c 14 24    	cvttsd2si (%r12),%edx
    4d55:	41 01 14 b0          	add    %edx,(%r8,%rsi,4)
    if( is_center[i] ) {
    4d59:	42 80 7c 09 02 00    	cmpb   $0x0,0x2(%rcx,%r9,1)
    4d5f:	4d 8d 51 02          	lea    0x2(%r9),%r10
    4d63:	74 0a                	je     4d6f <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x6cf>
      center_table[i] += (int)work_mem[pid*stride];
    4d65:	f2 45 0f 2c 1c 24    	cvttsd2si (%r12),%r11d
    4d6b:	47 01 1c 90          	add    %r11d,(%r8,%r10,4)
    if( is_center[i] ) {
    4d6f:	42 80 7c 09 03 00    	cmpb   $0x0,0x3(%rcx,%r9,1)
    4d75:	49 8d 41 03          	lea    0x3(%r9),%rax
    4d79:	74 0a                	je     4d85 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x6e5>
      center_table[i] += (int)work_mem[pid*stride];
    4d7b:	f2 41 0f 2c 3c 24    	cvttsd2si (%r12),%edi
    4d81:	41 01 3c 80          	add    %edi,(%r8,%rax,4)
    if( is_center[i] ) {
    4d85:	42 80 7c 09 04 00    	cmpb   $0x0,0x4(%rcx,%r9,1)
    4d8b:	49 8d 71 04          	lea    0x4(%r9),%rsi
    4d8f:	74 0a                	je     4d9b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x6fb>
      center_table[i] += (int)work_mem[pid*stride];
    4d91:	f2 41 0f 2c 14 24    	cvttsd2si (%r12),%edx
    4d97:	41 01 14 b0          	add    %edx,(%r8,%rsi,4)
    if( is_center[i] ) {
    4d9b:	42 80 7c 09 05 00    	cmpb   $0x0,0x5(%rcx,%r9,1)
    4da1:	4d 8d 51 05          	lea    0x5(%r9),%r10
    4da5:	74 0a                	je     4db1 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x711>
      center_table[i] += (int)work_mem[pid*stride];
    4da7:	f2 45 0f 2c 1c 24    	cvttsd2si (%r12),%r11d
    4dad:	47 01 1c 90          	add    %r11d,(%r8,%r10,4)
    if( is_center[i] ) {
    4db1:	42 80 7c 09 06 00    	cmpb   $0x0,0x6(%rcx,%r9,1)
    4db7:	49 8d 41 06          	lea    0x6(%r9),%rax
    4dbb:	74 0a                	je     4dc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x727>
      center_table[i] += (int)work_mem[pid*stride];
    4dbd:	f2 41 0f 2c 3c 24    	cvttsd2si (%r12),%edi
    4dc3:	41 01 3c 80          	add    %edi,(%r8,%rax,4)
  for( int i = k1; i < k2; i++ ) {
    4dc7:	49 8d 41 07          	lea    0x7(%r9),%rax
    4dcb:	4c 39 f8             	cmp    %r15,%rax
    4dce:	0f 8c 4a ff ff ff    	jl     4d1e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x67e>
    4dd4:	4c 89 ea             	mov    %r13,%rdx
  memset(switch_membership + k1, 0, (k2-k1)*sizeof(bool));
    4dd7:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    4ddc:	31 f6                	xor    %esi,%esi
    4dde:	48 03 3d 3b a3 00 00 	add    0xa33b(%rip),%rdi        # f120 <_ZL17switch_membership>
    4de5:	e8 36 d5 ff ff       	callq  2320 <memset@plt>
    4dea:	48 89 da             	mov    %rbx,%rdx
    4ded:	31 f6                	xor    %esi,%esi
    4def:	4c 89 e7             	mov    %r12,%rdi
    4df2:	e8 29 d5 ff ff       	callq  2320 <memset@plt>
  if( pid== 0 ) memset(work_mem+nproc*stride,0,stride*sizeof(double));
    4df7:	44 8b 6c 24 34       	mov    0x34(%rsp),%r13d
    4dfc:	45 85 ed             	test   %r13d,%r13d
    4dff:	0f 84 89 fd ff ff    	je     4b8e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x4ee>
  pthread_barrier_wait(barrier);
    4e05:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4e0a:	e8 41 63 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  double* gl_lower = &work_mem[nproc*stride];
    4e0f:	0f af 2d f2 a2 00 00 	imul   0xa2f2(%rip),%ebp        # f108 <_ZL5nproc>
  double* lower = &work_mem[pid*stride];
    4e16:	48 8b 0d 53 a2 00 00 	mov    0xa253(%rip),%rcx        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    4e1d:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
  double* gl_lower = &work_mem[nproc*stride];
    4e22:	48 63 ed             	movslq %ebp,%rbp
    4e25:	4c 8d 04 e9          	lea    (%rcx,%rbp,8),%r8
    4e29:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
    float x_cost = dist(points->p[i], points->p[x], points->dim) 
    4e2e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
      switch_membership[i] = 1;
    4e33:	4c 8b 2d e6 a2 00 00 	mov    0xa2e6(%rip),%r13        # f120 <_ZL17switch_membership>
  double cost_of_opening_x = 0;
    4e3a:	66 0f ef db          	pxor   %xmm3,%xmm3
    4e3e:	48 89 9c 24 88 00 00 	mov    %rbx,0x88(%rsp)
    4e45:	00 
    4e46:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    4e4b:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
    4e50:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    4e55:	66 0f ef d2          	pxor   %xmm2,%xmm2
    float x_cost = dist(points->p[i], points->p[x], points->dim) 
    4e59:	44 8b 4a 08          	mov    0x8(%rdx),%r9d
    4e5d:	4f 8d 64 3d 00       	lea    0x0(%r13,%r15,1),%r12
      lower[center_table[assign]] += current_cost - x_cost;
    4e62:	48 8b 3d a7 a2 00 00 	mov    0xa2a7(%rip),%rdi        # f110 <_ZL12center_table>
    4e69:	4d 8d 44 0d 00       	lea    0x0(%r13,%rcx,1),%r8
    float x_cost = dist(points->p[i], points->p[x], points->dim) 
    4e6e:	4c 8b 52 10          	mov    0x10(%rdx),%r10
    4e72:	48 89 cd             	mov    %rcx,%rbp
    4e75:	49 c1 e3 05          	shl    $0x5,%r11
    4e79:	45 89 cd             	mov    %r9d,%r13d
      lower[center_table[assign]] += current_cost - x_cost;
    4e7c:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    4e81:	48 c1 e1 05          	shl    $0x5,%rcx
    4e85:	41 8d 51 ff          	lea    -0x1(%r9),%edx
    4e89:	41 c1 ed 02          	shr    $0x2,%r13d
    4e8d:	45 89 ce             	mov    %r9d,%r14d
    4e90:	4f 8b 5c 1a 08       	mov    0x8(%r10,%r11,1),%r11
    4e95:	41 89 d7             	mov    %edx,%r15d
    4e98:	41 8d 45 fb          	lea    -0x5(%r13),%eax
    4e9c:	48 89 ac 24 80 00 00 	mov    %rbp,0x80(%rsp)
    4ea3:	00 
    4ea4:	49 8d 74 0a 58       	lea    0x58(%r10,%rcx,1),%rsi
    4ea9:	41 83 e6 fc          	and    $0xfffffffc,%r14d
    4ead:	83 e0 fc             	and    $0xfffffffc,%eax
    4eb0:	83 c0 08             	add    $0x8,%eax
    4eb3:	89 44 24 20          	mov    %eax,0x20(%rsp)
    4eb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    4ebe:	00 00 
    float x_cost = dist(points->p[i], points->p[x], points->dim) 
    4ec0:	0f 18 4e f0          	prefetcht0 -0x10(%rsi)
    4ec4:	48 8b 7e b0          	mov    -0x50(%rsi),%rdi
  for (i=0;i<dim;i++)
    4ec8:	45 85 c9             	test   %r9d,%r9d
    4ecb:	0f 8e df 08 00 00    	jle    57b0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1110>
    4ed1:	41 83 ff 02          	cmp    $0x2,%r15d
    4ed5:	0f 86 de 08 00 00    	jbe    57b9 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1119>
    4edb:	4c 89 d8             	mov    %r11,%rax
    4ede:	48 89 fa             	mov    %rdi,%rdx
    4ee1:	41 83 fd 04          	cmp    $0x4,%r13d
    4ee5:	0f 86 d9 08 00 00    	jbe    57c4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1124>
    4eeb:	bb 04 00 00 00       	mov    $0x4,%ebx
  float result=0.0;
    4ef0:	66 0f ef c0          	pxor   %xmm0,%xmm0
    4ef4:	eb 0d                	jmp    4f03 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x863>
    4ef6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    4efd:	00 00 00 
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    4f00:	44 89 d3             	mov    %r10d,%ebx
    4f03:	0f 10 08             	movups (%rax),%xmm1
    4f06:	44 0f 10 3a          	movups (%rdx),%xmm15
    4f0a:	44 8d 53 04          	lea    0x4(%rbx),%r10d
    4f0e:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    4f15:	0f 10 78 10          	movups 0x10(%rax),%xmm7
    4f19:	44 0f 10 42 10       	movups 0x10(%rdx),%xmm8
    4f1e:	48 83 c2 40          	add    $0x40,%rdx
    4f22:	0f 18 88 00 01 00 00 	prefetcht0 0x100(%rax)
    4f29:	44 0f 5c f9          	subps  %xmm1,%xmm15
    4f2d:	44 0f 10 62 e0       	movups -0x20(%rdx),%xmm12
    4f32:	44 0f 10 68 20       	movups 0x20(%rax),%xmm13
    4f37:	48 83 c0 40          	add    $0x40,%rax
    4f3b:	44 0f 5c c7          	subps  %xmm7,%xmm8
    4f3f:	45 0f 5c e5          	subps  %xmm13,%xmm12
    4f43:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    4f47:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    4f4b:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    4f4f:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    4f54:	41 0f 28 f7          	movaps %xmm15,%xmm6
    4f58:	41 0f c6 f7 55       	shufps $0x55,%xmm15,%xmm6
    4f5d:	45 0f 28 d0          	movaps %xmm8,%xmm10
    4f61:	41 0f 28 c8          	movaps %xmm8,%xmm1
    4f65:	45 0f c6 d0 55       	shufps $0x55,%xmm8,%xmm10
    4f6a:	41 0f 15 c8          	unpckhps %xmm8,%xmm1
    4f6e:	45 0f 28 f4          	movaps %xmm12,%xmm14
    4f72:	f3 0f 58 f0          	addss  %xmm0,%xmm6
    4f76:	41 0f 28 c7          	movaps %xmm15,%xmm0
    4f7a:	44 0f 28 d9          	movaps %xmm1,%xmm11
    4f7e:	41 0f 15 c7          	unpckhps %xmm15,%xmm0
    4f82:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    4f87:	41 0f 28 cc          	movaps %xmm12,%xmm1
    4f8b:	0f 28 e8             	movaps %xmm0,%xmm5
    4f8e:	0f 10 42 f0          	movups -0x10(%rdx),%xmm0
    4f92:	41 0f c6 cc 55       	shufps $0x55,%xmm12,%xmm1
    4f97:	f3 0f 58 ee          	addss  %xmm6,%xmm5
    4f9b:	0f 10 70 f0          	movups -0x10(%rax),%xmm6
    4f9f:	0f 5c c6             	subps  %xmm6,%xmm0
    4fa2:	f3 44 0f 58 fd       	addss  %xmm5,%xmm15
    4fa7:	0f 59 c0             	mulps  %xmm0,%xmm0
    4faa:	f3 45 0f 58 f8       	addss  %xmm8,%xmm15
    4faf:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    4fb4:	f3 45 0f 58 d7       	addss  %xmm15,%xmm10
    4fb9:	f3 45 0f 58 da       	addss  %xmm10,%xmm11
    4fbe:	f3 45 0f 58 d8       	addss  %xmm8,%xmm11
    4fc3:	44 0f 28 c0          	movaps %xmm0,%xmm8
    4fc7:	f3 45 0f 58 f3       	addss  %xmm11,%xmm14
    4fcc:	f3 44 0f 58 f1       	addss  %xmm1,%xmm14
    4fd1:	41 0f 28 cc          	movaps %xmm12,%xmm1
    4fd5:	41 0f 15 cc          	unpckhps %xmm12,%xmm1
    4fd9:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    4fde:	0f 28 e1             	movaps %xmm1,%xmm4
    4fe1:	0f 28 c8             	movaps %xmm0,%xmm1
    4fe4:	f3 41 0f 58 e6       	addss  %xmm14,%xmm4
    4fe9:	0f c6 c8 55          	shufps $0x55,%xmm0,%xmm1
    4fed:	f3 41 0f 58 e4       	addss  %xmm12,%xmm4
    4ff2:	f3 44 0f 58 c4       	addss  %xmm4,%xmm8
    4ff7:	f3 44 0f 58 c1       	addss  %xmm1,%xmm8
    4ffc:	0f 28 c8             	movaps %xmm0,%xmm1
    4fff:	0f 15 c8             	unpckhps %xmm0,%xmm1
    5002:	0f c6 c0 ff          	shufps $0xff,%xmm0,%xmm0
    5006:	0f 28 f9             	movaps %xmm1,%xmm7
    5009:	f3 41 0f 58 f8       	addss  %xmm8,%xmm7
    500e:	f3 0f 58 c7          	addss  %xmm7,%xmm0
  for (i=0;i<dim;i++)
    5012:	44 3b 54 24 20       	cmp    0x20(%rsp),%r10d
    5017:	0f 85 e3 fe ff ff    	jne    4f00 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x860>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    501d:	44 0f 10 0a          	movups (%rdx),%xmm9
    5021:	44 0f 10 10          	movups (%rax),%xmm10
    5025:	89 dd                	mov    %ebx,%ebp
    5027:	44 8d 53 01          	lea    0x1(%rbx),%r10d
    502b:	f7 d5                	not    %ebp
    502d:	b9 10 00 00 00       	mov    $0x10,%ecx
    5032:	45 0f 5c ca          	subps  %xmm10,%xmm9
    5036:	44 01 ed             	add    %r13d,%ebp
    5039:	83 e5 03             	and    $0x3,%ebp
    503c:	45 0f 59 c9          	mulps  %xmm9,%xmm9
    5040:	45 0f 28 d9          	movaps %xmm9,%xmm11
    5044:	f3 44 0f 58 d8       	addss  %xmm0,%xmm11
    5049:	41 0f 28 c1          	movaps %xmm9,%xmm0
    504d:	41 0f c6 c1 55       	shufps $0x55,%xmm9,%xmm0
    5052:	f3 44 0f 58 d8       	addss  %xmm0,%xmm11
    5057:	41 0f 28 c1          	movaps %xmm9,%xmm0
    505b:	41 0f 15 c1          	unpckhps %xmm9,%xmm0
    505f:	45 0f c6 c9 ff       	shufps $0xff,%xmm9,%xmm9
    5064:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    5069:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
  for (i=0;i<dim;i++)
    506e:	45 39 d5             	cmp    %r10d,%r13d
    5071:	0f 86 0e 02 00 00    	jbe    5285 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xbe5>
    5077:	85 ed                	test   %ebp,%ebp
    5079:	0f 84 f1 00 00 00    	je     5170 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xad0>
    507f:	83 fd 01             	cmp    $0x1,%ebp
    5082:	0f 84 92 00 00 00    	je     511a <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xa7a>
    5088:	83 fd 02             	cmp    $0x2,%ebp
    508b:	74 46                	je     50d3 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xa33>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    508d:	44 0f 10 6a 10       	movups 0x10(%rdx),%xmm13
    5092:	44 0f 10 70 10       	movups 0x10(%rax),%xmm14
    5097:	b9 20 00 00 00       	mov    $0x20,%ecx
    509c:	44 8d 53 02          	lea    0x2(%rbx),%r10d
    50a0:	45 0f 5c ee          	subps  %xmm14,%xmm13
    50a4:	45 0f 59 ed          	mulps  %xmm13,%xmm13
    50a8:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    50ad:	41 0f 28 e5          	movaps %xmm13,%xmm4
    50b1:	41 0f 28 f5          	movaps %xmm13,%xmm6
    50b5:	41 0f c6 e5 55       	shufps $0x55,%xmm13,%xmm4
    50ba:	41 0f 15 f5          	unpckhps %xmm13,%xmm6
    50be:	45 0f c6 ed ff       	shufps $0xff,%xmm13,%xmm13
    50c3:	f3 0f 58 e0          	addss  %xmm0,%xmm4
    50c7:	41 0f 28 c5          	movaps %xmm13,%xmm0
    50cb:	f3 0f 58 e6          	addss  %xmm6,%xmm4
    50cf:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    50d3:	0f 10 2c 08          	movups (%rax,%rcx,1),%xmm5
    50d7:	44 0f 10 04 0a       	movups (%rdx,%rcx,1),%xmm8
    50dc:	41 83 c2 01          	add    $0x1,%r10d
    50e0:	48 83 c1 10          	add    $0x10,%rcx
    50e4:	44 0f 5c c5          	subps  %xmm5,%xmm8
    50e8:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    50ec:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    50f1:	41 0f 28 e8          	movaps %xmm8,%xmm5
    50f5:	41 0f c6 e8 55       	shufps $0x55,%xmm8,%xmm5
    50fa:	0f 28 fd             	movaps %xmm5,%xmm7
    50fd:	f3 0f 58 f8          	addss  %xmm0,%xmm7
    5101:	41 0f 28 c0          	movaps %xmm8,%xmm0
    5105:	41 0f 15 c0          	unpckhps %xmm8,%xmm0
    5109:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    510e:	f3 0f 58 f8          	addss  %xmm0,%xmm7
    5112:	41 0f 28 c0          	movaps %xmm8,%xmm0
    5116:	f3 0f 58 c7          	addss  %xmm7,%xmm0
    511a:	44 0f 10 14 0a       	movups (%rdx,%rcx,1),%xmm10
    511f:	44 0f 10 1c 08       	movups (%rax,%rcx,1),%xmm11
    5124:	41 83 c2 01          	add    $0x1,%r10d
    5128:	48 83 c1 10          	add    $0x10,%rcx
    512c:	45 0f 5c d3          	subps  %xmm11,%xmm10
    5130:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    5134:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    5139:	41 0f 28 ea          	movaps %xmm10,%xmm5
    513d:	41 0f c6 ea 55       	shufps $0x55,%xmm10,%xmm5
    5142:	44 0f 28 ed          	movaps %xmm5,%xmm13
    5146:	f3 44 0f 58 e8       	addss  %xmm0,%xmm13
    514b:	41 0f 28 c2          	movaps %xmm10,%xmm0
    514f:	41 0f 15 c2          	unpckhps %xmm10,%xmm0
    5153:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    5158:	f3 44 0f 58 e8       	addss  %xmm0,%xmm13
    515d:	41 0f 28 c2          	movaps %xmm10,%xmm0
    5161:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
  for (i=0;i<dim;i++)
    5166:	45 39 d5             	cmp    %r10d,%r13d
    5169:	0f 86 16 01 00 00    	jbe    5285 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xbe5>
    516f:	90                   	nop
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5170:	0f 10 24 08          	movups (%rax,%rcx,1),%xmm4
    5174:	44 0f 10 3c 0a       	movups (%rdx,%rcx,1),%xmm15
    5179:	41 83 c2 04          	add    $0x4,%r10d
    517d:	0f 10 7c 08 10       	movups 0x10(%rax,%rcx,1),%xmm7
    5182:	0f 10 4c 0a 10       	movups 0x10(%rdx,%rcx,1),%xmm1
    5187:	44 0f 5c fc          	subps  %xmm4,%xmm15
    518b:	44 0f 10 6c 0a 20    	movups 0x20(%rdx,%rcx,1),%xmm13
    5191:	0f 10 6c 08 20       	movups 0x20(%rax,%rcx,1),%xmm5
    5196:	0f 5c cf             	subps  %xmm7,%xmm1
    5199:	44 0f 5c ed          	subps  %xmm5,%xmm13
    519d:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    51a1:	0f 59 c9             	mulps  %xmm1,%xmm1
    51a4:	45 0f 59 ed          	mulps  %xmm13,%xmm13
    51a8:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    51ad:	41 0f 28 f7          	movaps %xmm15,%xmm6
    51b1:	41 0f c6 f7 55       	shufps $0x55,%xmm15,%xmm6
    51b6:	44 0f 28 c6          	movaps %xmm6,%xmm8
    51ba:	44 0f 28 d1          	movaps %xmm1,%xmm10
    51be:	41 0f 28 f5          	movaps %xmm13,%xmm6
    51c2:	f3 44 0f 58 c0       	addss  %xmm0,%xmm8
    51c7:	41 0f 28 c7          	movaps %xmm15,%xmm0
    51cb:	41 0f c6 f5 55       	shufps $0x55,%xmm13,%xmm6
    51d0:	41 0f 15 c7          	unpckhps %xmm15,%xmm0
    51d4:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    51d9:	44 0f 28 c8          	movaps %xmm0,%xmm9
    51dd:	0f 28 c1             	movaps %xmm1,%xmm0
    51e0:	f3 45 0f 58 c8       	addss  %xmm8,%xmm9
    51e5:	0f c6 c1 55          	shufps $0x55,%xmm1,%xmm0
    51e9:	44 0f 10 44 0a 30    	movups 0x30(%rdx,%rcx,1),%xmm8
    51ef:	f3 45 0f 58 cf       	addss  %xmm15,%xmm9
    51f4:	44 0f 28 fe          	movaps %xmm6,%xmm15
    51f8:	f3 45 0f 58 d1       	addss  %xmm9,%xmm10
    51fd:	44 0f 10 4c 08 30    	movups 0x30(%rax,%rcx,1),%xmm9
    5203:	48 83 c1 40          	add    $0x40,%rcx
    5207:	45 0f 5c c1          	subps  %xmm9,%xmm8
    520b:	f3 44 0f 58 d0       	addss  %xmm0,%xmm10
    5210:	0f 28 c1             	movaps %xmm1,%xmm0
    5213:	0f 15 c1             	unpckhps %xmm1,%xmm0
    5216:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    521a:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    521e:	44 0f 28 e0          	movaps %xmm0,%xmm12
    5222:	f3 45 0f 58 e2       	addss  %xmm10,%xmm12
    5227:	f3 41 0f 58 cc       	addss  %xmm12,%xmm1
    522c:	41 0f 28 f8          	movaps %xmm8,%xmm7
    5230:	41 0f 28 c0          	movaps %xmm8,%xmm0
    5234:	41 0f c6 c0 55       	shufps $0x55,%xmm8,%xmm0
    5239:	f3 41 0f 58 cd       	addss  %xmm13,%xmm1
    523e:	f3 44 0f 58 f9       	addss  %xmm1,%xmm15
    5243:	41 0f 28 cd          	movaps %xmm13,%xmm1
    5247:	41 0f 15 cd          	unpckhps %xmm13,%xmm1
    524b:	45 0f c6 ed ff       	shufps $0xff,%xmm13,%xmm13
    5250:	0f 28 e1             	movaps %xmm1,%xmm4
    5253:	f3 41 0f 58 e7       	addss  %xmm15,%xmm4
    5258:	f3 44 0f 58 ec       	addss  %xmm4,%xmm13
    525d:	f3 41 0f 58 fd       	addss  %xmm13,%xmm7
    5262:	f3 0f 58 f8          	addss  %xmm0,%xmm7
    5266:	41 0f 28 c0          	movaps %xmm8,%xmm0
    526a:	41 0f 15 c0          	unpckhps %xmm8,%xmm0
    526e:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    5273:	f3 0f 58 c7          	addss  %xmm7,%xmm0
    5277:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
  for (i=0;i<dim;i++)
    527c:	45 39 d5             	cmp    %r10d,%r13d
    527f:	0f 87 eb fe ff ff    	ja     5170 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xad0>
    5285:	44 89 f0             	mov    %r14d,%eax
    5288:	45 39 ce             	cmp    %r9d,%r14d
    528b:	74 5a                	je     52e7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xc47>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    528d:	48 63 d0             	movslq %eax,%rdx
  for (i=0;i<dim;i++)
    5290:	8d 58 01             	lea    0x1(%rax),%ebx
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5293:	f3 44 0f 10 1c 97    	movss  (%rdi,%rdx,4),%xmm11
    5299:	f3 45 0f 5c 1c 93    	subss  (%r11,%rdx,4),%xmm11
    529f:	f3 45 0f 59 db       	mulss  %xmm11,%xmm11
    52a4:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
  for (i=0;i<dim;i++)
    52a9:	41 39 d9             	cmp    %ebx,%r9d
    52ac:	7e 39                	jle    52e7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xc47>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    52ae:	48 63 eb             	movslq %ebx,%rbp
  for (i=0;i<dim;i++)
    52b1:	83 c0 02             	add    $0x2,%eax
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    52b4:	f3 44 0f 10 24 af    	movss  (%rdi,%rbp,4),%xmm12
    52ba:	f3 45 0f 5c 24 ab    	subss  (%r11,%rbp,4),%xmm12
    52c0:	f3 45 0f 59 e4       	mulss  %xmm12,%xmm12
    52c5:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
  for (i=0;i<dim;i++)
    52ca:	41 39 c1             	cmp    %eax,%r9d
    52cd:	7e 18                	jle    52e7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xc47>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    52cf:	48 98                	cltq   
    52d1:	f3 44 0f 10 2c 87    	movss  (%rdi,%rax,4),%xmm13
    52d7:	f3 45 0f 5c 2c 83    	subss  (%r11,%rax,4),%xmm13
    52dd:	f3 45 0f 59 ed       	mulss  %xmm13,%xmm13
    52e2:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
      * points->p[i].weight;
    52e7:	f3 0f 59 46 a8       	mulss  -0x58(%rsi),%xmm0
    float current_cost = points->p[i].cost;
    52ec:	f3 0f 10 6e c0       	movss  -0x40(%rsi),%xmm5
    if ( x_cost < current_cost ) {
    52f1:	0f 18 0e             	prefetcht0 (%rsi)
    52f4:	0f 2f e8             	comiss %xmm0,%xmm5
    52f7:	0f 86 73 04 00 00    	jbe    5770 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x10d0>
      cost_of_opening_x += x_cost - current_cost;
    52fd:	f3 0f 5c c5          	subss  %xmm5,%xmm0
    5301:	66 0f ef f6          	pxor   %xmm6,%xmm6
      switch_membership[i] = 1;
    5305:	41 c6 00 01          	movb   $0x1,(%r8)
      cost_of_opening_x += x_cost - current_cost;
    5309:	f3 0f 5a f0          	cvtss2sd %xmm0,%xmm6
    530d:	f2 0f 58 d6          	addsd  %xmm6,%xmm2
  for ( i = k1; i < k2; i++ ) {
    5311:	49 83 c0 01          	add    $0x1,%r8
    5315:	48 83 c6 20          	add    $0x20,%rsi
    5319:	4d 39 e0             	cmp    %r12,%r8
    531c:	0f 85 9e fb ff ff    	jne    4ec0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x820>
  pthread_barrier_wait(barrier);
    5322:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    5327:	f2 0f 11 5c 24 28    	movsd  %xmm3,0x28(%rsp)
    532d:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
    5332:	f2 0f 11 54 24 20    	movsd  %xmm2,0x20(%rsp)
    5338:	4c 8b ac 24 80 00 00 	mov    0x80(%rsp),%r13
    533f:	00 
    5340:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
    5347:	00 
    5348:	e8 03 5e 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    if( is_center[i] ) {
    534d:	4c 8b 35 c4 9d 00 00 	mov    0x9dc4(%rip),%r14        # f118 <_ZL9is_center>
  int number_of_centers_to_close = 0;
    5354:	45 31 c9             	xor    %r9d,%r9d
      for( int p = 0; p < nproc; p++ ) {
    5357:	8b 2d ab 9d 00 00    	mov    0x9dab(%rip),%ebp        # f108 <_ZL5nproc>
	low += work_mem[center_table[i]+p*stride];
    535d:	4c 8b 15 0c 9d 00 00 	mov    0x9d0c(%rip),%r10        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    5364:	4c 8b 1d a5 9d 00 00 	mov    0x9da5(%rip),%r11        # f110 <_ZL12center_table>
    536b:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
    5370:	f2 0f 10 54 24 20    	movsd  0x20(%rsp),%xmm2
    5376:	f2 0f 10 5c 24 28    	movsd  0x28(%rsp),%xmm3
    537c:	eb 0f                	jmp    538d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xced>
    537e:	66 90                	xchg   %ax,%ax
  for ( int i = k1; i < k2; i++ ) {
    5380:	49 83 c5 01          	add    $0x1,%r13
    5384:	4d 39 fd             	cmp    %r15,%r13
    5387:	0f 84 13 01 00 00    	je     54a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xe00>
    if( is_center[i] ) {
    538d:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
    5392:	74 ec                	je     5380 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xce0>
      for( int p = 0; p < nproc; p++ ) {
    5394:	4b 63 34 ab          	movslq (%r11,%r13,4),%rsi
    5398:	85 ed                	test   %ebp,%ebp
    539a:	0f 8e 90 0c 00 00    	jle    6030 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1990>
    53a0:	41 89 ec             	mov    %ebp,%r12d
    53a3:	49 8d 04 f2          	lea    (%r10,%rsi,8),%rax
      double low = z;
    53a7:	f2 44 0f 10 7c 24 18 	movsd  0x18(%rsp),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    53ae:	31 c9                	xor    %ecx,%ecx
    53b0:	41 83 e4 07          	and    $0x7,%r12d
    53b4:	74 77                	je     542d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd8d>
    53b6:	41 83 fc 01          	cmp    $0x1,%r12d
    53ba:	74 62                	je     541e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd7e>
    53bc:	41 83 fc 02          	cmp    $0x2,%r12d
    53c0:	74 51                	je     5413 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd73>
    53c2:	41 83 fc 03          	cmp    $0x3,%r12d
    53c6:	74 40                	je     5408 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd68>
    53c8:	41 83 fc 04          	cmp    $0x4,%r12d
    53cc:	74 2f                	je     53fd <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd5d>
    53ce:	41 83 fc 05          	cmp    $0x5,%r12d
    53d2:	74 1e                	je     53f2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd52>
    53d4:	41 83 fc 06          	cmp    $0x6,%r12d
    53d8:	74 0d                	je     53e7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd47>
	low += work_mem[center_table[i]+p*stride];
    53da:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    53df:	b9 01 00 00 00       	mov    $0x1,%ecx
    53e4:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    53e7:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    53ec:	83 c1 01             	add    $0x1,%ecx
    53ef:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    53f2:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    53f7:	83 c1 01             	add    $0x1,%ecx
    53fa:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    53fd:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5402:	83 c1 01             	add    $0x1,%ecx
    5405:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5408:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    540d:	83 c1 01             	add    $0x1,%ecx
    5410:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5413:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5418:	83 c1 01             	add    $0x1,%ecx
    541b:	48 01 d8             	add    %rbx,%rax
    541e:	83 c1 01             	add    $0x1,%ecx
	low += work_mem[center_table[i]+p*stride];
    5421:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5426:	48 01 d8             	add    %rbx,%rax
    5429:	39 e9                	cmp    %ebp,%ecx
    542b:	74 47                	je     5474 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xdd4>
	low += work_mem[center_table[i]+p*stride];
    542d:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5432:	48 01 d8             	add    %rbx,%rax
    5435:	83 c1 08             	add    $0x8,%ecx
	low += work_mem[center_table[i]+p*stride];
    5438:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    543d:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5440:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5445:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5448:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    544d:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5450:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5455:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5458:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    545d:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5460:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    5465:	48 01 d8             	add    %rbx,%rax
	low += work_mem[center_table[i]+p*stride];
    5468:	f2 44 0f 58 38       	addsd  (%rax),%xmm15
      for( int p = 0; p < nproc; p++ ) {
    546d:	48 01 d8             	add    %rbx,%rax
    5470:	39 e9                	cmp    %ebp,%ecx
    5472:	75 b9                	jne    542d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xd8d>
      if ( low > 0 ) {
    5474:	66 44 0f 2f fb       	comisd %xmm3,%xmm15
      gl_lower[center_table[i]] = low;
    5479:	f2 45 0f 11 3c f0    	movsd  %xmm15,(%r8,%rsi,8)
      if ( low > 0 ) {
    547f:	0f 86 fb fe ff ff    	jbe    5380 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xce0>
	++number_of_centers_to_close;  
    5485:	49 83 c5 01          	add    $0x1,%r13
    5489:	41 83 c1 01          	add    $0x1,%r9d
	cost_of_opening_x -= low;
    548d:	f2 41 0f 5c d7       	subsd  %xmm15,%xmm2
  for ( int i = k1; i < k2; i++ ) {
    5492:	4d 39 fd             	cmp    %r15,%r13
    5495:	0f 85 f2 fe ff ff    	jne    538d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xced>
    549b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    54a0:	66 0f ef c9          	pxor   %xmm1,%xmm1
    54a4:	f2 41 0f 2a c9       	cvtsi2sd %r9d,%xmm1
  work_mem[pid*stride + K] = number_of_centers_to_close;
    54a9:	8b 44 24 70          	mov    0x70(%rsp),%eax
    54ad:	03 44 24 74          	add    0x74(%rsp),%eax
    54b1:	66 0f 14 ca          	unpcklpd %xmm2,%xmm1
    54b5:	f2 0f 11 5c 24 20    	movsd  %xmm3,0x20(%rsp)
    54bb:	48 98                	cltq   
  pthread_barrier_wait(barrier);
    54bd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  work_mem[pid*stride + K] = number_of_centers_to_close;
    54c2:	41 0f 11 0c c2       	movups %xmm1,(%r10,%rax,8)
  pthread_barrier_wait(barrier);
    54c7:	e8 84 5c 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid==0 ) {
    54cc:	8b 7c 24 34          	mov    0x34(%rsp),%edi
    54d0:	f2 0f 10 64 24 20    	movsd  0x20(%rsp),%xmm4
    54d6:	85 ff                	test   %edi,%edi
    54d8:	0f 85 f1 02 00 00    	jne    57cf <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x112f>
    gl_cost_of_opening_x = z;
    54de:	f2 44 0f 10 4c 24 18 	movsd  0x18(%rsp),%xmm9
    for( int p = 0; p < nproc; p++ ) {
    54e5:	44 8b 2d 1c 9c 00 00 	mov    0x9c1c(%rip),%r13d        # f108 <_ZL5nproc>
    gl_cost_of_opening_x = z;
    54ec:	f2 44 0f 11 0d 73 9b 	movsd  %xmm9,0x9b73(%rip)        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    54f3:	00 00 
    for( int p = 0; p < nproc; p++ ) {
    54f5:	45 85 ed             	test   %r13d,%r13d
    54f8:	0f 8e fd 01 00 00    	jle    56fb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x105b>
    54fe:	48 8b 15 6b 9b 00 00 	mov    0x9b6b(%rip),%rdx        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    5505:	45 89 eb             	mov    %r13d,%r11d
    5508:	44 8b 35 51 9b 00 00 	mov    0x9b51(%rip),%r14d        # f060 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE29gl_number_of_centers_to_close>
    550f:	45 31 c0             	xor    %r8d,%r8d
    5512:	48 8d 6c 1a f0       	lea    -0x10(%rdx,%rbx,1),%rbp
    5517:	41 83 e3 07          	and    $0x7,%r11d
    551b:	0f 84 26 01 00 00    	je     5647 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xfa7>
    5521:	41 83 fb 01          	cmp    $0x1,%r11d
    5525:	0f 84 f0 00 00 00    	je     561b <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xf7b>
    552b:	41 83 fb 02          	cmp    $0x2,%r11d
    552f:	0f 84 c3 00 00 00    	je     55f8 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xf58>
    5535:	41 83 fb 03          	cmp    $0x3,%r11d
    5539:	0f 84 95 00 00 00    	je     55d4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xf34>
    553f:	41 83 fb 04          	cmp    $0x4,%r11d
    5543:	74 6f                	je     55b4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xf14>
    5545:	41 83 fb 05          	cmp    $0x5,%r11d
    5549:	74 45                	je     5590 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xef0>
    554b:	41 83 fb 06          	cmp    $0x6,%r11d
    554f:	74 1f                	je     5570 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xed0>
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5551:	f2 44 0f 2c 4d 00    	cvttsd2si 0x0(%rbp),%r9d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5557:	f2 44 0f 58 4d 08    	addsd  0x8(%rbp),%xmm9
    555d:	48 01 dd             	add    %rbx,%rbp
    for( int p = 0; p < nproc; p++ ) {
    5560:	41 b8 01 00 00 00    	mov    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5566:	f2 44 0f 11 4c 24 18 	movsd  %xmm9,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    556d:	45 01 ce             	add    %r9d,%r14d
    5570:	f2 0f 2c 75 00       	cvttsd2si 0x0(%rbp),%esi
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5575:	f2 0f 10 7c 24 18    	movsd  0x18(%rsp),%xmm7
    for( int p = 0; p < nproc; p++ ) {
    557b:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    557f:	f2 0f 58 7d 08       	addsd  0x8(%rbp),%xmm7
    5584:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5587:	41 01 f6             	add    %esi,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    558a:	f2 0f 11 7c 24 18    	movsd  %xmm7,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5590:	f2 44 0f 2c 65 00    	cvttsd2si 0x0(%rbp),%r12d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5596:	f2 44 0f 10 54 24 18 	movsd  0x18(%rsp),%xmm10
    for( int p = 0; p < nproc; p++ ) {
    559d:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55a1:	f2 44 0f 58 55 08    	addsd  0x8(%rbp),%xmm10
    55a7:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55aa:	45 01 e6             	add    %r12d,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55ad:	f2 44 0f 11 54 24 18 	movsd  %xmm10,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55b4:	f2 0f 2c 4d 00       	cvttsd2si 0x0(%rbp),%ecx
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55b9:	f2 0f 10 44 24 18    	movsd  0x18(%rsp),%xmm0
    for( int p = 0; p < nproc; p++ ) {
    55bf:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55c3:	f2 0f 58 45 08       	addsd  0x8(%rbp),%xmm0
    55c8:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55cb:	41 01 ce             	add    %ecx,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55ce:	f2 0f 11 44 24 18    	movsd  %xmm0,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55d4:	f2 44 0f 2c 55 00    	cvttsd2si 0x0(%rbp),%r10d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55da:	f2 44 0f 10 5c 24 18 	movsd  0x18(%rsp),%xmm11
    for( int p = 0; p < nproc; p++ ) {
    55e1:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55e5:	f2 44 0f 58 5d 08    	addsd  0x8(%rbp),%xmm11
    55eb:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55ee:	45 01 d6             	add    %r10d,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55f1:	f2 44 0f 11 5c 24 18 	movsd  %xmm11,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    55f8:	f2 0f 2c 45 00       	cvttsd2si 0x0(%rbp),%eax
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    55fd:	f2 44 0f 10 64 24 18 	movsd  0x18(%rsp),%xmm12
    for( int p = 0; p < nproc; p++ ) {
    5604:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5608:	f2 44 0f 58 65 08    	addsd  0x8(%rbp),%xmm12
    560e:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5611:	41 01 c6             	add    %eax,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5614:	f2 44 0f 11 64 24 18 	movsd  %xmm12,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    561b:	f2 0f 2c 7d 00       	cvttsd2si 0x0(%rbp),%edi
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5620:	f2 44 0f 10 6c 24 18 	movsd  0x18(%rsp),%xmm13
    for( int p = 0; p < nproc; p++ ) {
    5627:	41 83 c0 01          	add    $0x1,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    562b:	f2 44 0f 58 6d 08    	addsd  0x8(%rbp),%xmm13
    5631:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5634:	41 01 fe             	add    %edi,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5637:	f2 44 0f 11 6c 24 18 	movsd  %xmm13,0x18(%rsp)
    for( int p = 0; p < nproc; p++ ) {
    563e:	45 39 e8             	cmp    %r13d,%r8d
    5641:	0f 84 9d 00 00 00    	je     56e4 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1044>
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5647:	f2 0f 2c 55 00       	cvttsd2si 0x0(%rbp),%edx
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    564c:	f2 0f 10 6c 24 18    	movsd  0x18(%rsp),%xmm5
    for( int p = 0; p < nproc; p++ ) {
    5652:	41 83 c0 08          	add    $0x8,%r8d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5656:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    565b:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    565e:	f2 44 0f 2c 5d 00    	cvttsd2si 0x0(%rbp),%r11d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5664:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    5669:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    566c:	f2 44 0f 2c 4d 00    	cvttsd2si 0x0(%rbp),%r9d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5672:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    5677:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    567a:	f2 0f 2c 75 00       	cvttsd2si 0x0(%rbp),%esi
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    567f:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    5684:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5687:	41 01 d6             	add    %edx,%r14d
    568a:	f2 44 0f 2c 65 00    	cvttsd2si 0x0(%rbp),%r12d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    5690:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    5695:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    5698:	f2 0f 2c 4d 00       	cvttsd2si 0x0(%rbp),%ecx
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    569d:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    56a2:	45 01 de             	add    %r11d,%r14d
    56a5:	48 01 dd             	add    %rbx,%rbp
    56a8:	f2 44 0f 2c 55 00    	cvttsd2si 0x0(%rbp),%r10d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    56ae:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    56b3:	45 01 ce             	add    %r9d,%r14d
    56b6:	48 01 dd             	add    %rbx,%rbp
    56b9:	f2 0f 2c 45 00       	cvttsd2si 0x0(%rbp),%eax
    56be:	41 01 f6             	add    %esi,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    56c1:	f2 0f 58 6d 08       	addsd  0x8(%rbp),%xmm5
    56c6:	48 01 dd             	add    %rbx,%rbp
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    56c9:	45 01 e6             	add    %r12d,%r14d
    56cc:	41 01 ce             	add    %ecx,%r14d
    56cf:	45 01 d6             	add    %r10d,%r14d
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    56d2:	f2 0f 11 6c 24 18    	movsd  %xmm5,0x18(%rsp)
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
    56d8:	41 01 c6             	add    %eax,%r14d
    for( int p = 0; p < nproc; p++ ) {
    56db:	45 39 e8             	cmp    %r13d,%r8d
    56de:	0f 85 63 ff ff ff    	jne    5647 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xfa7>
    56e4:	f2 44 0f 10 74 24 18 	movsd  0x18(%rsp),%xmm14
    56eb:	44 89 35 6e 99 00 00 	mov    %r14d,0x996e(%rip)        # f060 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE29gl_number_of_centers_to_close>
    56f2:	f2 44 0f 11 35 6d 99 	movsd  %xmm14,0x996d(%rip)        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    56f9:	00 00 
  pthread_barrier_wait(barrier);
    56fb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    5700:	f2 0f 11 64 24 18    	movsd  %xmm4,0x18(%rsp)
    5706:	e8 45 5a 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if ( gl_cost_of_opening_x < 0 ) {
    570b:	f2 44 0f 10 44 24 18 	movsd  0x18(%rsp),%xmm8
    5712:	66 44 0f 2f 05 4d 99 	comisd 0x994d(%rip),%xmm8        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    5719:	00 00 
    571b:	0f 87 df 00 00 00    	ja     5800 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1160>
      gl_cost_of_opening_x = 0;  // the value we'll return
    5721:	48 c7 05 3c 99 00 00 	movq   $0x0,0x993c(%rip)        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    5728:	00 00 00 00 
  pthread_barrier_wait(barrier);
    572c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    5731:	e8 1a 5a 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    free(work_mem);
    5736:	48 8b 3d 33 99 00 00 	mov    0x9933(%rip),%rdi        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    573d:	e8 ee cc ff ff       	callq  2430 <free@plt>
  return -gl_cost_of_opening_x;
    5742:	f2 0f 10 05 1e 99 00 	movsd  0x991e(%rip),%xmm0        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    5749:	00 
    574a:	66 0f 57 05 ae 6e 00 	xorpd  0x6eae(%rip),%xmm0        # c600 <_ZTS10FileStream+0x58>
    5751:	00 
}
    5752:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    5759:	5b                   	pop    %rbx
    575a:	5d                   	pop    %rbp
    575b:	41 5c                	pop    %r12
    575d:	41 5d                	pop    %r13
    575f:	41 5e                	pop    %r14
    5761:	41 5f                	pop    %r15
    5763:	c3                   	retq   
      center_table[i] = count++;
    5764:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    5768:	83 c1 01             	add    $0x1,%ecx
    576b:	e9 f9 f0 ff ff       	jmpq   4869 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1c9>
      lower[center_table[assign]] += current_cost - x_cost;
    5770:	48 63 46 b8          	movslq -0x48(%rsi),%rax
    5774:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    5779:	f3 0f 5c e8          	subss  %xmm0,%xmm5
    577d:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    5782:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    5787:	4c 63 14 81          	movslq (%rcx,%rax,4),%r10
    578b:	f3 44 0f 5a f5       	cvtss2sd %xmm5,%xmm14
    5790:	4a 8d 14 d7          	lea    (%rdi,%r10,8),%rdx
    5794:	48 03 54 24 40       	add    0x40(%rsp),%rdx
    5799:	f2 44 0f 58 32       	addsd  (%rdx),%xmm14
    579e:	f2 44 0f 11 32       	movsd  %xmm14,(%rdx)
    57a3:	e9 69 fb ff ff       	jmpq   5311 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xc71>
    57a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    57af:	00 
  float result=0.0;
    57b0:	66 0f ef c0          	pxor   %xmm0,%xmm0
    57b4:	e9 2e fb ff ff       	jmpq   52e7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xc47>
    57b9:	66 0f ef c0          	pxor   %xmm0,%xmm0
  for (i=0;i<dim;i++)
    57bd:	31 c0                	xor    %eax,%eax
    57bf:	e9 c9 fa ff ff       	jmpq   528d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xbed>
    57c4:	31 db                	xor    %ebx,%ebx
    57c6:	66 0f ef c0          	pxor   %xmm0,%xmm0
    57ca:	e9 4e f8 ff ff       	jmpq   501d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x97d>
  pthread_barrier_wait(barrier);
    57cf:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    57d4:	f2 0f 11 64 24 18    	movsd  %xmm4,0x18(%rsp)
    57da:	e8 71 59 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if ( gl_cost_of_opening_x < 0 ) {
    57df:	f2 44 0f 10 44 24 18 	movsd  0x18(%rsp),%xmm8
    57e6:	66 44 0f 2f 05 79 98 	comisd 0x9879(%rip),%xmm8        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    57ed:	00 00 
    57ef:	77 0f                	ja     5800 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1160>
  pthread_barrier_wait(barrier);
    57f1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    57f6:	e8 55 59 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  if( pid == 0 ) {
    57fb:	e9 42 ff ff ff       	jmpq   5742 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x10a2>
    for ( int i = k1; i < k2; i++ ) {
    5800:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
    5805:	0f 8e 46 07 00 00    	jle    5f51 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18b1>
      bool close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
    580b:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
	  dist(points->p[i], points->p[x], points->dim);
    5810:	4c 8b 6c 24 48       	mov    0x48(%rsp),%r13
    5815:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
    581a:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
      if ( switch_membership[i] || close_center ) {
    581f:	4c 8b 05 fa 98 00 00 	mov    0x98fa(%rip),%r8        # f120 <_ZL17switch_membership>
      bool close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
    5826:	48 8b 6b 10          	mov    0x10(%rbx),%rbp
	  dist(points->p[i], points->p[x], points->dim);
    582a:	49 c1 e5 05          	shl    $0x5,%r13
      bool close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
    582e:	4c 8b 35 db 98 00 00 	mov    0x98db(%rip),%r14        # f110 <_ZL12center_table>
    5835:	49 89 d3             	mov    %rdx,%r11
    5838:	4f 8d 24 38          	lea    (%r8,%r15,1),%r12
	  dist(points->p[i], points->p[x], points->dim);
    583c:	4a 8d 7c 2d 00       	lea    0x0(%rbp,%r13,1),%rdi
    5841:	4c 89 5c 24 28       	mov    %r11,0x28(%rsp)
    5846:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
    584b:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    5850:	49 8d 3c 10          	lea    (%r8,%rdx,1),%rdi
    5854:	48 c1 e2 05          	shl    $0x5,%rdx
    5858:	48 8d 44 15 40       	lea    0x40(%rbp,%rdx,1),%rax
    585d:	eb 28                	jmp    5887 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x11e7>
    585f:	90                   	nop
      bool close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
    5860:	4c 8b 78 d0          	mov    -0x30(%rax),%r15
    5864:	4b 63 34 be          	movslq (%r14,%r15,4),%rsi
      if ( switch_membership[i] || close_center ) {
    5868:	f2 41 0f 10 74 f5 00 	movsd  0x0(%r13,%rsi,8),%xmm6
    586f:	66 41 0f 2f f0       	comisd %xmm8,%xmm6
    5874:	77 16                	ja     588c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x11ec>
    for ( int i = k1; i < k2; i++ ) {
    5876:	48 83 c7 01          	add    $0x1,%rdi
    587a:	48 83 c0 20          	add    $0x20,%rax
    587e:	4c 39 e7             	cmp    %r12,%rdi
    5881:	0f 84 69 04 00 00    	je     5cf0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1650>
      if ( switch_membership[i] || close_center ) {
    5887:	80 3f 00             	cmpb   $0x0,(%rdi)
    588a:	74 d4                	je     5860 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x11c0>
	  dist(points->p[i], points->p[x], points->dim);
    588c:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
    5891:	0f 18 08             	prefetcht0 (%rax)
    5894:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
    5899:	0f 18 48 08          	prefetcht0 0x8(%rax)
	points->p[i].cost = points->p[i].weight *
    589d:	f3 0f 10 50 c0       	movss  -0x40(%rax),%xmm2
    58a2:	4c 8b 48 c8          	mov    -0x38(%rax),%r9
	  dist(points->p[i], points->p[x], points->dim);
    58a6:	44 8b 41 08          	mov    0x8(%rcx),%r8d
    58aa:	4d 8b 52 08          	mov    0x8(%r10),%r10
  for (i=0;i<dim;i++)
    58ae:	45 85 c0             	test   %r8d,%r8d
    58b1:	0f 8e df 07 00 00    	jle    6096 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19f6>
    58b7:	41 8d 58 ff          	lea    -0x1(%r8),%ebx
    58bb:	83 fb 02             	cmp    $0x2,%ebx
    58be:	0f 86 dc 07 00 00    	jbe    60a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1a00>
    58c4:	45 89 c3             	mov    %r8d,%r11d
    58c7:	41 c1 eb 02          	shr    $0x2,%r11d
    58cb:	41 83 fb 04          	cmp    $0x4,%r11d
    58cf:	0f 86 d7 07 00 00    	jbe    60ac <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1a0c>
    58d5:	41 8d 73 fb          	lea    -0x5(%r11),%esi
    58d9:	4c 89 d2             	mov    %r10,%rdx
    58dc:	4c 89 c9             	mov    %r9,%rcx
    58df:	bd 04 00 00 00       	mov    $0x4,%ebp
    58e4:	83 e6 fc             	and    $0xfffffffc,%esi
  float result=0.0;
    58e7:	66 0f ef c0          	pxor   %xmm0,%xmm0
    58eb:	83 c6 08             	add    $0x8,%esi
    58ee:	eb 03                	jmp    58f3 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1253>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    58f0:	44 89 fd             	mov    %r15d,%ebp
    58f3:	0f 10 1a             	movups (%rdx),%xmm3
    58f6:	44 0f 10 39          	movups (%rcx),%xmm15
    58fa:	44 8d 7d 04          	lea    0x4(%rbp),%r15d
    58fe:	0f 18 89 00 01 00 00 	prefetcht0 0x100(%rcx)
    5905:	0f 10 7a 10          	movups 0x10(%rdx),%xmm7
    5909:	44 0f 10 51 10       	movups 0x10(%rcx),%xmm10
    590e:	48 83 c1 40          	add    $0x40,%rcx
    5912:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    5919:	44 0f 5c fb          	subps  %xmm3,%xmm15
    591d:	44 0f 10 71 e0       	movups -0x20(%rcx),%xmm14
    5922:	0f 10 6a 20          	movups 0x20(%rdx),%xmm5
    5926:	48 83 c2 40          	add    $0x40,%rdx
    592a:	44 0f 5c d7          	subps  %xmm7,%xmm10
    592e:	44 0f 5c f5          	subps  %xmm5,%xmm14
    5932:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    5936:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    593a:	45 0f 59 f6          	mulps  %xmm14,%xmm14
    593e:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    5943:	45 0f 28 cf          	movaps %xmm15,%xmm9
    5947:	45 0f c6 cf 55       	shufps $0x55,%xmm15,%xmm9
    594c:	45 0f 28 e2          	movaps %xmm10,%xmm12
    5950:	41 0f 28 ca          	movaps %xmm10,%xmm1
    5954:	45 0f c6 e2 55       	shufps $0x55,%xmm10,%xmm12
    5959:	41 0f 15 ca          	unpckhps %xmm10,%xmm1
    595d:	41 0f 28 f6          	movaps %xmm14,%xmm6
    5961:	f3 44 0f 58 c8       	addss  %xmm0,%xmm9
    5966:	41 0f 28 c7          	movaps %xmm15,%xmm0
    596a:	44 0f 28 e9          	movaps %xmm1,%xmm13
    596e:	41 0f 15 c7          	unpckhps %xmm15,%xmm0
    5972:	45 0f c6 ff ff       	shufps $0xff,%xmm15,%xmm15
    5977:	41 0f 28 ce          	movaps %xmm14,%xmm1
    597b:	0f 28 e0             	movaps %xmm0,%xmm4
    597e:	0f 10 41 f0          	movups -0x10(%rcx),%xmm0
    5982:	41 0f c6 ce 55       	shufps $0x55,%xmm14,%xmm1
    5987:	f3 41 0f 58 e1       	addss  %xmm9,%xmm4
    598c:	44 0f 10 4a f0       	movups -0x10(%rdx),%xmm9
    5991:	41 0f 5c c1          	subps  %xmm9,%xmm0
    5995:	f3 44 0f 58 fc       	addss  %xmm4,%xmm15
    599a:	0f 59 c0             	mulps  %xmm0,%xmm0
    599d:	f3 45 0f 58 fa       	addss  %xmm10,%xmm15
    59a2:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    59a7:	f3 45 0f 58 e7       	addss  %xmm15,%xmm12
    59ac:	0f 28 e0             	movaps %xmm0,%xmm4
    59af:	0f 28 f8             	movaps %xmm0,%xmm7
    59b2:	0f 15 f8             	unpckhps %xmm0,%xmm7
    59b5:	f3 45 0f 58 ec       	addss  %xmm12,%xmm13
    59ba:	f3 45 0f 58 ea       	addss  %xmm10,%xmm13
    59bf:	f3 41 0f 58 f5       	addss  %xmm13,%xmm6
    59c4:	f3 0f 58 f1          	addss  %xmm1,%xmm6
    59c8:	41 0f 28 ce          	movaps %xmm14,%xmm1
    59cc:	41 0f 15 ce          	unpckhps %xmm14,%xmm1
    59d0:	45 0f c6 f6 ff       	shufps $0xff,%xmm14,%xmm14
    59d5:	0f 28 d9             	movaps %xmm1,%xmm3
    59d8:	0f 28 c8             	movaps %xmm0,%xmm1
    59db:	f3 0f 58 de          	addss  %xmm6,%xmm3
    59df:	0f c6 c8 55          	shufps $0x55,%xmm0,%xmm1
    59e3:	0f c6 c0 ff          	shufps $0xff,%xmm0,%xmm0
    59e7:	f3 41 0f 58 de       	addss  %xmm14,%xmm3
    59ec:	f3 0f 58 e3          	addss  %xmm3,%xmm4
    59f0:	f3 0f 58 e1          	addss  %xmm1,%xmm4
    59f4:	f3 0f 58 fc          	addss  %xmm4,%xmm7
    59f8:	f3 0f 58 c7          	addss  %xmm7,%xmm0
  for (i=0;i<dim;i++)
    59fc:	44 39 fe             	cmp    %r15d,%esi
    59ff:	0f 85 eb fe ff ff    	jne    58f0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1250>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5a05:	44 0f 10 19          	movups (%rcx),%xmm11
    5a09:	44 0f 10 22          	movups (%rdx),%xmm12
    5a0d:	41 89 ef             	mov    %ebp,%r15d
    5a10:	8d 5d 01             	lea    0x1(%rbp),%ebx
    5a13:	41 f7 d7             	not    %r15d
    5a16:	be 10 00 00 00       	mov    $0x10,%esi
    5a1b:	45 0f 5c dc          	subps  %xmm12,%xmm11
    5a1f:	45 01 df             	add    %r11d,%r15d
    5a22:	41 83 e7 03          	and    $0x3,%r15d
    5a26:	45 0f 59 db          	mulps  %xmm11,%xmm11
    5a2a:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    5a2f:	41 0f 28 eb          	movaps %xmm11,%xmm5
    5a33:	41 0f c6 eb 55       	shufps $0x55,%xmm11,%xmm5
    5a38:	f3 0f 58 e8          	addss  %xmm0,%xmm5
    5a3c:	41 0f 28 c3          	movaps %xmm11,%xmm0
    5a40:	41 0f 15 c3          	unpckhps %xmm11,%xmm0
    5a44:	45 0f c6 db ff       	shufps $0xff,%xmm11,%xmm11
    5a49:	45 0f 28 d3          	movaps %xmm11,%xmm10
    5a4d:	0f 28 f0             	movaps %xmm0,%xmm6
    5a50:	f3 0f 58 f5          	addss  %xmm5,%xmm6
    5a54:	f3 44 0f 58 d6       	addss  %xmm6,%xmm10
  for (i=0;i<dim;i++)
    5a59:	44 39 db             	cmp    %r11d,%ebx
    5a5c:	0f 83 00 02 00 00    	jae    5c62 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x15c2>
    5a62:	45 85 ff             	test   %r15d,%r15d
    5a65:	0f 84 ed 00 00 00    	je     5b58 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x14b8>
    5a6b:	41 83 ff 01          	cmp    $0x1,%r15d
    5a6f:	0f 84 8f 00 00 00    	je     5b04 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1464>
    5a75:	41 83 ff 02          	cmp    $0x2,%r15d
    5a79:	74 47                	je     5ac2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1422>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5a7b:	44 0f 10 79 10       	movups 0x10(%rcx),%xmm15
    5a80:	0f 10 5a 10          	movups 0x10(%rdx),%xmm3
    5a84:	be 20 00 00 00       	mov    $0x20,%esi
    5a89:	8d 5d 02             	lea    0x2(%rbp),%ebx
    5a8c:	44 0f 5c fb          	subps  %xmm3,%xmm15
    5a90:	45 0f 59 ff          	mulps  %xmm15,%xmm15
    5a94:	f3 45 0f 58 d7       	addss  %xmm15,%xmm10
    5a99:	41 0f 28 cf          	movaps %xmm15,%xmm1
    5a9d:	41 0f c6 cf 55       	shufps $0x55,%xmm15,%xmm1
    5aa2:	f3 41 0f 58 ca       	addss  %xmm10,%xmm1
    5aa7:	45 0f 28 d7          	movaps %xmm15,%xmm10
    5aab:	45 0f 15 d7          	unpckhps %xmm15,%xmm10
    5aaf:	f3 41 0f 58 ca       	addss  %xmm10,%xmm1
    5ab4:	45 0f 28 d7          	movaps %xmm15,%xmm10
    5ab8:	45 0f c6 d7 ff       	shufps $0xff,%xmm15,%xmm10
    5abd:	f3 44 0f 58 d1       	addss  %xmm1,%xmm10
    5ac2:	0f 10 3c 31          	movups (%rcx,%rsi,1),%xmm7
    5ac6:	44 0f 10 1c 32       	movups (%rdx,%rsi,1),%xmm11
    5acb:	83 c3 01             	add    $0x1,%ebx
    5ace:	48 83 c6 10          	add    $0x10,%rsi
    5ad2:	41 0f 5c fb          	subps  %xmm11,%xmm7
    5ad6:	0f 59 ff             	mulps  %xmm7,%xmm7
    5ad9:	f3 44 0f 58 d7       	addss  %xmm7,%xmm10
    5ade:	44 0f 28 ef          	movaps %xmm7,%xmm13
    5ae2:	0f 28 ef             	movaps %xmm7,%xmm5
    5ae5:	44 0f c6 ef 55       	shufps $0x55,%xmm7,%xmm13
    5aea:	0f 15 ef             	unpckhps %xmm7,%xmm5
    5aed:	0f c6 ff ff          	shufps $0xff,%xmm7,%xmm7
    5af1:	f3 45 0f 58 ea       	addss  %xmm10,%xmm13
    5af6:	44 0f 28 d7          	movaps %xmm7,%xmm10
    5afa:	f3 44 0f 58 ed       	addss  %xmm5,%xmm13
    5aff:	f3 45 0f 58 d5       	addss  %xmm13,%xmm10
    5b04:	44 0f 10 34 31       	movups (%rcx,%rsi,1),%xmm14
    5b09:	0f 10 24 32          	movups (%rdx,%rsi,1),%xmm4
    5b0d:	83 c3 01             	add    $0x1,%ebx
    5b10:	48 83 c6 10          	add    $0x10,%rsi
    5b14:	44 0f 5c f4          	subps  %xmm4,%xmm14
    5b18:	45 0f 59 f6          	mulps  %xmm14,%xmm14
    5b1c:	f3 45 0f 58 d6       	addss  %xmm14,%xmm10
    5b21:	45 0f 28 fe          	movaps %xmm14,%xmm15
    5b25:	41 0f 28 c6          	movaps %xmm14,%xmm0
    5b29:	45 0f c6 fe 55       	shufps $0x55,%xmm14,%xmm15
    5b2e:	41 0f 15 c6          	unpckhps %xmm14,%xmm0
    5b32:	45 0f c6 f6 ff       	shufps $0xff,%xmm14,%xmm14
    5b37:	f3 45 0f 58 fa       	addss  %xmm10,%xmm15
    5b3c:	45 0f 28 d6          	movaps %xmm14,%xmm10
    5b40:	f3 44 0f 58 f8       	addss  %xmm0,%xmm15
    5b45:	f3 45 0f 58 d7       	addss  %xmm15,%xmm10
  for (i=0;i<dim;i++)
    5b4a:	44 39 db             	cmp    %r11d,%ebx
    5b4d:	0f 83 0f 01 00 00    	jae    5c62 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x15c2>
    5b53:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5b58:	44 0f 10 0c 32       	movups (%rdx,%rsi,1),%xmm9
    5b5d:	0f 10 1c 31          	movups (%rcx,%rsi,1),%xmm3
    5b61:	83 c3 04             	add    $0x4,%ebx
    5b64:	44 0f 10 64 31 10    	movups 0x10(%rcx,%rsi,1),%xmm12
    5b6a:	44 0f 10 6c 32 10    	movups 0x10(%rdx,%rsi,1),%xmm13
    5b70:	41 0f 5c d9          	subps  %xmm9,%xmm3
    5b74:	0f 10 64 32 20       	movups 0x20(%rdx,%rsi,1),%xmm4
    5b79:	0f 10 4c 31 30       	movups 0x30(%rcx,%rsi,1),%xmm1
    5b7e:	45 0f 5c e5          	subps  %xmm13,%xmm12
    5b82:	0f 59 db             	mulps  %xmm3,%xmm3
    5b85:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    5b89:	f3 44 0f 58 d3       	addss  %xmm3,%xmm10
    5b8e:	0f 28 eb             	movaps %xmm3,%xmm5
    5b91:	0f 28 c3             	movaps %xmm3,%xmm0
    5b94:	0f c6 eb 55          	shufps $0x55,%xmm3,%xmm5
    5b98:	0f 28 fd             	movaps %xmm5,%xmm7
    5b9b:	0f 15 c3             	unpckhps %xmm3,%xmm0
    5b9e:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    5ba2:	44 0f 28 d8          	movaps %xmm0,%xmm11
    5ba6:	41 0f 28 f4          	movaps %xmm12,%xmm6
    5baa:	41 0f 28 c4          	movaps %xmm12,%xmm0
    5bae:	0f 10 6c 32 30       	movups 0x30(%rdx,%rsi,1),%xmm5
    5bb3:	f3 41 0f 58 fa       	addss  %xmm10,%xmm7
    5bb8:	44 0f 10 54 31 20    	movups 0x20(%rcx,%rsi,1),%xmm10
    5bbe:	41 0f c6 f4 55       	shufps $0x55,%xmm12,%xmm6
    5bc3:	41 0f 15 c4          	unpckhps %xmm12,%xmm0
    5bc7:	44 0f 28 f8          	movaps %xmm0,%xmm15
    5bcb:	0f 5c cd             	subps  %xmm5,%xmm1
    5bce:	48 83 c6 40          	add    $0x40,%rsi
    5bd2:	44 0f 5c d4          	subps  %xmm4,%xmm10
    5bd6:	f3 44 0f 58 df       	addss  %xmm7,%xmm11
    5bdb:	0f 59 c9             	mulps  %xmm1,%xmm1
    5bde:	45 0f 59 d2          	mulps  %xmm10,%xmm10
    5be2:	f3 44 0f 58 db       	addss  %xmm3,%xmm11
    5be7:	f3 45 0f 58 dc       	addss  %xmm12,%xmm11
    5bec:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    5bf1:	45 0f 28 ca          	movaps %xmm10,%xmm9
    5bf5:	41 0f 28 c2          	movaps %xmm10,%xmm0
    5bf9:	45 0f c6 ca 55       	shufps $0x55,%xmm10,%xmm9
    5bfe:	41 0f 15 c2          	unpckhps %xmm10,%xmm0
    5c02:	f3 41 0f 58 f3       	addss  %xmm11,%xmm6
    5c07:	44 0f 28 d8          	movaps %xmm0,%xmm11
    5c0b:	0f 28 c1             	movaps %xmm1,%xmm0
    5c0e:	0f 15 c1             	unpckhps %xmm1,%xmm0
    5c11:	f3 44 0f 58 fe       	addss  %xmm6,%xmm15
    5c16:	f3 45 0f 58 fc       	addss  %xmm12,%xmm15
    5c1b:	44 0f 28 e1          	movaps %xmm1,%xmm12
    5c1f:	44 0f c6 e1 55       	shufps $0x55,%xmm1,%xmm12
    5c24:	f3 45 0f 58 fa       	addss  %xmm10,%xmm15
    5c29:	45 0f c6 d2 ff       	shufps $0xff,%xmm10,%xmm10
    5c2e:	f3 45 0f 58 cf       	addss  %xmm15,%xmm9
    5c33:	f3 45 0f 58 d9       	addss  %xmm9,%xmm11
    5c38:	f3 45 0f 58 da       	addss  %xmm10,%xmm11
    5c3d:	44 0f 28 d0          	movaps %xmm0,%xmm10
    5c41:	f3 44 0f 58 d9       	addss  %xmm1,%xmm11
    5c46:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    5c4a:	f3 45 0f 58 e3       	addss  %xmm11,%xmm12
    5c4f:	f3 45 0f 58 d4       	addss  %xmm12,%xmm10
    5c54:	f3 44 0f 58 d1       	addss  %xmm1,%xmm10
  for (i=0;i<dim;i++)
    5c59:	44 39 db             	cmp    %r11d,%ebx
    5c5c:	0f 82 f6 fe ff ff    	jb     5b58 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x14b8>
    5c62:	44 89 c5             	mov    %r8d,%ebp
    5c65:	83 e5 fc             	and    $0xfffffffc,%ebp
    5c68:	44 39 c5             	cmp    %r8d,%ebp
    5c6b:	74 5a                	je     5cc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1627>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5c6d:	4c 63 dd             	movslq %ebp,%r11
  for (i=0;i<dim;i++)
    5c70:	8d 55 01             	lea    0x1(%rbp),%edx
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5c73:	f3 47 0f 10 2c 99    	movss  (%r9,%r11,4),%xmm13
    5c79:	f3 47 0f 5c 2c 9a    	subss  (%r10,%r11,4),%xmm13
    5c7f:	f3 45 0f 59 ed       	mulss  %xmm13,%xmm13
    5c84:	f3 45 0f 58 d5       	addss  %xmm13,%xmm10
  for (i=0;i<dim;i++)
    5c89:	41 39 d0             	cmp    %edx,%r8d
    5c8c:	7e 39                	jle    5cc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1627>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5c8e:	48 63 ca             	movslq %edx,%rcx
  for (i=0;i<dim;i++)
    5c91:	83 c5 02             	add    $0x2,%ebp
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5c94:	f3 45 0f 10 34 89    	movss  (%r9,%rcx,4),%xmm14
    5c9a:	f3 45 0f 5c 34 8a    	subss  (%r10,%rcx,4),%xmm14
    5ca0:	f3 45 0f 59 f6       	mulss  %xmm14,%xmm14
    5ca5:	f3 45 0f 58 d6       	addss  %xmm14,%xmm10
  for (i=0;i<dim;i++)
    5caa:	41 39 e8             	cmp    %ebp,%r8d
    5cad:	7e 18                	jle    5cc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1627>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    5caf:	48 63 ed             	movslq %ebp,%rbp
    5cb2:	f3 41 0f 10 34 a9    	movss  (%r9,%rbp,4),%xmm6
    5cb8:	f3 41 0f 5c 34 aa    	subss  (%r10,%rbp,4),%xmm6
    5cbe:	f3 0f 59 f6          	mulss  %xmm6,%xmm6
    5cc2:	f3 44 0f 58 d6       	addss  %xmm6,%xmm10
	points->p[i].cost = points->p[i].weight *
    5cc7:	f3 44 0f 59 d2       	mulss  %xmm2,%xmm10
	points->p[i].assign = x;
    5ccc:	4c 8b 7c 24 48       	mov    0x48(%rsp),%r15
    5cd1:	48 83 c7 01          	add    $0x1,%rdi
    5cd5:	0f 18 48 18          	prefetcht0 0x18(%rax)
    5cd9:	48 83 c0 20          	add    $0x20,%rax
    5cdd:	4c 89 78 b0          	mov    %r15,-0x50(%rax)
	points->p[i].cost = points->p[i].weight *
    5ce1:	f3 44 0f 11 50 b8    	movss  %xmm10,-0x48(%rax)
    for ( int i = k1; i < k2; i++ ) {
    5ce7:	4c 39 e7             	cmp    %r12,%rdi
    5cea:	0f 85 97 fb ff ff    	jne    5887 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x11e7>
    5cf0:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
    5cf5:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5cfa:	4c 8b 05 17 94 00 00 	mov    0x9417(%rip),%r8        # f118 <_ZL9is_center>
    5d01:	4c 89 fe             	mov    %r15,%rsi
    5d04:	48 2b 74 24 08       	sub    0x8(%rsp),%rsi
    5d09:	83 e6 07             	and    $0x7,%esi
    5d0c:	0f 84 1c 01 00 00    	je     5e2e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x178e>
    5d12:	48 83 fe 01          	cmp    $0x1,%rsi
    5d16:	0f 84 fa 00 00 00    	je     5e16 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1776>
    5d1c:	48 83 fe 02          	cmp    $0x2,%rsi
    5d20:	0f 84 ca 00 00 00    	je     5df0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1750>
    5d26:	48 83 fe 03          	cmp    $0x3,%rsi
    5d2a:	0f 84 9b 00 00 00    	je     5dcb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x172b>
    5d30:	48 83 fe 04          	cmp    $0x4,%rsi
    5d34:	74 70                	je     5da6 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1706>
    5d36:	48 83 fe 05          	cmp    $0x5,%rsi
    5d3a:	74 44                	je     5d80 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16e0>
    5d3c:	48 83 fe 06          	cmp    $0x6,%rsi
    5d40:	74 2f                	je     5d71 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16d1>
    5d42:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    5d47:	41 80 3c 18 00       	cmpb   $0x0,(%r8,%rbx,1)
    5d4c:	74 1a                	je     5d68 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16c8>
    5d4e:	49 63 04 9e          	movslq (%r14,%rbx,4),%rax
    5d52:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    5d57:	f2 0f 10 14 c7       	movsd  (%rdi,%rax,8),%xmm2
    5d5c:	66 41 0f 2f d0       	comisd %xmm8,%xmm2
    5d61:	76 05                	jbe    5d68 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16c8>
	is_center[i] = false;
    5d63:	41 c6 04 18 00       	movb   $0x0,(%r8,%rbx,1)
    for( int i = k1; i < k2; i++ ) {
    5d68:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
    5d6d:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5d71:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5d76:	0f 85 d7 03 00 00    	jne    6153 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1ab3>
    for( int i = k1; i < k2; i++ ) {
    5d7c:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5d80:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5d85:	74 1b                	je     5da2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1702>
    5d87:	4f 63 24 ae          	movslq (%r14,%r13,4),%r12
    5d8b:	4c 8b 5c 24 60       	mov    0x60(%rsp),%r11
    5d90:	f2 47 0f 10 14 e3    	movsd  (%r11,%r12,8),%xmm10
    5d96:	66 45 0f 2f d0       	comisd %xmm8,%xmm10
    5d9b:	76 05                	jbe    5da2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1702>
	is_center[i] = false;
    5d9d:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    for( int i = k1; i < k2; i++ ) {
    5da2:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5da6:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5dab:	74 1a                	je     5dc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1727>
    5dad:	4b 63 14 ae          	movslq (%r14,%r13,4),%rdx
    5db1:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    5db6:	f2 0f 10 24 d1       	movsd  (%rcx,%rdx,8),%xmm4
    5dbb:	66 41 0f 2f e0       	comisd %xmm8,%xmm4
    5dc0:	76 05                	jbe    5dc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1727>
	is_center[i] = false;
    5dc2:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    for( int i = k1; i < k2; i++ ) {
    5dc7:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5dcb:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5dd0:	74 1a                	je     5dec <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x174c>
    5dd2:	4b 63 2c ae          	movslq (%r14,%r13,4),%rbp
    5dd6:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
    5ddb:	f2 0f 10 1c ee       	movsd  (%rsi,%rbp,8),%xmm3
    5de0:	66 41 0f 2f d8       	comisd %xmm8,%xmm3
    5de5:	76 05                	jbe    5dec <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x174c>
	is_center[i] = false;
    5de7:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    for( int i = k1; i < k2; i++ ) {
    5dec:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5df0:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5df5:	74 1b                	je     5e12 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1772>
    5df7:	4b 63 04 ae          	movslq (%r14,%r13,4),%rax
    5dfb:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
    5e00:	f2 44 0f 10 0c c3    	movsd  (%rbx,%rax,8),%xmm9
    5e06:	66 45 0f 2f c8       	comisd %xmm8,%xmm9
    5e0b:	76 05                	jbe    5e12 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1772>
	is_center[i] = false;
    5e0d:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    for( int i = k1; i < k2; i++ ) {
    5e12:	49 83 c5 01          	add    $0x1,%r13
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5e16:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5e1b:	0f 85 36 02 00 00    	jne    6057 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x19b7>
    for( int i = k1; i < k2; i++ ) {
    5e21:	49 83 c5 01          	add    $0x1,%r13
    5e25:	4d 39 fd             	cmp    %r15,%r13
    5e28:	0f 84 23 01 00 00    	je     5f51 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18b1>
    5e2e:	4c 8b 54 24 60       	mov    0x60(%rsp),%r10
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5e33:	43 80 3c 28 00       	cmpb   $0x0,(%r8,%r13,1)
    5e38:	74 16                	je     5e50 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17b0>
    5e3a:	4f 63 24 ae          	movslq (%r14,%r13,4),%r12
    5e3e:	f2 43 0f 10 0c e2    	movsd  (%r10,%r12,8),%xmm1
    5e44:	66 41 0f 2f c8       	comisd %xmm8,%xmm1
    5e49:	76 05                	jbe    5e50 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17b0>
	is_center[i] = false;
    5e4b:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5e50:	43 80 7c 28 01 00    	cmpb   $0x0,0x1(%r8,%r13,1)
    5e56:	4d 8d 5d 01          	lea    0x1(%r13),%r11
    5e5a:	74 16                	je     5e72 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17d2>
    5e5c:	4f 63 2c 9e          	movslq (%r14,%r11,4),%r13
    5e60:	f2 43 0f 10 2c ea    	movsd  (%r10,%r13,8),%xmm5
    5e66:	66 41 0f 2f e8       	comisd %xmm8,%xmm5
    5e6b:	76 05                	jbe    5e72 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17d2>
	is_center[i] = false;
    5e6d:	43 c6 04 18 00       	movb   $0x0,(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5e72:	43 80 7c 18 01 00    	cmpb   $0x0,0x1(%r8,%r11,1)
    5e78:	49 8d 53 01          	lea    0x1(%r11),%rdx
    5e7c:	74 17                	je     5e95 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17f5>
    5e7e:	49 63 0c 96          	movslq (%r14,%rdx,4),%rcx
    5e82:	f2 41 0f 10 3c ca    	movsd  (%r10,%rcx,8),%xmm7
    5e88:	66 41 0f 2f f8       	comisd %xmm8,%xmm7
    5e8d:	76 06                	jbe    5e95 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x17f5>
	is_center[i] = false;
    5e8f:	43 c6 44 18 01 00    	movb   $0x0,0x1(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5e95:	43 80 7c 18 02 00    	cmpb   $0x0,0x2(%r8,%r11,1)
    5e9b:	49 8d 6b 02          	lea    0x2(%r11),%rbp
    5e9f:	74 17                	je     5eb8 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1818>
    5ea1:	49 63 34 ae          	movslq (%r14,%rbp,4),%rsi
    5ea5:	f2 45 0f 10 24 f2    	movsd  (%r10,%rsi,8),%xmm12
    5eab:	66 45 0f 2f e0       	comisd %xmm8,%xmm12
    5eb0:	76 06                	jbe    5eb8 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1818>
	is_center[i] = false;
    5eb2:	43 c6 44 18 02 00    	movb   $0x0,0x2(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5eb8:	43 80 7c 18 03 00    	cmpb   $0x0,0x3(%r8,%r11,1)
    5ebe:	49 8d 43 03          	lea    0x3(%r11),%rax
    5ec2:	74 17                	je     5edb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x183b>
    5ec4:	49 63 1c 86          	movslq (%r14,%rax,4),%rbx
    5ec8:	f2 41 0f 10 04 da    	movsd  (%r10,%rbx,8),%xmm0
    5ece:	66 41 0f 2f c0       	comisd %xmm8,%xmm0
    5ed3:	76 06                	jbe    5edb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x183b>
	is_center[i] = false;
    5ed5:	43 c6 44 18 03 00    	movb   $0x0,0x3(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5edb:	43 80 7c 18 04 00    	cmpb   $0x0,0x4(%r8,%r11,1)
    5ee1:	49 8d 7b 04          	lea    0x4(%r11),%rdi
    5ee5:	74 17                	je     5efe <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x185e>
    5ee7:	4d 63 0c be          	movslq (%r14,%rdi,4),%r9
    5eeb:	f2 47 0f 10 2c ca    	movsd  (%r10,%r9,8),%xmm13
    5ef1:	66 45 0f 2f e8       	comisd %xmm8,%xmm13
    5ef6:	76 06                	jbe    5efe <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x185e>
	is_center[i] = false;
    5ef8:	43 c6 44 18 04 00    	movb   $0x0,0x4(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5efe:	43 80 7c 18 05 00    	cmpb   $0x0,0x5(%r8,%r11,1)
    5f04:	4d 8d 63 05          	lea    0x5(%r11),%r12
    5f08:	74 17                	je     5f21 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1881>
    5f0a:	4f 63 2c a6          	movslq (%r14,%r12,4),%r13
    5f0e:	f2 47 0f 10 34 ea    	movsd  (%r10,%r13,8),%xmm14
    5f14:	66 45 0f 2f f0       	comisd %xmm8,%xmm14
    5f19:	76 06                	jbe    5f21 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1881>
	is_center[i] = false;
    5f1b:	43 c6 44 18 05 00    	movb   $0x0,0x5(%r8,%r11,1)
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    5f21:	43 80 7c 18 06 00    	cmpb   $0x0,0x6(%r8,%r11,1)
    5f27:	49 8d 53 06          	lea    0x6(%r11),%rdx
    5f2b:	74 17                	je     5f44 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18a4>
    5f2d:	49 63 0c 96          	movslq (%r14,%rdx,4),%rcx
    5f31:	f2 41 0f 10 34 ca    	movsd  (%r10,%rcx,8),%xmm6
    5f37:	66 41 0f 2f f0       	comisd %xmm8,%xmm6
    5f3c:	76 06                	jbe    5f44 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18a4>
	is_center[i] = false;
    5f3e:	43 c6 44 18 06 00    	movb   $0x0,0x6(%r8,%r11,1)
    for( int i = k1; i < k2; i++ ) {
    5f44:	4d 8d 6b 07          	lea    0x7(%r11),%r13
    5f48:	4d 39 fd             	cmp    %r15,%r13
    5f4b:	0f 85 e2 fe ff ff    	jne    5e33 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1793>
    if( x >= k1 && x < k2 ) {
    5f51:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
    5f56:	4c 39 74 24 58       	cmp    %r14,0x58(%rsp)
    5f5b:	7f 11                	jg     5f6e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18ce>
    5f5d:	4d 39 f7             	cmp    %r14,%r15
    5f60:	7e 0c                	jle    5f6e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x18ce>
      is_center[x] = true;
    5f62:	4c 8b 3d af 91 00 00 	mov    0x91af(%rip),%r15        # f118 <_ZL9is_center>
    5f69:	43 c6 04 37 01       	movb   $0x1,(%r15,%r14,1)
    if( pid==0 ) {
    5f6e:	44 8b 44 24 34       	mov    0x34(%rsp),%r8d
    5f73:	45 85 c0             	test   %r8d,%r8d
    5f76:	0f 85 75 f8 ff ff    	jne    57f1 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1151>
      *numcenters = *numcenters + 1 - gl_number_of_centers_to_close;
    5f7c:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
    5f81:	48 63 2d d8 90 00 00 	movslq 0x90d8(%rip),%rbp        # f060 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE29gl_number_of_centers_to_close>
    5f88:	4d 8b 1a             	mov    (%r10),%r11
    5f8b:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
    5f90:	49 83 c3 01          	add    $0x1,%r11
    5f94:	49 29 eb             	sub    %rbp,%r11
    5f97:	4d 89 1a             	mov    %r11,(%r10)
    5f9a:	e9 8d f7 ff ff       	jmpq   572c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x108c>
    5f9f:	4d 89 fd             	mov    %r15,%r13
    5fa2:	4c 2b 6c 24 58       	sub    0x58(%rsp),%r13
    5fa7:	e9 69 e7 ff ff       	jmpq   4715 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x75>
    work_mem = (double*) malloc(stride*(nproc+1)*sizeof(double));
    5fac:	44 8d 49 01          	lea    0x1(%rcx),%r9d
    5fb0:	44 0f af cd          	imul   %ebp,%r9d
    5fb4:	49 63 f9             	movslq %r9d,%rdi
    5fb7:	48 c1 e7 03          	shl    $0x3,%rdi
    5fbb:	e8 c0 c4 ff ff       	callq  2480 <malloc@plt>
  pthread_barrier_wait(barrier);
    5fc0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    gl_cost_of_opening_x = 0;
    5fc5:	48 c7 05 98 90 00 00 	movq   $0x0,0x9098(%rip)        # f068 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE20gl_cost_of_opening_x>
    5fcc:	00 00 00 00 
    work_mem = (double*) malloc(stride*(nproc+1)*sizeof(double));
    5fd0:	48 89 05 99 90 00 00 	mov    %rax,0x9099(%rip)        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    gl_number_of_centers_to_close = 0;
    5fd7:	c7 05 7f 90 00 00 00 	movl   $0x0,0x907f(%rip)        # f060 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE29gl_number_of_centers_to_close>
    5fde:	00 00 00 
  pthread_barrier_wait(barrier);
    5fe1:	e8 6a 51 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    5fe6:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
    5feb:	0f 8f b1 e7 ff ff    	jg     47a2 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x102>
  work_mem[pid*stride] = count;
    5ff1:	4c 8b 1d 78 90 00 00 	mov    0x9078(%rip),%r11        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
  pthread_barrier_wait(barrier);
    5ff8:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  work_mem[pid*stride] = count;
    5ffd:	4b c7 04 e3 00 00 00 	movq   $0x0,(%r11,%r12,8)
    6004:	00 
  pthread_barrier_wait(barrier);
    6005:	e8 46 51 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    for( int p = 0; p < nproc; p++ ) {
    600a:	8b 0d f8 90 00 00    	mov    0x90f8(%rip),%ecx        # f108 <_ZL5nproc>
    6010:	85 c9                	test   %ecx,%ecx
    6012:	0f 8f 4b e9 ff ff    	jg     4963 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x2c3>
  pthread_barrier_wait(barrier);
    6018:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    601d:	e8 2e 51 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    6022:	e9 37 eb ff ff       	jmpq   4b5e <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x4be>
    6027:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    602e:	00 00 
      double low = z;
    6030:	f2 44 0f 10 7c 24 18 	movsd  0x18(%rsp),%xmm15
    6037:	e9 38 f4 ff ff       	jmpq   5474 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0xdd4>
      center_table[i] += (int)work_mem[pid*stride];
    603c:	f2 41 0f 2c 34 24    	cvttsd2si (%r12),%esi
    6042:	41 01 34 80          	add    %esi,(%r8,%rax,4)
    6046:	e9 8a ec ff ff       	jmpq   4cd5 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x635>
      center_table[i] = count++;
    604b:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    604f:	83 c1 01             	add    $0x1,%ecx
    6052:	e9 f1 e7 ff ff       	jmpq   4848 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1a8>
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    6057:	4b 63 3c ae          	movslq (%r14,%r13,4),%rdi
    605b:	4c 8b 4c 24 60       	mov    0x60(%rsp),%r9
    6060:	f2 45 0f 10 1c f9    	movsd  (%r9,%rdi,8),%xmm11
    6066:	66 45 0f 2f d8       	comisd %xmm8,%xmm11
    606b:	0f 86 b0 fd ff ff    	jbe    5e21 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1781>
	is_center[i] = false;
    6071:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    6076:	e9 a6 fd ff ff       	jmpq   5e21 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1781>
      center_table[i] += (int)work_mem[pid*stride];
    607b:	f2 45 0f 2c 0c 24    	cvttsd2si (%r12),%r9d
    6081:	45 01 0c 80          	add    %r9d,(%r8,%rax,4)
    6085:	e9 3d ec ff ff       	jmpq   4cc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x627>
      center_table[i] = count++;
    608a:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    608e:	83 c1 01             	add    $0x1,%ecx
    6091:	e9 a3 e7 ff ff       	jmpq   4839 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x199>
  float result=0.0;
    6096:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    609b:	e9 27 fc ff ff       	jmpq   5cc7 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1627>
    60a0:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
  for (i=0;i<dim;i++)
    60a5:	31 ed                	xor    %ebp,%ebp
    60a7:	e9 c1 fb ff ff       	jmpq   5c6d <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x15cd>
    60ac:	4c 89 d2             	mov    %r10,%rdx
    60af:	4c 89 c9             	mov    %r9,%rcx
    60b2:	66 0f ef c0          	pxor   %xmm0,%xmm0
    60b6:	31 ed                	xor    %ebp,%ebp
    60b8:	e9 48 f9 ff ff       	jmpq   5a05 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x1365>
  work_mem[pid*stride] = count;
    60bd:	48 8b 0d ac 8f 00 00 	mov    0x8fac(%rip),%rcx        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
  pthread_barrier_wait(barrier);
    60c4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
  work_mem[pid*stride] = count;
    60c9:	4a c7 04 e1 00 00 00 	movq   $0x0,(%rcx,%r12,8)
    60d0:	00 
  pthread_barrier_wait(barrier);
    60d1:	4c 89 f7             	mov    %r14,%rdi
    60d4:	e8 77 50 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  pthread_barrier_wait(barrier);
    60d9:	4c 89 f7             	mov    %r14,%rdi
    60dc:	e8 6f 50 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  for( int i = k1; i < k2; i++ ) {
    60e1:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
    60e6:	4c 89 ea             	mov    %r13,%rdx
    60e9:	31 f6                	xor    %esi,%esi
    60eb:	4c 03 25 7e 8f 00 00 	add    0x8f7e(%rip),%r12        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
  memset(switch_membership + k1, 0, (k2-k1)*sizeof(bool));
    60f2:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    60f7:	48 03 3d 22 90 00 00 	add    0x9022(%rip),%rdi        # f120 <_ZL17switch_membership>
    60fe:	e8 1d c2 ff ff       	callq  2320 <memset@plt>
    6103:	48 89 da             	mov    %rbx,%rdx
    6106:	31 f6                	xor    %esi,%esi
    6108:	4c 89 e7             	mov    %r12,%rdi
    610b:	e8 10 c2 ff ff       	callq  2320 <memset@plt>
  pthread_barrier_wait(barrier);
    6110:	4c 89 f7             	mov    %r14,%rdi
    6113:	e8 38 50 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  double* gl_lower = &work_mem[nproc*stride];
    6118:	8b 05 ea 8f 00 00    	mov    0x8fea(%rip),%eax        # f108 <_ZL5nproc>
    611e:	48 8b 3d 4b 8f 00 00 	mov    0x8f4b(%rip),%rdi        # f070 <_ZZ5pgainlP6PointsdPliP16parsec_barrier_tE8work_mem>
    6125:	0f af c5             	imul   %ebp,%eax
    6128:	48 98                	cltq   
    612a:	4c 8d 04 c7          	lea    (%rdi,%rax,8),%r8
    612e:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
  for ( i = k1; i < k2; i++ ) {
    6133:	e9 a3 ea ff ff       	jmpq   4bdb <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x53b>
      center_table[i] = count++;
    6138:	41 89 0c 83          	mov    %ecx,(%r11,%rax,4)
    613c:	83 c1 01             	add    $0x1,%ecx
    613f:	e9 d4 e6 ff ff       	jmpq   4818 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x178>
      center_table[i] += (int)work_mem[pid*stride];
    6144:	f2 45 0f 2c 1c 24    	cvttsd2si (%r12),%r11d
    614a:	45 01 1c 80          	add    %r11d,(%r8,%rax,4)
    614e:	e9 52 eb ff ff       	jmpq   4ca5 <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x605>
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
    6153:	4f 63 0c ae          	movslq (%r14,%r13,4),%r9
    6157:	4c 8b 54 24 60       	mov    0x60(%rsp),%r10
    615c:	f2 47 0f 10 3c ca    	movsd  (%r10,%r9,8),%xmm15
    6162:	66 45 0f 2f f8       	comisd %xmm8,%xmm15
    6167:	0f 86 0f fc ff ff    	jbe    5d7c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16dc>
	is_center[i] = false;
    616d:	43 c6 04 28 00       	movb   $0x0,(%r8,%r13,1)
    6172:	e9 05 fc ff ff       	jmpq   5d7c <_Z5pgainlP6PointsdPliP16parsec_barrier_t+0x16dc>
    6177:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    617e:	00 00 

0000000000006180 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t>:
{
    6180:	f3 0f 1e fa          	endbr64 
    6184:	41 57                	push   %r15
    6186:	49 89 ff             	mov    %rdi,%r15
    6189:	41 56                	push   %r14
    618b:	45 89 ce             	mov    %r9d,%r14d
    618e:	41 55                	push   %r13
    6190:	41 54                	push   %r12
    6192:	49 89 f4             	mov    %rsi,%r12
    6195:	55                   	push   %rbp
    6196:	53                   	push   %rbx
    6197:	48 63 da             	movslq %edx,%rbx
    619a:	48 83 ec 48          	sub    $0x48,%rsp
    619e:	4c 8b ac 24 80 00 00 	mov    0x80(%rsp),%r13
    61a5:	00 
    61a6:	f3 0f 11 44 24 3c    	movss  %xmm0,0x3c(%rsp)
    61ac:	f2 0f 11 4c 24 28    	movsd  %xmm1,0x28(%rsp)
  pthread_barrier_wait(barrier);
    61b2:	4c 89 ef             	mov    %r13,%rdi
{
    61b5:	f3 0f 11 54 24 08    	movss  %xmm2,0x8(%rsp)
    61bb:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    61c0:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  pthread_barrier_wait(barrier);
    61c5:	e8 86 4f 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  while (change/cost > 1.0*e) {
    61ca:	f2 0f 10 7c 24 28    	movsd  0x28(%rsp),%xmm7
    61d0:	f3 0f 10 54 24 08    	movss  0x8(%rsp),%xmm2
    61d6:	66 0f ef c9          	pxor   %xmm1,%xmm1
    61da:	66 0f 28 c7          	movapd %xmm7,%xmm0
    61de:	f3 0f 5a ca          	cvtss2sd %xmm2,%xmm1
    61e2:	f2 0f 11 4c 24 30    	movsd  %xmm1,0x30(%rsp)
    61e8:	f2 0f 5e c7          	divsd  %xmm7,%xmm0
    61ec:	66 0f 2f c1          	comisd %xmm1,%xmm0
    61f0:	0f 86 1a 02 00 00    	jbe    6410 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x290>
    61f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    61fd:	00 00 00 
    if( pid == 0 ) {
    6200:	45 85 f6             	test   %r14d,%r14d
    6203:	0f 84 27 02 00 00    	je     6430 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x2b0>
    pthread_barrier_wait(barrier);
    6209:	4c 89 ef             	mov    %r13,%rdi
    620c:	e8 3f 4f 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    for (i=0;i<iter;i++) {
    6211:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
    6217:	0f 8e 93 03 00 00    	jle    65b0 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x430>
    621d:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    6222:	66 0f ef db          	pxor   %xmm3,%xmm3
    change = 0.0;
    6226:	66 0f ef e4          	pxor   %xmm4,%xmm4
    for (i=0;i<iter;i++) {
    622a:	31 ed                	xor    %ebp,%ebp
    622c:	f3 0f 5a 5c 24 3c    	cvtss2sd 0x3c(%rsp),%xmm3
    6232:	f2 0f 11 5c 24 08    	movsd  %xmm3,0x8(%rsp)
    6238:	83 e6 03             	and    $0x3,%esi
    623b:	0f 84 b1 00 00 00    	je     62f2 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x172>
    6241:	48 83 fe 01          	cmp    $0x1,%rsi
    6245:	74 67                	je     62ae <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x12e>
    6247:	48 83 fe 02          	cmp    $0x2,%rsi
    624b:	74 28                	je     6275 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0xf5>
      change += pgain(feasible[x], points, z, k, pid, barrier);
    624d:	49 63 3c 24          	movslq (%r12),%rdi
    6251:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    6256:	66 0f 28 c3          	movapd %xmm3,%xmm0
    625a:	4d 89 e8             	mov    %r13,%r8
    625d:	44 89 f1             	mov    %r14d,%ecx
    6260:	4c 89 fe             	mov    %r15,%rsi
    for (i=0;i<iter;i++) {
    6263:	bd 01 00 00 00       	mov    $0x1,%ebp
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6268:	e8 33 e4 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    626d:	66 0f ef e4          	pxor   %xmm4,%xmm4
    6271:	f2 0f 58 e0          	addsd  %xmm0,%xmm4
      x = i%numfeasible;
    6275:	48 89 e8             	mov    %rbp,%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6278:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    627e:	4d 89 e8             	mov    %r13,%r8
    6281:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    6284:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6286:	4c 89 fe             	mov    %r15,%rsi
    6289:	f2 0f 11 64 24 20    	movsd  %xmm4,0x20(%rsp)
    for (i=0;i<iter;i++) {
    628f:	48 83 c5 01          	add    $0x1,%rbp
      x = i%numfeasible;
    6293:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6296:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    629a:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    629f:	e8 fc e3 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    62a4:	f2 0f 10 64 24 20    	movsd  0x20(%rsp),%xmm4
    62aa:	f2 0f 58 e0          	addsd  %xmm0,%xmm4
      x = i%numfeasible;
    62ae:	48 89 e8             	mov    %rbp,%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    62b1:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    62b7:	4d 89 e8             	mov    %r13,%r8
    62ba:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    62bd:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    62bf:	4c 89 fe             	mov    %r15,%rsi
    62c2:	f2 0f 11 64 24 20    	movsd  %xmm4,0x20(%rsp)
    for (i=0;i<iter;i++) {
    62c8:	48 83 c5 01          	add    $0x1,%rbp
      x = i%numfeasible;
    62cc:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    62cf:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    62d3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    62d8:	e8 c3 e3 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    62dd:	f2 0f 10 64 24 20    	movsd  0x20(%rsp),%xmm4
    62e3:	f2 0f 58 e0          	addsd  %xmm0,%xmm4
    for (i=0;i<iter;i++) {
    62e7:	48 39 6c 24 18       	cmp    %rbp,0x18(%rsp)
    62ec:	0f 84 e2 00 00 00    	je     63d4 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x254>
      x = i%numfeasible;
    62f2:	48 89 e8             	mov    %rbp,%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    62f5:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    62fb:	4d 89 e8             	mov    %r13,%r8
    62fe:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    6301:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6303:	4c 89 fe             	mov    %r15,%rsi
    6306:	f2 0f 11 64 24 20    	movsd  %xmm4,0x20(%rsp)
      x = i%numfeasible;
    630c:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    630f:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    6313:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    6318:	e8 83 e3 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    for (i=0;i<iter;i++) {
    631d:	48 8d 45 01          	lea    0x1(%rbp),%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6321:	4d 89 e8             	mov    %r13,%r8
    6324:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    6327:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6329:	f2 0f 10 6c 24 20    	movsd  0x20(%rsp),%xmm5
    632f:	4c 89 fe             	mov    %r15,%rsi
      x = i%numfeasible;
    6332:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6335:	f2 0f 58 e8          	addsd  %xmm0,%xmm5
    6339:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    633f:	f2 0f 11 6c 24 20    	movsd  %xmm5,0x20(%rsp)
    6345:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    6349:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    634e:	e8 4d e3 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    for (i=0;i<iter;i++) {
    6353:	48 8d 45 02          	lea    0x2(%rbp),%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6357:	4d 89 e8             	mov    %r13,%r8
    635a:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    635d:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    635f:	f2 0f 58 44 24 20    	addsd  0x20(%rsp),%xmm0
    6365:	4c 89 fe             	mov    %r15,%rsi
      x = i%numfeasible;
    6368:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    636b:	f2 0f 11 44 24 20    	movsd  %xmm0,0x20(%rsp)
    6371:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    6377:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    637b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    6380:	e8 1b e3 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    for (i=0;i<iter;i++) {
    6385:	48 8d 45 03          	lea    0x3(%rbp),%rax
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6389:	4d 89 e8             	mov    %r13,%r8
    638c:	44 89 f1             	mov    %r14d,%ecx
      x = i%numfeasible;
    638f:	48 99                	cqto   
      change += pgain(feasible[x], points, z, k, pid, barrier);
    6391:	f2 0f 10 74 24 20    	movsd  0x20(%rsp),%xmm6
    6397:	4c 89 fe             	mov    %r15,%rsi
    for (i=0;i<iter;i++) {
    639a:	48 83 c5 04          	add    $0x4,%rbp
      x = i%numfeasible;
    639e:	48 f7 fb             	idiv   %rbx
      change += pgain(feasible[x], points, z, k, pid, barrier);
    63a1:	f2 0f 58 f0          	addsd  %xmm0,%xmm6
    63a5:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    63ab:	f2 0f 11 74 24 20    	movsd  %xmm6,0x20(%rsp)
    63b1:	49 63 3c 94          	movslq (%r12,%rdx,4),%rdi
    63b5:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    63ba:	e8 e1 e2 ff ff       	callq  46a0 <_Z5pgainlP6PointsdPliP16parsec_barrier_t>
    63bf:	f2 0f 10 64 24 20    	movsd  0x20(%rsp),%xmm4
    63c5:	f2 0f 58 e0          	addsd  %xmm0,%xmm4
    for (i=0;i<iter;i++) {
    63c9:	48 39 6c 24 18       	cmp    %rbp,0x18(%rsp)
    63ce:	0f 85 1e ff ff ff    	jne    62f2 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x172>
    63d4:	f2 44 0f 10 44 24 28 	movsd  0x28(%rsp),%xmm8
    63db:	f2 44 0f 5c c4       	subsd  %xmm4,%xmm8
    63e0:	f2 44 0f 11 44 24 28 	movsd  %xmm8,0x28(%rsp)
    pthread_barrier_wait(barrier);
    63e7:	4c 89 ef             	mov    %r13,%rdi
    63ea:	f2 0f 11 64 24 08    	movsd  %xmm4,0x8(%rsp)
    63f0:	e8 5b 4d 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
  while (change/cost > 1.0*e) {
    63f5:	f2 44 0f 10 4c 24 08 	movsd  0x8(%rsp),%xmm9
    63fc:	f2 44 0f 5e 4c 24 28 	divsd  0x28(%rsp),%xmm9
    6403:	66 44 0f 2f 4c 24 30 	comisd 0x30(%rsp),%xmm9
    640a:	0f 87 f0 fd ff ff    	ja     6200 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x80>
  return(cost);
    6410:	66 0f ef c0          	pxor   %xmm0,%xmm0
    6414:	f2 0f 5a 44 24 28    	cvtsd2ss 0x28(%rsp),%xmm0
}
    641a:	48 83 c4 48          	add    $0x48,%rsp
    641e:	5b                   	pop    %rbx
    641f:	5d                   	pop    %rbp
    6420:	41 5c                	pop    %r12
    6422:	41 5d                	pop    %r13
    6424:	41 5e                	pop    %r14
    6426:	41 5f                	pop    %r15
    6428:	c3                   	retq   
    6429:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  for (i=0;i<length;i++) {
    6430:	48 85 db             	test   %rbx,%rbx
    6433:	0f 8e d0 fd ff ff    	jle    6209 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x89>
    6439:	48 89 d8             	mov    %rbx,%rax
    643c:	31 ed                	xor    %ebp,%ebp
    643e:	83 e0 03             	and    $0x3,%eax
    6441:	0f 84 84 00 00 00    	je     64cb <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x34b>
    6447:	48 83 f8 01          	cmp    $0x1,%rax
    644b:	74 4e                	je     649b <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x31b>
    644d:	48 83 f8 02          	cmp    $0x2,%rax
    6451:	74 1f                	je     6472 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x2f2>
    j=(lrand48()%(length - i))+i;
    6453:	e8 18 bf ff ff       	callq  2370 <lrand48@plt>
    temp = intarray[i];
    6458:	41 8b 0c 24          	mov    (%r12),%ecx
  for (i=0;i<length;i++) {
    645c:	bd 01 00 00 00       	mov    $0x1,%ebp
    j=(lrand48()%(length - i))+i;
    6461:	48 99                	cqto   
    6463:	48 f7 fb             	idiv   %rbx
    intarray[i]=intarray[j];
    6466:	49 8d 34 94          	lea    (%r12,%rdx,4),%rsi
    646a:	8b 3e                	mov    (%rsi),%edi
    646c:	41 89 3c 24          	mov    %edi,(%r12)
    intarray[j]=temp;
    6470:	89 0e                	mov    %ecx,(%rsi)
    j=(lrand48()%(length - i))+i;
    6472:	e8 f9 be ff ff       	callq  2370 <lrand48@plt>
    6477:	49 89 d9             	mov    %rbx,%r9
    temp = intarray[i];
    647a:	45 8b 04 ac          	mov    (%r12,%rbp,4),%r8d
    j=(lrand48()%(length - i))+i;
    647e:	49 29 e9             	sub    %rbp,%r9
    6481:	48 99                	cqto   
    6483:	49 f7 f9             	idiv   %r9
    6486:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    6489:	4d 8d 14 94          	lea    (%r12,%rdx,4),%r10
    648d:	45 8b 1a             	mov    (%r10),%r11d
    6490:	45 89 1c ac          	mov    %r11d,(%r12,%rbp,4)
  for (i=0;i<length;i++) {
    6494:	48 83 c5 01          	add    $0x1,%rbp
    intarray[j]=temp;
    6498:	45 89 02             	mov    %r8d,(%r10)
    j=(lrand48()%(length - i))+i;
    649b:	e8 d0 be ff ff       	callq  2370 <lrand48@plt>
    64a0:	48 89 de             	mov    %rbx,%rsi
    temp = intarray[i];
    64a3:	41 8b 0c ac          	mov    (%r12,%rbp,4),%ecx
    j=(lrand48()%(length - i))+i;
    64a7:	48 29 ee             	sub    %rbp,%rsi
    64aa:	48 99                	cqto   
    64ac:	48 f7 fe             	idiv   %rsi
    64af:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    64b2:	49 8d 04 94          	lea    (%r12,%rdx,4),%rax
    64b6:	8b 38                	mov    (%rax),%edi
    64b8:	41 89 3c ac          	mov    %edi,(%r12,%rbp,4)
  for (i=0;i<length;i++) {
    64bc:	48 83 c5 01          	add    $0x1,%rbp
    intarray[j]=temp;
    64c0:	89 08                	mov    %ecx,(%rax)
  for (i=0;i<length;i++) {
    64c2:	48 39 dd             	cmp    %rbx,%rbp
    64c5:	0f 84 3e fd ff ff    	je     6209 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x89>
    j=(lrand48()%(length - i))+i;
    64cb:	e8 a0 be ff ff       	callq  2370 <lrand48@plt>
    64d0:	49 89 d9             	mov    %rbx,%r9
    temp = intarray[i];
    64d3:	45 8b 04 ac          	mov    (%r12,%rbp,4),%r8d
  for (i=0;i<length;i++) {
    64d7:	48 8d 4d 01          	lea    0x1(%rbp),%rcx
    j=(lrand48()%(length - i))+i;
    64db:	49 29 e9             	sub    %rbp,%r9
    64de:	48 99                	cqto   
  for (i=0;i<length;i++) {
    64e0:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    j=(lrand48()%(length - i))+i;
    64e5:	49 f7 f9             	idiv   %r9
    64e8:	48 01 ea             	add    %rbp,%rdx
    intarray[i]=intarray[j];
    64eb:	4d 8d 14 94          	lea    (%r12,%rdx,4),%r10
    64ef:	45 8b 1a             	mov    (%r10),%r11d
    64f2:	45 89 1c ac          	mov    %r11d,(%r12,%rbp,4)
    intarray[j]=temp;
    64f6:	45 89 02             	mov    %r8d,(%r10)
    j=(lrand48()%(length - i))+i;
    64f9:	e8 72 be ff ff       	callq  2370 <lrand48@plt>
    temp = intarray[i];
    64fe:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
    j=(lrand48()%(length - i))+i;
    6503:	48 89 df             	mov    %rbx,%rdi
  for (i=0;i<length;i++) {
    6506:	4c 8d 55 02          	lea    0x2(%rbp),%r10
    j=(lrand48()%(length - i))+i;
    650a:	48 99                	cqto   
  for (i=0;i<length;i++) {
    650c:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
    j=(lrand48()%(length - i))+i;
    6511:	4c 29 c7             	sub    %r8,%rdi
    temp = intarray[i];
    6514:	43 8b 34 84          	mov    (%r12,%r8,4),%esi
    j=(lrand48()%(length - i))+i;
    6518:	48 f7 ff             	idiv   %rdi
    651b:	4c 01 c2             	add    %r8,%rdx
    intarray[i]=intarray[j];
    651e:	49 8d 04 94          	lea    (%r12,%rdx,4),%rax
    6522:	44 8b 08             	mov    (%rax),%r9d
    6525:	47 89 0c 84          	mov    %r9d,(%r12,%r8,4)
    intarray[j]=temp;
    6529:	89 30                	mov    %esi,(%rax)
    j=(lrand48()%(length - i))+i;
    652b:	e8 40 be ff ff       	callq  2370 <lrand48@plt>
    temp = intarray[i];
    6530:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
    j=(lrand48()%(length - i))+i;
    6535:	49 89 d8             	mov    %rbx,%r8
    6538:	48 99                	cqto   
    653a:	4d 29 d8             	sub    %r11,%r8
    temp = intarray[i];
    653d:	43 8b 0c 9c          	mov    (%r12,%r11,4),%ecx
    j=(lrand48()%(length - i))+i;
    6541:	49 f7 f8             	idiv   %r8
  for (i=0;i<length;i++) {
    6544:	48 8d 45 03          	lea    0x3(%rbp),%rax
    6548:	48 83 c5 04          	add    $0x4,%rbp
    654c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    j=(lrand48()%(length - i))+i;
    6551:	4c 01 da             	add    %r11,%rdx
    intarray[i]=intarray[j];
    6554:	49 8d 34 94          	lea    (%r12,%rdx,4),%rsi
    6558:	8b 3e                	mov    (%rsi),%edi
    655a:	43 89 3c 9c          	mov    %edi,(%r12,%r11,4)
    intarray[j]=temp;
    655e:	89 0e                	mov    %ecx,(%rsi)
    j=(lrand48()%(length - i))+i;
    6560:	e8 0b be ff ff       	callq  2370 <lrand48@plt>
    temp = intarray[i];
    6565:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
    j=(lrand48()%(length - i))+i;
    656a:	49 89 db             	mov    %rbx,%r11
    656d:	48 99                	cqto   
    656f:	4d 29 cb             	sub    %r9,%r11
    temp = intarray[i];
    6572:	47 8b 14 8c          	mov    (%r12,%r9,4),%r10d
    j=(lrand48()%(length - i))+i;
    6576:	49 f7 fb             	idiv   %r11
    6579:	4c 01 ca             	add    %r9,%rdx
    intarray[i]=intarray[j];
    657c:	49 8d 0c 94          	lea    (%r12,%rdx,4),%rcx
    6580:	44 8b 01             	mov    (%rcx),%r8d
    6583:	47 89 04 8c          	mov    %r8d,(%r12,%r9,4)
    intarray[j]=temp;
    6587:	44 89 11             	mov    %r10d,(%rcx)
  for (i=0;i<length;i++) {
    658a:	48 39 dd             	cmp    %rbx,%rbp
    658d:	0f 85 38 ff ff ff    	jne    64cb <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x34b>
    pthread_barrier_wait(barrier);
    6593:	4c 89 ef             	mov    %r13,%rdi
    6596:	e8 b5 4b 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    for (i=0;i<iter;i++) {
    659b:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
    65a1:	0f 8f 76 fc ff ff    	jg     621d <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x9d>
    65a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    65ae:	00 00 
    change = 0.0;
    65b0:	66 0f ef e4          	pxor   %xmm4,%xmm4
    65b4:	e9 2e fe ff ff       	jmpq   63e7 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t+0x267>
    65b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000065c0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t>:
{
    65c0:	f3 0f 1e fa          	endbr64 
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    65c4:	66 0f ef c9          	pxor   %xmm1,%xmm1
    65c8:	8d 04 52             	lea    (%rdx,%rdx,2),%eax
    65cb:	66 0f ef e4          	pxor   %xmm4,%xmm4
{
    65cf:	41 57                	push   %r15
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    65d1:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
{
    65d5:	41 56                	push   %r14
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    65d7:	f2 0f 2a e0          	cvtsi2sd %eax,%xmm4
{
    65db:	41 55                	push   %r13
    65dd:	41 54                	push   %r12
    65df:	49 89 fc             	mov    %rdi,%r12
    65e2:	55                   	push   %rbp
    65e3:	53                   	push   %rbx
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    65e4:	66 0f 28 c1          	movapd %xmm1,%xmm0
{
    65e8:	48 89 f3             	mov    %rsi,%rbx
    65eb:	48 83 ec 18          	sub    $0x18,%rsp
  int numfeasible = points->num;
    65ef:	48 8b 2f             	mov    (%rdi),%rbp
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    65f2:	f2 0f 11 24 24       	movsd  %xmm4,(%rsp)
    65f7:	f2 0f 11 4c 24 08    	movsd  %xmm1,0x8(%rsp)
    65fd:	e8 7e bd ff ff       	callq  2380 <log@plt>
    6602:	f2 0f 59 04 24       	mulsd  (%rsp),%xmm0
    6607:	66 0f ef d2          	pxor   %xmm2,%xmm2
    660b:	f2 0f 2a d5          	cvtsi2sd %ebp,%xmm2
    660f:	66 0f 2f d0          	comisd %xmm0,%xmm2
    6613:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    6619:	0f 87 54 08 00 00    	ja     6e73 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x8b3>
  *feasible = (int *)malloc(numfeasible*sizeof(int));
    661f:	4c 63 f5             	movslq %ebp,%r14
    6622:	4a 8d 3c b5 00 00 00 	lea    0x0(,%r14,4),%rdi
    6629:	00 
    662a:	e8 51 be ff ff       	callq  2480 <malloc@plt>
  if (numfeasible == points->num) {
    662f:	4d 8b 2c 24          	mov    (%r12),%r13
  *feasible = (int *)malloc(numfeasible*sizeof(int));
    6633:	48 89 03             	mov    %rax,(%rbx)
  if (numfeasible == points->num) {
    6636:	4d 39 f5             	cmp    %r14,%r13
    6639:	0f 84 67 04 00 00    	je     6aa6 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4e6>
  accumweight= (float*)malloc(sizeof(float)*points->num);
    663f:	4e 8d 3c ad 00 00 00 	lea    0x0(,%r13,4),%r15
    6646:	00 
    6647:	4c 89 ff             	mov    %r15,%rdi
    664a:	e8 31 be ff ff       	callq  2480 <malloc@plt>
  accumweight[0] = points->p[0].weight;
    664f:	49 8b 54 24 10       	mov    0x10(%r12),%rdx
  accumweight= (float*)malloc(sizeof(float)*points->num);
    6654:	49 89 c6             	mov    %rax,%r14
  accumweight[0] = points->p[0].weight;
    6657:	f3 0f 10 1a          	movss  (%rdx),%xmm3
    665b:	f3 0f 11 18          	movss  %xmm3,(%rax)
  for( int i = 1; i < points->num; i++ ) {
    665f:	49 83 fd 01          	cmp    $0x1,%r13
    6663:	0f 8e 25 03 00 00    	jle    698e <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x3ce>
    6669:	49 83 fd 11          	cmp    $0x11,%r13
    666d:	0f 8e 13 08 00 00    	jle    6e86 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x8c6>
    6673:	49 8d 75 ee          	lea    -0x12(%r13),%rsi
    6677:	48 8d 48 04          	lea    0x4(%rax),%rcx
    667b:	bf 01 00 00 00       	mov    $0x1,%edi
    6680:	48 c1 ee 04          	shr    $0x4,%rsi
    6684:	4c 8d 82 80 02 00 00 	lea    0x280(%rdx),%r8
    668b:	c1 e6 04             	shl    $0x4,%esi
    668e:	83 c6 11             	add    $0x11,%esi
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    6691:	41 0f 18 48 c0       	prefetcht0 -0x40(%r8)
    6696:	41 0f 18 08          	prefetcht0 (%r8)
    669a:	83 c7 10             	add    $0x10,%edi
    669d:	f3 41 0f 58 98 a0 fd 	addss  -0x260(%r8),%xmm3
    66a4:	ff ff 
    66a6:	41 0f 18 48 40       	prefetcht0 0x40(%r8)
    66ab:	41 0f 18 88 80 00 00 	prefetcht0 0x80(%r8)
    66b2:	00 
    66b3:	41 0f 18 88 c0 00 00 	prefetcht0 0xc0(%r8)
    66ba:	00 
    66bb:	41 0f 18 88 00 01 00 	prefetcht0 0x100(%r8)
    66c2:	00 
    66c3:	41 0f 18 88 40 01 00 	prefetcht0 0x140(%r8)
    66ca:	00 
    66cb:	41 0f 18 88 80 01 00 	prefetcht0 0x180(%r8)
    66d2:	00 
    66d3:	48 83 c1 40          	add    $0x40,%rcx
    66d7:	49 81 c0 00 02 00 00 	add    $0x200,%r8
    66de:	f3 0f 11 59 c0       	movss  %xmm3,-0x40(%rcx)
    66e3:	f3 41 0f 58 98 c0 fb 	addss  -0x440(%r8),%xmm3
    66ea:	ff ff 
    66ec:	f3 0f 11 59 c4       	movss  %xmm3,-0x3c(%rcx)
    66f1:	f3 41 0f 58 98 e0 fb 	addss  -0x420(%r8),%xmm3
    66f8:	ff ff 
    66fa:	f3 0f 11 59 c8       	movss  %xmm3,-0x38(%rcx)
    66ff:	f3 41 0f 58 98 00 fc 	addss  -0x400(%r8),%xmm3
    6706:	ff ff 
    6708:	f3 0f 11 59 cc       	movss  %xmm3,-0x34(%rcx)
    670d:	f3 41 0f 58 98 20 fc 	addss  -0x3e0(%r8),%xmm3
    6714:	ff ff 
    6716:	f3 0f 11 59 d0       	movss  %xmm3,-0x30(%rcx)
    671b:	f3 41 0f 58 98 40 fc 	addss  -0x3c0(%r8),%xmm3
    6722:	ff ff 
    6724:	f3 0f 11 59 d4       	movss  %xmm3,-0x2c(%rcx)
    6729:	f3 41 0f 58 98 60 fc 	addss  -0x3a0(%r8),%xmm3
    6730:	ff ff 
    6732:	f3 0f 11 59 d8       	movss  %xmm3,-0x28(%rcx)
    6737:	f3 41 0f 58 98 80 fc 	addss  -0x380(%r8),%xmm3
    673e:	ff ff 
    6740:	f3 0f 11 59 dc       	movss  %xmm3,-0x24(%rcx)
    6745:	f3 41 0f 58 98 a0 fc 	addss  -0x360(%r8),%xmm3
    674c:	ff ff 
    674e:	f3 0f 11 59 e0       	movss  %xmm3,-0x20(%rcx)
    6753:	f3 41 0f 58 98 c0 fc 	addss  -0x340(%r8),%xmm3
    675a:	ff ff 
    675c:	f3 0f 11 59 e4       	movss  %xmm3,-0x1c(%rcx)
    6761:	f3 41 0f 58 98 e0 fc 	addss  -0x320(%r8),%xmm3
    6768:	ff ff 
    676a:	f3 0f 11 59 e8       	movss  %xmm3,-0x18(%rcx)
    676f:	f3 41 0f 58 98 00 fd 	addss  -0x300(%r8),%xmm3
    6776:	ff ff 
    6778:	f3 0f 11 59 ec       	movss  %xmm3,-0x14(%rcx)
    677d:	f3 41 0f 58 98 20 fd 	addss  -0x2e0(%r8),%xmm3
    6784:	ff ff 
    6786:	f3 0f 11 59 f0       	movss  %xmm3,-0x10(%rcx)
    678b:	f3 41 0f 58 98 40 fd 	addss  -0x2c0(%r8),%xmm3
    6792:	ff ff 
    6794:	f3 0f 11 59 f4       	movss  %xmm3,-0xc(%rcx)
    6799:	f3 41 0f 58 98 60 fd 	addss  -0x2a0(%r8),%xmm3
    67a0:	ff ff 
    67a2:	f3 0f 11 59 f8       	movss  %xmm3,-0x8(%rcx)
    67a7:	f3 41 0f 58 98 80 fd 	addss  -0x280(%r8),%xmm3
    67ae:	ff ff 
    67b0:	f3 0f 11 59 fc       	movss  %xmm3,-0x4(%rcx)
  for( int i = 1; i < points->num; i++ ) {
    67b5:	39 f7                	cmp    %esi,%edi
    67b7:	0f 85 d4 fe ff ff    	jne    6691 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0xd1>
    67bd:	4c 63 cf             	movslq %edi,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    67c0:	4d 89 cb             	mov    %r9,%r11
    67c3:	4d 89 ca             	mov    %r9,%r10
    67c6:	49 8d 41 01          	lea    0x1(%r9),%rax
    67ca:	49 c1 e3 05          	shl    $0x5,%r11
    67ce:	49 f7 d2             	not    %r10
    67d1:	f3 42 0f 58 1c 1a    	addss  (%rdx,%r11,1),%xmm3
    67d7:	4d 01 ea             	add    %r13,%r10
    67da:	41 83 e2 07          	and    $0x7,%r10d
    67de:	f3 43 0f 11 1c 8e    	movss  %xmm3,(%r14,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    67e4:	49 39 c5             	cmp    %rax,%r13
    67e7:	0f 8e a1 01 00 00    	jle    698e <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x3ce>
    67ed:	4d 85 d2             	test   %r10,%r10
    67f0:	0f 84 da 00 00 00    	je     68d0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x310>
    67f6:	49 83 fa 01          	cmp    $0x1,%r10
    67fa:	0f 84 a9 00 00 00    	je     68a9 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x2e9>
    6800:	49 83 fa 02          	cmp    $0x2,%r10
    6804:	0f 84 88 00 00 00    	je     6892 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x2d2>
    680a:	49 83 fa 03          	cmp    $0x3,%r10
    680e:	74 6b                	je     687b <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x2bb>
    6810:	49 83 fa 04          	cmp    $0x4,%r10
    6814:	74 4f                	je     6865 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x2a5>
    6816:	49 83 fa 05          	cmp    $0x5,%r10
    681a:	74 33                	je     684f <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x28f>
    681c:	49 83 fa 06          	cmp    $0x6,%r10
    6820:	74 17                	je     6839 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x279>
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    6822:	49 89 c0             	mov    %rax,%r8
    6825:	49 c1 e0 05          	shl    $0x5,%r8
    6829:	f3 42 0f 58 1c 02    	addss  (%rdx,%r8,1),%xmm3
    682f:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    6835:	49 8d 41 02          	lea    0x2(%r9),%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    6839:	48 89 c1             	mov    %rax,%rcx
    683c:	48 c1 e1 05          	shl    $0x5,%rcx
    6840:	f3 0f 58 1c 0a       	addss  (%rdx,%rcx,1),%xmm3
    6845:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    684b:	48 83 c0 01          	add    $0x1,%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    684f:	48 89 c6             	mov    %rax,%rsi
    6852:	48 c1 e6 05          	shl    $0x5,%rsi
    6856:	f3 0f 58 1c 32       	addss  (%rdx,%rsi,1),%xmm3
    685b:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    6861:	48 83 c0 01          	add    $0x1,%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    6865:	48 89 c7             	mov    %rax,%rdi
    6868:	48 c1 e7 05          	shl    $0x5,%rdi
    686c:	f3 0f 58 1c 3a       	addss  (%rdx,%rdi,1),%xmm3
    6871:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    6877:	48 83 c0 01          	add    $0x1,%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    687b:	49 89 c1             	mov    %rax,%r9
    687e:	49 c1 e1 05          	shl    $0x5,%r9
    6882:	f3 42 0f 58 1c 0a    	addss  (%rdx,%r9,1),%xmm3
    6888:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    688e:	48 83 c0 01          	add    $0x1,%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    6892:	49 89 c2             	mov    %rax,%r10
    6895:	49 c1 e2 05          	shl    $0x5,%r10
    6899:	f3 42 0f 58 1c 12    	addss  (%rdx,%r10,1),%xmm3
    689f:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    68a5:	48 83 c0 01          	add    $0x1,%rax
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    68a9:	49 89 c3             	mov    %rax,%r11
    68ac:	49 c1 e3 05          	shl    $0x5,%r11
    68b0:	f3 42 0f 58 1c 1a    	addss  (%rdx,%r11,1),%xmm3
    68b6:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
  for( int i = 1; i < points->num; i++ ) {
    68bc:	48 83 c0 01          	add    $0x1,%rax
    68c0:	49 39 c5             	cmp    %rax,%r13
    68c3:	0f 8e c5 00 00 00    	jle    698e <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x3ce>
    68c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    68d0:	49 89 c0             	mov    %rax,%r8
    68d3:	48 8d 48 01          	lea    0x1(%rax),%rcx
    68d7:	48 8d 78 02          	lea    0x2(%rax),%rdi
    68db:	49 c1 e0 05          	shl    $0x5,%r8
    68df:	48 89 ce             	mov    %rcx,%rsi
    68e2:	4c 8d 50 03          	lea    0x3(%rax),%r10
    68e6:	49 89 f9             	mov    %rdi,%r9
    68e9:	f3 42 0f 58 1c 02    	addss  (%rdx,%r8,1),%xmm3
    68ef:	48 c1 e6 05          	shl    $0x5,%rsi
    68f3:	49 c1 e1 05          	shl    $0x5,%r9
    68f7:	4d 89 d3             	mov    %r10,%r11
    68fa:	49 c1 e3 05          	shl    $0x5,%r11
    68fe:	4c 8d 40 04          	lea    0x4(%rax),%r8
    6902:	f3 41 0f 11 1c 86    	movss  %xmm3,(%r14,%rax,4)
    6908:	f3 0f 58 1c 32       	addss  (%rdx,%rsi,1),%xmm3
    690d:	f3 41 0f 11 1c 8e    	movss  %xmm3,(%r14,%rcx,4)
    6913:	f3 42 0f 58 1c 0a    	addss  (%rdx,%r9,1),%xmm3
    6919:	4c 89 c1             	mov    %r8,%rcx
    691c:	4c 8d 48 06          	lea    0x6(%rax),%r9
    6920:	48 c1 e1 05          	shl    $0x5,%rcx
    6924:	f3 41 0f 11 1c be    	movss  %xmm3,(%r14,%rdi,4)
    692a:	f3 42 0f 58 1c 1a    	addss  (%rdx,%r11,1),%xmm3
    6930:	48 8d 78 05          	lea    0x5(%rax),%rdi
    6934:	48 89 fe             	mov    %rdi,%rsi
    6937:	4c 8d 58 07          	lea    0x7(%rax),%r11
    693b:	48 83 c0 08          	add    $0x8,%rax
    693f:	48 c1 e6 05          	shl    $0x5,%rsi
    6943:	f3 43 0f 11 1c 96    	movss  %xmm3,(%r14,%r10,4)
    6949:	f3 0f 58 1c 0a       	addss  (%rdx,%rcx,1),%xmm3
    694e:	4d 89 ca             	mov    %r9,%r10
    6951:	49 c1 e2 05          	shl    $0x5,%r10
    6955:	f3 43 0f 11 1c 86    	movss  %xmm3,(%r14,%r8,4)
    695b:	f3 0f 58 1c 32       	addss  (%rdx,%rsi,1),%xmm3
    6960:	4d 89 d8             	mov    %r11,%r8
    6963:	49 c1 e0 05          	shl    $0x5,%r8
    6967:	f3 41 0f 11 1c be    	movss  %xmm3,(%r14,%rdi,4)
    696d:	f3 42 0f 58 1c 12    	addss  (%rdx,%r10,1),%xmm3
    6973:	f3 43 0f 11 1c 8e    	movss  %xmm3,(%r14,%r9,4)
    6979:	f3 42 0f 58 1c 02    	addss  (%rdx,%r8,1),%xmm3
    697f:	f3 43 0f 11 1c 9e    	movss  %xmm3,(%r14,%r11,4)
  for( int i = 1; i < points->num; i++ ) {
    6985:	49 39 c5             	cmp    %rax,%r13
    6988:	0f 8f 42 ff ff ff    	jg     68d0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x310>
  totalweight=accumweight[points->num-1];
    698e:	f3 43 0f 10 74 3e fc 	movss  -0x4(%r14,%r15,1),%xmm6
    6995:	f3 0f 11 34 24       	movss  %xmm6,(%rsp)
  for(int i=k1; i<k2; i++ ) {
    699a:	85 ed                	test   %ebp,%ebp
    699c:	0f 8e c0 00 00 00    	jle    6a62 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4a2>
    69a2:	44 8d 6d ff          	lea    -0x1(%rbp),%r13d
    69a6:	45 31 ff             	xor    %r15d,%r15d
    69a9:	4e 8d 2c ad 04 00 00 	lea    0x4(,%r13,4),%r13
    69b0:	00 
    69b1:	eb 1d                	jmp    69d0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x410>
    69b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
      (*feasible)[i]=0; 
    69b8:	48 8b 13             	mov    (%rbx),%rdx
    69bb:	42 c7 04 3a 00 00 00 	movl   $0x0,(%rdx,%r15,1)
    69c2:	00 
  for(int i=k1; i<k2; i++ ) {
    69c3:	49 83 c7 04          	add    $0x4,%r15
    69c7:	4d 39 fd             	cmp    %r15,%r13
    69ca:	0f 84 92 00 00 00    	je     6a62 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4a2>
    w = (lrand48()/(float)INT_MAX)*totalweight;
    69d0:	e8 9b b9 ff ff       	callq  2370 <lrand48@plt>
    69d5:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    if( accumweight[0] > w )  { 
    69da:	f3 41 0f 10 2e       	movss  (%r14),%xmm5
    w = (lrand48()/(float)INT_MAX)*totalweight;
    69df:	f3 4c 0f 2a c0       	cvtsi2ss %rax,%xmm8
    69e4:	f3 44 0f 59 05 cb 5b 	mulss  0x5bcb(%rip),%xmm8        # c5b8 <_ZTS10FileStream+0x10>
    69eb:	00 00 
    69ed:	f3 44 0f 59 04 24    	mulss  (%rsp),%xmm8
    if( accumweight[0] > w )  { 
    69f3:	41 0f 2f e8          	comiss %xmm8,%xmm5
    69f7:	77 bf                	ja     69b8 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x3f8>
    r=points->num-1;
    69f9:	41 8b 14 24          	mov    (%r12),%edx
    l=0;
    69fd:	31 f6                	xor    %esi,%esi
    69ff:	8d 7e 01             	lea    0x1(%rsi),%edi
    r=points->num-1;
    6a02:	44 8d 52 ff          	lea    -0x1(%rdx),%r10d
    while( l+1 < r ) {
    6a06:	41 39 fa             	cmp    %edi,%r10d
    6a09:	0f 8e 8b 00 00 00    	jle    6a9a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4da>
      k = (l+r)/2;
    6a0f:	46 8d 1c 16          	lea    (%rsi,%r10,1),%r11d
    6a13:	41 d1 fb             	sar    %r11d
      if( accumweight[k] > w ) {
    6a16:	49 63 c3             	movslq %r11d,%rax
    6a19:	f3 41 0f 10 3c 86    	movss  (%r14,%rax,4),%xmm7
    6a1f:	41 0f 2f f8          	comiss %xmm8,%xmm7
    6a23:	77 24                	ja     6a49 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x489>
    6a25:	eb 54                	jmp    6a7b <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4bb>
    6a27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    6a2e:	00 00 
      k = (l+r)/2;
    6a30:	46 8d 0c 1e          	lea    (%rsi,%r11,1),%r9d
    6a34:	41 d1 f9             	sar    %r9d
      if( accumweight[k] > w ) {
    6a37:	49 63 c9             	movslq %r9d,%rcx
    6a3a:	f3 45 0f 10 0c 8e    	movss  (%r14,%rcx,4),%xmm9
    6a40:	45 0f 2f c8          	comiss %xmm8,%xmm9
    6a44:	76 42                	jbe    6a88 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4c8>
      k = (l+r)/2;
    6a46:	45 89 cb             	mov    %r9d,%r11d
    while( l+1 < r ) {
    6a49:	41 39 fb             	cmp    %edi,%r11d
    6a4c:	7f e2                	jg     6a30 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x470>
    (*feasible)[i]=r;
    6a4e:	4c 8b 03             	mov    (%rbx),%r8
    6a51:	47 89 1c 38          	mov    %r11d,(%r8,%r15,1)
  for(int i=k1; i<k2; i++ ) {
    6a55:	49 83 c7 04          	add    $0x4,%r15
    6a59:	4d 39 fd             	cmp    %r15,%r13
    6a5c:	0f 85 6e ff ff ff    	jne    69d0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x410>
  free(accumweight); 
    6a62:	4c 89 f7             	mov    %r14,%rdi
    6a65:	e8 c6 b9 ff ff       	callq  2430 <free@plt>
}
    6a6a:	48 83 c4 18          	add    $0x18,%rsp
    6a6e:	89 e8                	mov    %ebp,%eax
    6a70:	5b                   	pop    %rbx
    6a71:	5d                   	pop    %rbp
    6a72:	41 5c                	pop    %r12
    6a74:	41 5d                	pop    %r13
    6a76:	41 5e                	pop    %r14
    6a78:	41 5f                	pop    %r15
    6a7a:	c3                   	retq   
      k = (l+r)/2;
    6a7b:	45 89 d9             	mov    %r11d,%r9d
      if( accumweight[k] > w ) {
    6a7e:	45 89 d3             	mov    %r10d,%r11d
    6a81:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      k = (l+r)/2;
    6a88:	44 89 ce             	mov    %r9d,%esi
    6a8b:	45 89 da             	mov    %r11d,%r10d
    6a8e:	8d 7e 01             	lea    0x1(%rsi),%edi
    while( l+1 < r ) {
    6a91:	41 39 fa             	cmp    %edi,%r10d
    6a94:	0f 8f 75 ff ff ff    	jg     6a0f <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x44f>
    (*feasible)[i]=r;
    6a9a:	4c 8b 03             	mov    (%rbx),%r8
    while( l+1 < r ) {
    6a9d:	45 89 d3             	mov    %r10d,%r11d
    (*feasible)[i]=r;
    6aa0:	47 89 1c 38          	mov    %r11d,(%r8,%r15,1)
    6aa4:	eb af                	jmp    6a55 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x495>
    for (int i=k1;i<k2;i++)
    6aa6:	85 ed                	test   %ebp,%ebp
    6aa8:	7e c0                	jle    6a6a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4aa>
    6aaa:	8d 5d ff             	lea    -0x1(%rbp),%ebx
    6aad:	83 fb 02             	cmp    $0x2,%ebx
    6ab0:	0f 86 da 03 00 00    	jbe    6e90 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x8d0>
    6ab6:	41 89 eb             	mov    %ebp,%r11d
    6ab9:	41 c1 eb 02          	shr    $0x2,%r11d
    6abd:	41 83 fb 04          	cmp    $0x4,%r11d
    6ac1:	0f 86 cd 03 00 00    	jbe    6e94 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x8d4>
    6ac7:	41 8d 4b fb          	lea    -0x5(%r11),%ecx
    6acb:	49 89 c5             	mov    %rax,%r13
    6ace:	45 31 f6             	xor    %r14d,%r14d
    6ad1:	66 0f 6f 05 37 5b 00 	movdqa 0x5b37(%rip),%xmm0        # c610 <_ZTS10FileStream+0x68>
    6ad8:	00 
    6ad9:	83 e1 fc             	and    $0xfffffffc,%ecx
    6adc:	66 0f 6f 0d 3c 5b 00 	movdqa 0x5b3c(%rip),%xmm1        # c620 <_ZTS10FileStream+0x78>
    6ae3:	00 
    6ae4:	66 0f 6f 25 44 5b 00 	movdqa 0x5b44(%rip),%xmm4        # c630 <_ZTS10FileStream+0x88>
    6aeb:	00 
    6aec:	41 89 cc             	mov    %ecx,%r12d
    6aef:	44 8d 49 04          	lea    0x4(%rcx),%r9d
    6af3:	66 0f 6f 1d 45 5b 00 	movdqa 0x5b45(%rip),%xmm3        # c640 <_ZTS10FileStream+0x98>
    6afa:	00 
    6afb:	66 0f 6f 15 4d 5b 00 	movdqa 0x5b4d(%rip),%xmm2        # c650 <_ZTS10FileStream+0xa8>
    6b02:	00 
    6b03:	41 c1 ec 02          	shr    $0x2,%r12d
    6b07:	41 83 e4 03          	and    $0x3,%r12d
    6b0b:	0f 84 a6 01 00 00    	je     6cb7 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x6f7>
      (*feasible)[i] = i;
    6b11:	66 44 0f 6f d0       	movdqa %xmm0,%xmm10
    6b16:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    6b1b:	66 44 0f 6f e0       	movdqa %xmm0,%xmm12
    6b20:	0f 11 00             	movups %xmm0,(%rax)
    6b23:	66 44 0f fe d1       	paddd  %xmm1,%xmm10
    6b28:	66 44 0f fe dc       	paddd  %xmm4,%xmm11
    6b2d:	0f 18 88 20 02 00 00 	prefetcht0 0x220(%rax)
    6b34:	41 be 04 00 00 00    	mov    $0x4,%r14d
    6b3a:	66 44 0f fe e3       	paddd  %xmm3,%xmm12
    6b3f:	44 0f 11 50 10       	movups %xmm10,0x10(%rax)
    6b44:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6b48:	44 0f 11 60 20       	movups %xmm12,0x20(%rax)
    6b4d:	4c 8d 68 40          	lea    0x40(%rax),%r13
    6b51:	44 0f 11 58 30       	movups %xmm11,0x30(%rax)
    for (int i=k1;i<k2;i++)
    6b56:	41 83 fc 01          	cmp    $0x1,%r12d
    6b5a:	0f 84 57 01 00 00    	je     6cb7 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x6f7>
    6b60:	41 83 fc 02          	cmp    $0x2,%r12d
    6b64:	74 4a                	je     6bb0 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x5f0>
      (*feasible)[i] = i;
    6b66:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    6b6b:	66 44 0f 6f f0       	movdqa %xmm0,%xmm14
    6b70:	66 44 0f 6f f8       	movdqa %xmm0,%xmm15
    6b75:	0f 18 88 60 02 00 00 	prefetcht0 0x260(%rax)
    6b7c:	66 44 0f fe e9       	paddd  %xmm1,%xmm13
    6b81:	66 44 0f fe f4       	paddd  %xmm4,%xmm14
    6b86:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
    6b8b:	41 be 08 00 00 00    	mov    $0x8,%r14d
    6b91:	66 44 0f fe fb       	paddd  %xmm3,%xmm15
    6b96:	45 0f 11 6d 10       	movups %xmm13,0x10(%r13)
    6b9b:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6b9f:	45 0f 11 7d 20       	movups %xmm15,0x20(%r13)
    6ba4:	45 0f 11 75 30       	movups %xmm14,0x30(%r13)
    for (int i=k1;i<k2;i++)
    6ba9:	4c 8d a8 80 00 00 00 	lea    0x80(%rax),%r13
      (*feasible)[i] = i;
    6bb0:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    6bb4:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    6bb8:	66 0f 6f f8          	movdqa %xmm0,%xmm7
    6bbc:	41 83 c6 04          	add    $0x4,%r14d
    6bc0:	66 0f fe f1          	paddd  %xmm1,%xmm6
    6bc4:	66 0f fe ec          	paddd  %xmm4,%xmm5
    6bc8:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
    6bcd:	41 0f 18 8d 20 02 00 	prefetcht0 0x220(%r13)
    6bd4:	00 
    6bd5:	66 0f fe fb          	paddd  %xmm3,%xmm7
    6bd9:	41 0f 11 75 10       	movups %xmm6,0x10(%r13)
    6bde:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6be2:	49 83 c5 40          	add    $0x40,%r13
    6be6:	41 0f 11 7d e0       	movups %xmm7,-0x20(%r13)
    6beb:	41 0f 11 6d f0       	movups %xmm5,-0x10(%r13)
    for (int i=k1;i<k2;i++)
    6bf0:	e9 c2 00 00 00       	jmpq   6cb7 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x6f7>
      (*feasible)[i] = i;
    6bf5:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    6bfa:	66 44 0f 6f e0       	movdqa %xmm0,%xmm12
    6bff:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    6c04:	41 0f 11 45 40       	movups %xmm0,0x40(%r13)
    6c09:	66 44 0f fe d9       	paddd  %xmm1,%xmm11
    6c0e:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6c12:	41 83 c6 10          	add    $0x10,%r14d
    6c16:	41 0f 18 8d 60 02 00 	prefetcht0 0x260(%r13)
    6c1d:	00 
    6c1e:	66 44 0f fe e4       	paddd  %xmm4,%xmm12
    6c23:	66 44 0f fe eb       	paddd  %xmm3,%xmm13
    6c28:	45 0f 11 5f 10       	movups %xmm11,0x10(%r15)
    6c2d:	66 44 0f 6f f0       	movdqa %xmm0,%xmm14
    6c32:	45 0f 11 6f 20       	movups %xmm13,0x20(%r15)
    6c37:	66 44 0f 6f f8       	movdqa %xmm0,%xmm15
    6c3c:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    6c40:	66 44 0f fe f1       	paddd  %xmm1,%xmm14
    6c45:	45 0f 11 67 30       	movups %xmm12,0x30(%r15)
    6c4a:	66 44 0f fe fc       	paddd  %xmm4,%xmm15
    6c4f:	66 0f fe f3          	paddd  %xmm3,%xmm6
    6c53:	41 0f 18 8d a0 02 00 	prefetcht0 0x2a0(%r13)
    6c5a:	00 
    6c5b:	41 0f 11 85 80 00 00 	movups %xmm0,0x80(%r13)
    6c62:	00 
    6c63:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6c67:	41 0f 18 8d e0 02 00 	prefetcht0 0x2e0(%r13)
    6c6e:	00 
    6c6f:	49 81 c5 00 01 00 00 	add    $0x100,%r13
    6c76:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    6c7a:	66 0f 6f f8          	movdqa %xmm0,%xmm7
    6c7e:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    6c83:	41 0f 11 45 c0       	movups %xmm0,-0x40(%r13)
    6c88:	66 0f fe e9          	paddd  %xmm1,%xmm5
    6c8c:	66 0f fe fc          	paddd  %xmm4,%xmm7
    6c90:	45 0f 11 75 90       	movups %xmm14,-0x70(%r13)
    6c95:	66 44 0f fe c3       	paddd  %xmm3,%xmm8
    6c9a:	41 0f 11 75 a0       	movups %xmm6,-0x60(%r13)
    6c9f:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6ca3:	45 0f 11 7d b0       	movups %xmm15,-0x50(%r13)
    6ca8:	41 0f 11 6d d0       	movups %xmm5,-0x30(%r13)
    6cad:	45 0f 11 45 e0       	movups %xmm8,-0x20(%r13)
    6cb2:	41 0f 11 7d f0       	movups %xmm7,-0x10(%r13)
    6cb7:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    6cbc:	66 44 0f 6f c8       	movdqa %xmm0,%xmm9
    6cc1:	66 44 0f 6f d0       	movdqa %xmm0,%xmm10
    6cc6:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
    6ccb:	4d 8d 7d 40          	lea    0x40(%r13),%r15
    6ccf:	41 0f 18 8d 20 02 00 	prefetcht0 0x220(%r13)
    6cd6:	00 
    6cd7:	66 0f fe c2          	paddd  %xmm2,%xmm0
    6cdb:	66 44 0f fe c1       	paddd  %xmm1,%xmm8
    6ce0:	66 44 0f fe cc       	paddd  %xmm4,%xmm9
    6ce5:	4d 89 fa             	mov    %r15,%r10
    6ce8:	66 44 0f fe d3       	paddd  %xmm3,%xmm10
    6ced:	45 0f 11 45 10       	movups %xmm8,0x10(%r13)
    6cf2:	45 0f 11 55 20       	movups %xmm10,0x20(%r13)
    6cf7:	45 0f 11 4d 30       	movups %xmm9,0x30(%r13)
    for (int i=k1;i<k2;i++)
    6cfc:	41 39 ce             	cmp    %ecx,%r14d
    6cff:	0f 85 f0 fe ff ff    	jne    6bf5 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x635>
      (*feasible)[i] = i;
    6d05:	44 89 ce             	mov    %r9d,%esi
    6d08:	41 8d 51 01          	lea    0x1(%r9),%edx
    6d0c:	41 0f 11 02          	movups %xmm0,(%r10)
    for (int i=k1;i<k2;i++)
    6d10:	4d 8d 42 10          	lea    0x10(%r10),%r8
    6d14:	f7 d6                	not    %esi
    6d16:	66 0f fe c1          	paddd  %xmm1,%xmm0
    6d1a:	44 01 de             	add    %r11d,%esi
    6d1d:	83 e6 07             	and    $0x7,%esi
    6d20:	41 39 d3             	cmp    %edx,%r11d
    6d23:	0f 86 0c 01 00 00    	jbe    6e35 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x875>
    6d29:	85 f6                	test   %esi,%esi
    6d2b:	0f 84 8d 00 00 00    	je     6dbe <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7fe>
    6d31:	83 fe 01             	cmp    $0x1,%esi
    6d34:	74 74                	je     6daa <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7ea>
    6d36:	83 fe 02             	cmp    $0x2,%esi
    6d39:	74 60                	je     6d9b <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7db>
    6d3b:	83 fe 03             	cmp    $0x3,%esi
    6d3e:	74 4c                	je     6d8c <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7cc>
    6d40:	83 fe 04             	cmp    $0x4,%esi
    6d43:	74 38                	je     6d7d <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7bd>
    6d45:	83 fe 05             	cmp    $0x5,%esi
    6d48:	74 24                	je     6d6e <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7ae>
    6d4a:	83 fe 06             	cmp    $0x6,%esi
    6d4d:	74 10                	je     6d5f <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x79f>
      (*feasible)[i] = i;
    6d4f:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d53:	41 8d 51 02          	lea    0x2(%r9),%edx
    6d57:	4d 8d 42 20          	lea    0x20(%r10),%r8
    6d5b:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6d5f:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d63:	83 c2 01             	add    $0x1,%edx
    6d66:	49 83 c0 10          	add    $0x10,%r8
    6d6a:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6d6e:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d72:	83 c2 01             	add    $0x1,%edx
    6d75:	49 83 c0 10          	add    $0x10,%r8
    6d79:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6d7d:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d81:	83 c2 01             	add    $0x1,%edx
    6d84:	49 83 c0 10          	add    $0x10,%r8
    6d88:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6d8c:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d90:	83 c2 01             	add    $0x1,%edx
    6d93:	49 83 c0 10          	add    $0x10,%r8
    6d97:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6d9b:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6d9f:	83 c2 01             	add    $0x1,%edx
    6da2:	49 83 c0 10          	add    $0x10,%r8
    6da6:	66 0f fe c1          	paddd  %xmm1,%xmm0
      (*feasible)[i] = i;
    6daa:	83 c2 01             	add    $0x1,%edx
    6dad:	41 0f 11 00          	movups %xmm0,(%r8)
    for (int i=k1;i<k2;i++)
    6db1:	49 83 c0 10          	add    $0x10,%r8
    6db5:	66 0f fe c1          	paddd  %xmm1,%xmm0
    6db9:	41 39 d3             	cmp    %edx,%r11d
    6dbc:	76 77                	jbe    6e35 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x875>
    6dbe:	66 44 0f 6f c8       	movdqa %xmm0,%xmm9
      (*feasible)[i] = i;
    6dc3:	41 0f 11 00          	movups %xmm0,(%r8)
    6dc7:	83 c2 08             	add    $0x8,%edx
    6dca:	49 83 e8 80          	sub    $0xffffffffffffff80,%r8
    6dce:	66 44 0f fe c9       	paddd  %xmm1,%xmm9
    for (int i=k1;i<k2;i++)
    6dd3:	66 45 0f 6f d1       	movdqa %xmm9,%xmm10
      (*feasible)[i] = i;
    6dd8:	45 0f 11 48 90       	movups %xmm9,-0x70(%r8)
    6ddd:	66 44 0f fe d1       	paddd  %xmm1,%xmm10
    for (int i=k1;i<k2;i++)
    6de2:	66 41 0f 6f da       	movdqa %xmm10,%xmm3
      (*feasible)[i] = i;
    6de7:	45 0f 11 50 a0       	movups %xmm10,-0x60(%r8)
    6dec:	66 0f fe d9          	paddd  %xmm1,%xmm3
    for (int i=k1;i<k2;i++)
    6df0:	66 0f 6f d3          	movdqa %xmm3,%xmm2
      (*feasible)[i] = i;
    6df4:	41 0f 11 58 b0       	movups %xmm3,-0x50(%r8)
    6df9:	66 0f fe d1          	paddd  %xmm1,%xmm2
    for (int i=k1;i<k2;i++)
    6dfd:	66 0f 6f e2          	movdqa %xmm2,%xmm4
      (*feasible)[i] = i;
    6e01:	41 0f 11 50 c0       	movups %xmm2,-0x40(%r8)
    6e06:	66 0f fe e1          	paddd  %xmm1,%xmm4
    for (int i=k1;i<k2;i++)
    6e0a:	66 44 0f 6f dc       	movdqa %xmm4,%xmm11
      (*feasible)[i] = i;
    6e0f:	41 0f 11 60 d0       	movups %xmm4,-0x30(%r8)
    6e14:	66 44 0f fe d9       	paddd  %xmm1,%xmm11
    for (int i=k1;i<k2;i++)
    6e19:	66 41 0f 6f c3       	movdqa %xmm11,%xmm0
      (*feasible)[i] = i;
    6e1e:	45 0f 11 58 e0       	movups %xmm11,-0x20(%r8)
    6e23:	66 0f fe c1          	paddd  %xmm1,%xmm0
    6e27:	41 0f 11 40 f0       	movups %xmm0,-0x10(%r8)
    for (int i=k1;i<k2;i++)
    6e2c:	66 0f fe c1          	paddd  %xmm1,%xmm0
    6e30:	41 39 d3             	cmp    %edx,%r11d
    6e33:	77 89                	ja     6dbe <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x7fe>
    6e35:	89 ef                	mov    %ebp,%edi
    6e37:	83 e7 fc             	and    $0xfffffffc,%edi
    6e3a:	39 ef                	cmp    %ebp,%edi
    6e3c:	0f 84 28 fc ff ff    	je     6a6a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4aa>
      (*feasible)[i] = i;
    6e42:	48 63 df             	movslq %edi,%rbx
    for (int i=k1;i<k2;i++)
    6e45:	44 8d 67 01          	lea    0x1(%rdi),%r12d
      (*feasible)[i] = i;
    6e49:	89 3c 98             	mov    %edi,(%rax,%rbx,4)
    for (int i=k1;i<k2;i++)
    6e4c:	44 39 e5             	cmp    %r12d,%ebp
    6e4f:	0f 8e 15 fc ff ff    	jle    6a6a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4aa>
      (*feasible)[i] = i;
    6e55:	4d 63 ec             	movslq %r12d,%r13
    for (int i=k1;i<k2;i++)
    6e58:	83 c7 02             	add    $0x2,%edi
      (*feasible)[i] = i;
    6e5b:	46 89 24 a8          	mov    %r12d,(%rax,%r13,4)
    for (int i=k1;i<k2;i++)
    6e5f:	39 fd                	cmp    %edi,%ebp
    6e61:	0f 8e 03 fc ff ff    	jle    6a6a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4aa>
      (*feasible)[i] = i;
    6e67:	4c 63 f7             	movslq %edi,%r14
    6e6a:	42 89 3c b0          	mov    %edi,(%rax,%r14,4)
    for (int i=k1;i<k2;i++)
    6e6e:	e9 f7 fb ff ff       	jmpq   6a6a <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x4aa>
    numfeasible = (int)(ITER*kmin*log((double)kmin));
    6e73:	e8 08 b5 ff ff       	callq  2380 <log@plt>
    6e78:	f2 0f 59 04 24       	mulsd  (%rsp),%xmm0
    6e7d:	f2 0f 2c e8          	cvttsd2si %xmm0,%ebp
    6e81:	e9 99 f7 ff ff       	jmpq   661f <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x5f>
  for( int i = 1; i < points->num; i++ ) {
    6e86:	bf 01 00 00 00       	mov    $0x1,%edi
    6e8b:	e9 2d f9 ff ff       	jmpq   67bd <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x1fd>
    for (int i=k1;i<k2;i++)
    6e90:	31 ff                	xor    %edi,%edi
    6e92:	eb ae                	jmp    6e42 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x882>
    6e94:	49 89 c2             	mov    %rax,%r10
    6e97:	45 31 c9             	xor    %r9d,%r9d
    6e9a:	66 0f 6f 05 6e 57 00 	movdqa 0x576e(%rip),%xmm0        # c610 <_ZTS10FileStream+0x68>
    6ea1:	00 
    6ea2:	66 0f 6f 0d 76 57 00 	movdqa 0x5776(%rip),%xmm1        # c620 <_ZTS10FileStream+0x78>
    6ea9:	00 
    6eaa:	e9 56 fe ff ff       	jmpq   6d05 <_Z19selectfeasible_fastP6PointsPPiiiP16parsec_barrier_t+0x745>
    6eaf:	90                   	nop

0000000000006eb0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t>:
{
    6eb0:	f3 0f 1e fa          	endbr64 
    6eb4:	41 57                	push   %r15
    6eb6:	41 56                	push   %r14
    6eb8:	41 55                	push   %r13
    6eba:	49 89 f5             	mov    %rsi,%r13
    6ebd:	41 54                	push   %r12
    6ebf:	45 89 c4             	mov    %r8d,%r12d
    6ec2:	55                   	push   %rbp
    6ec3:	4c 89 cd             	mov    %r9,%rbp
    6ec6:	53                   	push   %rbx
    6ec7:	48 89 fb             	mov    %rdi,%rbx
    6eca:	48 83 ec 68          	sub    $0x68,%rsp
    6ece:	4c 63 05 33 82 00 00 	movslq 0x8233(%rip),%r8        # f108 <_ZL5nproc>
    6ed5:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    6eda:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    6edf:	4d 89 c7             	mov    %r8,%r15
  if( pid==0 ) hizs = (double*)calloc(nproc,sizeof(double));
    6ee2:	45 85 e4             	test   %r12d,%r12d
    6ee5:	0f 84 39 0e 00 00    	je     7d24 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xe74>
  long numberOfPoints = points->num;
    6eeb:	48 8b 0b             	mov    (%rbx),%rcx
  long k1 = bsize * pid;
    6eee:	49 63 fc             	movslq %r12d,%rdi
  if( pid == nproc-1 ) k2 = points->num;
    6ef1:	41 83 ef 01          	sub    $0x1,%r15d
  long ptDimension = points->dim;
    6ef5:	44 8b 73 08          	mov    0x8(%rbx),%r14d
  long k1 = bsize * pid;
    6ef9:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  long bsize = points->num/nproc;
    6efe:	48 89 c8             	mov    %rcx,%rax
    6f01:	48 99                	cqto   
    6f03:	49 f7 f8             	idiv   %r8
  long k1 = bsize * pid;
    6f06:	48 0f af f8          	imul   %rax,%rdi
  long k2 = k1 + bsize;
    6f0a:	48 01 f8             	add    %rdi,%rax
    6f0d:	45 39 e7             	cmp    %r12d,%r15d
    6f10:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
    6f15:	48 8d 3d fd 50 00 00 	lea    0x50fd(%rip),%rdi        # c019 <_IO_stdin_used+0x19>
    6f1c:	48 0f 45 c8          	cmovne %rax,%rcx
    6f20:	49 89 cf             	mov    %rcx,%r15
    6f23:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    6f28:	e8 c3 b5 ff ff       	callq  24f0 <puts@plt>
  pthread_barrier_wait(barrier);
    6f2d:	48 89 ef             	mov    %rbp,%rdi
    6f30:	e8 1b 42 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    6f35:	48 8d 3d f7 50 00 00 	lea    0x50f7(%rip),%rdi        # c033 <_IO_stdin_used+0x33>
    6f3c:	e8 af b5 ff ff       	callq  24f0 <puts@plt>
  for (long kk=k1;kk < k2; kk++ ) {
    6f41:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    6f46:	49 39 f7             	cmp    %rsi,%r15
    6f49:	0f 8e 90 16 00 00    	jle    85df <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x172f>
    myhiz += dist(points->p[kk], points->p[0],
    6f4f:	4c 8b 53 10          	mov    0x10(%rbx),%r10
    6f53:	49 c1 e7 05          	shl    $0x5,%r15
    6f57:	48 c1 e6 05          	shl    $0x5,%rsi
  double myhiz = 0;
    6f5b:	66 0f ef f6          	pxor   %xmm6,%xmm6
    6f5f:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
    6f64:	66 0f ef d2          	pxor   %xmm2,%xmm2
    6f68:	4f 8d 44 3a 48       	lea    0x48(%r10,%r15,1),%r8
    6f6d:	45 89 f7             	mov    %r14d,%r15d
    6f70:	4d 8b 4a 08          	mov    0x8(%r10),%r9
    6f74:	49 8d 74 32 48       	lea    0x48(%r10,%rsi,1),%rsi
    6f79:	41 c1 ef 02          	shr    $0x2,%r15d
    6f7d:	45 8d 56 ff          	lea    -0x1(%r14),%r10d
    6f81:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
    6f86:	4c 89 c3             	mov    %r8,%rbx
    6f89:	41 8d 47 fb          	lea    -0x5(%r15),%eax
    6f8d:	44 89 64 24 48       	mov    %r12d,0x48(%rsp)
    6f92:	45 89 d4             	mov    %r10d,%r12d
    6f95:	83 e0 fc             	and    $0xfffffffc,%eax
    6f98:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
    6f9d:	44 8d 58 04          	lea    0x4(%rax),%r11d
    6fa1:	f2 0f 11 74 24 28    	movsd  %xmm6,0x28(%rsp)
    6fa7:	89 c5                	mov    %eax,%ebp
    6fa9:	44 89 5c 24 30       	mov    %r11d,0x30(%rsp)
    6fae:	45 89 f3             	mov    %r14d,%r11d
    6fb1:	41 83 e3 fc          	and    $0xfffffffc,%r11d
    6fb5:	0f 1f 00             	nopl   (%rax)
    myhiz += dist(points->p[kk], points->p[0],
    6fb8:	0f 18 0e             	prefetcht0 (%rsi)
    6fbb:	48 8b 7e c0          	mov    -0x40(%rsi),%rdi
  for (i=0;i<dim;i++)
    6fbf:	45 85 f6             	test   %r14d,%r14d
    6fc2:	0f 8e 78 05 00 00    	jle    7540 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x690>
    6fc8:	41 83 fc 02          	cmp    $0x2,%r12d
    6fcc:	0f 86 77 05 00 00    	jbe    7549 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x699>
    6fd2:	4c 89 c8             	mov    %r9,%rax
    6fd5:	48 89 fa             	mov    %rdi,%rdx
    6fd8:	41 83 ff 04          	cmp    $0x4,%r15d
    6fdc:	0f 86 72 05 00 00    	jbe    7554 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x6a4>
    6fe2:	45 31 c0             	xor    %r8d,%r8d
  float result=0.0;
    6fe5:	66 0f ef c9          	pxor   %xmm1,%xmm1
    6fe9:	eb 08                	jmp    6ff3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x143>
    6feb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    6ff0:	45 89 e8             	mov    %r13d,%r8d
    6ff3:	0f 10 28             	movups (%rax),%xmm5
    6ff6:	0f 10 22             	movups (%rdx),%xmm4
    6ff9:	45 8d 68 04          	lea    0x4(%r8),%r13d
    6ffd:	0f 18 8a 00 01 00 00 	prefetcht0 0x100(%rdx)
    7004:	0f 10 7a 10          	movups 0x10(%rdx),%xmm7
    7008:	44 0f 10 40 10       	movups 0x10(%rax),%xmm8
    700d:	48 83 c2 40          	add    $0x40,%rdx
    7011:	0f 18 88 00 01 00 00 	prefetcht0 0x100(%rax)
    7018:	0f 5c e5             	subps  %xmm5,%xmm4
    701b:	44 0f 10 62 e0       	movups -0x20(%rdx),%xmm12
    7020:	0f 10 6a f0          	movups -0x10(%rdx),%xmm5
    7024:	48 83 c0 40          	add    $0x40,%rax
    7028:	41 0f 5c f8          	subps  %xmm8,%xmm7
    702c:	44 0f 10 68 e0       	movups -0x20(%rax),%xmm13
    7031:	0f 59 e4             	mulps  %xmm4,%xmm4
    7034:	45 0f 5c e5          	subps  %xmm13,%xmm12
    7038:	0f 59 ff             	mulps  %xmm7,%xmm7
    703b:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    703f:	f3 0f 58 cc          	addss  %xmm4,%xmm1
    7043:	0f 28 dc             	movaps %xmm4,%xmm3
    7046:	0f c6 dc 55          	shufps $0x55,%xmm4,%xmm3
    704a:	44 0f 28 d7          	movaps %xmm7,%xmm10
    704e:	44 0f 28 df          	movaps %xmm7,%xmm11
    7052:	44 0f c6 d7 55       	shufps $0x55,%xmm7,%xmm10
    7057:	44 0f 15 df          	unpckhps %xmm7,%xmm11
    705b:	f3 0f 58 d9          	addss  %xmm1,%xmm3
    705f:	0f 28 cc             	movaps %xmm4,%xmm1
    7062:	45 0f 28 fc          	movaps %xmm12,%xmm15
    7066:	0f 15 cc             	unpckhps %xmm4,%xmm1
    7069:	0f c6 e4 ff          	shufps $0xff,%xmm4,%xmm4
    706d:	45 0f c6 fc 55       	shufps $0x55,%xmm12,%xmm15
    7072:	41 0f 28 f4          	movaps %xmm12,%xmm6
    7076:	41 0f 15 f4          	unpckhps %xmm12,%xmm6
    707a:	f3 0f 58 cb          	addss  %xmm3,%xmm1
    707e:	f3 0f 58 cc          	addss  %xmm4,%xmm1
    7082:	0f 10 60 f0          	movups -0x10(%rax),%xmm4
    7086:	0f 5c ec             	subps  %xmm4,%xmm5
    7089:	f3 0f 58 cf          	addss  %xmm7,%xmm1
    708d:	0f c6 ff ff          	shufps $0xff,%xmm7,%xmm7
    7091:	0f 59 ed             	mulps  %xmm5,%xmm5
    7094:	f3 41 0f 58 ca       	addss  %xmm10,%xmm1
    7099:	f3 41 0f 58 cb       	addss  %xmm11,%xmm1
    709e:	0f 28 dd             	movaps %xmm5,%xmm3
    70a1:	0f c6 dd 55          	shufps $0x55,%xmm5,%xmm3
    70a5:	f3 0f 58 cf          	addss  %xmm7,%xmm1
    70a9:	0f 28 fd             	movaps %xmm5,%xmm7
    70ac:	0f 15 fd             	unpckhps %xmm5,%xmm7
    70af:	f3 41 0f 58 cc       	addss  %xmm12,%xmm1
    70b4:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    70b9:	f3 41 0f 58 cf       	addss  %xmm15,%xmm1
    70be:	f3 0f 58 ce          	addss  %xmm6,%xmm1
    70c2:	f3 41 0f 58 cc       	addss  %xmm12,%xmm1
    70c7:	f3 0f 58 cd          	addss  %xmm5,%xmm1
    70cb:	0f c6 ed ff          	shufps $0xff,%xmm5,%xmm5
    70cf:	f3 0f 58 cb          	addss  %xmm3,%xmm1
    70d3:	f3 0f 58 cf          	addss  %xmm7,%xmm1
    70d7:	f3 0f 58 cd          	addss  %xmm5,%xmm1
  for (i=0;i<dim;i++)
    70db:	41 39 e8             	cmp    %ebp,%r8d
    70de:	0f 85 0c ff ff ff    	jne    6ff0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x140>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    70e4:	44 8b 6c 24 30       	mov    0x30(%rsp),%r13d
    70e9:	44 0f 10 02          	movups (%rdx),%xmm8
    70ed:	44 0f 10 08          	movups (%rax),%xmm9
    70f1:	45 89 ea             	mov    %r13d,%r10d
    70f4:	45 8d 45 01          	lea    0x1(%r13),%r8d
    70f8:	41 f7 d2             	not    %r10d
    70fb:	b9 10 00 00 00       	mov    $0x10,%ecx
    7100:	45 0f 5c c1          	subps  %xmm9,%xmm8
    7104:	45 01 fa             	add    %r15d,%r10d
    7107:	41 83 e2 03          	and    $0x3,%r10d
    710b:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    710f:	41 0f 28 c0          	movaps %xmm8,%xmm0
    7113:	45 0f 28 d0          	movaps %xmm8,%xmm10
    7117:	45 0f 28 d8          	movaps %xmm8,%xmm11
    711b:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    711f:	45 0f c6 d0 55       	shufps $0x55,%xmm8,%xmm10
    7124:	45 0f 15 d8          	unpckhps %xmm8,%xmm11
    7128:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    712d:	f3 41 0f 58 c2       	addss  %xmm10,%xmm0
    7132:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    7137:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
  for (i=0;i<dim;i++)
    713c:	45 39 c7             	cmp    %r8d,%r15d
    713f:	0f 86 a4 01 00 00    	jbe    72e9 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x439>
    7145:	45 85 d2             	test   %r10d,%r10d
    7148:	0f 84 a2 00 00 00    	je     71f0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x340>
    714e:	41 83 fa 01          	cmp    $0x1,%r10d
    7152:	74 44                	je     7198 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x2e8>
    7154:	41 83 fa 02          	cmp    $0x2,%r10d
    7158:	0f 85 02 04 00 00    	jne    7560 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x6b0>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    715e:	0f 10 2c 0a          	movups (%rdx,%rcx,1),%xmm5
    7162:	0f 10 24 08          	movups (%rax,%rcx,1),%xmm4
    7166:	41 83 c0 01          	add    $0x1,%r8d
    716a:	48 83 c1 10          	add    $0x10,%rcx
    716e:	0f 5c ec             	subps  %xmm4,%xmm5
    7171:	0f 59 ed             	mulps  %xmm5,%xmm5
    7174:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    7178:	0f 28 fd             	movaps %xmm5,%xmm7
    717b:	0f 28 cd             	movaps %xmm5,%xmm1
    717e:	0f c6 fd 55          	shufps $0x55,%xmm5,%xmm7
    7182:	0f 15 cd             	unpckhps %xmm5,%xmm1
    7185:	0f c6 ed ff          	shufps $0xff,%xmm5,%xmm5
    7189:	f3 0f 58 c7          	addss  %xmm7,%xmm0
    718d:	f3 0f 58 c8          	addss  %xmm0,%xmm1
    7191:	0f 28 c5             	movaps %xmm5,%xmm0
    7194:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    7198:	44 0f 10 04 0a       	movups (%rdx,%rcx,1),%xmm8
    719d:	44 0f 10 0c 08       	movups (%rax,%rcx,1),%xmm9
    71a2:	41 83 c0 01          	add    $0x1,%r8d
    71a6:	48 83 c1 10          	add    $0x10,%rcx
    71aa:	45 0f 5c c1          	subps  %xmm9,%xmm8
    71ae:	45 0f 59 c0          	mulps  %xmm8,%xmm8
    71b2:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    71b7:	45 0f 28 d8          	movaps %xmm8,%xmm11
    71bb:	45 0f 28 e0          	movaps %xmm8,%xmm12
    71bf:	45 0f c6 d8 55       	shufps $0x55,%xmm8,%xmm11
    71c4:	45 0f 15 e0          	unpckhps %xmm8,%xmm12
    71c8:	45 0f c6 c0 ff       	shufps $0xff,%xmm8,%xmm8
    71cd:	f3 41 0f 58 c3       	addss  %xmm11,%xmm0
    71d2:	f3 44 0f 58 e0       	addss  %xmm0,%xmm12
    71d7:	41 0f 28 c0          	movaps %xmm8,%xmm0
    71db:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
  for (i=0;i<dim;i++)
    71e0:	45 39 c7             	cmp    %r8d,%r15d
    71e3:	0f 86 00 01 00 00    	jbe    72e9 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x439>
    71e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    71f0:	44 0f 10 34 08       	movups (%rax,%rcx,1),%xmm14
    71f5:	44 0f 10 2c 0a       	movups (%rdx,%rcx,1),%xmm13
    71fa:	41 83 c0 04          	add    $0x4,%r8d
    71fe:	0f 10 5c 0a 10       	movups 0x10(%rdx,%rcx,1),%xmm3
    7203:	0f 10 64 08 10       	movups 0x10(%rax,%rcx,1),%xmm4
    7208:	45 0f 5c ee          	subps  %xmm14,%xmm13
    720c:	44 0f 10 4c 0a 20    	movups 0x20(%rdx,%rcx,1),%xmm9
    7212:	44 0f 10 54 08 20    	movups 0x20(%rax,%rcx,1),%xmm10
    7218:	0f 5c dc             	subps  %xmm4,%xmm3
    721b:	44 0f 10 74 0a 30    	movups 0x30(%rdx,%rcx,1),%xmm14
    7221:	44 0f 10 7c 08 30    	movups 0x30(%rax,%rcx,1),%xmm15
    7227:	48 83 c1 40          	add    $0x40,%rcx
    722b:	45 0f 5c ca          	subps  %xmm10,%xmm9
    722f:	45 0f 59 ed          	mulps  %xmm13,%xmm13
    7233:	45 0f 5c f7          	subps  %xmm15,%xmm14
    7237:	0f 59 db             	mulps  %xmm3,%xmm3
    723a:	45 0f 59 c9          	mulps  %xmm9,%xmm9
    723e:	45 0f 59 f6          	mulps  %xmm14,%xmm14
    7242:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    7247:	41 0f 28 f5          	movaps %xmm13,%xmm6
    724b:	41 0f 28 ed          	movaps %xmm13,%xmm5
    724f:	41 0f c6 f5 55       	shufps $0x55,%xmm13,%xmm6
    7254:	41 0f 15 ed          	unpckhps %xmm13,%xmm5
    7258:	0f 28 cb             	movaps %xmm3,%xmm1
    725b:	45 0f c6 ed ff       	shufps $0xff,%xmm13,%xmm13
    7260:	0f c6 cb 55          	shufps $0x55,%xmm3,%xmm1
    7264:	44 0f 28 c3          	movaps %xmm3,%xmm8
    7268:	45 0f 28 e1          	movaps %xmm9,%xmm12
    726c:	f3 0f 58 c6          	addss  %xmm6,%xmm0
    7270:	44 0f 15 c3          	unpckhps %xmm3,%xmm8
    7274:	45 0f c6 e1 55       	shufps $0x55,%xmm9,%xmm12
    7279:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    727d:	41 0f 28 ee          	movaps %xmm14,%xmm5
    7281:	41 0f c6 ee 55       	shufps $0x55,%xmm14,%xmm5
    7286:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    728b:	45 0f 28 e9          	movaps %xmm9,%xmm13
    728f:	45 0f 15 e9          	unpckhps %xmm9,%xmm13
    7293:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    7297:	0f c6 db ff          	shufps $0xff,%xmm3,%xmm3
    729b:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    729f:	f3 41 0f 58 c0       	addss  %xmm8,%xmm0
    72a4:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    72a8:	41 0f 28 de          	movaps %xmm14,%xmm3
    72ac:	41 0f 15 de          	unpckhps %xmm14,%xmm3
    72b0:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    72b5:	45 0f c6 c9 ff       	shufps $0xff,%xmm9,%xmm9
    72ba:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
    72bf:	f3 41 0f 58 c5       	addss  %xmm13,%xmm0
    72c4:	f3 41 0f 58 c1       	addss  %xmm9,%xmm0
    72c9:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
    72ce:	45 0f c6 f6 ff       	shufps $0xff,%xmm14,%xmm14
    72d3:	f3 0f 58 c5          	addss  %xmm5,%xmm0
    72d7:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    72db:	f3 41 0f 58 c6       	addss  %xmm14,%xmm0
  for (i=0;i<dim;i++)
    72e0:	45 39 c7             	cmp    %r8d,%r15d
    72e3:	0f 87 07 ff ff ff    	ja     71f0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x340>
    72e9:	44 89 d8             	mov    %r11d,%eax
    72ec:	45 39 f3             	cmp    %r14d,%r11d
    72ef:	74 53                	je     7344 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x494>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    72f1:	48 63 d0             	movslq %eax,%rdx
  for (i=0;i<dim;i++)
    72f4:	44 8d 68 01          	lea    0x1(%rax),%r13d
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    72f8:	f3 0f 10 24 97       	movss  (%rdi,%rdx,4),%xmm4
    72fd:	f3 41 0f 5c 24 91    	subss  (%r9,%rdx,4),%xmm4
    7303:	f3 0f 59 e4          	mulss  %xmm4,%xmm4
    7307:	f3 0f 58 c4          	addss  %xmm4,%xmm0
  for (i=0;i<dim;i++)
    730b:	45 39 ee             	cmp    %r13d,%r14d
    730e:	7e 34                	jle    7344 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x494>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    7310:	4d 63 d5             	movslq %r13d,%r10
  for (i=0;i<dim;i++)
    7313:	83 c0 02             	add    $0x2,%eax
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    7316:	f3 42 0f 10 3c 97    	movss  (%rdi,%r10,4),%xmm7
    731c:	f3 43 0f 5c 3c 91    	subss  (%r9,%r10,4),%xmm7
    7322:	f3 0f 59 ff          	mulss  %xmm7,%xmm7
    7326:	f3 0f 58 c7          	addss  %xmm7,%xmm0
  for (i=0;i<dim;i++)
    732a:	41 39 c6             	cmp    %eax,%r14d
    732d:	7e 15                	jle    7344 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x494>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    732f:	48 98                	cltq   
    7331:	f3 0f 10 0c 87       	movss  (%rdi,%rax,4),%xmm1
    7336:	f3 41 0f 5c 0c 81    	subss  (%r9,%rax,4),%xmm1
    733c:	f3 0f 59 c9          	mulss  %xmm1,%xmm1
    7340:	f3 0f 58 c1          	addss  %xmm1,%xmm0
		      ptDimension)*points->p[kk].weight;
    7344:	f3 0f 59 46 b8       	mulss  -0x48(%rsi),%xmm0
    7349:	0f 18 4e f8          	prefetcht0 -0x8(%rsi)
    734d:	48 83 c6 20          	add    $0x20,%rsi
    myhiz += dist(points->p[kk], points->p[0],
    7351:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
    7355:	f2 0f 58 d0          	addsd  %xmm0,%xmm2
  for (long kk=k1;kk < k2; kk++ ) {
    7359:	48 39 de             	cmp    %rbx,%rsi
    735c:	0f 85 56 fc ff ff    	jne    6fb8 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x108>
    7362:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
    7367:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
    736c:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
    7371:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  hizs[pid] = myhiz;
    7376:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    737b:	48 8b 05 be 7c 00 00 	mov    0x7cbe(%rip),%rax        # f040 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE4hizs>
    7382:	48 8d 3d c4 4c 00 00 	lea    0x4cc4(%rip),%rdi        # c04d <_IO_stdin_used+0x4d>
    7389:	f2 0f 11 14 c8       	movsd  %xmm2,(%rax,%rcx,8)
    738e:	e8 5d b1 ff ff       	callq  24f0 <puts@plt>
  pthread_barrier_wait(barrier);
    7393:	48 89 ef             	mov    %rbp,%rdi
    7396:	e8 b5 3d 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    739b:	48 8d 3d c5 4c 00 00 	lea    0x4cc5(%rip),%rdi        # c067 <_IO_stdin_used+0x67>
    73a2:	e8 49 b1 ff ff       	callq  24f0 <puts@plt>
  for( int i = 0; i < nproc; i++ )   {
    73a7:	8b 15 5b 7d 00 00    	mov    0x7d5b(%rip),%edx        # f108 <_ZL5nproc>
    73ad:	85 d2                	test   %edx,%edx
    73af:	0f 8e 19 12 00 00    	jle    85ce <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x171e>
    hiz += hizs[i];
    73b5:	48 8b 05 84 7c 00 00 	mov    0x7c84(%rip),%rax        # f040 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE4hizs>
    73bc:	83 fa 01             	cmp    $0x1,%edx
    73bf:	0f 84 4d 12 00 00    	je     8612 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1762>
    73c5:	89 d7                	mov    %edx,%edi
    73c7:	d1 ef                	shr    %edi
    73c9:	83 ff 04             	cmp    $0x4,%edi
    73cc:	0f 86 da 01 00 00    	jbe    75ac <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x6fc>
    73d2:	8d 77 fb             	lea    -0x5(%rdi),%esi
    73d5:	49 89 c6             	mov    %rax,%r14
  hiz = loz = 0.0;
    73d8:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    hiz += hizs[i];
    73dd:	45 31 ff             	xor    %r15d,%r15d
    73e0:	83 e6 fc             	and    $0xfffffffc,%esi
    73e3:	44 8d 56 04          	lea    0x4(%rsi),%r10d
    73e7:	40 f6 c6 04          	test   $0x4,%sil
    73eb:	74 6a                	je     7457 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x5a7>
    73ed:	f2 44 0f 10 00       	movsd  (%rax),%xmm8
    73f2:	f2 44 0f 10 48 08    	movsd  0x8(%rax),%xmm9
    73f8:	4c 8d 70 40          	lea    0x40(%rax),%r14
    73fc:	41 bf 04 00 00 00    	mov    $0x4,%r15d
    7402:	f2 44 0f 58 44 24 28 	addsd  0x28(%rsp),%xmm8
    7409:	f2 44 0f 10 50 10    	movsd  0x10(%rax),%xmm10
    740f:	0f 18 88 d0 01 00 00 	prefetcht0 0x1d0(%rax)
    7416:	f2 44 0f 10 58 18    	movsd  0x18(%rax),%xmm11
    741c:	f2 44 0f 10 60 20    	movsd  0x20(%rax),%xmm12
    7422:	f2 44 0f 10 68 28    	movsd  0x28(%rax),%xmm13
    7428:	f2 44 0f 10 70 30    	movsd  0x30(%rax),%xmm14
    742e:	f2 45 0f 58 c8       	addsd  %xmm8,%xmm9
    7433:	f2 44 0f 10 78 38    	movsd  0x38(%rax),%xmm15
    7439:	f2 45 0f 58 d1       	addsd  %xmm9,%xmm10
    743e:	f2 45 0f 58 da       	addsd  %xmm10,%xmm11
    7443:	f2 45 0f 58 dc       	addsd  %xmm12,%xmm11
    7448:	f2 45 0f 58 eb       	addsd  %xmm11,%xmm13
    744d:	f2 45 0f 58 f5       	addsd  %xmm13,%xmm14
    7452:	f2 45 0f 58 fe       	addsd  %xmm14,%xmm15
    7457:	f2 41 0f 10 36       	movsd  (%r14),%xmm6
    745c:	f2 41 0f 10 6e 08    	movsd  0x8(%r14),%xmm5
    7462:	4d 8d 4e 40          	lea    0x40(%r14),%r9
    7466:	41 0f 18 8e d0 01 00 	prefetcht0 0x1d0(%r14)
    746d:	00 
    746e:	f2 41 0f 10 5e 10    	movsd  0x10(%r14),%xmm3
    7474:	f2 41 0f 10 66 18    	movsd  0x18(%r14),%xmm4
    747a:	4d 89 cb             	mov    %r9,%r11
    747d:	f2 44 0f 58 fe       	addsd  %xmm6,%xmm15
    7482:	f2 41 0f 10 7e 20    	movsd  0x20(%r14),%xmm7
    7488:	f2 41 0f 10 4e 28    	movsd  0x28(%r14),%xmm1
    748e:	f2 41 0f 10 46 30    	movsd  0x30(%r14),%xmm0
    7494:	f2 41 0f 10 56 38    	movsd  0x38(%r14),%xmm2
    749a:	f2 44 0f 58 fd       	addsd  %xmm5,%xmm15
    749f:	f2 41 0f 58 df       	addsd  %xmm15,%xmm3
    74a4:	f2 0f 58 e3          	addsd  %xmm3,%xmm4
    74a8:	f2 0f 58 e7          	addsd  %xmm7,%xmm4
    74ac:	f2 0f 58 cc          	addsd  %xmm4,%xmm1
    74b0:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    74b4:	f2 0f 58 d0          	addsd  %xmm0,%xmm2
  for( int i = 0; i < nproc; i++ )   {
    74b8:	41 39 f7             	cmp    %esi,%r15d
    74bb:	0f 84 f5 00 00 00    	je     75b6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x706>
    hiz += hizs[i];
    74c1:	f2 45 0f 10 46 40    	movsd  0x40(%r14),%xmm8
    74c7:	f2 45 0f 10 4e 48    	movsd  0x48(%r14),%xmm9
    74cd:	41 83 c7 08          	add    $0x8,%r15d
    74d1:	41 0f 18 8e 10 02 00 	prefetcht0 0x210(%r14)
    74d8:	00 
    74d9:	f2 45 0f 10 51 10    	movsd  0x10(%r9),%xmm10
    74df:	f2 45 0f 10 59 20    	movsd  0x20(%r9),%xmm11
    74e5:	49 83 ee 80          	sub    $0xffffffffffffff80,%r14
    74e9:	f2 41 0f 58 d0       	addsd  %xmm8,%xmm2
    74ee:	f2 45 0f 10 61 28    	movsd  0x28(%r9),%xmm12
    74f4:	66 41 0f 10 41 30    	movupd 0x30(%r9),%xmm0
    74fa:	66 44 0f 28 e8       	movapd %xmm0,%xmm13
    74ff:	66 0f 15 c0          	unpckhpd %xmm0,%xmm0
    7503:	f2 41 0f 58 d1       	addsd  %xmm9,%xmm2
    7508:	66 44 0f 28 f8       	movapd %xmm0,%xmm15
    750d:	f2 44 0f 58 d2       	addsd  %xmm2,%xmm10
    7512:	f2 41 0f 10 51 18    	movsd  0x18(%r9),%xmm2
    7518:	f2 41 0f 58 d2       	addsd  %xmm10,%xmm2
    751d:	f2 41 0f 58 d3       	addsd  %xmm11,%xmm2
    7522:	f2 44 0f 58 e2       	addsd  %xmm2,%xmm12
    7527:	f2 45 0f 58 ec       	addsd  %xmm12,%xmm13
    752c:	f2 45 0f 58 fd       	addsd  %xmm13,%xmm15
  for( int i = 0; i < nproc; i++ )   {
    7531:	e9 21 ff ff ff       	jmpq   7457 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x5a7>
    7536:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    753d:	00 00 00 
  float result=0.0;
    7540:	66 0f ef c0          	pxor   %xmm0,%xmm0
    7544:	e9 fb fd ff ff       	jmpq   7344 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x494>
    7549:	66 0f ef c0          	pxor   %xmm0,%xmm0
  for (i=0;i<dim;i++)
    754d:	31 c0                	xor    %eax,%eax
    754f:	e9 9d fd ff ff       	jmpq   72f1 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x441>
    7554:	45 31 ed             	xor    %r13d,%r13d
    7557:	66 0f ef c9          	pxor   %xmm1,%xmm1
    755b:	e9 89 fb ff ff       	jmpq   70e9 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x239>
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
    7560:	44 0f 10 62 10       	movups 0x10(%rdx),%xmm12
    7565:	44 0f 10 68 10       	movups 0x10(%rax),%xmm13
    756a:	b9 20 00 00 00       	mov    $0x20,%ecx
    756f:	45 8d 45 02          	lea    0x2(%r13),%r8d
    7573:	45 0f 5c e5          	subps  %xmm13,%xmm12
    7577:	45 0f 59 e4          	mulps  %xmm12,%xmm12
    757b:	f3 41 0f 58 c4       	addss  %xmm12,%xmm0
    7580:	45 0f 28 fc          	movaps %xmm12,%xmm15
    7584:	41 0f 28 f4          	movaps %xmm12,%xmm6
    7588:	45 0f c6 fc 55       	shufps $0x55,%xmm12,%xmm15
    758d:	41 0f 15 f4          	unpckhps %xmm12,%xmm6
    7591:	45 0f c6 e4 ff       	shufps $0xff,%xmm12,%xmm12
    7596:	f3 41 0f 58 c7       	addss  %xmm15,%xmm0
    759b:	f3 0f 58 f0          	addss  %xmm0,%xmm6
    759f:	41 0f 28 c4          	movaps %xmm12,%xmm0
    75a3:	f3 0f 58 c6          	addss  %xmm6,%xmm0
  for (i=0;i<dim;i++)
    75a7:	e9 b2 fb ff ff       	jmpq   715e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x2ae>
    hiz += hizs[i];
    75ac:	49 89 c3             	mov    %rax,%r11
    75af:	45 31 d2             	xor    %r10d,%r10d
    75b2:	66 0f ef d2          	pxor   %xmm2,%xmm2
    75b6:	f2 45 0f 10 33       	movsd  (%r11),%xmm14
    75bb:	45 89 d0             	mov    %r10d,%r8d
    75be:	45 8d 72 01          	lea    0x1(%r10),%r14d
    75c2:	49 8d 4b 10          	lea    0x10(%r11),%rcx
    75c6:	41 f7 d0             	not    %r8d
    75c9:	f2 45 0f 10 7b 08    	movsd  0x8(%r11),%xmm15
    75cf:	f2 41 0f 58 d6       	addsd  %xmm14,%xmm2
    75d4:	41 01 f8             	add    %edi,%r8d
    75d7:	41 83 e0 07          	and    $0x7,%r8d
    75db:	f2 41 0f 58 d7       	addsd  %xmm15,%xmm2
  for( int i = 0; i < nproc; i++ )   {
    75e0:	44 39 f7             	cmp    %r14d,%edi
    75e3:	0f 86 a5 01 00 00    	jbe    778e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x8de>
    75e9:	45 85 c0             	test   %r8d,%r8d
    75ec:	0f 84 e9 00 00 00    	je     76db <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x82b>
    75f2:	41 83 f8 01          	cmp    $0x1,%r8d
    75f6:	0f 84 ba 00 00 00    	je     76b6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x806>
    75fc:	41 83 f8 02          	cmp    $0x2,%r8d
    7600:	0f 84 94 00 00 00    	je     769a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x7ea>
    7606:	41 83 f8 03          	cmp    $0x3,%r8d
    760a:	74 75                	je     7681 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x7d1>
    760c:	41 83 f8 04          	cmp    $0x4,%r8d
    7610:	74 56                	je     7668 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x7b8>
    7612:	41 83 f8 05          	cmp    $0x5,%r8d
    7616:	74 37                	je     764f <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x79f>
    7618:	41 83 f8 06          	cmp    $0x6,%r8d
    761c:	74 18                	je     7636 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x786>
    hiz += hizs[i];
    761e:	66 0f 10 31          	movupd (%rcx),%xmm6
    7622:	45 8d 72 02          	lea    0x2(%r10),%r14d
    7626:	49 8d 4b 20          	lea    0x20(%r11),%rcx
    762a:	f2 0f 58 d6          	addsd  %xmm6,%xmm2
    762e:	66 0f 15 f6          	unpckhpd %xmm6,%xmm6
    7632:	f2 0f 58 d6          	addsd  %xmm6,%xmm2
    7636:	f2 0f 10 19          	movsd  (%rcx),%xmm3
    763a:	41 83 c6 01          	add    $0x1,%r14d
    763e:	48 83 c1 10          	add    $0x10,%rcx
    7642:	f2 0f 58 da          	addsd  %xmm2,%xmm3
    7646:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    764b:	f2 0f 58 d3          	addsd  %xmm3,%xmm2
    764f:	f2 0f 10 21          	movsd  (%rcx),%xmm4
    7653:	41 83 c6 01          	add    $0x1,%r14d
    7657:	48 83 c1 10          	add    $0x10,%rcx
    765b:	f2 0f 58 e2          	addsd  %xmm2,%xmm4
    765f:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    7664:	f2 0f 58 d4          	addsd  %xmm4,%xmm2
    7668:	f2 0f 10 39          	movsd  (%rcx),%xmm7
    766c:	41 83 c6 01          	add    $0x1,%r14d
    7670:	48 83 c1 10          	add    $0x10,%rcx
    7674:	f2 0f 58 fa          	addsd  %xmm2,%xmm7
    7678:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    767d:	f2 0f 58 d7          	addsd  %xmm7,%xmm2
    7681:	f2 0f 10 09          	movsd  (%rcx),%xmm1
    7685:	41 83 c6 01          	add    $0x1,%r14d
    7689:	48 83 c1 10          	add    $0x10,%rcx
    768d:	f2 0f 58 ca          	addsd  %xmm2,%xmm1
    7691:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    7696:	f2 0f 58 d1          	addsd  %xmm1,%xmm2
    769a:	f2 44 0f 10 01       	movsd  (%rcx),%xmm8
    769f:	41 83 c6 01          	add    $0x1,%r14d
    76a3:	48 83 c1 10          	add    $0x10,%rcx
    76a7:	f2 44 0f 58 c2       	addsd  %xmm2,%xmm8
    76ac:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    76b1:	f2 41 0f 58 d0       	addsd  %xmm8,%xmm2
    76b6:	f2 44 0f 10 09       	movsd  (%rcx),%xmm9
    76bb:	41 83 c6 01          	add    $0x1,%r14d
    76bf:	48 83 c1 10          	add    $0x10,%rcx
    76c3:	f2 44 0f 58 ca       	addsd  %xmm2,%xmm9
    76c8:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    76cd:	f2 41 0f 58 d1       	addsd  %xmm9,%xmm2
  for( int i = 0; i < nproc; i++ )   {
    76d2:	44 39 f7             	cmp    %r14d,%edi
    76d5:	0f 86 b3 00 00 00    	jbe    778e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x8de>
    hiz += hizs[i];
    76db:	f2 44 0f 10 11       	movsd  (%rcx),%xmm10
    76e0:	f2 44 0f 10 59 08    	movsd  0x8(%rcx),%xmm11
    76e6:	41 83 c6 08          	add    $0x8,%r14d
    76ea:	48 83 e9 80          	sub    $0xffffffffffffff80,%rcx
    76ee:	f2 44 0f 10 61 90    	movsd  -0x70(%rcx),%xmm12
    76f4:	f2 0f 10 41 98       	movsd  -0x68(%rcx),%xmm0
    76f9:	f2 41 0f 58 d2       	addsd  %xmm10,%xmm2
    76fe:	f2 0f 10 71 b8       	movsd  -0x48(%rcx),%xmm6
    7703:	f2 0f 10 69 c0       	movsd  -0x40(%rcx),%xmm5
    7708:	f2 44 0f 10 69 a0    	movsd  -0x60(%rcx),%xmm13
    770e:	f2 44 0f 10 71 a8    	movsd  -0x58(%rcx),%xmm14
    7714:	f2 44 0f 10 79 b0    	movsd  -0x50(%rcx),%xmm15
    771a:	f2 0f 10 59 c8       	movsd  -0x38(%rcx),%xmm3
    771f:	f2 44 0f 58 da       	addsd  %xmm2,%xmm11
    7724:	f2 0f 10 61 d0       	movsd  -0x30(%rcx),%xmm4
    7729:	f2 0f 10 79 d8       	movsd  -0x28(%rcx),%xmm7
    772e:	f2 0f 10 49 e0       	movsd  -0x20(%rcx),%xmm1
    7733:	f2 44 0f 10 41 e8    	movsd  -0x18(%rcx),%xmm8
    7739:	f2 44 0f 10 49 f0    	movsd  -0x10(%rcx),%xmm9
    773f:	f2 0f 10 51 f8       	movsd  -0x8(%rcx),%xmm2
    7744:	f2 45 0f 58 e3       	addsd  %xmm11,%xmm12
    7749:	f2 41 0f 58 c4       	addsd  %xmm12,%xmm0
    774e:	f2 41 0f 58 c5       	addsd  %xmm13,%xmm0
    7753:	f2 44 0f 58 f0       	addsd  %xmm0,%xmm14
    7758:	f2 45 0f 58 fe       	addsd  %xmm14,%xmm15
    775d:	f2 41 0f 58 f7       	addsd  %xmm15,%xmm6
    7762:	f2 0f 58 f5          	addsd  %xmm5,%xmm6
    7766:	f2 0f 58 de          	addsd  %xmm6,%xmm3
    776a:	f2 0f 58 e3          	addsd  %xmm3,%xmm4
    776e:	f2 0f 58 fc          	addsd  %xmm4,%xmm7
    7772:	f2 0f 58 f9          	addsd  %xmm1,%xmm7
    7776:	f2 44 0f 58 c7       	addsd  %xmm7,%xmm8
    777b:	f2 45 0f 58 c8       	addsd  %xmm8,%xmm9
    7780:	f2 41 0f 58 d1       	addsd  %xmm9,%xmm2
  for( int i = 0; i < nproc; i++ )   {
    7785:	44 39 f7             	cmp    %r14d,%edi
    7788:	0f 87 4d ff ff ff    	ja     76db <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x82b>
    778e:	41 89 d0             	mov    %edx,%r8d
    7791:	41 83 e0 fe          	and    $0xfffffffe,%r8d
    7795:	41 39 d0             	cmp    %edx,%r8d
    7798:	74 09                	je     77a3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x8f3>
    hiz += hizs[i];
    779a:	4d 63 f8             	movslq %r8d,%r15
    779d:	f2 42 0f 58 14 f8    	addsd  (%rax,%r15,8),%xmm2
  for( int i = 0; i < nproc; i++ )   {
    77a3:	f2 44 0f 10 54 24 28 	movsd  0x28(%rsp),%xmm10
    77aa:	f2 44 0f 58 d2       	addsd  %xmm2,%xmm10
    77af:	f2 44 0f 59 15 18 4e 	mulsd  0x4e18(%rip),%xmm10        # c5d0 <_ZTS10FileStream+0x28>
    77b6:	00 00 
    77b8:	f2 44 0f 11 54 24 10 	movsd  %xmm10,0x10(%rsp)
  if (points->num <= kmax) {
    77bf:	4c 8b 0b             	mov    (%rbx),%r9
    77c2:	4c 3b 4c 24 20       	cmp    0x20(%rsp),%r9
    77c7:	0f 8e 86 03 00 00    	jle    7b53 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xca3>
  if( pid == 0 ) shuffle(points);
    77cd:	45 85 e4             	test   %r12d,%r12d
    77d0:	0f 84 86 05 00 00    	je     7d5c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xeac>
  cost = pspeedy(points, z, &k, pid, barrier);
    77d6:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    77db:	48 89 e9             	mov    %rbp,%rcx
    77de:	44 89 e2             	mov    %r12d,%edx
    77e1:	48 89 df             	mov    %rbx,%rdi
    77e4:	f2 44 0f 5a 6c 24 10 	cvtsd2ss 0x10(%rsp),%xmm13
    77eb:	41 0f 28 c5          	movaps %xmm13,%xmm0
    77ef:	48 8d 35 62 78 00 00 	lea    0x7862(%rip),%rsi        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    77f6:	f2 0f 11 54 24 18    	movsd  %xmm2,0x18(%rsp)
    77fc:	f3 44 0f 11 6c 24 08 	movss  %xmm13,0x8(%rsp)
    7803:	e8 d8 b7 ff ff       	callq  2fe0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t>
  while ((k < kmin)&&(i<SP)) {
    7808:	4c 39 2d 49 78 00 00 	cmp    %r13,0x7849(%rip)        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    780f:	f3 44 0f 10 74 24 08 	movss  0x8(%rsp),%xmm14
    7816:	f2 44 0f 10 7c 24 18 	movsd  0x18(%rsp),%xmm15
    781d:	0f 8c fa 05 00 00    	jl     7e1d <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xf6d>
  cost = pspeedy(points, z, &k, pid, barrier);
    7823:	66 0f ef c9          	pxor   %xmm1,%xmm1
    7827:	f3 0f 5a c8          	cvtss2sd %xmm0,%xmm1
  if( pid == 0 )
    782b:	45 85 e4             	test   %r12d,%r12d
    782e:	0f 84 1a 12 00 00    	je     8a4e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b9e>
    7834:	f2 44 0f 10 44 24 10 	movsd  0x10(%rsp),%xmm8
    783b:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    7840:	f2 44 0f 11 7c 24 10 	movsd  %xmm15,0x10(%rsp)
    7847:	f2 45 0f 5a c8       	cvtsd2ss %xmm8,%xmm9
    784c:	f2 44 0f 11 44 24 08 	movsd  %xmm8,0x8(%rsp)
    7853:	f3 44 0f 11 4c 24 18 	movss  %xmm9,0x18(%rsp)
    785a:	48 8d 3d 20 48 00 00 	lea    0x4820(%rip),%rdi        # c081 <_IO_stdin_used+0x81>
    7861:	f2 0f 11 4c 24 40    	movsd  %xmm1,0x40(%rsp)
    7867:	e8 84 ac ff ff       	callq  24f0 <puts@plt>
  pthread_barrier_wait(barrier);
    786c:	48 89 ef             	mov    %rbp,%rdi
    786f:	e8 dc 38 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    7874:	48 8d 3d 20 48 00 00 	lea    0x4820(%rip),%rdi        # c09b <_IO_stdin_used+0x9b>
    787b:	e8 70 ac ff ff       	callq  24f0 <puts@plt>
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid, barrier);
    7880:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
    7885:	66 0f ef c9          	pxor   %xmm1,%xmm1
    7889:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
  loz=0.0; z = (hiz+loz)/2.0;
    788e:	f2 44 0f 10 6c 24 28 	movsd  0x28(%rsp),%xmm13
    7895:	f2 44 0f 10 44 24 40 	movsd  0x40(%rsp),%xmm8
    789c:	f2 4d 0f 2a e7       	cvtsi2sd %r15,%xmm12
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid, barrier);
    78a1:	4f 8d 14 7f          	lea    (%r15,%r15,2),%r10
    78a5:	f2 49 0f 2a ca       	cvtsi2sd %r10,%xmm1
  loz=0.0; z = (hiz+loz)/2.0;
    78aa:	f2 44 0f 11 6c 24 38 	movsd  %xmm13,0x38(%rsp)
    78b1:	f2 44 0f 11 64 24 20 	movsd  %xmm12,0x20(%rsp)
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid, barrier);
    78b8:	f2 0f 11 4c 24 30    	movsd  %xmm1,0x30(%rsp)
    78be:	e9 48 01 00 00       	jmpq   7a0b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xb5b>
    78c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
    78c8:	66 0f ef f6          	pxor   %xmm6,%xmm6
    78cc:	f2 49 0f 2a f5       	cvtsi2sd %r13,%xmm6
    78d1:	f2 0f 59 35 07 4d 00 	mulsd  0x4d07(%rip),%xmm6        # c5e0 <_ZTS10FileStream+0x38>
    78d8:	00 
    78d9:	66 44 0f 2f f6       	comisd %xmm6,%xmm14
    78de:	0f 82 b4 01 00 00    	jb     7a98 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xbe8>
		 z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.001, pid, barrier);
    78e4:	f2 0f 10 44 24 20    	movsd  0x20(%rsp),%xmm0
    78ea:	f2 44 0f 11 44 24 28 	movsd  %xmm8,0x28(%rsp)
    78f1:	e8 8a aa ff ff       	callq  2380 <log@plt>
      cost = pFL(points, feasible, numfeasible,
    78f6:	48 83 ec 08          	sub    $0x8,%rsp
    78fa:	45 89 e1             	mov    %r12d,%r9d
    78fd:	48 89 df             	mov    %rbx,%rdi
		 z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.001, pid, barrier);
    7900:	f2 0f 59 44 24 38    	mulsd  0x38(%rsp),%xmm0
      cost = pFL(points, feasible, numfeasible,
    7906:	55                   	push   %rbp
    7907:	48 8d 0d 4a 77 00 00 	lea    0x774a(%rip),%rcx        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    790e:	f2 0f 10 4c 24 38    	movsd  0x38(%rsp),%xmm1
    7914:	8b 15 2e 77 00 00    	mov    0x772e(%rip),%edx        # f048 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE11numfeasible>
    791a:	f3 0f 10 15 9e 4c 00 	movss  0x4c9e(%rip),%xmm2        # c5c0 <_ZTS10FileStream+0x18>
    7921:	00 
    7922:	48 8b 35 27 77 00 00 	mov    0x7727(%rip),%rsi        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
    7929:	f2 4c 0f 2c c0       	cvttsd2si %xmm0,%r8
    792e:	f3 0f 10 44 24 28    	movss  0x28(%rsp),%xmm0
    7934:	e8 47 e8 ff ff       	callq  6180 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t>
    7939:	4c 8b 1d 18 77 00 00 	mov    0x7718(%rip),%r11        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7940:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    7945:	5a                   	pop    %rdx
    7946:	59                   	pop    %rcx
    7947:	f3 44 0f 5a c0       	cvtss2sd %xmm0,%xmm8
    if (k > kmax) {
    794c:	4d 39 df             	cmp    %r11,%r15
    794f:	0f 8d 6b 01 00 00    	jge    7ac0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xc10>
      loz = z; z = (hiz+loz)/2.0;
    7955:	f2 0f 10 6c 24 08    	movsd  0x8(%rsp),%xmm5
    795b:	f2 0f 10 64 24 10    	movsd  0x10(%rsp),%xmm4
      cost += (z-loz)*k;
    7961:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
      loz = z; z = (hiz+loz)/2.0;
    7966:	f2 0f 10 15 62 4c 00 	movsd  0x4c62(%rip),%xmm2        # c5d0 <_ZTS10FileStream+0x28>
    796d:	00 
      cost += (z-loz)*k;
    796e:	f2 4d 0f 2a cb       	cvtsi2sd %r11,%xmm9
      loz = z; z = (hiz+loz)/2.0;
    7973:	f2 0f 58 e5          	addsd  %xmm5,%xmm4
    7977:	f2 0f 59 e2          	mulsd  %xmm2,%xmm4
      cost += (z-loz)*k;
    797b:	66 44 0f 28 d4       	movapd %xmm4,%xmm10
    7980:	f2 44 0f 5c d5       	subsd  %xmm5,%xmm10
    7985:	f2 45 0f 59 d1       	mulsd  %xmm9,%xmm10
    798a:	f2 45 0f 58 c2       	addsd  %xmm10,%xmm8
    if (k < kmin) {
    798f:	4d 39 dd             	cmp    %r11,%r13
    7992:	0f 8f af 03 00 00    	jg     7d47 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xe97>
    if (((k <= kmax)&&(k >= kmin))||((loz >= (0.999)*hiz)) )
    7998:	f2 0f 10 4c 24 10    	movsd  0x10(%rsp),%xmm1
    799e:	f2 0f 59 0d 42 4c 00 	mulsd  0x4c42(%rip),%xmm1        # c5e8 <_ZTS10FileStream+0x40>
    79a5:	00 
    79a6:	f2 0f 11 64 24 18    	movsd  %xmm4,0x18(%rsp)
    79ac:	f2 44 0f 10 64 24 08 	movsd  0x8(%rsp),%xmm12
    79b3:	66 44 0f 2f e1       	comisd %xmm1,%xmm12
    79b8:	0f 83 5a 01 00 00    	jae    7b18 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xc68>
    79be:	48 8d 3d f0 46 00 00 	lea    0x46f0(%rip),%rdi        # c0b5 <_IO_stdin_used+0xb5>
    79c5:	f2 44 0f 11 44 24 28 	movsd  %xmm8,0x28(%rsp)
    79cc:	e8 1f ab ff ff       	callq  24f0 <puts@plt>
    pthread_barrier_wait(barrier);
    79d1:	48 89 ef             	mov    %rbp,%rdi
    79d4:	e8 77 37 00 00       	callq  b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>
    lastcost = cost;
    79d9:	f2 0f 10 74 24 18    	movsd  0x18(%rsp),%xmm6
    79df:	f2 44 0f 10 6c 24 08 	movsd  0x8(%rsp),%xmm13
    79e6:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    79eb:	f2 44 0f 10 44 24 28 	movsd  0x28(%rsp),%xmm8
    79f2:	f2 44 0f 5a fe       	cvtsd2ss %xmm6,%xmm15
    79f7:	f2 44 0f 11 6c 24 38 	movsd  %xmm13,0x38(%rsp)
    79fe:	f2 0f 11 74 24 08    	movsd  %xmm6,0x8(%rsp)
    7a04:	f3 44 0f 11 7c 24 18 	movss  %xmm15,0x18(%rsp)
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid, barrier);
    7a0b:	f2 0f 10 44 24 20    	movsd  0x20(%rsp),%xmm0
    7a11:	f2 44 0f 11 44 24 28 	movsd  %xmm8,0x28(%rsp)
    7a18:	e8 63 a9 ff ff       	callq  2380 <log@plt>
    cost = pFL(points, feasible, numfeasible,
    7a1d:	48 83 ec 08          	sub    $0x8,%rsp
    7a21:	48 89 df             	mov    %rbx,%rdi
    7a24:	45 89 e1             	mov    %r12d,%r9d
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid, barrier);
    7a27:	f2 0f 59 44 24 38    	mulsd  0x38(%rsp),%xmm0
    cost = pFL(points, feasible, numfeasible,
    7a2d:	55                   	push   %rbp
    7a2e:	48 8d 0d 23 76 00 00 	lea    0x7623(%rip),%rcx        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7a35:	f2 0f 10 4c 24 38    	movsd  0x38(%rsp),%xmm1
    7a3b:	48 8b 35 0e 76 00 00 	mov    0x760e(%rip),%rsi        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
    7a42:	f3 0f 10 15 72 4b 00 	movss  0x4b72(%rip),%xmm2        # c5bc <_ZTS10FileStream+0x14>
    7a49:	00 
    7a4a:	8b 15 f8 75 00 00    	mov    0x75f8(%rip),%edx        # f048 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE11numfeasible>
    7a50:	f2 4c 0f 2c c0       	cvttsd2si %xmm0,%r8
    7a55:	f3 0f 10 44 24 28    	movss  0x28(%rsp),%xmm0
    7a5b:	e8 20 e7 ff ff       	callq  6180 <_Z3pFLP6PointsPiifPldlfiP16parsec_barrier_t>
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
    7a60:	5e                   	pop    %rsi
    7a61:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    7a66:	5f                   	pop    %rdi
    7a67:	4c 8b 1d ea 75 00 00 	mov    0x75ea(%rip),%r11        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    cost = pFL(points, feasible, numfeasible,
    7a6e:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
    7a73:	f2 44 0f 10 3d 5c 4b 	movsd  0x4b5c(%rip),%xmm15        # c5d8 <_ZTS10FileStream+0x30>
    7a7a:	00 00 
    7a7c:	f2 44 0f 59 7c 24 20 	mulsd  0x20(%rsp),%xmm15
    cost = pFL(points, feasible, numfeasible,
    7a83:	f3 44 0f 5a c0       	cvtss2sd %xmm0,%xmm8
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
    7a88:	f2 4d 0f 2a f3       	cvtsi2sd %r11,%xmm14
    7a8d:	66 45 0f 2f fe       	comisd %xmm14,%xmm15
    7a92:	0f 83 30 fe ff ff    	jae    78c8 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xa18>
	((k <= kmax+2)&&(k >= kmin-2))) {
    7a98:	49 8d 57 02          	lea    0x2(%r15),%rdx
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
    7a9c:	49 39 d3             	cmp    %rdx,%r11
    7a9f:	0f 8f a7 fe ff ff    	jg     794c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xa9c>
	((k <= kmax+2)&&(k >= kmin-2))) {
    7aa5:	49 8d 75 fe          	lea    -0x2(%r13),%rsi
    7aa9:	49 39 f3             	cmp    %rsi,%r11
    7aac:	0f 8d 32 fe ff ff    	jge    78e4 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xa34>
    if (k > kmax) {
    7ab2:	4d 39 df             	cmp    %r11,%r15
    7ab5:	0f 8c 9a fe ff ff    	jl     7955 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xaa5>
    7abb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    if (k < kmin) {
    7ac0:	4d 39 dd             	cmp    %r11,%r13
    7ac3:	7e 53                	jle    7b18 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xc68>
    7ac5:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    7aca:	f2 0f 10 7c 24 08    	movsd  0x8(%rsp),%xmm7
    7ad0:	f2 0f 10 44 24 38    	movsd  0x38(%rsp),%xmm0
    7ad6:	f2 4d 0f 2a cb       	cvtsi2sd %r11,%xmm9
    7adb:	f2 0f 10 15 ed 4a 00 	movsd  0x4aed(%rip),%xmm2        # c5d0 <_ZTS10FileStream+0x28>
    7ae2:	00 
    7ae3:	f2 0f 11 7c 24 10    	movsd  %xmm7,0x10(%rsp)
    7ae9:	66 0f 28 e0          	movapd %xmm0,%xmm4
    7aed:	66 0f 28 df          	movapd %xmm7,%xmm3
    7af1:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
      hiz = z; z = (hiz+loz)/2.0;
    7af7:	f2 0f 58 e3          	addsd  %xmm3,%xmm4
    7afb:	f2 0f 59 e2          	mulsd  %xmm2,%xmm4
      cost += (z-hiz)*k;
    7aff:	66 44 0f 28 dc       	movapd %xmm4,%xmm11
    7b04:	f2 44 0f 5c db       	subsd  %xmm3,%xmm11
    7b09:	f2 45 0f 59 d9       	mulsd  %xmm9,%xmm11
    7b0e:	f2 45 0f 58 c3       	addsd  %xmm11,%xmm8
    if (((k <= kmax)&&(k >= kmin))||((loz >= (0.999)*hiz)) )
    7b13:	e9 80 fe ff ff       	jmpq   7998 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xae8>
    7b18:	48 8d 3d b0 45 00 00 	lea    0x45b0(%rip),%rdi        # c0cf <_IO_stdin_used+0xcf>
    7b1f:	f2 44 0f 11 44 24 08 	movsd  %xmm8,0x8(%rsp)
    7b26:	e8 c5 a9 ff ff       	callq  24f0 <puts@plt>
  if( pid==0 ) {
    7b2b:	45 85 e4             	test   %r12d,%r12d
    7b2e:	f2 44 0f 10 4c 24 08 	movsd  0x8(%rsp),%xmm9
    7b35:	0f 84 af 02 00 00    	je     7dea <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xf3a>
}
    7b3b:	48 83 c4 68          	add    $0x68,%rsp
  return cost;
    7b3f:	66 0f ef c0          	pxor   %xmm0,%xmm0
}
    7b43:	5b                   	pop    %rbx
  return cost;
    7b44:	f2 41 0f 5a c1       	cvtsd2ss %xmm9,%xmm0
}
    7b49:	5d                   	pop    %rbp
    7b4a:	41 5c                	pop    %r12
    7b4c:	41 5d                	pop    %r13
    7b4e:	41 5e                	pop    %r14
    7b50:	41 5f                	pop    %r15
    7b52:	c3                   	retq   
    for (long kk=k1;kk<k2;kk++) {
    7b53:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    7b58:	48 39 6c 24 18       	cmp    %rbp,0x18(%rsp)
    7b5d:	0f 8e a5 01 00 00    	jle    7d08 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xe58>
    7b63:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    7b68:	48 89 e9             	mov    %rbp,%rcx
    7b6b:	48 c1 e1 05          	shl    $0x5,%rcx
    7b6f:	48 03 4b 10          	add    0x10(%rbx),%rcx
    7b73:	49 29 e8             	sub    %rbp,%r8
    7b76:	41 83 e0 07          	and    $0x7,%r8d
    7b7a:	0f 84 c6 0e 00 00    	je     8a46 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b96>
    7b80:	49 83 f8 01          	cmp    $0x1,%r8
    7b84:	0f 84 b7 00 00 00    	je     7c41 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd91>
    7b8a:	49 83 f8 02          	cmp    $0x2,%r8
    7b8e:	0f 84 90 00 00 00    	je     7c24 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd74>
    7b94:	49 83 f8 03          	cmp    $0x3,%r8
    7b98:	74 6d                	je     7c07 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd57>
    7b9a:	49 83 f8 04          	cmp    $0x4,%r8
    7b9e:	74 4a                	je     7bea <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd3a>
    7ba0:	49 83 f8 05          	cmp    $0x5,%r8
    7ba4:	74 27                	je     7bcd <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd1d>
    7ba6:	49 83 f8 06          	cmp    $0x6,%r8
    7baa:	0f 85 76 0e 00 00    	jne    8a26 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b76>
      points->p[kk].assign = kk;
    7bb0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
      points->p[kk].cost = 0;
    7bb5:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7bbc:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7bc0:	4c 89 71 f0          	mov    %r14,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7bc4:	49 83 c6 01          	add    $0x1,%r14
    7bc8:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
      points->p[kk].assign = kk;
    7bcd:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
      points->p[kk].cost = 0;
    7bd2:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7bd9:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7bdd:	4c 89 49 f0          	mov    %r9,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7be1:	49 83 c1 01          	add    $0x1,%r9
    7be5:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
      points->p[kk].assign = kk;
    7bea:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
      points->p[kk].cost = 0;
    7bef:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7bf6:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7bfa:	48 89 41 f0          	mov    %rax,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7bfe:	48 83 c0 01          	add    $0x1,%rax
    7c02:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
      points->p[kk].assign = kk;
    7c07:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
      points->p[kk].cost = 0;
    7c0c:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7c13:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7c17:	4c 89 79 f0          	mov    %r15,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7c1b:	49 83 c7 01          	add    $0x1,%r15
    7c1f:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
      points->p[kk].assign = kk;
    7c24:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
      points->p[kk].cost = 0;
    7c29:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7c30:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7c34:	4c 89 51 f0          	mov    %r10,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7c38:	49 83 c2 01          	add    $0x1,%r10
    7c3c:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
      points->p[kk].assign = kk;
    7c41:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
      points->p[kk].cost = 0;
    7c46:	c7 41 18 00 00 00 00 	movl   $0x0,0x18(%rcx)
    7c4d:	48 83 c1 20          	add    $0x20,%rcx
      points->p[kk].assign = kk;
    7c51:	48 89 51 f0          	mov    %rdx,-0x10(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7c55:	48 83 c2 01          	add    $0x1,%rdx
    7c59:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    7c5e:	48 39 54 24 18       	cmp    %rdx,0x18(%rsp)
    7c63:	0f 84 9f 00 00 00    	je     7d08 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xe58>
    7c69:	48 8d 72 01          	lea    0x1(%rdx),%rsi
    7c6d:	4c 8d 5a 02          	lea    0x2(%rdx),%r11
      points->p[kk].assign = kk;
    7c71:	48 89 51 10          	mov    %rdx,0x10(%rcx)
      points->p[kk].cost = 0;
    7c75:	48 81 c1 00 01 00 00 	add    $0x100,%rcx
    for (long kk=k1;kk<k2;kk++) {
    7c7c:	4c 8d 6a 03          	lea    0x3(%rdx),%r13
    7c80:	48 8d 5a 04          	lea    0x4(%rdx),%rbx
      points->p[kk].assign = kk;
    7c84:	48 89 b1 30 ff ff ff 	mov    %rsi,-0xd0(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7c8b:	48 8d 6a 05          	lea    0x5(%rdx),%rbp
    7c8f:	4c 8d 42 06          	lea    0x6(%rdx),%r8
      points->p[kk].cost = 0;
    7c93:	c7 81 18 ff ff ff 00 	movl   $0x0,-0xe8(%rcx)
    7c9a:	00 00 00 
    for (long kk=k1;kk<k2;kk++) {
    7c9d:	48 8d 7a 07          	lea    0x7(%rdx),%rdi
      points->p[kk].assign = kk;
    7ca1:	48 89 59 90          	mov    %rbx,-0x70(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7ca5:	48 83 c2 08          	add    $0x8,%rdx
      points->p[kk].cost = 0;
    7ca9:	c7 81 38 ff ff ff 00 	movl   $0x0,-0xc8(%rcx)
    7cb0:	00 00 00 
      points->p[kk].assign = kk;
    7cb3:	4c 89 99 50 ff ff ff 	mov    %r11,-0xb0(%rcx)
      points->p[kk].cost = 0;
    7cba:	c7 81 58 ff ff ff 00 	movl   $0x0,-0xa8(%rcx)
    7cc1:	00 00 00 
      points->p[kk].assign = kk;
    7cc4:	4c 89 a9 70 ff ff ff 	mov    %r13,-0x90(%rcx)
      points->p[kk].cost = 0;
    7ccb:	c7 81 78 ff ff ff 00 	movl   $0x0,-0x88(%rcx)
    7cd2:	00 00 00 
    7cd5:	c7 41 98 00 00 00 00 	movl   $0x0,-0x68(%rcx)
      points->p[kk].assign = kk;
    7cdc:	48 89 69 b0          	mov    %rbp,-0x50(%rcx)
      points->p[kk].cost = 0;
    7ce0:	c7 41 b8 00 00 00 00 	movl   $0x0,-0x48(%rcx)
      points->p[kk].assign = kk;
    7ce7:	4c 89 41 d0          	mov    %r8,-0x30(%rcx)
      points->p[kk].cost = 0;
    7ceb:	c7 41 d8 00 00 00 00 	movl   $0x0,-0x28(%rcx)
      points->p[kk].assign = kk;
    7cf2:	48 89 79 f0          	mov    %rdi,-0x10(%rcx)
      points->p[kk].cost = 0;
    7cf6:	c7 41 f8 00 00 00 00 	movl   $0x0,-0x8(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    7cfd:	48 39 54 24 18       	cmp    %rdx,0x18(%rsp)
    7d02:	0f 85 61 ff ff ff    	jne    7c69 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xdb9>
    if( pid== 0 ) {
    7d08:	45 85 e4             	test   %r12d,%r12d
    7d0b:	0f 84 e1 08 00 00    	je     85f2 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1742>
}
    7d11:	48 83 c4 68          	add    $0x68,%rsp
    return cost;
    7d15:	66 0f ef c0          	pxor   %xmm0,%xmm0
}
    7d19:	5b                   	pop    %rbx
    7d1a:	5d                   	pop    %rbp
    7d1b:	41 5c                	pop    %r12
    7d1d:	41 5d                	pop    %r13
    7d1f:	41 5e                	pop    %r14
    7d21:	41 5f                	pop    %r15
    7d23:	c3                   	retq   
  if( pid==0 ) hizs = (double*)calloc(nproc,sizeof(double));
    7d24:	4c 89 c7             	mov    %r8,%rdi
    7d27:	be 08 00 00 00       	mov    $0x8,%esi
    7d2c:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
    7d31:	e8 1a a6 ff ff       	callq  2350 <calloc@plt>
    7d36:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
    7d3b:	48 89 05 fe 72 00 00 	mov    %rax,0x72fe(%rip)        # f040 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE4hizs>
    7d42:	e9 a4 f1 ff ff       	jmpq   6eeb <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x3b>
      loz = z; z = (hiz+loz)/2.0;
    7d47:	f2 0f 11 64 24 10    	movsd  %xmm4,0x10(%rsp)
    7d4d:	66 0f 28 e5          	movapd %xmm5,%xmm4
    7d51:	f2 0f 10 5c 24 10    	movsd  0x10(%rsp),%xmm3
    7d57:	e9 9b fd ff ff       	jmpq   7af7 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xc47>
  for (i=0;i<points->num-1;i++) {
    7d5c:	49 83 f9 01          	cmp    $0x1,%r9
    7d60:	0f 8e 70 fa ff ff    	jle    77d6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x926>
    7d66:	45 31 f6             	xor    %r14d,%r14d
    7d69:	f2 0f 11 54 24 08    	movsd  %xmm2,0x8(%rsp)
    7d6f:	90                   	nop
    j=(lrand48()%(points->num - i)) + i;
    7d70:	e8 fb a5 ff ff       	callq  2370 <lrand48@plt>
    7d75:	48 8b 3b             	mov    (%rbx),%rdi
    temp = points->p[i];
    7d78:	4c 8b 5b 10          	mov    0x10(%rbx),%r11
    7d7c:	4c 89 f6             	mov    %r14,%rsi
    j=(lrand48()%(points->num - i)) + i;
    7d7f:	48 99                	cqto   
    temp = points->p[i];
    7d81:	48 c1 e6 05          	shl    $0x5,%rsi
    j=(lrand48()%(points->num - i)) + i;
    7d85:	49 89 fa             	mov    %rdi,%r10
    temp = points->p[i];
    7d88:	4c 01 de             	add    %r11,%rsi
  for (i=0;i<points->num-1;i++) {
    7d8b:	48 83 ef 01          	sub    $0x1,%rdi
    j=(lrand48()%(points->num - i)) + i;
    7d8f:	4d 29 f2             	sub    %r14,%r10
    temp = points->p[i];
    7d92:	f3 0f 10 16          	movss  (%rsi),%xmm2
    7d96:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
    j=(lrand48()%(points->num - i)) + i;
    7d9a:	49 f7 fa             	idiv   %r10
    temp = points->p[i];
    7d9d:	4c 8b 46 10          	mov    0x10(%rsi),%r8
    7da1:	f3 44 0f 10 5e 18    	movss  0x18(%rsi),%xmm11
    j=(lrand48()%(points->num - i)) + i;
    7da7:	4c 01 f2             	add    %r14,%rdx
  for (i=0;i<points->num-1;i++) {
    7daa:	49 83 c6 01          	add    $0x1,%r14
    points->p[i] = points->p[j];
    7dae:	48 c1 e2 05          	shl    $0x5,%rdx
    7db2:	49 8d 04 13          	lea    (%r11,%rdx,1),%rax
    7db6:	f3 44 0f 6f 20       	movdqu (%rax),%xmm12
    7dbb:	44 0f 11 26          	movups %xmm12,(%rsi)
    7dbf:	f3 0f 6f 40 10       	movdqu 0x10(%rax),%xmm0
    7dc4:	0f 11 46 10          	movups %xmm0,0x10(%rsi)
    points->p[j] = temp;
    7dc8:	f3 0f 11 10          	movss  %xmm2,(%rax)
    7dcc:	48 89 48 08          	mov    %rcx,0x8(%rax)
    7dd0:	4c 89 40 10          	mov    %r8,0x10(%rax)
    7dd4:	f3 44 0f 11 58 18    	movss  %xmm11,0x18(%rax)
  for (i=0;i<points->num-1;i++) {
    7dda:	4c 39 f7             	cmp    %r14,%rdi
    7ddd:	7f 91                	jg     7d70 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xec0>
    7ddf:	f2 0f 10 54 24 08    	movsd  0x8(%rsp),%xmm2
    7de5:	e9 ec f9 ff ff       	jmpq   77d6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x926>
    free(feasible); 
    7dea:	48 8b 3d 5f 72 00 00 	mov    0x725f(%rip),%rdi        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
    7df1:	e8 3a a6 ff ff       	callq  2430 <free@plt>
    free(hizs);
    7df6:	48 8b 3d 43 72 00 00 	mov    0x7243(%rip),%rdi        # f040 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE4hizs>
    7dfd:	e8 2e a6 ff ff       	callq  2430 <free@plt>
    *kfinal = k;
    7e02:	4c 8b 2d 4f 72 00 00 	mov    0x724f(%rip),%r13        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7e09:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
    7e0e:	f2 44 0f 10 4c 24 08 	movsd  0x8(%rsp),%xmm9
    7e15:	4c 89 2b             	mov    %r13,(%rbx)
    7e18:	e9 1e fd ff ff       	jmpq   7b3b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xc8b>
    cost = pspeedy(points, z, &k, pid, barrier);
    7e1d:	48 89 e9             	mov    %rbp,%rcx
    7e20:	44 89 e2             	mov    %r12d,%edx
    7e23:	48 8d 35 2e 72 00 00 	lea    0x722e(%rip),%rsi        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7e2a:	48 89 df             	mov    %rbx,%rdi
    7e2d:	41 0f 28 c6          	movaps %xmm14,%xmm0
    7e31:	f2 44 0f 11 7c 24 08 	movsd  %xmm15,0x8(%rsp)
    7e38:	e8 a3 b1 ff ff       	callq  2fe0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t>
  while (k < kmin) {
    7e3d:	4c 3b 2d 14 72 00 00 	cmp    0x7214(%rip),%r13        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7e44:	f2 44 0f 10 7c 24 08 	movsd  0x8(%rsp),%xmm15
    7e4b:	0f 8e d2 f9 ff ff    	jle    7823 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x973>
    cost = pspeedy(points, z, &k, pid, barrier);
    7e51:	4c 8d 35 00 72 00 00 	lea    0x7200(%rip),%r14        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7e58:	f2 0f 10 7c 24 10    	movsd  0x10(%rsp),%xmm7
    7e5e:	eb 3e                	jmp    7e9e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xfee>
    7e60:	66 0f ef c0          	pxor   %xmm0,%xmm0
    7e64:	48 89 e9             	mov    %rbp,%rcx
    7e67:	44 89 e2             	mov    %r12d,%edx
    7e6a:	4c 89 f6             	mov    %r14,%rsi
    7e6d:	48 89 df             	mov    %rbx,%rdi
    7e70:	f2 0f 5a 44 24 08    	cvtsd2ss 0x8(%rsp),%xmm0
    7e76:	f3 0f 11 44 24 18    	movss  %xmm0,0x18(%rsp)
    7e7c:	e8 5f b1 ff ff       	callq  2fe0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t>
  while (k < kmin) {
    7e81:	4c 3b 2d d0 71 00 00 	cmp    0x71d0(%rip),%r13        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7e88:	0f 8e 22 07 00 00    	jle    85b0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1700>
    if (i >= SP) {hiz=z; z=(hiz+loz)/2.0; i=0;}
    7e8e:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    7e94:	f2 0f 11 44 24 10    	movsd  %xmm0,0x10(%rsp)
    7e9a:	66 0f 28 f8          	movapd %xmm0,%xmm7
    7e9e:	f2 0f 58 7c 24 28    	addsd  0x28(%rsp),%xmm7
    7ea4:	f2 0f 59 3d 24 47 00 	mulsd  0x4724(%rip),%xmm7        # c5d0 <_ZTS10FileStream+0x28>
    7eab:	00 
    7eac:	f2 0f 11 7c 24 08    	movsd  %xmm7,0x8(%rsp)
    if( pid == 0 ) shuffle(points);
    7eb2:	45 85 e4             	test   %r12d,%r12d
    7eb5:	75 a9                	jne    7e60 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xfb0>
  for (i=0;i<points->num-1;i++) {
    7eb7:	48 83 3b 01          	cmpq   $0x1,(%rbx)
    7ebb:	7e 72                	jle    7f2f <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x107f>
    7ebd:	45 31 ff             	xor    %r15d,%r15d
    j=(lrand48()%(points->num - i)) + i;
    7ec0:	e8 ab a4 ff ff       	callq  2370 <lrand48@plt>
    7ec5:	48 8b 3b             	mov    (%rbx),%rdi
    temp = points->p[i];
    7ec8:	4c 8b 5b 10          	mov    0x10(%rbx),%r11
    7ecc:	4c 89 fe             	mov    %r15,%rsi
    j=(lrand48()%(points->num - i)) + i;
    7ecf:	48 99                	cqto   
    temp = points->p[i];
    7ed1:	48 c1 e6 05          	shl    $0x5,%rsi
    j=(lrand48()%(points->num - i)) + i;
    7ed5:	49 89 f8             	mov    %rdi,%r8
    temp = points->p[i];
    7ed8:	4c 01 de             	add    %r11,%rsi
  for (i=0;i<points->num-1;i++) {
    7edb:	48 83 ef 01          	sub    $0x1,%rdi
    j=(lrand48()%(points->num - i)) + i;
    7edf:	4d 29 f8             	sub    %r15,%r8
    temp = points->p[i];
    7ee2:	f3 0f 10 2e          	movss  (%rsi),%xmm5
    7ee6:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
    j=(lrand48()%(points->num - i)) + i;
    7eea:	49 f7 f8             	idiv   %r8
    temp = points->p[i];
    7eed:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
    7ef1:	f3 0f 10 5e 18       	movss  0x18(%rsi),%xmm3
    j=(lrand48()%(points->num - i)) + i;
    7ef6:	4c 01 fa             	add    %r15,%rdx
  for (i=0;i<points->num-1;i++) {
    7ef9:	49 83 c7 01          	add    $0x1,%r15
    points->p[i] = points->p[j];
    7efd:	48 c1 e2 05          	shl    $0x5,%rdx
    7f01:	4d 8d 14 13          	lea    (%r11,%rdx,1),%r10
    7f05:	f3 41 0f 6f 32       	movdqu (%r10),%xmm6
    7f0a:	0f 11 36             	movups %xmm6,(%rsi)
    7f0d:	f3 41 0f 6f 62 10    	movdqu 0x10(%r10),%xmm4
    7f13:	0f 11 66 10          	movups %xmm4,0x10(%rsi)
    points->p[j] = temp;
    7f17:	f3 41 0f 11 2a       	movss  %xmm5,(%r10)
    7f1c:	4d 89 4a 08          	mov    %r9,0x8(%r10)
    7f20:	49 89 4a 10          	mov    %rcx,0x10(%r10)
    7f24:	f3 41 0f 11 5a 18    	movss  %xmm3,0x18(%r10)
  for (i=0;i<points->num-1;i++) {
    7f2a:	4c 39 ff             	cmp    %r15,%rdi
    7f2d:	7f 91                	jg     7ec0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1010>
    cost = pspeedy(points, z, &k, pid, barrier);
    7f2f:	31 d2                	xor    %edx,%edx
    7f31:	66 0f ef c0          	pxor   %xmm0,%xmm0
    7f35:	48 89 e9             	mov    %rbp,%rcx
    7f38:	4c 89 f6             	mov    %r14,%rsi
    7f3b:	48 89 df             	mov    %rbx,%rdi
    7f3e:	f2 0f 5a 44 24 08    	cvtsd2ss 0x8(%rsp),%xmm0
    7f44:	f3 0f 11 44 24 18    	movss  %xmm0,0x18(%rsp)
    7f4a:	e8 91 b0 ff ff       	callq  2fe0 <_Z7pspeedyP6PointsfPliP16parsec_barrier_t>
  while (k < kmin) {
    7f4f:	4c 3b 2d 02 71 00 00 	cmp    0x7102(%rip),%r13        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    7f56:	0f 8f 32 ff ff ff    	jg     7e8e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xfde>
    cost = pspeedy(points, z, &k, pid, barrier);
    7f5c:	66 0f ef c9          	pxor   %xmm1,%xmm1
    7f60:	f3 0f 5a c8          	cvtss2sd %xmm0,%xmm1
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    7f64:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    7f69:	43 8d 44 6d 00       	lea    0x0(%r13,%r13,2),%eax
    7f6e:	66 45 0f ef db       	pxor   %xmm11,%xmm11
  int numfeasible = points->num;
    7f73:	4c 8b 3b             	mov    (%rbx),%r15
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    7f76:	f2 45 0f 2a e5       	cvtsi2sd %r13d,%xmm12
    7f7b:	f2 0f 11 4c 24 48    	movsd  %xmm1,0x48(%rsp)
    7f81:	f2 44 0f 2a d8       	cvtsi2sd %eax,%xmm11
  int numfeasible = points->num;
    7f86:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    7f8b:	66 41 0f 28 c4       	movapd %xmm12,%xmm0
    7f90:	f2 44 0f 11 64 24 40 	movsd  %xmm12,0x40(%rsp)
    7f97:	f2 44 0f 11 5c 24 30 	movsd  %xmm11,0x30(%rsp)
    7f9e:	e8 dd a3 ff ff       	callq  2380 <log@plt>
    7fa3:	f2 0f 59 44 24 30    	mulsd  0x30(%rsp),%xmm0
    7fa9:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    7fae:	f2 44 0f 10 74 24 40 	movsd  0x40(%rsp),%xmm14
    7fb5:	f2 45 0f 2a ef       	cvtsi2sd %r15d,%xmm13
    7fba:	f2 44 0f 10 7c 24 48 	movsd  0x48(%rsp),%xmm15
    7fc1:	66 44 0f 2f e8       	comisd %xmm0,%xmm13
    7fc6:	0f 87 27 0a 00 00    	ja     89f3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b43>
  *feasible = (int *)malloc(numfeasible*sizeof(int));
    7fcc:	4c 63 74 24 38       	movslq 0x38(%rsp),%r14
    7fd1:	f2 44 0f 11 7c 24 30 	movsd  %xmm15,0x30(%rsp)
    7fd8:	4a 8d 3c b5 00 00 00 	lea    0x0(,%r14,4),%rdi
    7fdf:	00 
    7fe0:	e8 9b a4 ff ff       	callq  2480 <malloc@plt>
  if (numfeasible == points->num) {
    7fe5:	48 8b 33             	mov    (%rbx),%rsi
    7fe8:	f2 0f 10 4c 24 30    	movsd  0x30(%rsp),%xmm1
  *feasible = (int *)malloc(numfeasible*sizeof(int));
    7fee:	48 89 05 5b 70 00 00 	mov    %rax,0x705b(%rip)        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
  if (numfeasible == points->num) {
    7ff5:	49 39 f6             	cmp    %rsi,%r14
    7ff8:	0f 84 20 06 00 00    	je     861e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x176e>
  accumweight= (float*)malloc(sizeof(float)*points->num);
    7ffe:	4c 8d 34 b5 00 00 00 	lea    0x0(,%rsi,4),%r14
    8005:	00 
    8006:	f2 0f 11 4c 24 40    	movsd  %xmm1,0x40(%rsp)
    800c:	4c 89 f7             	mov    %r14,%rdi
    800f:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
    8014:	e8 67 a4 ff ff       	callq  2480 <malloc@plt>
  accumweight[0] = points->p[0].weight;
    8019:	4c 8b 5b 10          	mov    0x10(%rbx),%r11
  for( int i = 1; i < points->num; i++ ) {
    801d:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  accumweight= (float*)malloc(sizeof(float)*points->num);
    8022:	49 89 c7             	mov    %rax,%r15
  for( int i = 1; i < points->num; i++ ) {
    8025:	f2 0f 10 4c 24 40    	movsd  0x40(%rsp),%xmm1
  accumweight[0] = points->p[0].weight;
    802b:	f3 41 0f 10 2b       	movss  (%r11),%xmm5
  for( int i = 1; i < points->num; i++ ) {
    8030:	48 83 fe 01          	cmp    $0x1,%rsi
  accumweight[0] = points->p[0].weight;
    8034:	f3 0f 11 28          	movss  %xmm5,(%rax)
  for( int i = 1; i < points->num; i++ ) {
    8038:	0f 8e 26 03 00 00    	jle    8364 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x14b4>
    803e:	48 83 fe 11          	cmp    $0x11,%rsi
    8042:	0f 8e 2f 0a 00 00    	jle    8a77 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1bc7>
    8048:	4c 8d 4e ee          	lea    -0x12(%rsi),%r9
    804c:	48 8d 48 04          	lea    0x4(%rax),%rcx
    8050:	ba 01 00 00 00       	mov    $0x1,%edx
    8055:	49 c1 e9 04          	shr    $0x4,%r9
    8059:	4d 8d 83 80 02 00 00 	lea    0x280(%r11),%r8
    8060:	41 c1 e1 04          	shl    $0x4,%r9d
    8064:	41 83 c1 11          	add    $0x11,%r9d
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8068:	41 0f 18 48 c0       	prefetcht0 -0x40(%r8)
    806d:	41 0f 18 08          	prefetcht0 (%r8)
    8071:	83 c2 10             	add    $0x10,%edx
    8074:	f3 41 0f 58 a8 a0 fd 	addss  -0x260(%r8),%xmm5
    807b:	ff ff 
    807d:	41 0f 18 48 40       	prefetcht0 0x40(%r8)
    8082:	41 0f 18 88 80 00 00 	prefetcht0 0x80(%r8)
    8089:	00 
    808a:	41 0f 18 88 c0 00 00 	prefetcht0 0xc0(%r8)
    8091:	00 
    8092:	41 0f 18 88 00 01 00 	prefetcht0 0x100(%r8)
    8099:	00 
    809a:	41 0f 18 88 40 01 00 	prefetcht0 0x140(%r8)
    80a1:	00 
    80a2:	41 0f 18 88 80 01 00 	prefetcht0 0x180(%r8)
    80a9:	00 
    80aa:	48 83 c1 40          	add    $0x40,%rcx
    80ae:	49 81 c0 00 02 00 00 	add    $0x200,%r8
    80b5:	f3 0f 11 69 c0       	movss  %xmm5,-0x40(%rcx)
    80ba:	f3 41 0f 58 a8 c0 fb 	addss  -0x440(%r8),%xmm5
    80c1:	ff ff 
    80c3:	f3 0f 11 69 c4       	movss  %xmm5,-0x3c(%rcx)
    80c8:	f3 41 0f 58 a8 e0 fb 	addss  -0x420(%r8),%xmm5
    80cf:	ff ff 
    80d1:	f3 0f 11 69 c8       	movss  %xmm5,-0x38(%rcx)
    80d6:	f3 41 0f 58 a8 00 fc 	addss  -0x400(%r8),%xmm5
    80dd:	ff ff 
    80df:	f3 0f 11 69 cc       	movss  %xmm5,-0x34(%rcx)
    80e4:	f3 41 0f 58 a8 20 fc 	addss  -0x3e0(%r8),%xmm5
    80eb:	ff ff 
    80ed:	f3 0f 11 69 d0       	movss  %xmm5,-0x30(%rcx)
    80f2:	f3 41 0f 58 a8 40 fc 	addss  -0x3c0(%r8),%xmm5
    80f9:	ff ff 
    80fb:	f3 0f 11 69 d4       	movss  %xmm5,-0x2c(%rcx)
    8100:	f3 41 0f 58 a8 60 fc 	addss  -0x3a0(%r8),%xmm5
    8107:	ff ff 
    8109:	f3 0f 11 69 d8       	movss  %xmm5,-0x28(%rcx)
    810e:	f3 41 0f 58 a8 80 fc 	addss  -0x380(%r8),%xmm5
    8115:	ff ff 
    8117:	f3 0f 11 69 dc       	movss  %xmm5,-0x24(%rcx)
    811c:	f3 41 0f 58 a8 a0 fc 	addss  -0x360(%r8),%xmm5
    8123:	ff ff 
    8125:	f3 0f 11 69 e0       	movss  %xmm5,-0x20(%rcx)
    812a:	f3 41 0f 58 a8 c0 fc 	addss  -0x340(%r8),%xmm5
    8131:	ff ff 
    8133:	f3 0f 11 69 e4       	movss  %xmm5,-0x1c(%rcx)
    8138:	f3 41 0f 58 a8 e0 fc 	addss  -0x320(%r8),%xmm5
    813f:	ff ff 
    8141:	f3 0f 11 69 e8       	movss  %xmm5,-0x18(%rcx)
    8146:	f3 41 0f 58 a8 00 fd 	addss  -0x300(%r8),%xmm5
    814d:	ff ff 
    814f:	f3 0f 11 69 ec       	movss  %xmm5,-0x14(%rcx)
    8154:	f3 41 0f 58 a8 20 fd 	addss  -0x2e0(%r8),%xmm5
    815b:	ff ff 
    815d:	f3 0f 11 69 f0       	movss  %xmm5,-0x10(%rcx)
    8162:	f3 41 0f 58 a8 40 fd 	addss  -0x2c0(%r8),%xmm5
    8169:	ff ff 
    816b:	f3 0f 11 69 f4       	movss  %xmm5,-0xc(%rcx)
    8170:	f3 41 0f 58 a8 60 fd 	addss  -0x2a0(%r8),%xmm5
    8177:	ff ff 
    8179:	f3 0f 11 69 f8       	movss  %xmm5,-0x8(%rcx)
    817e:	f3 41 0f 58 a8 80 fd 	addss  -0x280(%r8),%xmm5
    8185:	ff ff 
    8187:	f3 0f 11 69 fc       	movss  %xmm5,-0x4(%rcx)
  for( int i = 1; i < points->num; i++ ) {
    818c:	44 39 ca             	cmp    %r9d,%edx
    818f:	0f 85 d3 fe ff ff    	jne    8068 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x11b8>
    8195:	4c 63 d2             	movslq %edx,%r10
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8198:	4c 89 d0             	mov    %r10,%rax
    819b:	4c 89 d7             	mov    %r10,%rdi
    819e:	4d 8d 4a 01          	lea    0x1(%r10),%r9
    81a2:	48 c1 e0 05          	shl    $0x5,%rax
    81a6:	48 f7 d7             	not    %rdi
    81a9:	f3 41 0f 58 2c 03    	addss  (%r11,%rax,1),%xmm5
    81af:	48 01 f7             	add    %rsi,%rdi
    81b2:	83 e7 07             	and    $0x7,%edi
    81b5:	f3 43 0f 11 2c 97    	movss  %xmm5,(%r15,%r10,4)
  for( int i = 1; i < points->num; i++ ) {
    81bb:	49 39 f1             	cmp    %rsi,%r9
    81be:	0f 8d a0 01 00 00    	jge    8364 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x14b4>
    81c4:	48 85 ff             	test   %rdi,%rdi
    81c7:	0f 84 d6 00 00 00    	je     82a3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x13f3>
    81cd:	48 83 ff 01          	cmp    $0x1,%rdi
    81d1:	0f 84 ac 00 00 00    	je     8283 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x13d3>
    81d7:	48 83 ff 02          	cmp    $0x2,%rdi
    81db:	0f 84 8b 00 00 00    	je     826c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x13bc>
    81e1:	48 83 ff 03          	cmp    $0x3,%rdi
    81e5:	74 6e                	je     8255 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x13a5>
    81e7:	48 83 ff 04          	cmp    $0x4,%rdi
    81eb:	74 51                	je     823e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x138e>
    81ed:	48 83 ff 05          	cmp    $0x5,%rdi
    81f1:	74 34                	je     8227 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1377>
    81f3:	48 83 ff 06          	cmp    $0x6,%rdi
    81f7:	74 17                	je     8210 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1360>
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    81f9:	4d 89 c8             	mov    %r9,%r8
    81fc:	49 c1 e0 05          	shl    $0x5,%r8
    8200:	f3 43 0f 58 2c 03    	addss  (%r11,%r8,1),%xmm5
    8206:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    820c:	4d 8d 4a 02          	lea    0x2(%r10),%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8210:	4c 89 c9             	mov    %r9,%rcx
    8213:	48 c1 e1 05          	shl    $0x5,%rcx
    8217:	f3 41 0f 58 2c 0b    	addss  (%r11,%rcx,1),%xmm5
    821d:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    8223:	49 83 c1 01          	add    $0x1,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8227:	4c 89 ca             	mov    %r9,%rdx
    822a:	48 c1 e2 05          	shl    $0x5,%rdx
    822e:	f3 41 0f 58 2c 13    	addss  (%r11,%rdx,1),%xmm5
    8234:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    823a:	49 83 c1 01          	add    $0x1,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    823e:	4d 89 ca             	mov    %r9,%r10
    8241:	49 c1 e2 05          	shl    $0x5,%r10
    8245:	f3 43 0f 58 2c 13    	addss  (%r11,%r10,1),%xmm5
    824b:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    8251:	49 83 c1 01          	add    $0x1,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8255:	4c 89 cf             	mov    %r9,%rdi
    8258:	48 c1 e7 05          	shl    $0x5,%rdi
    825c:	f3 41 0f 58 2c 3b    	addss  (%r11,%rdi,1),%xmm5
    8262:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    8268:	49 83 c1 01          	add    $0x1,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    826c:	4c 89 c8             	mov    %r9,%rax
    826f:	48 c1 e0 05          	shl    $0x5,%rax
    8273:	f3 41 0f 58 2c 03    	addss  (%r11,%rax,1),%xmm5
    8279:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    827f:	49 83 c1 01          	add    $0x1,%r9
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    8283:	4d 89 c8             	mov    %r9,%r8
    8286:	49 c1 e0 05          	shl    $0x5,%r8
    828a:	f3 43 0f 58 2c 03    	addss  (%r11,%r8,1),%xmm5
    8290:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
  for( int i = 1; i < points->num; i++ ) {
    8296:	49 83 c1 01          	add    $0x1,%r9
    829a:	49 39 f1             	cmp    %rsi,%r9
    829d:	0f 8d c1 00 00 00    	jge    8364 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x14b4>
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
    82a3:	4c 89 c9             	mov    %r9,%rcx
    82a6:	49 8d 51 01          	lea    0x1(%r9),%rdx
    82aa:	49 8d 79 02          	lea    0x2(%r9),%rdi
    82ae:	48 c1 e1 05          	shl    $0x5,%rcx
    82b2:	49 89 d2             	mov    %rdx,%r10
    82b5:	4d 8d 41 03          	lea    0x3(%r9),%r8
    82b9:	48 89 f8             	mov    %rdi,%rax
    82bc:	f3 41 0f 58 2c 0b    	addss  (%r11,%rcx,1),%xmm5
    82c2:	49 c1 e2 05          	shl    $0x5,%r10
    82c6:	48 c1 e0 05          	shl    $0x5,%rax
    82ca:	4c 89 c1             	mov    %r8,%rcx
    82cd:	48 c1 e1 05          	shl    $0x5,%rcx
    82d1:	f3 43 0f 11 2c 8f    	movss  %xmm5,(%r15,%r9,4)
    82d7:	f3 43 0f 58 2c 13    	addss  (%r11,%r10,1),%xmm5
    82dd:	f3 41 0f 11 2c 97    	movss  %xmm5,(%r15,%rdx,4)
    82e3:	f3 41 0f 58 2c 03    	addss  (%r11,%rax,1),%xmm5
    82e9:	49 8d 51 04          	lea    0x4(%r9),%rdx
    82ed:	49 89 d2             	mov    %rdx,%r10
    82f0:	49 c1 e2 05          	shl    $0x5,%r10
    82f4:	f3 41 0f 11 2c bf    	movss  %xmm5,(%r15,%rdi,4)
    82fa:	f3 41 0f 58 2c 0b    	addss  (%r11,%rcx,1),%xmm5
    8300:	49 8d 79 05          	lea    0x5(%r9),%rdi
    8304:	48 89 f8             	mov    %rdi,%rax
    8307:	48 c1 e0 05          	shl    $0x5,%rax
    830b:	f3 43 0f 11 2c 87    	movss  %xmm5,(%r15,%r8,4)
    8311:	f3 43 0f 58 2c 13    	addss  (%r11,%r10,1),%xmm5
    8317:	4d 8d 41 06          	lea    0x6(%r9),%r8
    831b:	4c 89 c1             	mov    %r8,%rcx
    831e:	48 c1 e1 05          	shl    $0x5,%rcx
    8322:	f3 41 0f 11 2c 97    	movss  %xmm5,(%r15,%rdx,4)
    8328:	f3 41 0f 58 2c 03    	addss  (%r11,%rax,1),%xmm5
    832e:	49 8d 51 07          	lea    0x7(%r9),%rdx
    8332:	49 83 c1 08          	add    $0x8,%r9
    8336:	49 89 d2             	mov    %rdx,%r10
    8339:	49 c1 e2 05          	shl    $0x5,%r10
    833d:	f3 41 0f 11 2c bf    	movss  %xmm5,(%r15,%rdi,4)
    8343:	f3 41 0f 58 2c 0b    	addss  (%r11,%rcx,1),%xmm5
    8349:	f3 43 0f 11 2c 87    	movss  %xmm5,(%r15,%r8,4)
    834f:	f3 43 0f 58 2c 13    	addss  (%r11,%r10,1),%xmm5
    8355:	f3 41 0f 11 2c 97    	movss  %xmm5,(%r15,%rdx,4)
  for( int i = 1; i < points->num; i++ ) {
    835b:	49 39 f1             	cmp    %rsi,%r9
    835e:	0f 8c 3f ff ff ff    	jl     82a3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x13f3>
  totalweight=accumweight[points->num-1];
    8364:	f3 43 0f 10 5c 37 fc 	movss  -0x4(%r15,%r14,1),%xmm3
  for(int i=k1; i<k2; i++ ) {
    836b:	44 8b 5c 24 38       	mov    0x38(%rsp),%r11d
  totalweight=accumweight[points->num-1];
    8370:	f3 0f 11 5c 24 30    	movss  %xmm3,0x30(%rsp)
  for(int i=k1; i<k2; i++ ) {
    8376:	45 85 db             	test   %r11d,%r11d
    8379:	0f 8e eb 00 00 00    	jle    846a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15ba>
    837f:	8b 74 24 38          	mov    0x38(%rsp),%esi
    8383:	45 31 f6             	xor    %r14d,%r14d
    8386:	44 89 64 24 48       	mov    %r12d,0x48(%rsp)
    838b:	f2 0f 11 4c 24 40    	movsd  %xmm1,0x40(%rsp)
    8391:	4d 89 f4             	mov    %r14,%r12
    8394:	49 89 ee             	mov    %rbp,%r14
    8397:	48 89 dd             	mov    %rbx,%rbp
    839a:	83 ee 01             	sub    $0x1,%esi
    839d:	4c 8d 0c b5 04 00 00 	lea    0x4(,%rsi,4),%r9
    83a4:	00 
    83a5:	4c 89 cb             	mov    %r9,%rbx
    83a8:	eb 1c                	jmp    83c6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1516>
      (*feasible)[i]=0; 
    83aa:	48 8b 05 9f 6c 00 00 	mov    0x6c9f(%rip),%rax        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
    83b1:	42 c7 04 20 00 00 00 	movl   $0x0,(%rax,%r12,1)
    83b8:	00 
  for(int i=k1; i<k2; i++ ) {
    83b9:	49 83 c4 04          	add    $0x4,%r12
    83bd:	4c 39 e3             	cmp    %r12,%rbx
    83c0:	0f 84 93 00 00 00    	je     8459 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15a9>
    w = (lrand48()/(float)INT_MAX)*totalweight;
    83c6:	e8 a5 9f ff ff       	callq  2370 <lrand48@plt>
    83cb:	66 0f ef c0          	pxor   %xmm0,%xmm0
    if( accumweight[0] > w )  { 
    83cf:	f3 41 0f 10 37       	movss  (%r15),%xmm6
    r=points->num-1;
    83d4:	48 8b 75 00          	mov    0x0(%rbp),%rsi
    w = (lrand48()/(float)INT_MAX)*totalweight;
    83d8:	f3 48 0f 2a c0       	cvtsi2ss %rax,%xmm0
    83dd:	f3 0f 59 05 d3 41 00 	mulss  0x41d3(%rip),%xmm0        # c5b8 <_ZTS10FileStream+0x10>
    83e4:	00 
    83e5:	f3 0f 59 44 24 30    	mulss  0x30(%rsp),%xmm0
    if( accumweight[0] > w )  { 
    83eb:	0f 2f f0             	comiss %xmm0,%xmm6
    83ee:	77 ba                	ja     83aa <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x14fa>
    r=points->num-1;
    83f0:	44 8d 5e ff          	lea    -0x1(%rsi),%r11d
    l=0;
    83f4:	31 ff                	xor    %edi,%edi
    83f6:	44 8d 47 01          	lea    0x1(%rdi),%r8d
    while( l+1 < r ) {
    83fa:	45 39 c3             	cmp    %r8d,%r11d
    83fd:	0f 8e 1b 06 00 00    	jle    8a1e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b6e>
      k = (l+r)/2;
    8403:	42 8d 14 1f          	lea    (%rdi,%r11,1),%edx
    8407:	d1 fa                	sar    %edx
      if( accumweight[k] > w ) {
    8409:	48 63 c2             	movslq %edx,%rax
    840c:	f3 41 0f 10 24 87    	movss  (%r15,%rax,4),%xmm4
    8412:	0f 2f e0             	comiss %xmm0,%xmm4
    8415:	77 25                	ja     843c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x158c>
    8417:	e9 a1 01 00 00       	jmpq   85bd <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x170d>
    841c:	0f 1f 40 00          	nopl   0x0(%rax)
      k = (l+r)/2;
    8420:	44 8d 14 17          	lea    (%rdi,%rdx,1),%r10d
    8424:	41 d1 fa             	sar    %r10d
      if( accumweight[k] > w ) {
    8427:	49 63 ca             	movslq %r10d,%rcx
    842a:	f3 41 0f 10 3c 8f    	movss  (%r15,%rcx,4),%xmm7
    8430:	0f 2f f8             	comiss %xmm0,%xmm7
    8433:	0f 86 8a 01 00 00    	jbe    85c3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1713>
      k = (l+r)/2;
    8439:	44 89 d2             	mov    %r10d,%edx
    while( l+1 < r ) {
    843c:	44 39 c2             	cmp    %r8d,%edx
    843f:	7f df                	jg     8420 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1570>
    (*feasible)[i]=r;
    8441:	4c 8b 0d 08 6c 00 00 	mov    0x6c08(%rip),%r9        # f050 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE8feasible>
    8448:	43 89 14 21          	mov    %edx,(%r9,%r12,1)
  for(int i=k1; i<k2; i++ ) {
    844c:	49 83 c4 04          	add    $0x4,%r12
    8450:	4c 39 e3             	cmp    %r12,%rbx
    8453:	0f 85 6d ff ff ff    	jne    83c6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1516>
    8459:	f2 0f 10 4c 24 40    	movsd  0x40(%rsp),%xmm1
    845f:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
    8464:	48 89 eb             	mov    %rbp,%rbx
    8467:	4c 89 f5             	mov    %r14,%rbp
  free(accumweight); 
    846a:	4c 89 ff             	mov    %r15,%rdi
    846d:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
    8472:	f2 0f 11 4c 24 30    	movsd  %xmm1,0x30(%rsp)
    8478:	e8 b3 9f ff ff       	callq  2430 <free@plt>
    847d:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    8482:	f2 0f 10 4c 24 30    	movsd  0x30(%rsp),%xmm1
      numfeasible = selectfeasible_fast(points,&feasible,kmin,pid,barrier);
    8488:	8b 44 24 38          	mov    0x38(%rsp),%eax
    848c:	89 05 b6 6b 00 00    	mov    %eax,0x6bb6(%rip)        # f048 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE11numfeasible>
      for( int i = 0; i< points->num; i++ ) {
    8492:	48 85 f6             	test   %rsi,%rsi
    8495:	0f 8e bf f3 ff ff    	jle    785a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x9aa>
    849b:	4c 8b 53 10          	mov    0x10(%rbx),%r10
    849f:	48 c1 e6 05          	shl    $0x5,%rsi
	is_center[points->p[i].assign]= true;
    84a3:	4c 8b 3d 6e 6c 00 00 	mov    0x6c6e(%rip),%r15        # f118 <_ZL9is_center>
    84aa:	4a 8d 14 16          	lea    (%rsi,%r10,1),%rdx
    84ae:	48 8d 76 e0          	lea    -0x20(%rsi),%rsi
    84b2:	48 c1 ee 05          	shr    $0x5,%rsi
    84b6:	48 83 c6 01          	add    $0x1,%rsi
    84ba:	83 e6 07             	and    $0x7,%esi
    84bd:	0f 84 88 00 00 00    	je     854b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x169b>
    84c3:	48 83 fe 01          	cmp    $0x1,%rsi
    84c7:	74 6c                	je     8535 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1685>
    84c9:	48 83 fe 02          	cmp    $0x2,%rsi
    84cd:	74 59                	je     8528 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1678>
    84cf:	48 83 fe 03          	cmp    $0x3,%rsi
    84d3:	74 46                	je     851b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x166b>
    84d5:	48 83 fe 04          	cmp    $0x4,%rsi
    84d9:	74 33                	je     850e <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x165e>
    84db:	48 83 fe 05          	cmp    $0x5,%rsi
    84df:	74 20                	je     8501 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1651>
    84e1:	48 83 fe 06          	cmp    $0x6,%rsi
    84e5:	74 0d                	je     84f4 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1644>
    84e7:	49 8b 4a 10          	mov    0x10(%r10),%rcx
    84eb:	49 83 c2 20          	add    $0x20,%r10
    84ef:	41 c6 04 0f 01       	movb   $0x1,(%r15,%rcx,1)
    84f4:	4d 8b 5a 10          	mov    0x10(%r10),%r11
    84f8:	49 83 c2 20          	add    $0x20,%r10
    84fc:	43 c6 04 1f 01       	movb   $0x1,(%r15,%r11,1)
    8501:	4d 8b 42 10          	mov    0x10(%r10),%r8
    8505:	49 83 c2 20          	add    $0x20,%r10
    8509:	43 c6 04 07 01       	movb   $0x1,(%r15,%r8,1)
    850e:	4d 8b 72 10          	mov    0x10(%r10),%r14
    8512:	49 83 c2 20          	add    $0x20,%r10
    8516:	43 c6 04 37 01       	movb   $0x1,(%r15,%r14,1)
    851b:	49 8b 7a 10          	mov    0x10(%r10),%rdi
    851f:	49 83 c2 20          	add    $0x20,%r10
    8523:	41 c6 04 3f 01       	movb   $0x1,(%r15,%rdi,1)
    8528:	4d 8b 4a 10          	mov    0x10(%r10),%r9
    852c:	49 83 c2 20          	add    $0x20,%r10
    8530:	43 c6 04 0f 01       	movb   $0x1,(%r15,%r9,1)
    8535:	49 8b 42 10          	mov    0x10(%r10),%rax
    8539:	49 83 c2 20          	add    $0x20,%r10
    853d:	41 c6 04 07 01       	movb   $0x1,(%r15,%rax,1)
      for( int i = 0; i< points->num; i++ ) {
    8542:	4c 39 d2             	cmp    %r10,%rdx
    8545:	0f 84 0f f3 ff ff    	je     785a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x9aa>
	is_center[points->p[i].assign]= true;
    854b:	49 8b 72 10          	mov    0x10(%r10),%rsi
    854f:	49 8b 4a 30          	mov    0x30(%r10),%rcx
    8553:	49 81 c2 00 01 00 00 	add    $0x100,%r10
    855a:	4d 8b 9a 50 ff ff ff 	mov    -0xb0(%r10),%r11
    8561:	4d 8b 82 70 ff ff ff 	mov    -0x90(%r10),%r8
    8568:	4d 8b 72 90          	mov    -0x70(%r10),%r14
    856c:	49 8b 7a b0          	mov    -0x50(%r10),%rdi
    8570:	41 c6 04 37 01       	movb   $0x1,(%r15,%rsi,1)
    8575:	4d 8b 4a d0          	mov    -0x30(%r10),%r9
    8579:	49 8b 42 f0          	mov    -0x10(%r10),%rax
    857d:	41 c6 04 0f 01       	movb   $0x1,(%r15,%rcx,1)
    8582:	43 c6 04 1f 01       	movb   $0x1,(%r15,%r11,1)
    8587:	43 c6 04 07 01       	movb   $0x1,(%r15,%r8,1)
    858c:	43 c6 04 37 01       	movb   $0x1,(%r15,%r14,1)
    8591:	41 c6 04 3f 01       	movb   $0x1,(%r15,%rdi,1)
    8596:	43 c6 04 0f 01       	movb   $0x1,(%r15,%r9,1)
    859b:	41 c6 04 07 01       	movb   $0x1,(%r15,%rax,1)
      for( int i = 0; i< points->num; i++ ) {
    85a0:	4c 39 d2             	cmp    %r10,%rdx
    85a3:	75 a6                	jne    854b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x169b>
    85a5:	e9 b0 f2 ff ff       	jmpq   785a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x9aa>
    85aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    cost = pspeedy(points, z, &k, pid, barrier);
    85b0:	66 0f ef c9          	pxor   %xmm1,%xmm1
    85b4:	f3 0f 5a c8          	cvtss2sd %xmm0,%xmm1
    85b8:	e9 9d f2 ff ff       	jmpq   785a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x9aa>
      k = (l+r)/2;
    85bd:	41 89 d2             	mov    %edx,%r10d
      if( accumweight[k] > w ) {
    85c0:	44 89 da             	mov    %r11d,%edx
      k = (l+r)/2;
    85c3:	41 89 d3             	mov    %edx,%r11d
    85c6:	44 89 d7             	mov    %r10d,%edi
    85c9:	e9 28 fe ff ff       	jmpq   83f6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1546>
  for( int i = 0; i < nproc; i++ )   {
    85ce:	f2 0f 10 54 24 28    	movsd  0x28(%rsp),%xmm2
    85d4:	f2 0f 11 54 24 10    	movsd  %xmm2,0x10(%rsp)
    85da:	e9 e0 f1 ff ff       	jmpq   77bf <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x90f>
  double myhiz = 0;
    85df:	66 0f ef d2          	pxor   %xmm2,%xmm2
    85e3:	f2 0f 11 54 24 28    	movsd  %xmm2,0x28(%rsp)
    85e9:	66 0f ef d2          	pxor   %xmm2,%xmm2
    85ed:	e9 84 ed ff ff       	jmpq   7376 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x4c6>
      free(hizs); 
    85f2:	48 8b 3d 47 6a 00 00 	mov    0x6a47(%rip),%rdi        # f040 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE4hizs>
    85f9:	e8 32 9e ff ff       	callq  2430 <free@plt>
      *kfinal = k;
    85fe:	4c 8b 25 53 6a 00 00 	mov    0x6a53(%rip),%r12        # f058 <_ZZ8pkmedianP6PointsllPliP16parsec_barrier_tE1k>
    8605:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    860a:	4c 89 21             	mov    %r12,(%rcx)
    860d:	e9 ff f6 ff ff       	jmpq   7d11 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xe61>
  for( int i = 0; i < nproc; i++ )   {
    8612:	45 31 c0             	xor    %r8d,%r8d
  hiz = loz = 0.0;
    8615:	66 0f ef d2          	pxor   %xmm2,%xmm2
    8619:	e9 7c f1 ff ff       	jmpq   779a <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x8ea>
    for (int i=k1;i<k2;i++)
    861e:	44 8b 44 24 38       	mov    0x38(%rsp),%r8d
    8623:	45 85 c0             	test   %r8d,%r8d
    8626:	0f 8e 5c fe ff ff    	jle    8488 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15d8>
    862c:	45 8d 70 ff          	lea    -0x1(%r8),%r14d
    8630:	41 83 fe 02          	cmp    $0x2,%r14d
    8634:	0f 86 62 04 00 00    	jbe    8a9c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1bec>
    863a:	41 c1 e8 02          	shr    $0x2,%r8d
    863e:	41 83 f8 04          	cmp    $0x4,%r8d
    8642:	0f 86 39 04 00 00    	jbe    8a81 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1bd1>
    8648:	41 8d 78 fb          	lea    -0x5(%r8),%edi
    864c:	48 89 c2             	mov    %rax,%rdx
    864f:	31 c9                	xor    %ecx,%ecx
    8651:	66 0f 6f 05 b7 3f 00 	movdqa 0x3fb7(%rip),%xmm0        # c610 <_ZTS10FileStream+0x68>
    8658:	00 
    8659:	83 e7 fc             	and    $0xfffffffc,%edi
    865c:	66 0f 6f 15 bc 3f 00 	movdqa 0x3fbc(%rip),%xmm2        # c620 <_ZTS10FileStream+0x78>
    8663:	00 
    8664:	66 0f 6f 2d c4 3f 00 	movdqa 0x3fc4(%rip),%xmm5        # c630 <_ZTS10FileStream+0x88>
    866b:	00 
    866c:	41 89 fa             	mov    %edi,%r10d
    866f:	44 8d 4f 04          	lea    0x4(%rdi),%r9d
    8673:	66 0f 6f 25 c5 3f 00 	movdqa 0x3fc5(%rip),%xmm4        # c640 <_ZTS10FileStream+0x98>
    867a:	00 
    867b:	66 0f 6f 1d cd 3f 00 	movdqa 0x3fcd(%rip),%xmm3        # c650 <_ZTS10FileStream+0xa8>
    8682:	00 
    8683:	41 c1 ea 02          	shr    $0x2,%r10d
    8687:	41 83 e2 03          	and    $0x3,%r10d
    868b:	0f 84 9a 01 00 00    	je     882b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x197b>
      (*feasible)[i] = i;
    8691:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    8696:	66 44 0f 6f c8       	movdqa %xmm0,%xmm9
    869b:	66 44 0f 6f d0       	movdqa %xmm0,%xmm10
    86a0:	0f 11 00             	movups %xmm0,(%rax)
    86a3:	66 44 0f fe c2       	paddd  %xmm2,%xmm8
    86a8:	66 0f fe c3          	paddd  %xmm3,%xmm0
    86ac:	b9 04 00 00 00       	mov    $0x4,%ecx
    86b1:	0f 18 88 20 02 00 00 	prefetcht0 0x220(%rax)
    86b8:	66 44 0f fe cd       	paddd  %xmm5,%xmm9
    86bd:	66 44 0f fe d4       	paddd  %xmm4,%xmm10
    86c2:	44 0f 11 40 10       	movups %xmm8,0x10(%rax)
    86c7:	44 0f 11 50 20       	movups %xmm10,0x20(%rax)
    86cc:	48 8d 50 40          	lea    0x40(%rax),%rdx
    86d0:	44 0f 11 48 30       	movups %xmm9,0x30(%rax)
    for (int i=k1;i<k2;i++)
    86d5:	41 83 fa 01          	cmp    $0x1,%r10d
    86d9:	0f 84 4c 01 00 00    	je     882b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x197b>
    86df:	41 83 fa 02          	cmp    $0x2,%r10d
    86e3:	74 47                	je     872c <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x187c>
      (*feasible)[i] = i;
    86e5:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    86ea:	66 44 0f 6f e0       	movdqa %xmm0,%xmm12
    86ef:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    86f4:	0f 18 88 60 02 00 00 	prefetcht0 0x260(%rax)
    86fb:	66 44 0f fe da       	paddd  %xmm2,%xmm11
    8700:	66 44 0f fe e5       	paddd  %xmm5,%xmm12
    8705:	0f 11 02             	movups %xmm0,(%rdx)
    8708:	b9 08 00 00 00       	mov    $0x8,%ecx
    870d:	66 44 0f fe ec       	paddd  %xmm4,%xmm13
    8712:	44 0f 11 5a 10       	movups %xmm11,0x10(%rdx)
    8717:	66 0f fe c3          	paddd  %xmm3,%xmm0
    871b:	44 0f 11 6a 20       	movups %xmm13,0x20(%rdx)
    8720:	44 0f 11 62 30       	movups %xmm12,0x30(%rdx)
    for (int i=k1;i<k2;i++)
    8725:	48 8d 90 80 00 00 00 	lea    0x80(%rax),%rdx
      (*feasible)[i] = i;
    872c:	66 44 0f 6f f0       	movdqa %xmm0,%xmm14
    8731:	66 44 0f 6f f8       	movdqa %xmm0,%xmm15
    8736:	0f 11 02             	movups %xmm0,(%rdx)
    8739:	83 c1 04             	add    $0x4,%ecx
    873c:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    8740:	66 44 0f fe f2       	paddd  %xmm2,%xmm14
    8745:	66 44 0f fe fd       	paddd  %xmm5,%xmm15
    874a:	0f 18 8a 20 02 00 00 	prefetcht0 0x220(%rdx)
    8751:	66 0f fe f4          	paddd  %xmm4,%xmm6
    8755:	44 0f 11 72 10       	movups %xmm14,0x10(%rdx)
    875a:	66 0f fe c3          	paddd  %xmm3,%xmm0
    875e:	48 83 c2 40          	add    $0x40,%rdx
    8762:	0f 11 72 e0          	movups %xmm6,-0x20(%rdx)
    8766:	44 0f 11 7a f0       	movups %xmm15,-0x10(%rdx)
    for (int i=k1;i<k2;i++)
    876b:	e9 bb 00 00 00       	jmpq   882b <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x197b>
      (*feasible)[i] = i;
    8770:	66 44 0f 6f d0       	movdqa %xmm0,%xmm10
    8775:	66 44 0f 6f d8       	movdqa %xmm0,%xmm11
    877a:	0f 11 42 40          	movups %xmm0,0x40(%rdx)
    877e:	83 c1 10             	add    $0x10,%ecx
    8781:	66 44 0f 6f e0       	movdqa %xmm0,%xmm12
    8786:	66 44 0f fe d2       	paddd  %xmm2,%xmm10
    878b:	66 0f fe c3          	paddd  %xmm3,%xmm0
    878f:	0f 18 8a 60 02 00 00 	prefetcht0 0x260(%rdx)
    8796:	66 44 0f fe dd       	paddd  %xmm5,%xmm11
    879b:	66 44 0f fe e4       	paddd  %xmm4,%xmm12
    87a0:	45 0f 11 53 10       	movups %xmm10,0x10(%r11)
    87a5:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
    87aa:	45 0f 11 63 20       	movups %xmm12,0x20(%r11)
    87af:	66 44 0f 6f f0       	movdqa %xmm0,%xmm14
    87b4:	66 44 0f 6f f8       	movdqa %xmm0,%xmm15
    87b9:	66 44 0f fe ea       	paddd  %xmm2,%xmm13
    87be:	45 0f 11 5b 30       	movups %xmm11,0x30(%r11)
    87c3:	66 44 0f fe f5       	paddd  %xmm5,%xmm14
    87c8:	66 44 0f fe fc       	paddd  %xmm4,%xmm15
    87cd:	0f 18 8a a0 02 00 00 	prefetcht0 0x2a0(%rdx)
    87d4:	0f 11 82 80 00 00 00 	movups %xmm0,0x80(%rdx)
    87db:	66 0f fe c3          	paddd  %xmm3,%xmm0
    87df:	0f 18 8a e0 02 00 00 	prefetcht0 0x2e0(%rdx)
    87e6:	48 81 c2 00 01 00 00 	add    $0x100,%rdx
    87ed:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    87f1:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    87f6:	66 0f 6f f8          	movdqa %xmm0,%xmm7
    87fa:	0f 11 42 c0          	movups %xmm0,-0x40(%rdx)
    87fe:	66 0f fe f2          	paddd  %xmm2,%xmm6
    8802:	66 44 0f fe c5       	paddd  %xmm5,%xmm8
    8807:	44 0f 11 6a 90       	movups %xmm13,-0x70(%rdx)
    880c:	66 0f fe fc          	paddd  %xmm4,%xmm7
    8810:	44 0f 11 7a a0       	movups %xmm15,-0x60(%rdx)
    8815:	66 0f fe c3          	paddd  %xmm3,%xmm0
    8819:	44 0f 11 72 b0       	movups %xmm14,-0x50(%rdx)
    881e:	0f 11 72 d0          	movups %xmm6,-0x30(%rdx)
    8822:	0f 11 7a e0          	movups %xmm7,-0x20(%rdx)
    8826:	44 0f 11 42 f0       	movups %xmm8,-0x10(%rdx)
    882b:	66 0f 6f f8          	movdqa %xmm0,%xmm7
    882f:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
    8834:	4c 8d 5a 40          	lea    0x40(%rdx),%r11
    8838:	0f 11 02             	movups %xmm0,(%rdx)
    883b:	66 44 0f 6f c8       	movdqa %xmm0,%xmm9
    8840:	66 0f fe fa          	paddd  %xmm2,%xmm7
    8844:	66 44 0f fe c5       	paddd  %xmm5,%xmm8
    8849:	4d 89 de             	mov    %r11,%r14
    884c:	66 44 0f fe cc       	paddd  %xmm4,%xmm9
    8851:	0f 18 8a 20 02 00 00 	prefetcht0 0x220(%rdx)
    8858:	0f 11 7a 10          	movups %xmm7,0x10(%rdx)
    885c:	66 0f fe c3          	paddd  %xmm3,%xmm0
    8860:	44 0f 11 4a 20       	movups %xmm9,0x20(%rdx)
    8865:	44 0f 11 42 30       	movups %xmm8,0x30(%rdx)
    for (int i=k1;i<k2;i++)
    886a:	39 f9                	cmp    %edi,%ecx
    886c:	0f 85 fe fe ff ff    	jne    8770 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x18c0>
      (*feasible)[i] = i;
    8872:	45 89 cf             	mov    %r9d,%r15d
    8875:	45 8d 51 01          	lea    0x1(%r9),%r10d
    8879:	41 0f 11 06          	movups %xmm0,(%r14)
    for (int i=k1;i<k2;i++)
    887d:	49 8d 56 10          	lea    0x10(%r14),%rdx
    8881:	41 f7 d7             	not    %r15d
    8884:	66 0f fe c2          	paddd  %xmm2,%xmm0
    8888:	45 01 c7             	add    %r8d,%r15d
    888b:	41 83 e7 07          	and    $0x7,%r15d
    888f:	45 39 d0             	cmp    %r10d,%r8d
    8892:	0f 86 0e 01 00 00    	jbe    89a6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1af6>
    8898:	45 85 ff             	test   %r15d,%r15d
    889b:	0f 84 92 00 00 00    	je     8933 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a83>
    88a1:	41 83 ff 01          	cmp    $0x1,%r15d
    88a5:	74 78                	je     891f <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a6f>
    88a7:	41 83 ff 02          	cmp    $0x2,%r15d
    88ab:	74 63                	je     8910 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a60>
    88ad:	41 83 ff 03          	cmp    $0x3,%r15d
    88b1:	74 4e                	je     8901 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a51>
    88b3:	41 83 ff 04          	cmp    $0x4,%r15d
    88b7:	74 39                	je     88f2 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a42>
    88b9:	41 83 ff 05          	cmp    $0x5,%r15d
    88bd:	74 24                	je     88e3 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a33>
    88bf:	41 83 ff 06          	cmp    $0x6,%r15d
    88c3:	74 0f                	je     88d4 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a24>
      (*feasible)[i] = i;
    88c5:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    88c8:	45 8d 51 02          	lea    0x2(%r9),%r10d
    88cc:	49 8d 56 20          	lea    0x20(%r14),%rdx
    88d0:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    88d4:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    88d7:	41 83 c2 01          	add    $0x1,%r10d
    88db:	48 83 c2 10          	add    $0x10,%rdx
    88df:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    88e3:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    88e6:	41 83 c2 01          	add    $0x1,%r10d
    88ea:	48 83 c2 10          	add    $0x10,%rdx
    88ee:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    88f2:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    88f5:	41 83 c2 01          	add    $0x1,%r10d
    88f9:	48 83 c2 10          	add    $0x10,%rdx
    88fd:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    8901:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    8904:	41 83 c2 01          	add    $0x1,%r10d
    8908:	48 83 c2 10          	add    $0x10,%rdx
    890c:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    8910:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    8913:	41 83 c2 01          	add    $0x1,%r10d
    8917:	48 83 c2 10          	add    $0x10,%rdx
    891b:	66 0f fe c2          	paddd  %xmm2,%xmm0
      (*feasible)[i] = i;
    891f:	41 83 c2 01          	add    $0x1,%r10d
    8923:	0f 11 02             	movups %xmm0,(%rdx)
    for (int i=k1;i<k2;i++)
    8926:	48 83 c2 10          	add    $0x10,%rdx
    892a:	66 0f fe c2          	paddd  %xmm2,%xmm0
    892e:	45 39 d0             	cmp    %r10d,%r8d
    8931:	76 73                	jbe    89a6 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1af6>
    8933:	66 44 0f 6f c8       	movdqa %xmm0,%xmm9
      (*feasible)[i] = i;
    8938:	0f 11 02             	movups %xmm0,(%rdx)
    893b:	41 83 c2 08          	add    $0x8,%r10d
    893f:	48 83 ea 80          	sub    $0xffffffffffffff80,%rdx
    8943:	66 44 0f fe ca       	paddd  %xmm2,%xmm9
    for (int i=k1;i<k2;i++)
    8948:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
      (*feasible)[i] = i;
    894d:	44 0f 11 4a 90       	movups %xmm9,-0x70(%rdx)
    8952:	66 0f fe da          	paddd  %xmm2,%xmm3
    for (int i=k1;i<k2;i++)
    8956:	66 0f 6f e3          	movdqa %xmm3,%xmm4
      (*feasible)[i] = i;
    895a:	0f 11 5a a0          	movups %xmm3,-0x60(%rdx)
    895e:	66 0f fe e2          	paddd  %xmm2,%xmm4
    for (int i=k1;i<k2;i++)
    8962:	66 0f 6f ec          	movdqa %xmm4,%xmm5
      (*feasible)[i] = i;
    8966:	0f 11 62 b0          	movups %xmm4,-0x50(%rdx)
    896a:	66 0f fe ea          	paddd  %xmm2,%xmm5
    for (int i=k1;i<k2;i++)
    896e:	66 44 0f 6f d5       	movdqa %xmm5,%xmm10
      (*feasible)[i] = i;
    8973:	0f 11 6a c0          	movups %xmm5,-0x40(%rdx)
    8977:	66 44 0f fe d2       	paddd  %xmm2,%xmm10
    for (int i=k1;i<k2;i++)
    897c:	66 45 0f 6f da       	movdqa %xmm10,%xmm11
      (*feasible)[i] = i;
    8981:	44 0f 11 52 d0       	movups %xmm10,-0x30(%rdx)
    8986:	66 44 0f fe da       	paddd  %xmm2,%xmm11
    for (int i=k1;i<k2;i++)
    898b:	66 41 0f 6f c3       	movdqa %xmm11,%xmm0
      (*feasible)[i] = i;
    8990:	44 0f 11 5a e0       	movups %xmm11,-0x20(%rdx)
    8995:	66 0f fe c2          	paddd  %xmm2,%xmm0
    8999:	0f 11 42 f0          	movups %xmm0,-0x10(%rdx)
    for (int i=k1;i<k2;i++)
    899d:	66 0f fe c2          	paddd  %xmm2,%xmm0
    89a1:	45 39 d0             	cmp    %r10d,%r8d
    89a4:	77 8d                	ja     8933 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1a83>
    89a6:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
    89aa:	41 89 cf             	mov    %ecx,%r15d
    89ad:	41 83 e7 fc          	and    $0xfffffffc,%r15d
    89b1:	41 39 cf             	cmp    %ecx,%r15d
    89b4:	0f 84 ce fa ff ff    	je     8488 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15d8>
    89ba:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
      (*feasible)[i] = i;
    89bf:	4d 63 df             	movslq %r15d,%r11
    for (int i=k1;i<k2;i++)
    89c2:	45 8d 47 01          	lea    0x1(%r15),%r8d
      (*feasible)[i] = i;
    89c6:	46 89 3c 98          	mov    %r15d,(%rax,%r11,4)
    for (int i=k1;i<k2;i++)
    89ca:	45 39 f0             	cmp    %r14d,%r8d
    89cd:	0f 8d b5 fa ff ff    	jge    8488 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15d8>
      (*feasible)[i] = i;
    89d3:	49 63 f8             	movslq %r8d,%rdi
    for (int i=k1;i<k2;i++)
    89d6:	41 83 c7 02          	add    $0x2,%r15d
      (*feasible)[i] = i;
    89da:	44 89 04 b8          	mov    %r8d,(%rax,%rdi,4)
    for (int i=k1;i<k2;i++)
    89de:	45 39 f7             	cmp    %r14d,%r15d
    89e1:	0f 8d a1 fa ff ff    	jge    8488 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15d8>
      (*feasible)[i] = i;
    89e7:	4d 63 cf             	movslq %r15d,%r9
    89ea:	46 89 3c 88          	mov    %r15d,(%rax,%r9,4)
    for (int i=k1;i<k2;i++)
    89ee:	e9 95 fa ff ff       	jmpq   8488 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x15d8>
    numfeasible = (int)(ITER*kmin*log((double)kmin));
    89f3:	66 41 0f 28 c6       	movapd %xmm14,%xmm0
    89f8:	f2 44 0f 11 7c 24 40 	movsd  %xmm15,0x40(%rsp)
    89ff:	e8 7c 99 ff ff       	callq  2380 <log@plt>
    8a04:	f2 0f 59 44 24 30    	mulsd  0x30(%rsp),%xmm0
    8a0a:	f2 44 0f 10 7c 24 40 	movsd  0x40(%rsp),%xmm15
    8a11:	f2 0f 2c f8          	cvttsd2si %xmm0,%edi
    8a15:	89 7c 24 38          	mov    %edi,0x38(%rsp)
    8a19:	e9 ae f5 ff ff       	jmpq   7fcc <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x111c>
    while( l+1 < r ) {
    8a1e:	44 89 da             	mov    %r11d,%edx
    8a21:	e9 1b fa ff ff       	jmpq   8441 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1591>
    8a26:	48 89 ef             	mov    %rbp,%rdi
      points->p[kk].assign = kk;
    8a29:	48 89 69 10          	mov    %rbp,0x10(%rcx)
      points->p[kk].cost = 0;
    8a2d:	48 83 c1 20          	add    $0x20,%rcx
    for (long kk=k1;kk<k2;kk++) {
    8a31:	48 83 c7 01          	add    $0x1,%rdi
      points->p[kk].cost = 0;
    8a35:	c7 41 f8 00 00 00 00 	movl   $0x0,-0x8(%rcx)
    for (long kk=k1;kk<k2;kk++) {
    8a3c:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    8a41:	e9 6a f1 ff ff       	jmpq   7bb0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xd00>
    8a46:	48 89 ea             	mov    %rbp,%rdx
    8a49:	e9 1b f2 ff ff       	jmpq   7c69 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0xdb9>
    8a4e:	f2 44 0f 10 54 24 10 	movsd  0x10(%rsp),%xmm10
    8a55:	66 0f ef d2          	pxor   %xmm2,%xmm2
    8a59:	f2 44 0f 11 7c 24 10 	movsd  %xmm15,0x10(%rsp)
    8a60:	f2 41 0f 5a d2       	cvtsd2ss %xmm10,%xmm2
    8a65:	f2 44 0f 11 54 24 08 	movsd  %xmm10,0x8(%rsp)
    8a6c:	f3 0f 11 54 24 18    	movss  %xmm2,0x18(%rsp)
    8a72:	e9 ed f4 ff ff       	jmpq   7f64 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x10b4>
  for( int i = 1; i < points->num; i++ ) {
    8a77:	ba 01 00 00 00       	mov    $0x1,%edx
    8a7c:	e9 14 f7 ff ff       	jmpq   8195 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x12e5>
    for (int i=k1;i<k2;i++)
    8a81:	49 89 c6             	mov    %rax,%r14
    8a84:	45 31 c9             	xor    %r9d,%r9d
    8a87:	66 0f 6f 05 81 3b 00 	movdqa 0x3b81(%rip),%xmm0        # c610 <_ZTS10FileStream+0x68>
    8a8e:	00 
    8a8f:	66 0f 6f 15 89 3b 00 	movdqa 0x3b89(%rip),%xmm2        # c620 <_ZTS10FileStream+0x78>
    8a96:	00 
    8a97:	e9 d6 fd ff ff       	jmpq   8872 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x19c2>
    8a9c:	45 31 ff             	xor    %r15d,%r15d
    8a9f:	e9 16 ff ff ff       	jmpq   89ba <_Z8pkmedianP6PointsllPliP16parsec_barrier_t+0x1b0a>
    8aa4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    8aab:	00 00 00 00 
    8aaf:	90                   	nop

0000000000008ab0 <_Z14localSearchSubPv>:
void* localSearchSub(void* arg_) {
    8ab0:	f3 0f 1e fa          	endbr64 
    8ab4:	53                   	push   %rbx
    8ab5:	48 89 fb             	mov    %rdi,%rbx
    8ab8:	48 8d 3d 2a 36 00 00 	lea    0x362a(%rip),%rdi        # c0e9 <_IO_stdin_used+0xe9>
    8abf:	e8 2c 9a ff ff       	callq  24f0 <puts@plt>
  pkmedian(arg->points,arg->kmin,arg->kmax,arg->kfinal,arg->pid,arg->barrier);
    8ac4:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
    8ac8:	48 8b 53 10          	mov    0x10(%rbx),%rdx
    8acc:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    8ad0:	4c 8b 4b 28          	mov    0x28(%rbx),%r9
    8ad4:	44 8b 43 20          	mov    0x20(%rbx),%r8d
    8ad8:	48 8b 3b             	mov    (%rbx),%rdi
    8adb:	e8 d0 e3 ff ff       	callq  6eb0 <_Z8pkmedianP6PointsllPliP16parsec_barrier_t>
    8ae0:	48 8d 3d 1a 36 00 00 	lea    0x361a(%rip),%rdi        # c101 <_IO_stdin_used+0x101>
    8ae7:	e8 04 9a ff ff       	callq  24f0 <puts@plt>
}
    8aec:	31 c0                	xor    %eax,%eax
    8aee:	5b                   	pop    %rbx
    8aef:	c3                   	retq   

0000000000008af0 <_Z11contcentersP6Points>:
{
    8af0:	f3 0f 1e fa          	endbr64 
    8af4:	41 57                	push   %r15
    8af6:	41 56                	push   %r14
    8af8:	41 55                	push   %r13
    8afa:	41 54                	push   %r12
    8afc:	55                   	push   %rbp
    8afd:	53                   	push   %rbx
  for (i=0;i<points->num;i++) {
    8afe:	4c 8b 2f             	mov    (%rdi),%r13
    8b01:	4d 85 ed             	test   %r13,%r13
    8b04:	0f 8e f7 04 00 00    	jle    9001 <_Z11contcentersP6Points+0x511>
    if (points->p[i].assign != i) {
    8b0a:	48 8b 47 10          	mov    0x10(%rdi),%rax
    8b0e:	49 89 fe             	mov    %rdi,%r14
  for (i=0;i<points->num;i++) {
    8b11:	45 31 c0             	xor    %r8d,%r8d
    8b14:	f2 44 0f 10 15 d3 3a 	movsd  0x3ad3(%rip),%xmm10        # c5f0 <_ZTS10FileStream+0x48>
    8b1b:	00 00 
    if (points->p[i].assign != i) {
    8b1d:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
    8b22:	48 8d 70 28          	lea    0x28(%rax),%rsi
    8b26:	eb 19                	jmp    8b41 <_Z11contcentersP6Points+0x51>
    8b28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    8b2f:	00 
  for (i=0;i<points->num;i++) {
    8b30:	49 83 c0 01          	add    $0x1,%r8
    8b34:	48 83 c6 20          	add    $0x20,%rsi
    8b38:	4d 39 e8             	cmp    %r13,%r8
    8b3b:	0f 84 c0 04 00 00    	je     9001 <_Z11contcentersP6Points+0x511>
    if (points->p[i].assign != i) {
    8b41:	48 8b 56 e8          	mov    -0x18(%rsi),%rdx
    8b45:	4c 39 c2             	cmp    %r8,%rdx
    8b48:	74 e6                	je     8b30 <_Z11contcentersP6Points+0x40>
      relweight=points->p[points->p[i].assign].weight + points->p[i].weight;
    8b4a:	48 c1 e2 05          	shl    $0x5,%rdx
    8b4e:	48 03 54 24 e8       	add    -0x18(%rsp),%rdx
    8b53:	f3 0f 10 4e d8       	movss  -0x28(%rsi),%xmm1
    8b58:	f3 0f 10 2a          	movss  (%rdx),%xmm5
      for (ii=0;ii<points->dim;ii++) {
    8b5c:	4d 63 5e 08          	movslq 0x8(%r14),%r11
      relweight=points->p[points->p[i].assign].weight + points->p[i].weight;
    8b60:	f3 0f 58 e9          	addss  %xmm1,%xmm5
      relweight = points->p[i].weight/relweight;
    8b64:	f3 0f 5e cd          	divss  %xmm5,%xmm1
      for (ii=0;ii<points->dim;ii++) {
    8b68:	4d 85 db             	test   %r11,%r11
    8b6b:	0f 8e 7b 04 00 00    	jle    8fec <_Z11contcentersP6Points+0x4fc>
	  points->p[i].coord[ii]*relweight;
    8b71:	4c 8b 56 e0          	mov    -0x20(%rsi),%r10
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8b75:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    8b79:	66 0f ef c0          	pxor   %xmm0,%xmm0
    8b7d:	66 41 0f 28 ea       	movapd %xmm10,%xmm5
    8b82:	f3 0f 5a c1          	cvtss2sd %xmm1,%xmm0
    8b86:	0f 18 0e             	prefetcht0 (%rsi)
    8b89:	f2 0f 5c e8          	subsd  %xmm0,%xmm5
    8b8d:	49 8d 5a 10          	lea    0x10(%r10),%rbx
    8b91:	48 8d 69 10          	lea    0x10(%rcx),%rbp
    8b95:	48 39 d9             	cmp    %rbx,%rcx
    8b98:	40 0f 93 c7          	setae  %dil
    8b9c:	49 39 ea             	cmp    %rbp,%r10
    8b9f:	41 0f 93 c1          	setae  %r9b
    8ba3:	44 08 cf             	or     %r9b,%dil
    8ba6:	0f 84 64 04 00 00    	je     9010 <_Z11contcentersP6Points+0x520>
    8bac:	4d 8d 63 ff          	lea    -0x1(%r11),%r12
    8bb0:	49 83 fc 02          	cmp    $0x2,%r12
    8bb4:	0f 86 56 04 00 00    	jbe    9010 <_Z11contcentersP6Points+0x520>
    8bba:	4c 89 db             	mov    %r11,%rbx
    8bbd:	66 0f 28 c5          	movapd %xmm5,%xmm0
    8bc1:	0f 28 e1             	movaps %xmm1,%xmm4
    8bc4:	48 c1 eb 02          	shr    $0x2,%rbx
    8bc8:	66 0f 14 c0          	unpcklpd %xmm0,%xmm0
    8bcc:	0f c6 e4 00          	shufps $0x0,%xmm4,%xmm4
    8bd0:	48 83 fb 04          	cmp    $0x4,%rbx
    8bd4:	0f 86 d0 07 00 00    	jbe    93aa <_Z11contcentersP6Points+0x8ba>
    8bda:	48 8d 6b fb          	lea    -0x5(%rbx),%rbp
	  points->p[i].coord[ii]*relweight;
    8bde:	4c 89 d7             	mov    %r10,%rdi
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8be1:	48 89 c8             	mov    %rcx,%rax
	  points->p[i].coord[ii]*relweight;
    8be4:	45 31 e4             	xor    %r12d,%r12d
    8be7:	48 83 e5 fc          	and    $0xfffffffffffffffc,%rbp
    8beb:	4c 8d 7d 04          	lea    0x4(%rbp),%r15
    8bef:	4c 89 7c 24 f0       	mov    %r15,-0x10(%rsp)
    8bf4:	eb 0d                	jmp    8c03 <_Z11contcentersP6Points+0x113>
    8bf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    8bfd:	00 00 00 
	points->p[points->p[i].assign].coord[ii]+=
    8c00:	4d 89 fc             	mov    %r15,%r12
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c03:	0f 12 70 08          	movlps 0x8(%rax),%xmm6
    8c07:	0f 5a 18             	cvtps2pd (%rax),%xmm3
    8c0a:	0f 12 78 18          	movlps 0x18(%rax),%xmm7
    8c0e:	0f 18 8f c0 00 00 00 	prefetcht0 0xc0(%rdi)
    8c15:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8c19:	44 0f 5a de          	cvtps2pd %xmm6,%xmm11
    8c1d:	44 0f 5a ff          	cvtps2pd %xmm7,%xmm15
    8c21:	44 0f 12 40 28       	movlps 0x28(%rax),%xmm8
    8c26:	66 44 0f 59 d8       	mulpd  %xmm0,%xmm11
    8c2b:	44 0f 12 48 38       	movlps 0x38(%rax),%xmm9
    8c30:	48 83 c7 40          	add    $0x40,%rdi
    8c34:	0f 18 88 c0 00 00 00 	prefetcht0 0xc0(%rax)
    8c3b:	66 44 0f 59 f8       	mulpd  %xmm0,%xmm15
    8c40:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
    8c45:	66 44 0f 5a e3       	cvtpd2ps %xmm3,%xmm12
    8c4a:	0f 5a 58 10          	cvtps2pd 0x10(%rax),%xmm3
    8c4e:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8c52:	66 45 0f 5a eb       	cvtpd2ps %xmm11,%xmm13
    8c57:	45 0f 16 e5          	movlhps %xmm13,%xmm12
    8c5b:	44 0f 11 20          	movups %xmm12,(%rax)
	  points->p[i].coord[ii]*relweight;
    8c5f:	44 0f 10 77 c0       	movups -0x40(%rdi),%xmm14
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c64:	66 45 0f 5a df       	cvtpd2ps %xmm15,%xmm11
	  points->p[i].coord[ii]*relweight;
    8c69:	44 0f 59 f4          	mulps  %xmm4,%xmm14
	points->p[points->p[i].assign].coord[ii]+=
    8c6d:	45 0f 58 e6          	addps  %xmm14,%xmm12
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c71:	45 0f 5a f0          	cvtps2pd %xmm8,%xmm14
    8c75:	66 44 0f 59 f0       	mulpd  %xmm0,%xmm14
	points->p[points->p[i].assign].coord[ii]+=
    8c7a:	44 0f 11 20          	movups %xmm12,(%rax)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c7e:	66 44 0f 5a e3       	cvtpd2ps %xmm3,%xmm12
    8c83:	45 0f 16 e3          	movlhps %xmm11,%xmm12
    8c87:	0f 5a 58 20          	cvtps2pd 0x20(%rax),%xmm3
    8c8b:	44 0f 11 60 10       	movups %xmm12,0x10(%rax)
	  points->p[i].coord[ii]*relweight;
    8c90:	44 0f 10 6f d0       	movups -0x30(%rdi),%xmm13
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c95:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
	  points->p[i].coord[ii]*relweight;
    8c99:	44 0f 59 ec          	mulps  %xmm4,%xmm13
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8c9d:	66 44 0f 5a fb       	cvtpd2ps %xmm3,%xmm15
    8ca2:	0f 5a 58 30          	cvtps2pd 0x30(%rax),%xmm3
    8ca6:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8caa:	48 83 c0 40          	add    $0x40,%rax
	points->p[points->p[i].assign].coord[ii]+=
    8cae:	45 0f 58 e5          	addps  %xmm13,%xmm12
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8cb2:	45 0f 5a e9          	cvtps2pd %xmm9,%xmm13
    8cb6:	66 44 0f 59 e8       	mulpd  %xmm0,%xmm13
	points->p[points->p[i].assign].coord[ii]+=
    8cbb:	44 0f 11 60 d0       	movups %xmm12,-0x30(%rax)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8cc0:	66 45 0f 5a e6       	cvtpd2ps %xmm14,%xmm12
    8cc5:	45 0f 16 fc          	movlhps %xmm12,%xmm15
    8cc9:	66 44 0f 5a f3       	cvtpd2ps %xmm3,%xmm14
    8cce:	44 0f 11 78 e0       	movups %xmm15,-0x20(%rax)
	  points->p[i].coord[ii]*relweight;
    8cd3:	44 0f 10 5f e0       	movups -0x20(%rdi),%xmm11
    8cd8:	44 0f 59 dc          	mulps  %xmm4,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    8cdc:	45 0f 58 fb          	addps  %xmm11,%xmm15
    8ce0:	44 0f 11 78 e0       	movups %xmm15,-0x20(%rax)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8ce5:	66 45 0f 5a fd       	cvtpd2ps %xmm13,%xmm15
    8cea:	45 0f 16 f7          	movlhps %xmm15,%xmm14
    8cee:	44 0f 11 70 f0       	movups %xmm14,-0x10(%rax)
	  points->p[i].coord[ii]*relweight;
    8cf3:	44 0f 10 67 f0       	movups -0x10(%rdi),%xmm12
    8cf8:	44 0f 59 e4          	mulps  %xmm4,%xmm12
	points->p[points->p[i].assign].coord[ii]+=
    8cfc:	45 0f 58 f4          	addps  %xmm12,%xmm14
    8d00:	44 0f 11 70 f0       	movups %xmm14,-0x10(%rax)
      for (ii=0;ii<points->dim;ii++) {
    8d05:	49 89 c1             	mov    %rax,%r9
    8d08:	49 39 ec             	cmp    %rbp,%r12
    8d0b:	0f 85 ef fe ff ff    	jne    8c00 <_Z11contcentersP6Points+0x110>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8d11:	0f 12 50 08          	movlps 0x8(%rax),%xmm2
    8d15:	0f 5a 18             	cvtps2pd (%rax),%xmm3
    8d18:	4c 8b 64 24 f0       	mov    -0x10(%rsp),%r12
    8d1d:	bd 10 00 00 00       	mov    $0x10,%ebp
    8d22:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8d26:	44 0f 5a da          	cvtps2pd %xmm2,%xmm11
    8d2a:	66 44 0f 59 d8       	mulpd  %xmm0,%xmm11
    8d2f:	4d 89 e7             	mov    %r12,%r15
    8d32:	49 83 c4 01          	add    $0x1,%r12
    8d36:	49 f7 d7             	not    %r15
    8d39:	49 01 df             	add    %rbx,%r15
    8d3c:	41 83 e7 03          	and    $0x3,%r15d
    8d40:	66 44 0f 5a eb       	cvtpd2ps %xmm3,%xmm13
    8d45:	66 45 0f 5a f3       	cvtpd2ps %xmm11,%xmm14
    8d4a:	45 0f 16 ee          	movlhps %xmm14,%xmm13
    8d4e:	45 0f 11 29          	movups %xmm13,(%r9)
	  points->p[i].coord[ii]*relweight;
    8d52:	44 0f 10 3f          	movups (%rdi),%xmm15
    8d56:	44 0f 59 fc          	mulps  %xmm4,%xmm15
	points->p[points->p[i].assign].coord[ii]+=
    8d5a:	45 0f 58 ef          	addps  %xmm15,%xmm13
    8d5e:	45 0f 11 29          	movups %xmm13,(%r9)
      for (ii=0;ii<points->dim;ii++) {
    8d62:	4c 39 e3             	cmp    %r12,%rbx
    8d65:	0f 86 b6 01 00 00    	jbe    8f21 <_Z11contcentersP6Points+0x431>
    8d6b:	4d 85 ff             	test   %r15,%r15
    8d6e:	0f 84 a4 00 00 00    	je     8e18 <_Z11contcentersP6Points+0x328>
    8d74:	49 83 ff 01          	cmp    $0x1,%r15
    8d78:	74 4d                	je     8dc7 <_Z11contcentersP6Points+0x2d7>
    8d7a:	49 83 ff 02          	cmp    $0x2,%r15
    8d7e:	0f 85 3d 06 00 00    	jne    93c1 <_Z11contcentersP6Points+0x8d1>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8d84:	0f 12 54 28 08       	movlps 0x8(%rax,%rbp,1),%xmm2
    8d89:	0f 5a 1c 28          	cvtps2pd (%rax,%rbp,1),%xmm3
    8d8d:	49 83 c4 01          	add    $0x1,%r12
    8d91:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8d95:	44 0f 5a fa          	cvtps2pd %xmm2,%xmm15
    8d99:	66 44 0f 59 f8       	mulpd  %xmm0,%xmm15
    8d9e:	66 44 0f 5a e3       	cvtpd2ps %xmm3,%xmm12
    8da3:	66 45 0f 5a ef       	cvtpd2ps %xmm15,%xmm13
    8da8:	45 0f 16 e5          	movlhps %xmm13,%xmm12
    8dac:	45 0f 11 24 29       	movups %xmm12,(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8db1:	44 0f 10 1c 2f       	movups (%rdi,%rbp,1),%xmm11
    8db6:	44 0f 59 dc          	mulps  %xmm4,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    8dba:	45 0f 58 e3          	addps  %xmm11,%xmm12
    8dbe:	45 0f 11 24 29       	movups %xmm12,(%r9,%rbp,1)
      for (ii=0;ii<points->dim;ii++) {
    8dc3:	48 83 c5 10          	add    $0x10,%rbp
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8dc7:	0f 12 54 28 08       	movlps 0x8(%rax,%rbp,1),%xmm2
    8dcc:	0f 5a 1c 28          	cvtps2pd (%rax,%rbp,1),%xmm3
    8dd0:	49 83 c4 01          	add    $0x1,%r12
    8dd4:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8dd8:	44 0f 5a f2          	cvtps2pd %xmm2,%xmm14
    8ddc:	66 44 0f 59 f0       	mulpd  %xmm0,%xmm14
    8de1:	66 44 0f 5a fb       	cvtpd2ps %xmm3,%xmm15
    8de6:	66 45 0f 5a e6       	cvtpd2ps %xmm14,%xmm12
    8deb:	45 0f 16 fc          	movlhps %xmm12,%xmm15
    8def:	45 0f 11 3c 29       	movups %xmm15,(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8df4:	44 0f 10 2c 2f       	movups (%rdi,%rbp,1),%xmm13
    8df9:	44 0f 59 ec          	mulps  %xmm4,%xmm13
	points->p[points->p[i].assign].coord[ii]+=
    8dfd:	45 0f 58 fd          	addps  %xmm13,%xmm15
    8e01:	45 0f 11 3c 29       	movups %xmm15,(%r9,%rbp,1)
      for (ii=0;ii<points->dim;ii++) {
    8e06:	48 83 c5 10          	add    $0x10,%rbp
    8e0a:	4c 39 e3             	cmp    %r12,%rbx
    8e0d:	0f 86 0e 01 00 00    	jbe    8f21 <_Z11contcentersP6Points+0x431>
    8e13:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8e18:	0f 12 54 28 08       	movlps 0x8(%rax,%rbp,1),%xmm2
    8e1d:	0f 5a 1c 28          	cvtps2pd (%rax,%rbp,1),%xmm3
    8e21:	49 83 c4 04          	add    $0x4,%r12
    8e25:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8e29:	44 0f 5a da          	cvtps2pd %xmm2,%xmm11
    8e2d:	66 44 0f 59 d8       	mulpd  %xmm0,%xmm11
    8e32:	66 44 0f 5a f3       	cvtpd2ps %xmm3,%xmm14
    8e37:	66 45 0f 5a fb       	cvtpd2ps %xmm11,%xmm15
    8e3c:	45 0f 16 f7          	movlhps %xmm15,%xmm14
    8e40:	45 0f 11 34 29       	movups %xmm14,(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8e45:	44 0f 10 24 2f       	movups (%rdi,%rbp,1),%xmm12
    8e4a:	44 0f 59 e4          	mulps  %xmm4,%xmm12
	points->p[points->p[i].assign].coord[ii]+=
    8e4e:	45 0f 58 f4          	addps  %xmm12,%xmm14
    8e52:	45 0f 11 34 29       	movups %xmm14,(%r9,%rbp,1)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8e57:	0f 5a 5c 28 10       	cvtps2pd 0x10(%rax,%rbp,1),%xmm3
    8e5c:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8e60:	0f 12 54 28 18       	movlps 0x18(%rax,%rbp,1),%xmm2
    8e65:	44 0f 5a ea          	cvtps2pd %xmm2,%xmm13
    8e69:	66 44 0f 59 e8       	mulpd  %xmm0,%xmm13
    8e6e:	66 44 0f 5a f3       	cvtpd2ps %xmm3,%xmm14
    8e73:	66 45 0f 5a dd       	cvtpd2ps %xmm13,%xmm11
    8e78:	45 0f 16 f3          	movlhps %xmm11,%xmm14
    8e7c:	45 0f 11 74 29 10    	movups %xmm14,0x10(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8e82:	44 0f 10 7c 2f 10    	movups 0x10(%rdi,%rbp,1),%xmm15
    8e88:	44 0f 59 fc          	mulps  %xmm4,%xmm15
	points->p[points->p[i].assign].coord[ii]+=
    8e8c:	45 0f 58 f7          	addps  %xmm15,%xmm14
    8e90:	45 0f 11 74 29 10    	movups %xmm14,0x10(%r9,%rbp,1)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8e96:	0f 5a 5c 28 20       	cvtps2pd 0x20(%rax,%rbp,1),%xmm3
    8e9b:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8e9f:	0f 12 54 28 28       	movlps 0x28(%rax,%rbp,1),%xmm2
    8ea4:	44 0f 5a e2          	cvtps2pd %xmm2,%xmm12
    8ea8:	66 44 0f 59 e0       	mulpd  %xmm0,%xmm12
    8ead:	66 44 0f 5a eb       	cvtpd2ps %xmm3,%xmm13
    8eb2:	66 45 0f 5a f4       	cvtpd2ps %xmm12,%xmm14
    8eb7:	45 0f 16 ee          	movlhps %xmm14,%xmm13
    8ebb:	45 0f 11 6c 29 20    	movups %xmm13,0x20(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8ec1:	44 0f 10 5c 2f 20    	movups 0x20(%rdi,%rbp,1),%xmm11
    8ec7:	44 0f 59 dc          	mulps  %xmm4,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    8ecb:	45 0f 58 eb          	addps  %xmm11,%xmm13
    8ecf:	45 0f 11 6c 29 20    	movups %xmm13,0x20(%r9,%rbp,1)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8ed5:	0f 5a 5c 28 30       	cvtps2pd 0x30(%rax,%rbp,1),%xmm3
    8eda:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    8ede:	0f 12 54 28 38       	movlps 0x38(%rax,%rbp,1),%xmm2
    8ee3:	44 0f 5a fa          	cvtps2pd %xmm2,%xmm15
    8ee7:	66 44 0f 59 f8       	mulpd  %xmm0,%xmm15
    8eec:	66 44 0f 5a e3       	cvtpd2ps %xmm3,%xmm12
    8ef1:	66 45 0f 5a ef       	cvtpd2ps %xmm15,%xmm13
    8ef6:	45 0f 16 e5          	movlhps %xmm13,%xmm12
    8efa:	45 0f 11 64 29 30    	movups %xmm12,0x30(%r9,%rbp,1)
	  points->p[i].coord[ii]*relweight;
    8f00:	44 0f 10 74 2f 30    	movups 0x30(%rdi,%rbp,1),%xmm14
    8f06:	44 0f 59 f4          	mulps  %xmm4,%xmm14
	points->p[points->p[i].assign].coord[ii]+=
    8f0a:	45 0f 58 e6          	addps  %xmm14,%xmm12
    8f0e:	45 0f 11 64 29 30    	movups %xmm12,0x30(%r9,%rbp,1)
      for (ii=0;ii<points->dim;ii++) {
    8f14:	48 83 c5 40          	add    $0x40,%rbp
    8f18:	4c 39 e3             	cmp    %r12,%rbx
    8f1b:	0f 87 f7 fe ff ff    	ja     8e18 <_Z11contcentersP6Points+0x328>
    8f21:	4c 89 db             	mov    %r11,%rbx
    8f24:	48 83 e3 fc          	and    $0xfffffffffffffffc,%rbx
    8f28:	4c 39 db             	cmp    %r11,%rbx
    8f2b:	0f 84 b2 00 00 00    	je     8fe3 <_Z11contcentersP6Points+0x4f3>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8f31:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    8f38:	00 
    8f39:	66 0f ef c0          	pxor   %xmm0,%xmm0
    8f3d:	66 0f ef e4          	pxor   %xmm4,%xmm4
    8f41:	4c 8d 0c 39          	lea    (%rcx,%rdi,1),%r9
      for (ii=0;ii<points->dim;ii++) {
    8f45:	48 8d 43 01          	lea    0x1(%rbx),%rax
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8f49:	f3 41 0f 5a 01       	cvtss2sd (%r9),%xmm0
    8f4e:	f2 0f 59 c5          	mulsd  %xmm5,%xmm0
    8f52:	f2 0f 5a e0          	cvtsd2ss %xmm0,%xmm4
    8f56:	f3 41 0f 11 21       	movss  %xmm4,(%r9)
	  points->p[i].coord[ii]*relweight;
    8f5b:	f3 45 0f 10 1c 9a    	movss  (%r10,%rbx,4),%xmm11
    8f61:	f3 44 0f 59 d9       	mulss  %xmm1,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    8f66:	f3 41 0f 58 e3       	addss  %xmm11,%xmm4
    8f6b:	f3 41 0f 11 21       	movss  %xmm4,(%r9)
      for (ii=0;ii<points->dim;ii++) {
    8f70:	4c 39 d8             	cmp    %r11,%rax
    8f73:	7d 6e                	jge    8fe3 <_Z11contcentersP6Points+0x4f3>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8f75:	4c 8d 7c 39 04       	lea    0x4(%rcx,%rdi,1),%r15
    8f7a:	66 0f ef db          	pxor   %xmm3,%xmm3
    8f7e:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
      for (ii=0;ii<points->dim;ii++) {
    8f83:	48 83 c3 02          	add    $0x2,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8f87:	f3 41 0f 5a 1f       	cvtss2sd (%r15),%xmm3
    8f8c:	f2 0f 59 dd          	mulsd  %xmm5,%xmm3
    8f90:	f2 44 0f 5a fb       	cvtsd2ss %xmm3,%xmm15
    8f95:	f3 45 0f 11 3f       	movss  %xmm15,(%r15)
	  points->p[i].coord[ii]*relweight;
    8f9a:	f3 45 0f 10 64 3a 04 	movss  0x4(%r10,%rdi,1),%xmm12
    8fa1:	f3 44 0f 59 e1       	mulss  %xmm1,%xmm12
	points->p[points->p[i].assign].coord[ii]+=
    8fa6:	f3 45 0f 58 fc       	addss  %xmm12,%xmm15
    8fab:	f3 45 0f 11 3f       	movss  %xmm15,(%r15)
      for (ii=0;ii<points->dim;ii++) {
    8fb0:	49 39 db             	cmp    %rbx,%r11
    8fb3:	7e 2e                	jle    8fe3 <_Z11contcentersP6Points+0x4f3>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    8fb5:	48 8d 6c 39 08       	lea    0x8(%rcx,%rdi,1),%rbp
    8fba:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    8fbf:	f3 44 0f 5a 6d 00    	cvtss2sd 0x0(%rbp),%xmm13
    8fc5:	f2 41 0f 59 ed       	mulsd  %xmm13,%xmm5
    8fca:	f2 0f 5a ed          	cvtsd2ss %xmm5,%xmm5
    8fce:	f3 0f 11 6d 00       	movss  %xmm5,0x0(%rbp)
	  points->p[i].coord[ii]*relweight;
    8fd3:	f3 41 0f 59 4c 3a 08 	mulss  0x8(%r10,%rdi,1),%xmm1
	points->p[points->p[i].assign].coord[ii]+=
    8fda:	f3 0f 58 e9          	addss  %xmm1,%xmm5
    8fde:	f3 0f 11 6d 00       	movss  %xmm5,0x0(%rbp)
      for (ii=0;ii<points->dim;ii++) {
    8fe3:	f3 0f 10 2a          	movss  (%rdx),%xmm5
    8fe7:	f3 0f 58 6e d8       	addss  -0x28(%rsi),%xmm5
  for (i=0;i<points->num;i++) {
    8fec:	49 83 c0 01          	add    $0x1,%r8
      points->p[points->p[i].assign].weight += points->p[i].weight;
    8ff0:	f3 0f 11 2a          	movss  %xmm5,(%rdx)
  for (i=0;i<points->num;i++) {
    8ff4:	48 83 c6 20          	add    $0x20,%rsi
    8ff8:	4d 39 e8             	cmp    %r13,%r8
    8ffb:	0f 85 40 fb ff ff    	jne    8b41 <_Z11contcentersP6Points+0x51>
}
    9001:	5b                   	pop    %rbx
    9002:	31 c0                	xor    %eax,%eax
    9004:	5d                   	pop    %rbp
    9005:	41 5c                	pop    %r12
    9007:	41 5d                	pop    %r13
    9009:	41 5e                	pop    %r14
    900b:	41 5f                	pop    %r15
    900d:	c3                   	retq   
    900e:	66 90                	xchg   %ax,%ax
    9010:	4d 89 dc             	mov    %r11,%r12
      for (ii=0;ii<points->dim;ii++) {
    9013:	31 db                	xor    %ebx,%ebx
    9015:	41 83 e4 07          	and    $0x7,%r12d
    9019:	0f 84 be 01 00 00    	je     91dd <_Z11contcentersP6Points+0x6ed>
    901f:	49 83 fc 01          	cmp    $0x1,%r12
    9023:	0f 84 74 01 00 00    	je     919d <_Z11contcentersP6Points+0x6ad>
    9029:	49 83 fc 02          	cmp    $0x2,%r12
    902d:	0f 84 31 01 00 00    	je     9164 <_Z11contcentersP6Points+0x674>
    9033:	49 83 fc 03          	cmp    $0x3,%r12
    9037:	0f 84 ee 00 00 00    	je     912b <_Z11contcentersP6Points+0x63b>
    903d:	49 83 fc 04          	cmp    $0x4,%r12
    9041:	0f 84 b1 00 00 00    	je     90f8 <_Z11contcentersP6Points+0x608>
    9047:	49 83 fc 05          	cmp    $0x5,%r12
    904b:	74 71                	je     90be <_Z11contcentersP6Points+0x5ce>
    904d:	49 83 fc 06          	cmp    $0x6,%r12
    9051:	74 32                	je     9085 <_Z11contcentersP6Points+0x595>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9053:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    9058:	66 0f ef c0          	pxor   %xmm0,%xmm0
      for (ii=0;ii<points->dim;ii++) {
    905c:	bb 01 00 00 00       	mov    $0x1,%ebx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9061:	f3 44 0f 5a 31       	cvtss2sd (%rcx),%xmm14
    9066:	f2 44 0f 59 f5       	mulsd  %xmm5,%xmm14
    906b:	f2 41 0f 5a c6       	cvtsd2ss %xmm14,%xmm0
    9070:	f3 0f 11 01          	movss  %xmm0,(%rcx)
	  points->p[i].coord[ii]*relweight;
    9074:	f3 41 0f 10 22       	movss  (%r10),%xmm4
    9079:	f3 0f 59 e1          	mulss  %xmm1,%xmm4
	points->p[points->p[i].assign].coord[ii]+=
    907d:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    9081:	f3 0f 11 01          	movss  %xmm0,(%rcx)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9085:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    908a:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    908f:	f3 44 0f 5a 1c 99    	cvtss2sd (%rcx,%rbx,4),%xmm11
    9095:	f2 44 0f 59 dd       	mulsd  %xmm5,%xmm11
    909a:	f2 45 0f 5a fb       	cvtsd2ss %xmm11,%xmm15
    909f:	f3 44 0f 11 3c 99    	movss  %xmm15,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    90a5:	f3 41 0f 10 1c 9a    	movss  (%r10,%rbx,4),%xmm3
    90ab:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
	points->p[points->p[i].assign].coord[ii]+=
    90af:	f3 44 0f 58 fb       	addss  %xmm3,%xmm15
    90b4:	f3 44 0f 11 3c 99    	movss  %xmm15,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    90ba:	48 83 c3 01          	add    $0x1,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    90be:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    90c3:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    90c8:	f3 44 0f 5a 24 99    	cvtss2sd (%rcx,%rbx,4),%xmm12
    90ce:	f2 44 0f 59 e5       	mulsd  %xmm5,%xmm12
    90d3:	f2 45 0f 5a ec       	cvtsd2ss %xmm12,%xmm13
    90d8:	f3 44 0f 11 2c 99    	movss  %xmm13,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    90de:	f3 45 0f 10 34 9a    	movss  (%r10,%rbx,4),%xmm14
    90e4:	f3 44 0f 59 f1       	mulss  %xmm1,%xmm14
	points->p[points->p[i].assign].coord[ii]+=
    90e9:	f3 45 0f 58 ee       	addss  %xmm14,%xmm13
    90ee:	f3 44 0f 11 2c 99    	movss  %xmm13,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    90f4:	48 83 c3 01          	add    $0x1,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    90f8:	66 0f ef c0          	pxor   %xmm0,%xmm0
    90fc:	66 0f ef e4          	pxor   %xmm4,%xmm4
    9100:	f3 0f 5a 04 99       	cvtss2sd (%rcx,%rbx,4),%xmm0
    9105:	f2 0f 59 c5          	mulsd  %xmm5,%xmm0
    9109:	f2 0f 5a e0          	cvtsd2ss %xmm0,%xmm4
    910d:	f3 0f 11 24 99       	movss  %xmm4,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    9112:	f3 45 0f 10 1c 9a    	movss  (%r10,%rbx,4),%xmm11
    9118:	f3 44 0f 59 d9       	mulss  %xmm1,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    911d:	f3 41 0f 58 e3       	addss  %xmm11,%xmm4
    9122:	f3 0f 11 24 99       	movss  %xmm4,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    9127:	48 83 c3 01          	add    $0x1,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    912b:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    9130:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    9135:	f3 44 0f 5a 3c 99    	cvtss2sd (%rcx,%rbx,4),%xmm15
    913b:	f2 44 0f 59 fd       	mulsd  %xmm5,%xmm15
    9140:	f2 45 0f 5a e7       	cvtsd2ss %xmm15,%xmm12
    9145:	f3 44 0f 11 24 99    	movss  %xmm12,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    914b:	f3 41 0f 10 1c 9a    	movss  (%r10,%rbx,4),%xmm3
    9151:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
	points->p[points->p[i].assign].coord[ii]+=
    9155:	f3 44 0f 58 e3       	addss  %xmm3,%xmm12
    915a:	f3 44 0f 11 24 99    	movss  %xmm12,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    9160:	48 83 c3 01          	add    $0x1,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9164:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    9169:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    916e:	f3 44 0f 5a 2c 99    	cvtss2sd (%rcx,%rbx,4),%xmm13
    9174:	f2 44 0f 59 ed       	mulsd  %xmm5,%xmm13
    9179:	f2 45 0f 5a f5       	cvtsd2ss %xmm13,%xmm14
    917e:	f3 44 0f 11 34 99    	movss  %xmm14,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    9184:	f3 41 0f 10 04 9a    	movss  (%r10,%rbx,4),%xmm0
    918a:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
	points->p[points->p[i].assign].coord[ii]+=
    918e:	f3 44 0f 58 f0       	addss  %xmm0,%xmm14
    9193:	f3 44 0f 11 34 99    	movss  %xmm14,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    9199:	48 83 c3 01          	add    $0x1,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    919d:	66 0f ef e4          	pxor   %xmm4,%xmm4
    91a1:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    91a6:	f3 0f 5a 24 99       	cvtss2sd (%rcx,%rbx,4),%xmm4
    91ab:	f2 0f 59 e5          	mulsd  %xmm5,%xmm4
    91af:	f2 44 0f 5a dc       	cvtsd2ss %xmm4,%xmm11
    91b4:	f3 44 0f 11 1c 99    	movss  %xmm11,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    91ba:	f3 45 0f 10 3c 9a    	movss  (%r10,%rbx,4),%xmm15
    91c0:	f3 44 0f 59 f9       	mulss  %xmm1,%xmm15
	points->p[points->p[i].assign].coord[ii]+=
    91c5:	f3 45 0f 58 df       	addss  %xmm15,%xmm11
    91ca:	f3 44 0f 11 1c 99    	movss  %xmm11,(%rcx,%rbx,4)
      for (ii=0;ii<points->dim;ii++) {
    91d0:	48 83 c3 01          	add    $0x1,%rbx
    91d4:	49 39 db             	cmp    %rbx,%r11
    91d7:	0f 84 06 fe ff ff    	je     8fe3 <_Z11contcentersP6Points+0x4f3>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    91dd:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    91e2:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
      for (ii=0;ii<points->dim;ii++) {
    91e7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    91eb:	f3 44 0f 5a 24 99    	cvtss2sd (%rcx,%rbx,4),%xmm12
    91f1:	66 0f ef c0          	pxor   %xmm0,%xmm0
      for (ii=0;ii<points->dim;ii++) {
    91f5:	4c 8d 4b 02          	lea    0x2(%rbx),%r9
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    91f9:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    91fe:	f2 44 0f 59 e5       	mulsd  %xmm5,%xmm12
    9203:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    9208:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
      for (ii=0;ii<points->dim;ii++) {
    920d:	48 8d 43 03          	lea    0x3(%rbx),%rax
    9211:	4c 8d 7b 04          	lea    0x4(%rbx),%r15
    9215:	48 8d 6b 05          	lea    0x5(%rbx),%rbp
    9219:	4c 8d 63 06          	lea    0x6(%rbx),%r12
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    921d:	f2 45 0f 5a ec       	cvtsd2ss %xmm12,%xmm13
    9222:	f3 44 0f 11 2c 99    	movss  %xmm13,(%rcx,%rbx,4)
	  points->p[i].coord[ii]*relweight;
    9228:	f3 41 0f 10 1c 9a    	movss  (%r10,%rbx,4),%xmm3
    922e:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
	points->p[points->p[i].assign].coord[ii]+=
    9232:	f3 44 0f 58 eb       	addss  %xmm3,%xmm13
    9237:	f3 44 0f 11 2c 99    	movss  %xmm13,(%rcx,%rbx,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    923d:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    9242:	f3 44 0f 5a 34 b9    	cvtss2sd (%rcx,%rdi,4),%xmm14
    9248:	f2 44 0f 59 f5       	mulsd  %xmm5,%xmm14
    924d:	f2 41 0f 5a c6       	cvtsd2ss %xmm14,%xmm0
    9252:	f3 0f 11 04 b9       	movss  %xmm0,(%rcx,%rdi,4)
	  points->p[i].coord[ii]*relweight;
    9257:	f3 41 0f 10 24 ba    	movss  (%r10,%rdi,4),%xmm4
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    925d:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
	  points->p[i].coord[ii]*relweight;
    9262:	f3 0f 59 e1          	mulss  %xmm1,%xmm4
	points->p[points->p[i].assign].coord[ii]+=
    9266:	f3 0f 58 c4          	addss  %xmm4,%xmm0
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    926a:	66 0f ef e4          	pxor   %xmm4,%xmm4
	points->p[points->p[i].assign].coord[ii]+=
    926e:	f3 0f 11 04 b9       	movss  %xmm0,(%rcx,%rdi,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9273:	66 0f ef c0          	pxor   %xmm0,%xmm0
      for (ii=0;ii<points->dim;ii++) {
    9277:	48 8d 7b 07          	lea    0x7(%rbx),%rdi
    927b:	48 83 c3 08          	add    $0x8,%rbx
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    927f:	f3 46 0f 5a 1c 89    	cvtss2sd (%rcx,%r9,4),%xmm11
    9285:	f2 44 0f 59 dd       	mulsd  %xmm5,%xmm11
    928a:	f2 45 0f 5a fb       	cvtsd2ss %xmm11,%xmm15
    928f:	f3 46 0f 11 3c 89    	movss  %xmm15,(%rcx,%r9,4)
	  points->p[i].coord[ii]*relweight;
    9295:	f3 47 0f 10 24 8a    	movss  (%r10,%r9,4),%xmm12
    929b:	f3 44 0f 59 e1       	mulss  %xmm1,%xmm12
	points->p[points->p[i].assign].coord[ii]+=
    92a0:	f3 45 0f 58 fc       	addss  %xmm12,%xmm15
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    92a5:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
	points->p[points->p[i].assign].coord[ii]+=
    92aa:	f3 46 0f 11 3c 89    	movss  %xmm15,(%rcx,%r9,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    92b0:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    92b5:	f3 44 0f 5a 2c 81    	cvtss2sd (%rcx,%rax,4),%xmm13
    92bb:	f2 44 0f 59 ed       	mulsd  %xmm5,%xmm13
    92c0:	f2 45 0f 5a f5       	cvtsd2ss %xmm13,%xmm14
    92c5:	f3 44 0f 11 34 81    	movss  %xmm14,(%rcx,%rax,4)
	  points->p[i].coord[ii]*relweight;
    92cb:	f3 41 0f 10 1c 82    	movss  (%r10,%rax,4),%xmm3
    92d1:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
	points->p[points->p[i].assign].coord[ii]+=
    92d5:	f3 44 0f 58 f3       	addss  %xmm3,%xmm14
    92da:	f3 44 0f 11 34 81    	movss  %xmm14,(%rcx,%rax,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    92e0:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    92e5:	f3 42 0f 5a 04 b9    	cvtss2sd (%rcx,%r15,4),%xmm0
    92eb:	f2 0f 59 c5          	mulsd  %xmm5,%xmm0
    92ef:	f2 0f 5a e0          	cvtsd2ss %xmm0,%xmm4
    92f3:	f3 42 0f 11 24 b9    	movss  %xmm4,(%rcx,%r15,4)
	  points->p[i].coord[ii]*relweight;
    92f9:	f3 47 0f 10 1c ba    	movss  (%r10,%r15,4),%xmm11
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    92ff:	66 0f ef c0          	pxor   %xmm0,%xmm0
	  points->p[i].coord[ii]*relweight;
    9303:	f3 44 0f 59 d9       	mulss  %xmm1,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    9308:	f3 41 0f 58 e3       	addss  %xmm11,%xmm4
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    930d:	66 45 0f ef db       	pxor   %xmm11,%xmm11
	points->p[points->p[i].assign].coord[ii]+=
    9312:	f3 42 0f 11 24 b9    	movss  %xmm4,(%rcx,%r15,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9318:	66 0f ef e4          	pxor   %xmm4,%xmm4
    931c:	f3 44 0f 5a 3c a9    	cvtss2sd (%rcx,%rbp,4),%xmm15
    9322:	f2 44 0f 59 fd       	mulsd  %xmm5,%xmm15
    9327:	f2 45 0f 5a e7       	cvtsd2ss %xmm15,%xmm12
    932c:	f3 44 0f 11 24 a9    	movss  %xmm12,(%rcx,%rbp,4)
	  points->p[i].coord[ii]*relweight;
    9332:	f3 45 0f 10 2c aa    	movss  (%r10,%rbp,4),%xmm13
    9338:	f3 44 0f 59 e9       	mulss  %xmm1,%xmm13
	points->p[points->p[i].assign].coord[ii]+=
    933d:	f3 45 0f 58 e5       	addss  %xmm13,%xmm12
    9342:	f3 44 0f 11 24 a9    	movss  %xmm12,(%rcx,%rbp,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9348:	f3 46 0f 5a 34 a1    	cvtss2sd (%rcx,%r12,4),%xmm14
    934e:	f2 44 0f 59 f5       	mulsd  %xmm5,%xmm14
    9353:	f2 41 0f 5a c6       	cvtsd2ss %xmm14,%xmm0
    9358:	f3 42 0f 11 04 a1    	movss  %xmm0,(%rcx,%r12,4)
	  points->p[i].coord[ii]*relweight;
    935e:	f3 43 0f 10 1c a2    	movss  (%r10,%r12,4),%xmm3
    9364:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
	points->p[points->p[i].assign].coord[ii]+=
    9368:	f3 0f 58 c3          	addss  %xmm3,%xmm0
    936c:	f3 42 0f 11 04 a1    	movss  %xmm0,(%rcx,%r12,4)
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    9372:	f3 0f 5a 24 b9       	cvtss2sd (%rcx,%rdi,4),%xmm4
    9377:	f2 0f 59 e5          	mulsd  %xmm5,%xmm4
    937b:	f2 44 0f 5a dc       	cvtsd2ss %xmm4,%xmm11
    9380:	f3 44 0f 11 1c b9    	movss  %xmm11,(%rcx,%rdi,4)
	  points->p[i].coord[ii]*relweight;
    9386:	f3 45 0f 10 3c ba    	movss  (%r10,%rdi,4),%xmm15
    938c:	f3 44 0f 59 f9       	mulss  %xmm1,%xmm15
	points->p[points->p[i].assign].coord[ii]+=
    9391:	f3 45 0f 58 df       	addss  %xmm15,%xmm11
    9396:	f3 44 0f 11 1c b9    	movss  %xmm11,(%rcx,%rdi,4)
      for (ii=0;ii<points->dim;ii++) {
    939c:	49 39 db             	cmp    %rbx,%r11
    939f:	0f 85 38 fe ff ff    	jne    91dd <_Z11contcentersP6Points+0x6ed>
    93a5:	e9 39 fc ff ff       	jmpq   8fe3 <_Z11contcentersP6Points+0x4f3>
	  points->p[i].coord[ii]*relweight;
    93aa:	4c 89 d7             	mov    %r10,%rdi
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    93ad:	49 89 c9             	mov    %rcx,%r9
    93b0:	48 89 c8             	mov    %rcx,%rax
	  points->p[i].coord[ii]*relweight;
    93b3:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
    93ba:	00 00 
    93bc:	e9 50 f9 ff ff       	jmpq   8d11 <_Z11contcentersP6Points+0x221>
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
    93c1:	0f 12 50 18          	movlps 0x18(%rax),%xmm2
    93c5:	0f 5a 58 10          	cvtps2pd 0x10(%rax),%xmm3
    93c9:	4c 8b 64 24 f0       	mov    -0x10(%rsp),%r12
    93ce:	bd 20 00 00 00       	mov    $0x20,%ebp
    93d3:	66 0f 59 d8          	mulpd  %xmm0,%xmm3
    93d7:	44 0f 5a e2          	cvtps2pd %xmm2,%xmm12
    93db:	66 44 0f 59 e0       	mulpd  %xmm0,%xmm12
    93e0:	49 83 c4 02          	add    $0x2,%r12
    93e4:	66 44 0f 5a eb       	cvtpd2ps %xmm3,%xmm13
    93e9:	66 45 0f 5a dc       	cvtpd2ps %xmm12,%xmm11
    93ee:	45 0f 16 eb          	movlhps %xmm11,%xmm13
    93f2:	45 0f 11 69 10       	movups %xmm13,0x10(%r9)
	  points->p[i].coord[ii]*relweight;
    93f7:	44 0f 10 77 10       	movups 0x10(%rdi),%xmm14
    93fc:	44 0f 59 f4          	mulps  %xmm4,%xmm14
	points->p[points->p[i].assign].coord[ii]+=
    9400:	45 0f 58 ee          	addps  %xmm14,%xmm13
    9404:	45 0f 11 69 10       	movups %xmm13,0x10(%r9)
      for (ii=0;ii<points->dim;ii++) {
    9409:	e9 76 f9 ff ff       	jmpq   8d84 <_Z11contcentersP6Points+0x294>
    940e:	66 90                	xchg   %ax,%ax

0000000000009410 <_Z11copycentersP6PointsS0_Pll>:
{
    9410:	f3 0f 1e fa          	endbr64 
    9414:	41 57                	push   %r15
    9416:	41 56                	push   %r14
    9418:	49 89 f6             	mov    %rsi,%r14
  bool *is_a_median = (bool *) calloc(points->num, sizeof(bool));
    941b:	be 01 00 00 00       	mov    $0x1,%esi
{
    9420:	41 55                	push   %r13
    9422:	49 89 fd             	mov    %rdi,%r13
    9425:	41 54                	push   %r12
    9427:	55                   	push   %rbp
    9428:	53                   	push   %rbx
    9429:	48 83 ec 28          	sub    $0x28,%rsp
  bool *is_a_median = (bool *) calloc(points->num, sizeof(bool));
    942d:	4c 8b 27             	mov    (%rdi),%r12
{
    9430:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  bool *is_a_median = (bool *) calloc(points->num, sizeof(bool));
    9435:	4c 89 e7             	mov    %r12,%rdi
{
    9438:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  bool *is_a_median = (bool *) calloc(points->num, sizeof(bool));
    943d:	e8 0e 8f ff ff       	callq  2350 <calloc@plt>
    9442:	4d 8b 3e             	mov    (%r14),%r15
    9445:	48 89 c5             	mov    %rax,%rbp
  for ( i = 0; i < points->num; i++ ) {
    9448:	4d 85 e4             	test   %r12,%r12
    944b:	0f 8e 17 01 00 00    	jle    9568 <_Z11copycentersP6PointsS0_Pll+0x158>
    9451:	49 8b 4d 10          	mov    0x10(%r13),%rcx
    9455:	4c 89 e2             	mov    %r12,%rdx
    9458:	48 c1 e2 05          	shl    $0x5,%rdx
    945c:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    9460:	48 83 ea 20          	sub    $0x20,%rdx
    9464:	48 89 cb             	mov    %rcx,%rbx
    9467:	48 c1 ea 05          	shr    $0x5,%rdx
    946b:	48 83 c2 01          	add    $0x1,%rdx
    946f:	83 e2 07             	and    $0x7,%edx
    9472:	74 7f                	je     94f3 <_Z11copycentersP6PointsS0_Pll+0xe3>
    9474:	48 83 fa 01          	cmp    $0x1,%rdx
    9478:	74 67                	je     94e1 <_Z11copycentersP6PointsS0_Pll+0xd1>
    947a:	48 83 fa 02          	cmp    $0x2,%rdx
    947e:	74 53                	je     94d3 <_Z11copycentersP6PointsS0_Pll+0xc3>
    9480:	48 83 fa 03          	cmp    $0x3,%rdx
    9484:	74 3f                	je     94c5 <_Z11copycentersP6PointsS0_Pll+0xb5>
    9486:	48 83 fa 04          	cmp    $0x4,%rdx
    948a:	74 2b                	je     94b7 <_Z11copycentersP6PointsS0_Pll+0xa7>
    948c:	48 83 fa 05          	cmp    $0x5,%rdx
    9490:	74 17                	je     94a9 <_Z11copycentersP6PointsS0_Pll+0x99>
    9492:	48 83 fa 06          	cmp    $0x6,%rdx
    9496:	0f 85 64 01 00 00    	jne    9600 <_Z11copycentersP6PointsS0_Pll+0x1f0>
    is_a_median[points->p[i].assign] = 1;
    949c:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    94a0:	48 83 c3 20          	add    $0x20,%rbx
    94a4:	c6 44 3d 00 01       	movb   $0x1,0x0(%rbp,%rdi,1)
    94a9:	4c 8b 43 10          	mov    0x10(%rbx),%r8
    94ad:	48 83 c3 20          	add    $0x20,%rbx
    94b1:	42 c6 44 05 00 01    	movb   $0x1,0x0(%rbp,%r8,1)
    94b7:	4c 8b 4b 10          	mov    0x10(%rbx),%r9
    94bb:	48 83 c3 20          	add    $0x20,%rbx
    94bf:	42 c6 44 0d 00 01    	movb   $0x1,0x0(%rbp,%r9,1)
    94c5:	4c 8b 53 10          	mov    0x10(%rbx),%r10
    94c9:	48 83 c3 20          	add    $0x20,%rbx
    94cd:	42 c6 44 15 00 01    	movb   $0x1,0x0(%rbp,%r10,1)
    94d3:	4c 8b 5b 10          	mov    0x10(%rbx),%r11
    94d7:	48 83 c3 20          	add    $0x20,%rbx
    94db:	42 c6 44 1d 00 01    	movb   $0x1,0x0(%rbp,%r11,1)
    94e1:	48 8b 53 10          	mov    0x10(%rbx),%rdx
    94e5:	48 83 c3 20          	add    $0x20,%rbx
    94e9:	c6 44 15 00 01       	movb   $0x1,0x0(%rbp,%rdx,1)
  for ( i = 0; i < points->num; i++ ) {
    94ee:	48 39 de             	cmp    %rbx,%rsi
    94f1:	74 5e                	je     9551 <_Z11copycentersP6PointsS0_Pll+0x141>
    is_a_median[points->p[i].assign] = 1;
    94f3:	48 8b 43 10          	mov    0x10(%rbx),%rax
    94f7:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
    94fb:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
    9502:	4c 8b 83 50 ff ff ff 	mov    -0xb0(%rbx),%r8
    9509:	4c 8b 8b 70 ff ff ff 	mov    -0x90(%rbx),%r9
    9510:	4c 8b 53 90          	mov    -0x70(%rbx),%r10
    9514:	4c 8b 5b b0          	mov    -0x50(%rbx),%r11
    9518:	c6 44 05 00 01       	movb   $0x1,0x0(%rbp,%rax,1)
    951d:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
    9521:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
    9525:	c6 44 3d 00 01       	movb   $0x1,0x0(%rbp,%rdi,1)
    952a:	42 c6 44 05 00 01    	movb   $0x1,0x0(%rbp,%r8,1)
    9530:	42 c6 44 0d 00 01    	movb   $0x1,0x0(%rbp,%r9,1)
    9536:	42 c6 44 15 00 01    	movb   $0x1,0x0(%rbp,%r10,1)
    953c:	42 c6 44 1d 00 01    	movb   $0x1,0x0(%rbp,%r11,1)
    9542:	c6 44 15 00 01       	movb   $0x1,0x0(%rbp,%rdx,1)
    9547:	c6 44 05 00 01       	movb   $0x1,0x0(%rbp,%rax,1)
  for ( i = 0; i < points->num; i++ ) {
    954c:	48 39 de             	cmp    %rbx,%rsi
    954f:	75 a2                	jne    94f3 <_Z11copycentersP6PointsS0_Pll+0xe3>
  for ( i = 0; i < points->num; i++ ) {
    9551:	31 db                	xor    %ebx,%ebx
    9553:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    if ( is_a_median[i] ) {
    9558:	80 7c 1d 00 00       	cmpb   $0x0,0x0(%rbp,%rbx,1)
    955d:	75 29                	jne    9588 <_Z11copycentersP6PointsS0_Pll+0x178>
  for ( i = 0; i < points->num; i++ ) {
    955f:	48 83 c3 01          	add    $0x1,%rbx
    9563:	4c 39 e3             	cmp    %r12,%rbx
    9566:	7c f0                	jl     9558 <_Z11copycentersP6PointsS0_Pll+0x148>
  centers->num = k;
    9568:	4d 89 3e             	mov    %r15,(%r14)
}
    956b:	48 83 c4 28          	add    $0x28,%rsp
  free(is_a_median);
    956f:	48 89 ef             	mov    %rbp,%rdi
}
    9572:	5b                   	pop    %rbx
    9573:	5d                   	pop    %rbp
    9574:	41 5c                	pop    %r12
    9576:	41 5d                	pop    %r13
    9578:	41 5e                	pop    %r14
    957a:	41 5f                	pop    %r15
  free(is_a_median);
    957c:	e9 af 8e ff ff       	jmpq   2430 <free@plt>
    9581:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      memcpy( centers->p[k].coord, points->p[i].coord, points->dim * sizeof(float));
    9588:	49 8b 76 10          	mov    0x10(%r14),%rsi
    958c:	49 89 d8             	mov    %rbx,%r8
    958f:	4d 89 fc             	mov    %r15,%r12
    9592:	49 63 55 08          	movslq 0x8(%r13),%rdx
    9596:	49 c1 e0 05          	shl    $0x5,%r8
    959a:	49 c1 e4 05          	shl    $0x5,%r12
  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
    959e:	4a 8b 7c 26 08       	mov    0x8(%rsi,%r12,1),%rdi
    95a3:	4a 8b 74 01 08       	mov    0x8(%rcx,%r8,1),%rsi
    95a8:	48 c1 e2 02          	shl    $0x2,%rdx
    95ac:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
    95b1:	e8 da 8d ff ff       	callq  2390 <memcpy@plt>
      centers->p[k].weight = points->p[i].weight;
    95b6:	49 8b 4d 10          	mov    0x10(%r13),%rcx
    95ba:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
      centerIDs[k] = i + offset;
    95bf:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
      centers->p[k].weight = points->p[i].weight;
    95c4:	4d 8b 4e 10          	mov    0x10(%r14),%r9
    95c8:	f3 0f 10 04 39       	movss  (%rcx,%rdi,1),%xmm0
      centerIDs[k] = i + offset;
    95cd:	4c 8b 5c 24 10       	mov    0x10(%rsp),%r11
    95d2:	49 01 da             	add    %rbx,%r10
  for ( i = 0; i < points->num; i++ ) {
    95d5:	48 83 c3 01          	add    $0x1,%rbx
      centers->p[k].weight = points->p[i].weight;
    95d9:	f3 43 0f 11 04 21    	movss  %xmm0,(%r9,%r12,1)
      centerIDs[k] = i + offset;
    95df:	4f 89 14 fb          	mov    %r10,(%r11,%r15,8)
      k++;
    95e3:	4d 8b 65 00          	mov    0x0(%r13),%r12
    95e7:	49 83 c7 01          	add    $0x1,%r15
  for ( i = 0; i < points->num; i++ ) {
    95eb:	4c 39 e3             	cmp    %r12,%rbx
    95ee:	0f 8c 64 ff ff ff    	jl     9558 <_Z11copycentersP6PointsS0_Pll+0x148>
    95f4:	e9 6f ff ff ff       	jmpq   9568 <_Z11copycentersP6PointsS0_Pll+0x158>
    95f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    is_a_median[points->p[i].assign] = 1;
    9600:	48 8b 41 10          	mov    0x10(%rcx),%rax
    9604:	48 8d 59 20          	lea    0x20(%rcx),%rbx
    9608:	c6 44 05 00 01       	movb   $0x1,0x0(%rbp,%rax,1)
  for ( i = 0; i < points->num; i++ ) {
    960d:	e9 8a fe ff ff       	jmpq   949c <_Z11copycentersP6PointsS0_Pll+0x8c>
    9612:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    9619:	00 00 00 00 
    961d:	0f 1f 00             	nopl   (%rax)

0000000000009620 <_Z11localSearchP6PointsllPl>:
void localSearch( Points* points, long kmin, long kmax, long* kfinal ) {
    9620:	f3 0f 1e fa          	endbr64 
    9624:	41 57                	push   %r15
    9626:	41 56                	push   %r14
    9628:	49 89 ce             	mov    %rcx,%r14
    962b:	41 55                	push   %r13
    962d:	41 54                	push   %r12
    962f:	55                   	push   %rbp
    9630:	53                   	push   %rbx
    pthread_t* threads = new pthread_t[nproc];
    9631:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
void localSearch( Points* points, long kmin, long kmax, long* kfinal ) {
    9638:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    963f:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    9644:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    9649:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    pthread_t* threads = new pthread_t[nproc];
    964e:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffffff,%rdx
    9655:	ff ff 0f 
void localSearch( Points* points, long kmin, long kmax, long* kfinal ) {
    9658:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    965f:	00 00 
    9661:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
    9668:	00 
    9669:	31 c0                	xor    %eax,%eax
    pthread_t* threads = new pthread_t[nproc];
    966b:	48 63 05 96 5a 00 00 	movslq 0x5a96(%rip),%rax        # f108 <_ZL5nproc>
    9672:	48 8d 3c c5 00 00 00 	lea    0x0(,%rax,8),%rdi
    9679:	00 
    967a:	48 39 d0             	cmp    %rdx,%rax
    967d:	48 0f 47 fb          	cmova  %rbx,%rdi
    9681:	e8 5a 8c ff ff       	callq  22e0 <_Znam@plt>
    pkmedian_arg_t* arg = new pkmedian_arg_t[nproc];
    9686:	48 63 0d 7b 5a 00 00 	movslq 0x5a7b(%rip),%rcx        # f108 <_ZL5nproc>
    968d:	48 89 df             	mov    %rbx,%rdi
    9690:	48 be aa aa aa aa aa 	movabs $0x2aaaaaaaaaaaaaa,%rsi
    9697:	aa aa 02 
    pthread_t* threads = new pthread_t[nproc];
    969a:	49 89 c4             	mov    %rax,%r12
    pkmedian_arg_t* arg = new pkmedian_arg_t[nproc];
    969d:	48 39 f1             	cmp    %rsi,%rcx
    96a0:	77 08                	ja     96aa <_Z11localSearchP6PointsllPl+0x8a>
    96a2:	48 8d 3c 49          	lea    (%rcx,%rcx,2),%rdi
    96a6:	48 c1 e7 04          	shl    $0x4,%rdi
    96aa:	e8 31 8c ff ff       	callq  22e0 <_Znam@plt>
    pthread_barrier_init(&barrier,NULL,nproc);
    96af:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
    96b4:	8b 15 4e 5a 00 00    	mov    0x5a4e(%rip),%edx        # f108 <_ZL5nproc>
    96ba:	31 f6                	xor    %esi,%esi
    96bc:	48 89 ef             	mov    %rbp,%rdi
    pkmedian_arg_t* arg = new pkmedian_arg_t[nproc];
    96bf:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    pthread_barrier_init(&barrier,NULL,nproc);
    96c4:	e8 f7 18 00 00       	callq  afc0 <_Z19parsec_barrier_initP16parsec_barrier_tPKij>
    for( int i = 0; i < nproc; i++ ) {
    96c9:	8b 15 39 5a 00 00    	mov    0x5a39(%rip),%edx        # f108 <_ZL5nproc>
    96cf:	85 d2                	test   %edx,%edx
    96d1:	0f 8e 41 01 00 00    	jle    9818 <_Z11localSearchP6PointsllPl+0x1f8>
    96d7:	f3 0f 7e 4c 24 10    	movq   0x10(%rsp),%xmm1
    96dd:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
    96e2:	4c 89 e3             	mov    %r12,%rbx
    96e5:	45 31 ff             	xor    %r15d,%r15d
    96e8:	0f 16 4c 24 28       	movhps 0x28(%rsp),%xmm1
    96ed:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
    96f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
      arg[i].points = points;
    96f8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
      arg[i].kmin = kmin;
    96fd:	66 0f 6f 44 24 10    	movdqa 0x10(%rsp),%xmm0
      arg[i].pid = i;
    9703:	45 89 7d 20          	mov    %r15d,0x20(%r13)
    9707:	31 c0                	xor    %eax,%eax
      arg[i].kfinal = kfinal;
    9709:	4d 89 75 18          	mov    %r14,0x18(%r13)
    970d:	48 8d 35 05 2a 00 00 	lea    0x2a05(%rip),%rsi        # c119 <_IO_stdin_used+0x119>
    9714:	41 0f 18 8d 98 00 00 	prefetcht0 0x98(%r13)
    971b:	00 
    971c:	41 0f 18 8d a8 00 00 	prefetcht0 0xa8(%r13)
    9723:	00 
      arg[i].points = points;
    9724:	49 89 7d 00          	mov    %rdi,0x0(%r13)
    9728:	bf 01 00 00 00       	mov    $0x1,%edi
      arg[i].barrier = &barrier;
    972d:	49 89 6d 28          	mov    %rbp,0x28(%r13)
      arg[i].kmin = kmin;
    9731:	41 0f 11 45 08       	movups %xmm0,0x8(%r13)
    9736:	e8 95 8b ff ff       	callq  22d0 <__printf_chk@plt>
    973b:	48 83 ec 08          	sub    $0x8,%rsp
    973f:	44 89 fa             	mov    %r15d,%edx
    9742:	31 c0                	xor    %eax,%eax
    9744:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    974b:	48 8d 35 56 2b 00 00 	lea    0x2b56(%rip),%rsi        # c2a8 <_IO_stdin_used+0x2a8>
    9752:	bf 01 00 00 00       	mov    $0x1,%edi
    for( int i = 0; i < nproc; i++ ) {
    9757:	41 83 c7 01          	add    $0x1,%r15d
    975b:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9762:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9769:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9770:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9777:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    977e:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9785:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    978c:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    9793:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    979a:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    97a1:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    97a8:	ff b4 24 98 00 00 00 	pushq  0x98(%rsp)
    97af:	e8 1c 8b ff ff       	callq  22d0 <__printf_chk@plt>
      pthread_create(threads+i,NULL,localSearchSub,(void*)&arg[i]);
    97b4:	4c 89 e9             	mov    %r13,%rcx
    97b7:	48 89 df             	mov    %rbx,%rdi
    97ba:	48 83 c4 70          	add    $0x70,%rsp
    97be:	48 8d 15 eb f2 ff ff 	lea    -0xd15(%rip),%rdx        # 8ab0 <_Z14localSearchSubPv>
    97c5:	31 f6                	xor    %esi,%esi
    97c7:	49 83 c5 30          	add    $0x30,%r13
    97cb:	48 83 c3 08          	add    $0x8,%rbx
    97cf:	e8 5c 8b ff ff       	callq  2330 <pthread_create@plt>
    97d4:	48 8d 3d 4a 29 00 00 	lea    0x294a(%rip),%rdi        # c125 <_IO_stdin_used+0x125>
    97db:	e8 10 8d ff ff       	callq  24f0 <puts@plt>
    for( int i = 0; i < nproc; i++ ) {
    97e0:	8b 15 22 59 00 00    	mov    0x5922(%rip),%edx        # f108 <_ZL5nproc>
    97e6:	44 39 fa             	cmp    %r15d,%edx
    97e9:	0f 8f 09 ff ff ff    	jg     96f8 <_Z11localSearchP6PointsllPl+0xd8>
    for ( int i = 0; i < nproc; i++) {
    97ef:	85 d2                	test   %edx,%edx
    97f1:	7e 25                	jle    9818 <_Z11localSearchP6PointsllPl+0x1f8>
    97f3:	45 31 f6             	xor    %r14d,%r14d
    97f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    97fd:	00 00 00 
      pthread_join(threads[i],NULL);
    9800:	4b 8b 3c f4          	mov    (%r12,%r14,8),%rdi
    9804:	31 f6                	xor    %esi,%esi
    9806:	49 83 c6 01          	add    $0x1,%r14
    980a:	e8 01 8b ff ff       	callq  2310 <pthread_join@plt>
    for ( int i = 0; i < nproc; i++) {
    980f:	44 39 35 f2 58 00 00 	cmp    %r14d,0x58f2(%rip)        # f108 <_ZL5nproc>
    9816:	7f e8                	jg     9800 <_Z11localSearchP6PointsllPl+0x1e0>
    delete[] threads;
    9818:	4c 89 e7             	mov    %r12,%rdi
    981b:	e8 50 8c ff ff       	callq  2470 <_ZdaPv@plt>
    delete[] arg;
    9820:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    9825:	e8 46 8c ff ff       	callq  2470 <_ZdaPv@plt>
    pthread_barrier_destroy(&barrier);
    982a:	48 89 ef             	mov    %rbp,%rdi
    982d:	e8 1e 18 00 00       	callq  b050 <_Z22parsec_barrier_destroyP16parsec_barrier_t>
}
    9832:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
    9839:	00 
    983a:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    9841:	00 00 
    9843:	75 12                	jne    9857 <_Z11localSearchP6PointsllPl+0x237>
    9845:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    984c:	5b                   	pop    %rbx
    984d:	5d                   	pop    %rbp
    984e:	41 5c                	pop    %r12
    9850:	41 5d                	pop    %r13
    9852:	41 5e                	pop    %r14
    9854:	41 5f                	pop    %r15
    9856:	c3                   	retq   
    9857:	e8 94 8b ff ff       	callq  23f0 <__stack_chk_fail@plt>
    985c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000009860 <_Z12outcenterIDsP6PointsPlPc>:
void outcenterIDs( Points* centers, long* centerIDs, char* outfile ) {
    9860:	f3 0f 1e fa          	endbr64 
    9864:	41 57                	push   %r15
    9866:	49 89 ff             	mov    %rdi,%r15
  FILE* fp = fopen(outfile, "w");
    9869:	48 89 d7             	mov    %rdx,%rdi
void outcenterIDs( Points* centers, long* centerIDs, char* outfile ) {
    986c:	41 56                	push   %r14
    986e:	41 55                	push   %r13
    9870:	41 54                	push   %r12
    9872:	55                   	push   %rbp
    9873:	53                   	push   %rbx
    9874:	48 89 d3             	mov    %rdx,%rbx
    9877:	48 83 ec 18          	sub    $0x18,%rsp
    987b:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  FILE* fp = fopen(outfile, "w");
    9880:	48 8d 35 b4 28 00 00 	lea    0x28b4(%rip),%rsi        # c13b <_IO_stdin_used+0x13b>
    9887:	e8 94 8b ff ff       	callq  2420 <fopen@plt>
  if( fp==NULL ) {
    988c:	48 85 c0             	test   %rax,%rax
    988f:	0f 84 e8 05 00 00    	je     9e7d <_Z12outcenterIDsP6PointsPlPc+0x61d>
  int* is_a_median = (int*)calloc( sizeof(int), centers->num );
    9895:	49 8b 1f             	mov    (%r15),%rbx
    9898:	bf 04 00 00 00       	mov    $0x4,%edi
    989d:	49 89 c4             	mov    %rax,%r12
    98a0:	48 89 de             	mov    %rbx,%rsi
    98a3:	e8 a8 8a ff ff       	callq  2350 <calloc@plt>
    98a8:	48 89 c5             	mov    %rax,%rbp
  for( int i =0 ; i< centers->num; i++ ) {
    98ab:	48 85 db             	test   %rbx,%rbx
    98ae:	0f 8e 7a 05 00 00    	jle    9e2e <_Z12outcenterIDsP6PointsPlPc+0x5ce>
    is_a_median[centers->p[i].assign] = 1;
    98b4:	49 8b 57 10          	mov    0x10(%r15),%rdx
    98b8:	48 83 fb 02          	cmp    $0x2,%rbx
    98bc:	0f 8e b3 05 00 00    	jle    9e75 <_Z12outcenterIDsP6PointsPlPc+0x615>
    98c2:	48 8d 73 fd          	lea    -0x3(%rbx),%rsi
    98c6:	48 8d 82 f0 02 00 00 	lea    0x2f0(%rdx),%rax
  for( int i =0 ; i< centers->num; i++ ) {
    98cd:	45 31 c9             	xor    %r9d,%r9d
    98d0:	48 d1 ee             	shr    %rsi
    98d3:	8d 7c 36 02          	lea    0x2(%rsi,%rsi,1),%edi
    98d7:	83 c6 01             	add    $0x1,%esi
    98da:	83 e6 07             	and    $0x7,%esi
    98dd:	0f 84 36 01 00 00    	je     9a19 <_Z12outcenterIDsP6PointsPlPc+0x1b9>
    98e3:	83 fe 01             	cmp    $0x1,%esi
    98e6:	0f 84 fa 00 00 00    	je     99e6 <_Z12outcenterIDsP6PointsPlPc+0x186>
    98ec:	83 fe 02             	cmp    $0x2,%esi
    98ef:	0f 84 c6 00 00 00    	je     99bb <_Z12outcenterIDsP6PointsPlPc+0x15b>
    98f5:	83 fe 03             	cmp    $0x3,%esi
    98f8:	0f 84 92 00 00 00    	je     9990 <_Z12outcenterIDsP6PointsPlPc+0x130>
    98fe:	83 fe 04             	cmp    $0x4,%esi
    9901:	74 64                	je     9967 <_Z12outcenterIDsP6PointsPlPc+0x107>
    9903:	83 fe 05             	cmp    $0x5,%esi
    9906:	74 34                	je     993c <_Z12outcenterIDsP6PointsPlPc+0xdc>
    9908:	83 fe 06             	cmp    $0x6,%esi
    990b:	0f 85 33 05 00 00    	jne    9e44 <_Z12outcenterIDsP6PointsPlPc+0x5e4>
    is_a_median[centers->p[i].assign] = 1;
    9911:	4c 8b 90 20 fd ff ff 	mov    -0x2e0(%rax),%r10
    9918:	4c 8b 98 40 fd ff ff 	mov    -0x2c0(%rax),%r11
    991f:	0f 18 08             	prefetcht0 (%rax)
    9922:	41 83 c1 02          	add    $0x2,%r9d
    9926:	48 83 c0 40          	add    $0x40,%rax
    992a:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9931:	00 00 
    9933:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    993a:	00 00 
    993c:	4c 8b a8 20 fd ff ff 	mov    -0x2e0(%rax),%r13
    9943:	4c 8b b0 40 fd ff ff 	mov    -0x2c0(%rax),%r14
    994a:	0f 18 08             	prefetcht0 (%rax)
    994d:	41 83 c1 02          	add    $0x2,%r9d
    9951:	48 83 c0 40          	add    $0x40,%rax
    9955:	42 c7 44 ad 00 01 00 	movl   $0x1,0x0(%rbp,%r13,4)
    995c:	00 00 
    995e:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9965:	00 00 
    9967:	48 8b b0 20 fd ff ff 	mov    -0x2e0(%rax),%rsi
    996e:	48 8b 88 40 fd ff ff 	mov    -0x2c0(%rax),%rcx
    9975:	0f 18 08             	prefetcht0 (%rax)
    9978:	41 83 c1 02          	add    $0x2,%r9d
    997c:	48 83 c0 40          	add    $0x40,%rax
    9980:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9987:	00 
    9988:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    998f:	00 
    9990:	4c 8b 80 20 fd ff ff 	mov    -0x2e0(%rax),%r8
    9997:	4c 8b 90 40 fd ff ff 	mov    -0x2c0(%rax),%r10
    999e:	0f 18 08             	prefetcht0 (%rax)
    99a1:	41 83 c1 02          	add    $0x2,%r9d
    99a5:	48 83 c0 40          	add    $0x40,%rax
    99a9:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    99b0:	00 00 
    99b2:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    99b9:	00 00 
    99bb:	4c 8b 98 20 fd ff ff 	mov    -0x2e0(%rax),%r11
    99c2:	4c 8b a8 40 fd ff ff 	mov    -0x2c0(%rax),%r13
    99c9:	0f 18 08             	prefetcht0 (%rax)
    99cc:	41 83 c1 02          	add    $0x2,%r9d
    99d0:	48 83 c0 40          	add    $0x40,%rax
    99d4:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    99db:	00 00 
    99dd:	42 c7 44 ad 00 01 00 	movl   $0x1,0x0(%rbp,%r13,4)
    99e4:	00 00 
    99e6:	4c 8b b0 20 fd ff ff 	mov    -0x2e0(%rax),%r14
    99ed:	48 8b b0 40 fd ff ff 	mov    -0x2c0(%rax),%rsi
    99f4:	41 83 c1 02          	add    $0x2,%r9d
    99f8:	0f 18 08             	prefetcht0 (%rax)
    99fb:	48 83 c0 40          	add    $0x40,%rax
    99ff:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9a06:	00 00 
    9a08:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9a0f:	00 
  for( int i =0 ; i< centers->num; i++ ) {
    9a10:	41 39 f9             	cmp    %edi,%r9d
    9a13:	0f 84 5f 01 00 00    	je     9b78 <_Z12outcenterIDsP6PointsPlPc+0x318>
    is_a_median[centers->p[i].assign] = 1;
    9a19:	48 8b 88 20 fd ff ff 	mov    -0x2e0(%rax),%rcx
    9a20:	4c 8d 50 40          	lea    0x40(%rax),%r10
    9a24:	0f 18 08             	prefetcht0 (%rax)
    9a27:	4c 8b 80 40 fd ff ff 	mov    -0x2c0(%rax),%r8
    9a2e:	4c 8b 98 60 fd ff ff 	mov    -0x2a0(%rax),%r11
    9a35:	41 0f 18 0a          	prefetcht0 (%r10)
    9a39:	4c 8b a8 80 fd ff ff 	mov    -0x280(%rax),%r13
    9a40:	4c 8d b0 80 00 00 00 	lea    0x80(%rax),%r14
    9a47:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    9a4e:	00 
    9a4f:	48 8b b0 a0 fd ff ff 	mov    -0x260(%rax),%rsi
    9a56:	41 0f 18 0e          	prefetcht0 (%r14)
    9a5a:	41 83 c1 10          	add    $0x10,%r9d
    9a5e:	48 8b 88 c0 fd ff ff 	mov    -0x240(%rax),%rcx
    9a65:	4c 8b 90 e0 fd ff ff 	mov    -0x220(%rax),%r10
    9a6c:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9a73:	00 00 
    9a75:	4c 8d 80 c0 00 00 00 	lea    0xc0(%rax),%r8
    9a7c:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    9a83:	00 00 
    9a85:	4c 8b 98 00 fe ff ff 	mov    -0x200(%rax),%r11
    9a8c:	41 0f 18 08          	prefetcht0 (%r8)
    9a90:	42 c7 44 ad 00 01 00 	movl   $0x1,0x0(%rbp,%r13,4)
    9a97:	00 00 
    9a99:	4c 8d a8 00 01 00 00 	lea    0x100(%rax),%r13
    9aa0:	4c 8b b0 20 fe ff ff 	mov    -0x1e0(%rax),%r14
    9aa7:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9aae:	00 
    9aaf:	41 0f 18 4d 00       	prefetcht0 0x0(%r13)
    9ab4:	48 8b b0 40 fe ff ff 	mov    -0x1c0(%rax),%rsi
    9abb:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    9ac2:	00 
    9ac3:	4c 8b 80 60 fe ff ff 	mov    -0x1a0(%rax),%r8
    9aca:	48 8d 88 40 01 00 00 	lea    0x140(%rax),%rcx
    9ad1:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9ad8:	00 00 
    9ada:	4c 8b a8 a0 fe ff ff 	mov    -0x160(%rax),%r13
    9ae1:	0f 18 09             	prefetcht0 (%rcx)
    9ae4:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    9aeb:	00 00 
    9aed:	4c 8b 90 80 fe ff ff 	mov    -0x180(%rax),%r10
    9af4:	4c 8d 98 80 01 00 00 	lea    0x180(%rax),%r11
    9afb:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9b02:	00 00 
    9b04:	41 0f 18 0b          	prefetcht0 (%r11)
    9b08:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9b0f:	00 
    9b10:	48 8d b0 c0 01 00 00 	lea    0x1c0(%rax),%rsi
    9b17:	48 05 00 02 00 00    	add    $0x200,%rax
    9b1d:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9b24:	00 00 
    9b26:	0f 18 0e             	prefetcht0 (%rsi)
    9b29:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9b30:	00 00 
    9b32:	42 c7 44 ad 00 01 00 	movl   $0x1,0x0(%rbp,%r13,4)
    9b39:	00 00 
    9b3b:	4c 8b b0 c0 fc ff ff 	mov    -0x340(%rax),%r14
    9b42:	48 8b 88 e0 fc ff ff 	mov    -0x320(%rax),%rcx
    9b49:	4c 8b 80 00 fd ff ff 	mov    -0x300(%rax),%r8
    9b50:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9b57:	00 00 
    9b59:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    9b60:	00 
    9b61:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9b68:	00 00 
  for( int i =0 ; i< centers->num; i++ ) {
    9b6a:	41 39 f9             	cmp    %edi,%r9d
    9b6d:	0f 85 a6 fe ff ff    	jne    9a19 <_Z12outcenterIDsP6PointsPlPc+0x1b9>
    9b73:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    9b78:	49 63 f9             	movslq %r9d,%rdi
    is_a_median[centers->p[i].assign] = 1;
    9b7b:	48 89 f8             	mov    %rdi,%rax
    9b7e:	49 89 f9             	mov    %rdi,%r9
    9b81:	4c 8d 6f 01          	lea    0x1(%rdi),%r13
    9b85:	48 c1 e0 05          	shl    $0x5,%rax
    9b89:	49 f7 d1             	not    %r9
    9b8c:	4c 8b 54 02 10       	mov    0x10(%rdx,%rax,1),%r10
    9b91:	49 01 d9             	add    %rbx,%r9
    9b94:	41 83 e1 07          	and    $0x7,%r9d
    9b98:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9b9f:	00 00 
  for( int i =0 ; i< centers->num; i++ ) {
    9ba1:	4c 39 eb             	cmp    %r13,%rbx
    9ba4:	0f 8e a7 01 00 00    	jle    9d51 <_Z12outcenterIDsP6PointsPlPc+0x4f1>
    9baa:	4d 85 c9             	test   %r9,%r9
    9bad:	0f 84 e5 00 00 00    	je     9c98 <_Z12outcenterIDsP6PointsPlPc+0x438>
    9bb3:	49 83 f9 01          	cmp    $0x1,%r9
    9bb7:	0f 84 b4 00 00 00    	je     9c71 <_Z12outcenterIDsP6PointsPlPc+0x411>
    9bbd:	49 83 f9 02          	cmp    $0x2,%r9
    9bc1:	0f 84 91 00 00 00    	je     9c58 <_Z12outcenterIDsP6PointsPlPc+0x3f8>
    9bc7:	49 83 f9 03          	cmp    $0x3,%r9
    9bcb:	74 72                	je     9c3f <_Z12outcenterIDsP6PointsPlPc+0x3df>
    9bcd:	49 83 f9 04          	cmp    $0x4,%r9
    9bd1:	74 53                	je     9c26 <_Z12outcenterIDsP6PointsPlPc+0x3c6>
    9bd3:	49 83 f9 05          	cmp    $0x5,%r9
    9bd7:	74 34                	je     9c0d <_Z12outcenterIDsP6PointsPlPc+0x3ad>
    9bd9:	49 83 f9 06          	cmp    $0x6,%r9
    9bdd:	74 16                	je     9bf5 <_Z12outcenterIDsP6PointsPlPc+0x395>
    is_a_median[centers->p[i].assign] = 1;
    9bdf:	49 c1 e5 05          	shl    $0x5,%r13
    9be3:	4e 8b 5c 2a 10       	mov    0x10(%rdx,%r13,1),%r11
    9be8:	4c 8d 6f 02          	lea    0x2(%rdi),%r13
    9bec:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    9bf3:	00 00 
    9bf5:	4d 89 ee             	mov    %r13,%r14
    9bf8:	49 83 c5 01          	add    $0x1,%r13
    9bfc:	49 c1 e6 05          	shl    $0x5,%r14
    9c00:	4a 8b 74 32 10       	mov    0x10(%rdx,%r14,1),%rsi
    9c05:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9c0c:	00 
    9c0d:	4c 89 e9             	mov    %r13,%rcx
    9c10:	49 83 c5 01          	add    $0x1,%r13
    9c14:	48 c1 e1 05          	shl    $0x5,%rcx
    9c18:	4c 8b 44 0a 10       	mov    0x10(%rdx,%rcx,1),%r8
    9c1d:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9c24:	00 00 
    9c26:	4c 89 ef             	mov    %r13,%rdi
    9c29:	49 83 c5 01          	add    $0x1,%r13
    9c2d:	48 c1 e7 05          	shl    $0x5,%rdi
    9c31:	4c 8b 4c 3a 10       	mov    0x10(%rdx,%rdi,1),%r9
    9c36:	42 c7 44 8d 00 01 00 	movl   $0x1,0x0(%rbp,%r9,4)
    9c3d:	00 00 
    9c3f:	4c 89 e8             	mov    %r13,%rax
    9c42:	49 83 c5 01          	add    $0x1,%r13
    9c46:	48 c1 e0 05          	shl    $0x5,%rax
    9c4a:	4c 8b 54 02 10       	mov    0x10(%rdx,%rax,1),%r10
    9c4f:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9c56:	00 00 
    9c58:	4d 89 eb             	mov    %r13,%r11
    9c5b:	49 83 c5 01          	add    $0x1,%r13
    9c5f:	49 c1 e3 05          	shl    $0x5,%r11
    9c63:	4e 8b 74 1a 10       	mov    0x10(%rdx,%r11,1),%r14
    9c68:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9c6f:	00 00 
    9c71:	4c 89 ee             	mov    %r13,%rsi
    9c74:	49 83 c5 01          	add    $0x1,%r13
    9c78:	48 c1 e6 05          	shl    $0x5,%rsi
    9c7c:	48 8b 4c 32 10       	mov    0x10(%rdx,%rsi,1),%rcx
    9c81:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    9c88:	00 
  for( int i =0 ; i< centers->num; i++ ) {
    9c89:	4c 39 eb             	cmp    %r13,%rbx
    9c8c:	0f 8e bf 00 00 00    	jle    9d51 <_Z12outcenterIDsP6PointsPlPc+0x4f1>
    9c92:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    is_a_median[centers->p[i].assign] = 1;
    9c98:	4d 89 e8             	mov    %r13,%r8
    9c9b:	4d 8d 4d 01          	lea    0x1(%r13),%r9
    9c9f:	4d 8d 55 02          	lea    0x2(%r13),%r10
    9ca3:	49 c1 e0 05          	shl    $0x5,%r8
    9ca7:	49 c1 e1 05          	shl    $0x5,%r9
    9cab:	4d 8d 75 03          	lea    0x3(%r13),%r14
    9caf:	49 8d 4d 04          	lea    0x4(%r13),%rcx
    9cb3:	49 c1 e2 05          	shl    $0x5,%r10
    9cb7:	4a 8b 7c 02 10       	mov    0x10(%rdx,%r8,1),%rdi
    9cbc:	4a 8b 44 0a 10       	mov    0x10(%rdx,%r9,1),%rax
    9cc1:	49 c1 e6 05          	shl    $0x5,%r14
    9cc5:	4e 8b 5c 12 10       	mov    0x10(%rdx,%r10,1),%r11
    9cca:	48 c1 e1 05          	shl    $0x5,%rcx
    9cce:	4a 8b 74 32 10       	mov    0x10(%rdx,%r14,1),%rsi
    9cd3:	c7 44 bd 00 01 00 00 	movl   $0x1,0x0(%rbp,%rdi,4)
    9cda:	00 
    9cdb:	49 8d 7d 05          	lea    0x5(%r13),%rdi
    9cdf:	4c 8b 44 0a 10       	mov    0x10(%rdx,%rcx,1),%r8
    9ce4:	c7 44 85 00 01 00 00 	movl   $0x1,0x0(%rbp,%rax,4)
    9ceb:	00 
    9cec:	49 8d 45 06          	lea    0x6(%r13),%rax
    9cf0:	48 c1 e7 05          	shl    $0x5,%rdi
    9cf4:	42 c7 44 9d 00 01 00 	movl   $0x1,0x0(%rbp,%r11,4)
    9cfb:	00 00 
    9cfd:	4d 8d 5d 07          	lea    0x7(%r13),%r11
    9d01:	48 c1 e0 05          	shl    $0x5,%rax
    9d05:	4c 8b 4c 3a 10       	mov    0x10(%rdx,%rdi,1),%r9
    9d0a:	49 c1 e3 05          	shl    $0x5,%r11
    9d0e:	4c 8b 54 02 10       	mov    0x10(%rdx,%rax,1),%r10
    9d13:	49 83 c5 08          	add    $0x8,%r13
    9d17:	c7 44 b5 00 01 00 00 	movl   $0x1,0x0(%rbp,%rsi,4)
    9d1e:	00 
    9d1f:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9d26:	00 00 
    9d28:	4e 8b 74 1a 10       	mov    0x10(%rdx,%r11,1),%r14
    9d2d:	42 c7 44 8d 00 01 00 	movl   $0x1,0x0(%rbp,%r9,4)
    9d34:	00 00 
    9d36:	42 c7 44 95 00 01 00 	movl   $0x1,0x0(%rbp,%r10,4)
    9d3d:	00 00 
    9d3f:	42 c7 44 b5 00 01 00 	movl   $0x1,0x0(%rbp,%r14,4)
    9d46:	00 00 
  for( int i =0 ; i< centers->num; i++ ) {
    9d48:	4c 39 eb             	cmp    %r13,%rbx
    9d4b:	0f 8f 47 ff ff ff    	jg     9c98 <_Z12outcenterIDsP6PointsPlPc+0x438>
    9d51:	45 31 f6             	xor    %r14d,%r14d
    9d54:	eb 17                	jmp    9d6d <_Z12outcenterIDsP6PointsPlPc+0x50d>
    9d56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    9d5d:	00 00 00 
  for( int i = 0; i < centers->num; i++ ) {
    9d60:	49 83 c6 01          	add    $0x1,%r14
    9d64:	4c 39 f3             	cmp    %r14,%rbx
    9d67:	0f 8e c1 00 00 00    	jle    9e2e <_Z12outcenterIDsP6PointsPlPc+0x5ce>
    if( is_a_median[i] ) {
    9d6d:	42 8b 54 b5 00       	mov    0x0(%rbp,%r14,4),%edx
    9d72:	85 d2                	test   %edx,%edx
    9d74:	74 ea                	je     9d60 <_Z12outcenterIDsP6PointsPlPc+0x500>
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
    9d76:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    9d7b:	be 01 00 00 00       	mov    $0x1,%esi
    9d80:	4c 89 e7             	mov    %r12,%rdi
    9d83:	31 c0                	xor    %eax,%eax
    9d85:	48 8d 15 c3 23 00 00 	lea    0x23c3(%rip),%rdx        # c14f <_IO_stdin_used+0x14f>
    9d8c:	4d 89 f5             	mov    %r14,%r13
    9d8f:	4a 8b 0c f3          	mov    (%rbx,%r14,8),%rcx
    9d93:	49 c1 e5 05          	shl    $0x5,%r13
      for( int k = 0; k < centers->dim; k++ ) {
    9d97:	31 db                	xor    %ebx,%ebx
    9d99:	e8 72 87 ff ff       	callq  2510 <__fprintf_chk@plt>
      fprintf(fp, "%lf\n", centers->p[i].weight);
    9d9e:	49 8b 77 10          	mov    0x10(%r15),%rsi
    9da2:	66 0f ef c0          	pxor   %xmm0,%xmm0
    9da6:	4c 89 e7             	mov    %r12,%rdi
    9da9:	48 8d 15 a3 23 00 00 	lea    0x23a3(%rip),%rdx        # c153 <_IO_stdin_used+0x153>
    9db0:	b8 01 00 00 00       	mov    $0x1,%eax
    9db5:	f3 42 0f 5a 04 2e    	cvtss2sd (%rsi,%r13,1),%xmm0
    9dbb:	be 01 00 00 00       	mov    $0x1,%esi
    9dc0:	e8 4b 87 ff ff       	callq  2510 <__fprintf_chk@plt>
      for( int k = 0; k < centers->dim; k++ ) {
    9dc5:	41 8b 4f 08          	mov    0x8(%r15),%ecx
    9dc9:	85 c9                	test   %ecx,%ecx
    9dcb:	7e 38                	jle    9e05 <_Z12outcenterIDsP6PointsPlPc+0x5a5>
    9dcd:	0f 1f 00             	nopl   (%rax)
	fprintf(fp, "%lf ", centers->p[i].coord[k]);
    9dd0:	4d 8b 47 10          	mov    0x10(%r15),%r8
    9dd4:	66 0f ef c0          	pxor   %xmm0,%xmm0
    9dd8:	be 01 00 00 00       	mov    $0x1,%esi
    9ddd:	48 8d 15 77 23 00 00 	lea    0x2377(%rip),%rdx        # c15b <_IO_stdin_used+0x15b>
    9de4:	b8 01 00 00 00       	mov    $0x1,%eax
    9de9:	4b 8b 7c 28 08       	mov    0x8(%r8,%r13,1),%rdi
    9dee:	f3 0f 5a 04 9f       	cvtss2sd (%rdi,%rbx,4),%xmm0
    9df3:	4c 89 e7             	mov    %r12,%rdi
    9df6:	48 83 c3 01          	add    $0x1,%rbx
    9dfa:	e8 11 87 ff ff       	callq  2510 <__fprintf_chk@plt>
      for( int k = 0; k < centers->dim; k++ ) {
    9dff:	41 39 5f 08          	cmp    %ebx,0x8(%r15)
    9e03:	7f cb                	jg     9dd0 <_Z12outcenterIDsP6PointsPlPc+0x570>
    9e05:	4c 89 e1             	mov    %r12,%rcx
    9e08:	ba 02 00 00 00       	mov    $0x2,%edx
    9e0d:	be 01 00 00 00       	mov    $0x1,%esi
    9e12:	49 83 c6 01          	add    $0x1,%r14
    9e16:	48 8d 3d 3b 23 00 00 	lea    0x233b(%rip),%rdi        # c158 <_IO_stdin_used+0x158>
    9e1d:	e8 2e 87 ff ff       	callq  2550 <fwrite@plt>
    9e22:	49 8b 1f             	mov    (%r15),%rbx
  for( int i = 0; i < centers->num; i++ ) {
    9e25:	4c 39 f3             	cmp    %r14,%rbx
    9e28:	0f 8f 3f ff ff ff    	jg     9d6d <_Z12outcenterIDsP6PointsPlPc+0x50d>
}
    9e2e:	48 83 c4 18          	add    $0x18,%rsp
  fclose(fp);
    9e32:	4c 89 e7             	mov    %r12,%rdi
}
    9e35:	5b                   	pop    %rbx
    9e36:	5d                   	pop    %rbp
    9e37:	41 5c                	pop    %r12
    9e39:	41 5d                	pop    %r13
    9e3b:	41 5e                	pop    %r14
    9e3d:	41 5f                	pop    %r15
  fclose(fp);
    9e3f:	e9 7c 85 ff ff       	jmpq   23c0 <fclose@plt>
    is_a_median[centers->p[i].assign] = 1;
    9e44:	48 8b 88 20 fd ff ff 	mov    -0x2e0(%rax),%rcx
    9e4b:	4c 8b 80 40 fd ff ff 	mov    -0x2c0(%rax),%r8
    9e52:	0f 18 08             	prefetcht0 (%rax)
    9e55:	41 b9 02 00 00 00    	mov    $0x2,%r9d
    9e5b:	48 83 c0 40          	add    $0x40,%rax
    9e5f:	c7 44 8d 00 01 00 00 	movl   $0x1,0x0(%rbp,%rcx,4)
    9e66:	00 
    9e67:	42 c7 44 85 00 01 00 	movl   $0x1,0x0(%rbp,%r8,4)
    9e6e:	00 00 
  for( int i =0 ; i< centers->num; i++ ) {
    9e70:	e9 9c fa ff ff       	jmpq   9911 <_Z12outcenterIDsP6PointsPlPc+0xb1>
    is_a_median[centers->p[i].assign] = 1;
    9e75:	45 31 c9             	xor    %r9d,%r9d
    9e78:	e9 fb fc ff ff       	jmpq   9b78 <_Z12outcenterIDsP6PointsPlPc+0x318>
    9e7d:	48 8b 3d 9c 51 00 00 	mov    0x519c(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    9e84:	48 89 d9             	mov    %rbx,%rcx
    9e87:	be 01 00 00 00       	mov    $0x1,%esi
    9e8c:	31 c0                	xor    %eax,%eax
    9e8e:	48 8d 15 a8 22 00 00 	lea    0x22a8(%rip),%rdx        # c13d <_IO_stdin_used+0x13d>
    9e95:	e8 76 86 ff ff       	callq  2510 <__fprintf_chk@plt>
    exit(1);
    9e9a:	bf 01 00 00 00       	mov    $0x1,%edi
    9e9f:	e8 ac 85 ff ff       	callq  2450 <exit@plt>
    9ea4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    9eab:	00 00 00 00 
    9eaf:	90                   	nop

0000000000009eb0 <_Z13streamClusterP7PStreamllillPc>:
{
    9eb0:	f3 0f 1e fa          	endbr64 
    9eb4:	41 57                	push   %r15
    9eb6:	4d 89 c7             	mov    %r8,%r15
    9eb9:	41 56                	push   %r14
    9ebb:	41 55                	push   %r13
    9ebd:	41 54                	push   %r12
    9ebf:	4c 63 e1             	movslq %ecx,%r12
    9ec2:	55                   	push   %rbp
    9ec3:	4c 89 cd             	mov    %r9,%rbp
    9ec6:	53                   	push   %rbx
    9ec7:	48 89 fb             	mov    %rdi,%rbx
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
    9eca:	48 8d 3d 8f 22 00 00 	lea    0x228f(%rip),%rdi        # c160 <_IO_stdin_used+0x160>
    9ed1:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    9ed8:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
    9edf:	00 
    9ee0:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
    9ee5:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    9eea:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
    9eef:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
    9ef4:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    9ef9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    9f00:	00 00 
    9f02:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
    9f09:	00 
    9f0a:	31 c0                	xor    %eax,%eax
    9f0c:	e8 df 85 ff ff       	callq  24f0 <puts@plt>
  float* block = (float*)malloc( chunksize*dim*sizeof(float) );
    9f11:	4c 89 e7             	mov    %r12,%rdi
  float* centerBlock = (float*)malloc(centersize*dim*sizeof(float) );
    9f14:	4c 0f af e5          	imul   %rbp,%r12
  float* block = (float*)malloc( chunksize*dim*sizeof(float) );
    9f18:	49 0f af ff          	imul   %r15,%rdi
    9f1c:	48 c1 e7 02          	shl    $0x2,%rdi
    9f20:	e8 5b 85 ff ff       	callq  2480 <malloc@plt>
  float* centerBlock = (float*)malloc(centersize*dim*sizeof(float) );
    9f25:	4a 8d 3c a5 00 00 00 	lea    0x0(,%r12,4),%rdi
    9f2c:	00 
  float* block = (float*)malloc( chunksize*dim*sizeof(float) );
    9f2d:	49 89 c6             	mov    %rax,%r14
    9f30:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  float* centerBlock = (float*)malloc(centersize*dim*sizeof(float) );
    9f35:	e8 46 85 ff ff       	callq  2480 <malloc@plt>
  long* centerIDs = (long*)malloc(centersize*dim*sizeof(long));
    9f3a:	4a 8d 3c e5 00 00 00 	lea    0x0(,%r12,8),%rdi
    9f41:	00 
  float* centerBlock = (float*)malloc(centersize*dim*sizeof(float) );
    9f42:	49 89 c5             	mov    %rax,%r13
  long* centerIDs = (long*)malloc(centersize*dim*sizeof(long));
    9f45:	e8 36 85 ff ff       	callq  2480 <malloc@plt>
    9f4a:	48 8d 3d 21 22 00 00 	lea    0x2221(%rip),%rdi        # c172 <_IO_stdin_used+0x172>
    9f51:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    9f56:	e8 95 85 ff ff       	callq  24f0 <puts@plt>
  if( block == NULL ) { 
    9f5b:	4d 85 f6             	test   %r14,%r14
    9f5e:	0f 84 48 09 00 00    	je     a8ac <_Z13streamClusterP7PStreamllillPc+0x9fc>
  points.dim = dim;
    9f64:	8b 54 24 40          	mov    0x40(%rsp),%edx
    (Point *)malloc(chunksize*sizeof(Point));
    9f68:	4c 89 ff             	mov    %r15,%rdi
  points.num = chunksize;
    9f6b:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
    (Point *)malloc(chunksize*sizeof(Point));
    9f70:	48 c1 e7 05          	shl    $0x5,%rdi
  points.dim = dim;
    9f74:	89 54 24 68          	mov    %edx,0x68(%rsp)
    (Point *)malloc(chunksize*sizeof(Point));
    9f78:	e8 03 85 ff ff       	callq  2480 <malloc@plt>
    9f7d:	48 8d 3d 00 22 00 00 	lea    0x2200(%rip),%rdi        # c184 <_IO_stdin_used+0x184>
  points.p = 
    9f84:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
    9f89:	e8 62 85 ff ff       	callq  24f0 <puts@plt>
  for( int i = 0; i < chunksize; i++ ) {
    9f8e:	4d 85 ff             	test   %r15,%r15
    9f91:	0f 8e 51 02 00 00    	jle    a1e8 <_Z13streamClusterP7PStreamllillPc+0x338>
    9f97:	49 8d 77 ff          	lea    -0x1(%r15),%rsi
    points.p[i].coord = &block[i*dim];
    9f9b:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    9fa0:	48 83 fe 02          	cmp    $0x2,%rsi
    9fa4:	0f 86 ad 08 00 00    	jbe    a857 <_Z13streamClusterP7PStreamllillPc+0x9a7>
    9faa:	66 0f 6e 6c 24 40    	movd   0x40(%rsp),%xmm5
    9fb0:	4c 89 ff             	mov    %r15,%rdi
    9fb3:	f3 0f 7e 4c 24 10    	movq   0x10(%rsp),%xmm1
    9fb9:	49 89 c9             	mov    %rcx,%r9
    9fbc:	48 c1 ef 02          	shr    $0x2,%rdi
    9fc0:	66 0f 6f 3d 48 26 00 	movdqa 0x2648(%rip),%xmm7        # c610 <_ZTS10FileStream+0x68>
    9fc7:	00 
    9fc8:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    9fcd:	66 0f 6f 25 4b 26 00 	movdqa 0x264b(%rip),%xmm4        # c620 <_ZTS10FileStream+0x78>
    9fd4:	00 
    9fd5:	48 c1 e7 07          	shl    $0x7,%rdi
    9fd9:	66 0f 70 dd 00       	pshufd $0x0,%xmm5,%xmm3
    9fde:	66 0f 6c c9          	punpcklqdq %xmm1,%xmm1
    9fe2:	66 0f 6f f3          	movdqa %xmm3,%xmm6
    9fe6:	4c 8d 04 0f          	lea    (%rdi,%rcx,1),%r8
    9fea:	81 e7 80 00 00 00    	and    $0x80,%edi
    9ff0:	66 0f 73 d6 20       	psrlq  $0x20,%xmm6
    9ff5:	74 7f                	je     a076 <_Z13streamClusterP7PStreamllillPc+0x1c6>
    9ff7:	66 0f 6f d7          	movdqa %xmm7,%xmm2
    9ffb:	66 0f 6f c7          	movdqa %xmm7,%xmm0
    9fff:	66 45 0f 6f d9       	movdqa %xmm9,%xmm11
    a004:	66 0f 73 d2 20       	psrlq  $0x20,%xmm2
    a009:	66 0f f4 c3          	pmuludq %xmm3,%xmm0
    a00d:	4c 8d 89 80 00 00 00 	lea    0x80(%rcx),%r9
    a014:	66 0f f4 d6          	pmuludq %xmm6,%xmm2
    a018:	66 0f fe fc          	paddd  %xmm4,%xmm7
    a01c:	66 44 0f 70 d0 08    	pshufd $0x8,%xmm0,%xmm10
    a022:	66 44 0f 70 c2 08    	pshufd $0x8,%xmm2,%xmm8
    a028:	66 45 0f 62 d0       	punpckldq %xmm8,%xmm10
    a02d:	66 45 0f 66 da       	pcmpgtd %xmm10,%xmm11
    a032:	66 45 0f 6f e2       	movdqa %xmm10,%xmm12
    a037:	66 45 0f 62 e3       	punpckldq %xmm11,%xmm12
    a03c:	66 45 0f 6a d3       	punpckhdq %xmm11,%xmm10
    a041:	66 41 0f 73 f4 02    	psllq  $0x2,%xmm12
    a047:	66 41 0f 73 f2 02    	psllq  $0x2,%xmm10
    a04d:	66 44 0f d4 e1       	paddq  %xmm1,%xmm12
    a052:	66 44 0f d4 d1       	paddq  %xmm1,%xmm10
    a057:	66 44 0f d6 61 08    	movq   %xmm12,0x8(%rcx)
    a05d:	44 0f 17 61 28       	movhps %xmm12,0x28(%rcx)
    a062:	66 44 0f d6 51 48    	movq   %xmm10,0x48(%rcx)
    a068:	44 0f 17 51 68       	movhps %xmm10,0x68(%rcx)
  for( int i = 0; i < chunksize; i++ ) {
    a06d:	4d 39 c1             	cmp    %r8,%r9
    a070:	0f 84 04 01 00 00    	je     a17a <_Z13streamClusterP7PStreamllillPc+0x2ca>
    a076:	66 44 0f 6f ef       	movdqa %xmm7,%xmm13
    points.p[i].coord = &block[i*dim];
    a07b:	66 44 0f 6f f7       	movdqa %xmm7,%xmm14
    a080:	66 41 0f 6f e9       	movdqa %xmm9,%xmm5
    a085:	49 81 c1 00 01 00 00 	add    $0x100,%r9
    a08c:	66 44 0f fe ec       	paddd  %xmm4,%xmm13
    a091:	66 0f 73 d7 20       	psrlq  $0x20,%xmm7
    a096:	66 45 0f 6f e1       	movdqa %xmm9,%xmm12
    a09b:	66 45 0f 6f d5       	movdqa %xmm13,%xmm10
    a0a0:	66 44 0f f4 f3       	pmuludq %xmm3,%xmm14
    a0a5:	66 41 0f 6f d5       	movdqa %xmm13,%xmm2
    a0aa:	66 41 0f 73 d2 20    	psrlq  $0x20,%xmm10
    a0b0:	66 0f f4 fe          	pmuludq %xmm6,%xmm7
    a0b4:	66 44 0f fe ec       	paddd  %xmm4,%xmm13
    a0b9:	66 0f f4 d3          	pmuludq %xmm3,%xmm2
    a0bd:	66 44 0f f4 d6       	pmuludq %xmm6,%xmm10
    a0c2:	66 45 0f 70 fe 08    	pshufd $0x8,%xmm14,%xmm15
    a0c8:	66 0f 70 ff 08       	pshufd $0x8,%xmm7,%xmm7
    a0cd:	66 44 0f 70 da 08    	pshufd $0x8,%xmm2,%xmm11
    a0d3:	66 45 0f 70 c2 08    	pshufd $0x8,%xmm10,%xmm8
    a0d9:	66 44 0f 62 ff       	punpckldq %xmm7,%xmm15
    a0de:	66 45 0f 62 d8       	punpckldq %xmm8,%xmm11
    a0e3:	66 41 0f 66 ef       	pcmpgtd %xmm15,%xmm5
    a0e8:	66 41 0f 6f c7       	movdqa %xmm15,%xmm0
    a0ed:	66 45 0f 66 e3       	pcmpgtd %xmm11,%xmm12
    a0f2:	66 45 0f 6f f3       	movdqa %xmm11,%xmm14
    a0f7:	66 41 0f 6f fd       	movdqa %xmm13,%xmm7
    a0fc:	66 0f 62 c5          	punpckldq %xmm5,%xmm0
    a100:	66 44 0f 6a fd       	punpckhdq %xmm5,%xmm15
    a105:	66 45 0f 62 f4       	punpckldq %xmm12,%xmm14
    a10a:	66 0f 73 f0 02       	psllq  $0x2,%xmm0
    a10f:	66 45 0f 6a dc       	punpckhdq %xmm12,%xmm11
    a114:	66 41 0f 73 f7 02    	psllq  $0x2,%xmm15
    a11a:	66 41 0f 73 f6 02    	psllq  $0x2,%xmm14
    a120:	66 0f d4 c1          	paddq  %xmm1,%xmm0
    a124:	66 41 0f 73 f3 02    	psllq  $0x2,%xmm11
    a12a:	66 44 0f d4 f9       	paddq  %xmm1,%xmm15
    a12f:	66 44 0f d4 f1       	paddq  %xmm1,%xmm14
    a134:	66 41 0f d6 81 08 ff 	movq   %xmm0,-0xf8(%r9)
    a13b:	ff ff 
    a13d:	66 44 0f d4 d9       	paddq  %xmm1,%xmm11
    a142:	41 0f 17 81 28 ff ff 	movhps %xmm0,-0xd8(%r9)
    a149:	ff 
    a14a:	66 45 0f d6 b9 48 ff 	movq   %xmm15,-0xb8(%r9)
    a151:	ff ff 
    a153:	45 0f 17 b9 68 ff ff 	movhps %xmm15,-0x98(%r9)
    a15a:	ff 
    a15b:	66 45 0f d6 71 88    	movq   %xmm14,-0x78(%r9)
    a161:	45 0f 17 71 a8       	movhps %xmm14,-0x58(%r9)
    a166:	66 45 0f d6 59 c8    	movq   %xmm11,-0x38(%r9)
    a16c:	45 0f 17 59 e8       	movhps %xmm11,-0x18(%r9)
  for( int i = 0; i < chunksize; i++ ) {
    a171:	4d 39 c1             	cmp    %r8,%r9
    a174:	0f 85 fc fe ff ff    	jne    a076 <_Z13streamClusterP7PStreamllillPc+0x1c6>
    a17a:	4d 89 fa             	mov    %r15,%r10
    a17d:	49 83 e2 fc          	and    $0xfffffffffffffffc,%r10
    a181:	44 89 d0             	mov    %r10d,%eax
    a184:	4d 39 d7             	cmp    %r10,%r15
    a187:	74 5f                	je     a1e8 <_Z13streamClusterP7PStreamllillPc+0x338>
    points.p[i].coord = &block[i*dim];
    a189:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
    a18e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    a193:	4c 63 d8             	movslq %eax,%r11
  for( int i = 0; i < chunksize; i++ ) {
    a196:	8d 78 01             	lea    0x1(%rax),%edi
    points.p[i].coord = &block[i*dim];
    a199:	49 c1 e3 05          	shl    $0x5,%r11
  for( int i = 0; i < chunksize; i++ ) {
    a19d:	4c 63 c7             	movslq %edi,%r8
    points.p[i].coord = &block[i*dim];
    a1a0:	44 89 e5             	mov    %r12d,%ebp
    a1a3:	0f af e8             	imul   %eax,%ebp
    a1a6:	4c 63 f5             	movslq %ebp,%r14
    a1a9:	4a 8d 14 b6          	lea    (%rsi,%r14,4),%rdx
    a1ad:	4a 89 54 19 08       	mov    %rdx,0x8(%rcx,%r11,1)
  for( int i = 0; i < chunksize; i++ ) {
    a1b2:	4d 39 c7             	cmp    %r8,%r15
    a1b5:	7e 31                	jle    a1e8 <_Z13streamClusterP7PStreamllillPc+0x338>
    points.p[i].coord = &block[i*dim];
    a1b7:	44 01 e5             	add    %r12d,%ebp
  for( int i = 0; i < chunksize; i++ ) {
    a1ba:	83 c0 02             	add    $0x2,%eax
    points.p[i].coord = &block[i*dim];
    a1bd:	49 c1 e0 05          	shl    $0x5,%r8
    a1c1:	4c 63 cd             	movslq %ebp,%r9
  for( int i = 0; i < chunksize; i++ ) {
    a1c4:	48 98                	cltq   
    points.p[i].coord = &block[i*dim];
    a1c6:	4e 8d 1c 8e          	lea    (%rsi,%r9,4),%r11
    a1ca:	4e 89 5c 01 08       	mov    %r11,0x8(%rcx,%r8,1)
  for( int i = 0; i < chunksize; i++ ) {
    a1cf:	49 39 c7             	cmp    %rax,%r15
    a1d2:	7e 14                	jle    a1e8 <_Z13streamClusterP7PStreamllillPc+0x338>
    points.p[i].coord = &block[i*dim];
    a1d4:	45 8d 24 2c          	lea    (%r12,%rbp,1),%r12d
    a1d8:	48 c1 e0 05          	shl    $0x5,%rax
    a1dc:	49 63 ec             	movslq %r12d,%rbp
    a1df:	4c 8d 34 ae          	lea    (%rsi,%rbp,4),%r14
    a1e3:	4c 89 74 01 08       	mov    %r14,0x8(%rcx,%rax,1)
    (Point *)malloc(centersize*sizeof(Point));
    a1e8:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
  centers.dim = dim;
    a1ed:	8b 4c 24 40          	mov    0x40(%rsp),%ecx
    (Point *)malloc(centersize*sizeof(Point));
    a1f1:	4c 89 e7             	mov    %r12,%rdi
  centers.dim = dim;
    a1f4:	89 8c 24 88 00 00 00 	mov    %ecx,0x88(%rsp)
    (Point *)malloc(centersize*sizeof(Point));
    a1fb:	48 c1 e7 05          	shl    $0x5,%rdi
    a1ff:	e8 7c 82 ff ff       	callq  2480 <malloc@plt>
    a204:	48 8d 3d 8b 1f 00 00 	lea    0x1f8b(%rip),%rdi        # c196 <_IO_stdin_used+0x196>
  centers.p = 
    a20b:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
    a212:	00 
    a213:	e8 d8 82 ff ff       	callq  24f0 <puts@plt>
  centers.num = 0;
    a218:	48 c7 84 24 80 00 00 	movq   $0x0,0x80(%rsp)
    a21f:	00 00 00 00 00 
  for( int i = 0; i< centersize; i++ ) {
    a224:	4d 85 e4             	test   %r12,%r12
    a227:	0f 8e d2 02 00 00    	jle    a4ff <_Z13streamClusterP7PStreamllillPc+0x64f>
    a22d:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    centers.p[i].coord = &centerBlock[i*dim];
    a232:	4c 8b 9c 24 90 00 00 	mov    0x90(%rsp),%r11
    a239:	00 
    a23a:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
    a23e:	48 83 f8 02          	cmp    $0x2,%rax
    a242:	0f 86 00 06 00 00    	jbe    a848 <_Z13streamClusterP7PStreamllillPc+0x998>
    a248:	48 c1 ee 02          	shr    $0x2,%rsi
    a24c:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
    a251:	4d 89 d8             	mov    %r11,%r8
    a254:	66 0f ef f6          	pxor   %xmm6,%xmm6
    a258:	66 0f 6e 5c 24 40    	movd   0x40(%rsp),%xmm3
    a25e:	48 89 f2             	mov    %rsi,%rdx
    a261:	f3 44 0f 7e 6c 24 30 	movq   0x30(%rsp),%xmm13
    a268:	48 c1 e2 07          	shl    $0x7,%rdx
    a26c:	f3 0f 10 0d 50 23 00 	movss  0x2350(%rip),%xmm1        # c5c4 <_ZTS10FileStream+0x1c>
    a273:	00 
    a274:	66 44 0f 6f 05 93 23 	movdqa 0x2393(%rip),%xmm8        # c610 <_ZTS10FileStream+0x68>
    a27b:	00 00 
    a27d:	66 0f 70 e3 00       	pshufd $0x0,%xmm3,%xmm4
    a282:	4a 8d 3c 1a          	lea    (%rdx,%r11,1),%rdi
    a286:	81 e2 80 00 00 00    	and    $0x80,%edx
    a28c:	66 44 0f 6f 3d 8b 23 	movdqa 0x238b(%rip),%xmm15        # c620 <_ZTS10FileStream+0x78>
    a293:	00 00 
    a295:	66 0f 6f ec          	movdqa %xmm4,%xmm5
    a299:	66 45 0f 6c ed       	punpcklqdq %xmm13,%xmm13
    a29e:	66 0f 73 d5 20       	psrlq  $0x20,%xmm5
    a2a3:	0f 84 99 00 00 00    	je     a342 <_Z13streamClusterP7PStreamllillPc+0x492>
    a2a9:	66 41 0f 6f d0       	movdqa %xmm8,%xmm2
    a2ae:	66 44 0f 6f cc       	movdqa %xmm4,%xmm9
    a2b3:	66 44 0f 6f de       	movdqa %xmm6,%xmm11
    centers.p[i].weight = 1.0;
    a2b8:	f3 41 0f 11 0b       	movss  %xmm1,(%r11)
    centers.p[i].coord = &centerBlock[i*dim];
    a2bd:	66 0f 73 d2 20       	psrlq  $0x20,%xmm2
    a2c2:	66 45 0f f4 c8       	pmuludq %xmm8,%xmm9
    a2c7:	4d 8d 83 80 00 00 00 	lea    0x80(%r11),%r8
    centers.p[i].weight = 1.0;
    a2ce:	f3 41 0f 11 4b 20    	movss  %xmm1,0x20(%r11)
    centers.p[i].coord = &centerBlock[i*dim];
    a2d4:	66 0f f4 d5          	pmuludq %xmm5,%xmm2
    centers.p[i].weight = 1.0;
    a2d8:	f3 41 0f 11 4b 40    	movss  %xmm1,0x40(%r11)
    a2de:	66 45 0f fe c7       	paddd  %xmm15,%xmm8
    a2e3:	f3 41 0f 11 4b 60    	movss  %xmm1,0x60(%r11)
    centers.p[i].coord = &centerBlock[i*dim];
    a2e9:	66 41 0f 70 c1 08    	pshufd $0x8,%xmm9,%xmm0
    a2ef:	66 44 0f 70 d2 08    	pshufd $0x8,%xmm2,%xmm10
    a2f5:	66 41 0f 62 c2       	punpckldq %xmm10,%xmm0
    a2fa:	66 44 0f 66 d8       	pcmpgtd %xmm0,%xmm11
    a2ff:	66 44 0f 6f e0       	movdqa %xmm0,%xmm12
    a304:	66 45 0f 62 e3       	punpckldq %xmm11,%xmm12
    a309:	66 41 0f 6a c3       	punpckhdq %xmm11,%xmm0
    a30e:	66 41 0f 73 f4 02    	psllq  $0x2,%xmm12
    a314:	66 0f 73 f0 02       	psllq  $0x2,%xmm0
    a319:	66 45 0f d4 e5       	paddq  %xmm13,%xmm12
    a31e:	66 41 0f d4 c5       	paddq  %xmm13,%xmm0
    a323:	66 45 0f d6 63 08    	movq   %xmm12,0x8(%r11)
    a329:	45 0f 17 63 28       	movhps %xmm12,0x28(%r11)
    a32e:	66 41 0f d6 43 48    	movq   %xmm0,0x48(%r11)
    a334:	41 0f 17 43 68       	movhps %xmm0,0x68(%r11)
  for( int i = 0; i< centersize; i++ ) {
    a339:	49 39 f8             	cmp    %rdi,%r8
    a33c:	0f 84 31 01 00 00    	je     a473 <_Z13streamClusterP7PStreamllillPc+0x5c3>
    centers.p[i].coord = &centerBlock[i*dim];
    a342:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    a346:	66 45 0f 6f f0       	movdqa %xmm8,%xmm14
    a34b:	66 0f 6f c4          	movdqa %xmm4,%xmm0
    centers.p[i].weight = 1.0;
    a34f:	f3 41 0f 11 08       	movss  %xmm1,(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a354:	66 41 0f f4 f8       	pmuludq %xmm8,%xmm7
    a359:	66 45 0f fe f7       	paddd  %xmm15,%xmm14
    a35e:	66 44 0f 6f ce       	movdqa %xmm6,%xmm9
    centers.p[i].weight = 1.0;
    a363:	f3 41 0f 11 48 20    	movss  %xmm1,0x20(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a369:	66 41 0f 73 d0 20    	psrlq  $0x20,%xmm8
    a36f:	66 41 0f f4 c6       	pmuludq %xmm14,%xmm0
    a374:	66 45 0f 6f d6       	movdqa %xmm14,%xmm10
    centers.p[i].weight = 1.0;
    a379:	f3 41 0f 11 48 40    	movss  %xmm1,0x40(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a37f:	66 44 0f f4 c5       	pmuludq %xmm5,%xmm8
    a384:	66 41 0f 73 d2 20    	psrlq  $0x20,%xmm10
    centers.p[i].weight = 1.0;
    a38a:	f3 41 0f 11 48 60    	movss  %xmm1,0x60(%r8)
    a390:	66 45 0f fe f7       	paddd  %xmm15,%xmm14
    centers.p[i].coord = &centerBlock[i*dim];
    a395:	66 44 0f f4 d5       	pmuludq %xmm5,%xmm10
    a39a:	49 81 c0 00 01 00 00 	add    $0x100,%r8
    centers.p[i].weight = 1.0;
    a3a1:	f3 41 0f 11 48 80    	movss  %xmm1,-0x80(%r8)
    a3a7:	f3 41 0f 11 48 a0    	movss  %xmm1,-0x60(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a3ad:	66 0f 70 df 08       	pshufd $0x8,%xmm7,%xmm3
    a3b2:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    centers.p[i].weight = 1.0;
    a3b6:	f3 41 0f 11 48 c0    	movss  %xmm1,-0x40(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a3bc:	66 44 0f 70 d8 08    	pshufd $0x8,%xmm0,%xmm11
    centers.p[i].weight = 1.0;
    a3c2:	f3 41 0f 11 48 e0    	movss  %xmm1,-0x20(%r8)
    centers.p[i].coord = &centerBlock[i*dim];
    a3c8:	66 45 0f 70 c0 08    	pshufd $0x8,%xmm8,%xmm8
    a3ce:	66 41 0f 62 d8       	punpckldq %xmm8,%xmm3
    a3d3:	66 45 0f 70 e2 08    	pshufd $0x8,%xmm10,%xmm12
    a3d9:	66 45 0f 6f c6       	movdqa %xmm14,%xmm8
    a3de:	66 44 0f 66 cb       	pcmpgtd %xmm3,%xmm9
    a3e3:	66 45 0f 62 dc       	punpckldq %xmm12,%xmm11
    a3e8:	66 0f 6f d3          	movdqa %xmm3,%xmm2
    a3ec:	66 41 0f 66 fb       	pcmpgtd %xmm11,%xmm7
    a3f1:	66 41 0f 6a d9       	punpckhdq %xmm9,%xmm3
    a3f6:	66 41 0f 62 d1       	punpckldq %xmm9,%xmm2
    a3fb:	66 0f 73 f3 02       	psllq  $0x2,%xmm3
    a400:	66 0f 73 f2 02       	psllq  $0x2,%xmm2
    a405:	66 41 0f d4 dd       	paddq  %xmm13,%xmm3
    a40a:	66 41 0f d4 d5       	paddq  %xmm13,%xmm2
    a40f:	66 41 0f d6 98 48 ff 	movq   %xmm3,-0xb8(%r8)
    a416:	ff ff 
    a418:	41 0f 17 98 68 ff ff 	movhps %xmm3,-0x98(%r8)
    a41f:	ff 
    a420:	66 41 0f 6f db       	movdqa %xmm11,%xmm3
    a425:	66 44 0f 6a df       	punpckhdq %xmm7,%xmm11
    a42a:	66 0f 62 df          	punpckldq %xmm7,%xmm3
    a42e:	66 41 0f 73 f3 02    	psllq  $0x2,%xmm11
    a434:	66 41 0f d6 90 08 ff 	movq   %xmm2,-0xf8(%r8)
    a43b:	ff ff 
    a43d:	66 0f 73 f3 02       	psllq  $0x2,%xmm3
    a442:	66 45 0f d4 dd       	paddq  %xmm13,%xmm11
    a447:	41 0f 17 90 28 ff ff 	movhps %xmm2,-0xd8(%r8)
    a44e:	ff 
    a44f:	66 41 0f d4 dd       	paddq  %xmm13,%xmm3
    a454:	66 45 0f d6 58 c8    	movq   %xmm11,-0x38(%r8)
    a45a:	66 41 0f d6 58 88    	movq   %xmm3,-0x78(%r8)
    a460:	41 0f 17 58 a8       	movhps %xmm3,-0x58(%r8)
    a465:	45 0f 17 58 e8       	movhps %xmm11,-0x18(%r8)
  for( int i = 0; i< centersize; i++ ) {
    a46a:	49 39 f8             	cmp    %rdi,%r8
    a46d:	0f 85 cf fe ff ff    	jne    a342 <_Z13streamClusterP7PStreamllillPc+0x492>
    a473:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
    a478:	4d 89 ca             	mov    %r9,%r10
    a47b:	49 83 e2 fc          	and    $0xfffffffffffffffc,%r10
    a47f:	44 89 d0             	mov    %r10d,%eax
    a482:	4d 39 d1             	cmp    %r10,%r9
    a485:	74 78                	je     a4ff <_Z13streamClusterP7PStreamllillPc+0x64f>
    centers.p[i].coord = &centerBlock[i*dim];
    a487:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
    a48b:	48 63 c8             	movslq %eax,%rcx
  for( int i = 0; i< centersize; i++ ) {
    a48e:	8d 50 01             	lea    0x1(%rax),%edx
    a491:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
    centers.p[i].coord = &centerBlock[i*dim];
    a496:	48 c1 e1 05          	shl    $0x5,%rcx
  for( int i = 0; i< centersize; i++ ) {
    a49a:	4c 63 ca             	movslq %edx,%r9
    centers.p[i].coord = &centerBlock[i*dim];
    a49d:	41 89 ee             	mov    %ebp,%r14d
    a4a0:	4c 01 d9             	add    %r11,%rcx
    a4a3:	44 0f af f0          	imul   %eax,%r14d
    centers.p[i].weight = 1.0;
    a4a7:	f3 0f 11 09          	movss  %xmm1,(%rcx)
    centers.p[i].coord = &centerBlock[i*dim];
    a4ab:	4d 63 e6             	movslq %r14d,%r12
    a4ae:	4b 8d 74 a5 00       	lea    0x0(%r13,%r12,4),%rsi
    a4b3:	48 89 71 08          	mov    %rsi,0x8(%rcx)
  for( int i = 0; i< centersize; i++ ) {
    a4b7:	4d 39 ca             	cmp    %r9,%r10
    a4ba:	7e 43                	jle    a4ff <_Z13streamClusterP7PStreamllillPc+0x64f>
    centers.p[i].coord = &centerBlock[i*dim];
    a4bc:	41 01 ee             	add    %ebp,%r14d
    a4bf:	49 c1 e1 05          	shl    $0x5,%r9
  for( int i = 0; i< centersize; i++ ) {
    a4c3:	83 c0 02             	add    $0x2,%eax
    centers.p[i].coord = &centerBlock[i*dim];
    a4c6:	41 89 e8             	mov    %ebp,%r8d
    a4c9:	49 63 fe             	movslq %r14d,%rdi
    a4cc:	4d 01 d9             	add    %r11,%r9
  for( int i = 0; i< centersize; i++ ) {
    a4cf:	48 98                	cltq   
    centers.p[i].coord = &centerBlock[i*dim];
    a4d1:	49 8d 6c bd 00       	lea    0x0(%r13,%rdi,4),%rbp
    centers.p[i].weight = 1.0;
    a4d6:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    centers.p[i].coord = &centerBlock[i*dim];
    a4db:	49 89 69 08          	mov    %rbp,0x8(%r9)
  for( int i = 0; i< centersize; i++ ) {
    a4df:	49 39 c2             	cmp    %rax,%r10
    a4e2:	7e 1b                	jle    a4ff <_Z13streamClusterP7PStreamllillPc+0x64f>
    centers.p[i].coord = &centerBlock[i*dim];
    a4e4:	48 c1 e0 05          	shl    $0x5,%rax
    a4e8:	4c 01 d8             	add    %r11,%rax
    a4eb:	47 8d 1c 30          	lea    (%r8,%r14,1),%r11d
    a4ef:	4d 63 f3             	movslq %r11d,%r14
    centers.p[i].weight = 1.0;
    a4f2:	f3 0f 11 08          	movss  %xmm1,(%rax)
    centers.p[i].coord = &centerBlock[i*dim];
    a4f6:	4f 8d 6c b5 00       	lea    0x0(%r13,%r14,4),%r13
    a4fb:	4c 89 68 08          	mov    %r13,0x8(%rax)
    a4ff:	48 8d 3d a2 1c 00 00 	lea    0x1ca2(%rip),%rdi        # c1a8 <_IO_stdin_used+0x1a8>
  long IDoffset = 0;
    a506:	45 31 f6             	xor    %r14d,%r14d
    localSearch(&points,kmin, kmax,&kfinal); // parallel
    a509:	4c 8d 6c 24 60       	lea    0x60(%rsp),%r13
    a50e:	e8 dd 7f ff ff       	callq  24f0 <puts@plt>
    a513:	48 8d 44 24 58       	lea    0x58(%rsp),%rax
    a518:	44 89 7c 24 44       	mov    %r15d,0x44(%rsp)
    copycenters(&points, &centers, centerIDs, IDoffset); /* sequential */
    a51d:	48 8d 8c 24 80 00 00 	lea    0x80(%rsp),%rcx
    a524:	00 
    localSearch(&points,kmin, kmax,&kfinal); // parallel
    a525:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    copycenters(&points, &centers, centerIDs, IDoffset); /* sequential */
    a52a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    a52f:	90                   	nop
    size_t numRead  = stream->read(block, dim, chunksize ); 
    a530:	4c 8b 23             	mov    (%rbx),%r12
    a533:	8b 4c 24 44          	mov    0x44(%rsp),%ecx
    a537:	48 89 df             	mov    %rbx,%rdi
    a53a:	8b 54 24 40          	mov    0x40(%rsp),%edx
    a53e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    a543:	41 ff 14 24          	callq  *(%r12)
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
    a547:	48 8b 3d d2 4a 00 00 	mov    0x4ad2(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    a54e:	48 8d 15 65 1c 00 00 	lea    0x1c65(%rip),%rdx        # c1ba <_IO_stdin_used+0x1ba>
    a555:	be 01 00 00 00       	mov    $0x1,%esi
    a55a:	48 89 c1             	mov    %rax,%rcx
    a55d:	48 89 c5             	mov    %rax,%rbp
    a560:	31 c0                	xor    %eax,%eax
    a562:	e8 a9 7f ff ff       	callq  2510 <__fprintf_chk@plt>
    if( stream->ferror() || numRead < (unsigned int)chunksize && !stream->feof() ) {
    a567:	48 8b 03             	mov    (%rbx),%rax
    a56a:	48 89 df             	mov    %rbx,%rdi
    a56d:	ff 50 08             	callq  *0x8(%rax)
    a570:	f3 0f 10 0d 4c 20 00 	movss  0x204c(%rip),%xmm1        # c5c4 <_ZTS10FileStream+0x1c>
    a577:	00 
    a578:	85 c0                	test   %eax,%eax
    a57a:	0f 85 de 02 00 00    	jne    a85e <_Z13streamClusterP7PStreamllillPc+0x9ae>
    a580:	44 89 fe             	mov    %r15d,%esi
    a583:	48 39 ee             	cmp    %rbp,%rsi
    a586:	76 1b                	jbe    a5a3 <_Z13streamClusterP7PStreamllillPc+0x6f3>
    a588:	4c 8b 23             	mov    (%rbx),%r12
    a58b:	48 89 df             	mov    %rbx,%rdi
    a58e:	41 ff 54 24 10       	callq  *0x10(%r12)
    a593:	f3 0f 10 0d 29 20 00 	movss  0x2029(%rip),%xmm1        # c5c4 <_ZTS10FileStream+0x1c>
    a59a:	00 
    a59b:	85 c0                	test   %eax,%eax
    a59d:	0f 84 bb 02 00 00    	je     a85e <_Z13streamClusterP7PStreamllillPc+0x9ae>
    points.num = numRead;
    a5a3:	48 89 6c 24 60       	mov    %rbp,0x60(%rsp)
    for( int i = 0; i < points.num; i++ ) {
    a5a8:	48 85 ed             	test   %rbp,%rbp
    a5ab:	0f 8e cd 00 00 00    	jle    a67e <_Z13streamClusterP7PStreamllillPc+0x7ce>
    a5b1:	4c 8b 4c 24 70       	mov    0x70(%rsp),%r9
    a5b6:	48 89 ea             	mov    %rbp,%rdx
    a5b9:	48 c1 e2 05          	shl    $0x5,%rdx
    a5bd:	4e 8d 14 0a          	lea    (%rdx,%r9,1),%r10
    a5c1:	48 83 ea 20          	sub    $0x20,%rdx
    a5c5:	48 c1 ea 05          	shr    $0x5,%rdx
    a5c9:	48 83 c2 01          	add    $0x1,%rdx
    a5cd:	83 e2 07             	and    $0x7,%edx
    a5d0:	74 68                	je     a63a <_Z13streamClusterP7PStreamllillPc+0x78a>
    a5d2:	48 83 fa 01          	cmp    $0x1,%rdx
    a5d6:	74 54                	je     a62c <_Z13streamClusterP7PStreamllillPc+0x77c>
    a5d8:	48 83 fa 02          	cmp    $0x2,%rdx
    a5dc:	74 45                	je     a623 <_Z13streamClusterP7PStreamllillPc+0x773>
    a5de:	48 83 fa 03          	cmp    $0x3,%rdx
    a5e2:	74 36                	je     a61a <_Z13streamClusterP7PStreamllillPc+0x76a>
    a5e4:	48 83 fa 04          	cmp    $0x4,%rdx
    a5e8:	74 27                	je     a611 <_Z13streamClusterP7PStreamllillPc+0x761>
    a5ea:	48 83 fa 05          	cmp    $0x5,%rdx
    a5ee:	74 18                	je     a608 <_Z13streamClusterP7PStreamllillPc+0x758>
    a5f0:	48 83 fa 06          	cmp    $0x6,%rdx
    a5f4:	74 09                	je     a5ff <_Z13streamClusterP7PStreamllillPc+0x74f>
      points.p[i].weight = 1.0;
    a5f6:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a5fb:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a5ff:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a604:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a608:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a60d:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a611:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a616:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a61a:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a61f:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a623:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a628:	49 83 c1 20          	add    $0x20,%r9
      points.p[i].weight = 1.0;
    a62c:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a631:	49 83 c1 20          	add    $0x20,%r9
    a635:	4d 39 d1             	cmp    %r10,%r9
    a638:	74 44                	je     a67e <_Z13streamClusterP7PStreamllillPc+0x7ce>
      points.p[i].weight = 1.0;
    a63a:	f3 41 0f 11 09       	movss  %xmm1,(%r9)
    a63f:	49 81 c1 00 01 00 00 	add    $0x100,%r9
    a646:	f3 41 0f 11 89 20 ff 	movss  %xmm1,-0xe0(%r9)
    a64d:	ff ff 
    a64f:	f3 41 0f 11 89 40 ff 	movss  %xmm1,-0xc0(%r9)
    a656:	ff ff 
    a658:	f3 41 0f 11 89 60 ff 	movss  %xmm1,-0xa0(%r9)
    a65f:	ff ff 
    a661:	f3 41 0f 11 49 80    	movss  %xmm1,-0x80(%r9)
    a667:	f3 41 0f 11 49 a0    	movss  %xmm1,-0x60(%r9)
    a66d:	f3 41 0f 11 49 c0    	movss  %xmm1,-0x40(%r9)
    a673:	f3 41 0f 11 49 e0    	movss  %xmm1,-0x20(%r9)
    for( int i = 0; i < points.num; i++ ) {
    a679:	4d 39 d1             	cmp    %r10,%r9
    a67c:	75 bc                	jne    a63a <_Z13streamClusterP7PStreamllillPc+0x78a>
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
    a67e:	48 8d 3d 5a 1b 00 00 	lea    0x1b5a(%rip),%rdi        # c1df <_IO_stdin_used+0x1df>
    a685:	e8 66 7e ff ff       	callq  24f0 <puts@plt>
    switch_membership = (bool*)malloc(points.num*sizeof(bool));
    a68a:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    a68f:	4c 89 e7             	mov    %r12,%rdi
    a692:	e8 e9 7d ff ff       	callq  2480 <malloc@plt>
    is_center = (bool*)calloc(points.num,sizeof(bool));
    a697:	be 01 00 00 00       	mov    $0x1,%esi
    a69c:	4c 89 e7             	mov    %r12,%rdi
    switch_membership = (bool*)malloc(points.num*sizeof(bool));
    a69f:	48 89 05 7a 4a 00 00 	mov    %rax,0x4a7a(%rip)        # f120 <_ZL17switch_membership>
    is_center = (bool*)calloc(points.num,sizeof(bool));
    a6a6:	e8 a5 7c ff ff       	callq  2350 <calloc@plt>
    center_table = (int*)malloc(points.num*sizeof(int));
    a6ab:	4a 8d 3c a5 00 00 00 	lea    0x0(,%r12,4),%rdi
    a6b2:	00 
    is_center = (bool*)calloc(points.num,sizeof(bool));
    a6b3:	48 89 05 5e 4a 00 00 	mov    %rax,0x4a5e(%rip)        # f118 <_ZL9is_center>
    center_table = (int*)malloc(points.num*sizeof(int));
    a6ba:	e8 c1 7d ff ff       	callq  2480 <malloc@plt>
    a6bf:	48 8d 3d 2b 1b 00 00 	lea    0x1b2b(%rip),%rdi        # c1f1 <_IO_stdin_used+0x1f1>
    a6c6:	48 89 05 43 4a 00 00 	mov    %rax,0x4a43(%rip)        # f110 <_ZL12center_table>
    a6cd:	e8 1e 7e ff ff       	callq  24f0 <puts@plt>
    localSearch(&points,kmin, kmax,&kfinal); // parallel
    a6d2:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    a6d7:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    a6dc:	4c 89 ef             	mov    %r13,%rdi
    a6df:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    a6e4:	e8 37 ef ff ff       	callq  9620 <_Z11localSearchP6PointsllPl>
    a6e9:	48 8d 3d 13 1b 00 00 	lea    0x1b13(%rip),%rdi        # c203 <_IO_stdin_used+0x203>
    a6f0:	e8 fb 7d ff ff       	callq  24f0 <puts@plt>
    contcenters(&points); /* sequential */
    a6f5:	4c 89 ef             	mov    %r13,%rdi
    a6f8:	e8 f3 e3 ff ff       	callq  8af0 <_Z11contcentersP6Points>
    a6fd:	48 8d 3d 13 1b 00 00 	lea    0x1b13(%rip),%rdi        # c217 <_IO_stdin_used+0x217>
    a704:	e8 e7 7d ff ff       	callq  24f0 <puts@plt>
    if( kfinal + centers.num > centersize ) {
    a709:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    a70e:	4c 03 84 24 80 00 00 	add    0x80(%rsp),%r8
    a715:	00 
    a716:	4c 3b 44 24 08       	cmp    0x8(%rsp),%r8
    a71b:	0f 8f 64 01 00 00    	jg     a885 <_Z13streamClusterP7PStreamllillPc+0x9d5>
    a721:	48 8d 3d 03 1b 00 00 	lea    0x1b03(%rip),%rdi        # c22b <_IO_stdin_used+0x22b>
    a728:	e8 c3 7d ff ff       	callq  24f0 <puts@plt>
    copycenters(&points, &centers, centerIDs, IDoffset); /* sequential */
    a72d:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    a732:	4c 89 f1             	mov    %r14,%rcx
    a735:	4c 89 ef             	mov    %r13,%rdi
    a738:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    IDoffset += numRead;
    a73d:	49 01 ee             	add    %rbp,%r14
    copycenters(&points, &centers, centerIDs, IDoffset); /* sequential */
    a740:	e8 cb ec ff ff       	callq  9410 <_Z11copycentersP6PointsS0_Pll>
    a745:	48 8d 3d f3 1a 00 00 	lea    0x1af3(%rip),%rdi        # c23f <_IO_stdin_used+0x23f>
    a74c:	e8 9f 7d ff ff       	callq  24f0 <puts@plt>
    a751:	48 8d 3d fb 1a 00 00 	lea    0x1afb(%rip),%rdi        # c253 <_IO_stdin_used+0x253>
    a758:	e8 93 7d ff ff       	callq  24f0 <puts@plt>
    free(is_center);
    a75d:	48 8b 3d b4 49 00 00 	mov    0x49b4(%rip),%rdi        # f118 <_ZL9is_center>
    a764:	e8 c7 7c ff ff       	callq  2430 <free@plt>
    free(switch_membership);
    a769:	48 8b 3d b0 49 00 00 	mov    0x49b0(%rip),%rdi        # f120 <_ZL17switch_membership>
    a770:	e8 bb 7c ff ff       	callq  2430 <free@plt>
    free(center_table);
    a775:	48 8b 3d 94 49 00 00 	mov    0x4994(%rip),%rdi        # f110 <_ZL12center_table>
    a77c:	e8 af 7c ff ff       	callq  2430 <free@plt>
    if( stream->feof() ) {
    a781:	48 8b 2b             	mov    (%rbx),%rbp
    a784:	48 89 df             	mov    %rbx,%rdi
    a787:	ff 55 10             	callq  *0x10(%rbp)
    a78a:	85 c0                	test   %eax,%eax
    a78c:	0f 84 9e fd ff ff    	je     a530 <_Z13streamClusterP7PStreamllillPc+0x680>
    a792:	48 8d 3d cc 1a 00 00 	lea    0x1acc(%rip),%rdi        # c265 <_IO_stdin_used+0x265>
    a799:	e8 52 7d ff ff       	callq  24f0 <puts@plt>
  switch_membership = (bool*)malloc(centers.num*sizeof(bool));
    a79e:	48 8b 9c 24 80 00 00 	mov    0x80(%rsp),%rbx
    a7a5:	00 
    a7a6:	48 89 df             	mov    %rbx,%rdi
    a7a9:	e8 d2 7c ff ff       	callq  2480 <malloc@plt>
  is_center = (bool*)calloc(centers.num,sizeof(bool));
    a7ae:	be 01 00 00 00       	mov    $0x1,%esi
    a7b3:	48 89 df             	mov    %rbx,%rdi
  switch_membership = (bool*)malloc(centers.num*sizeof(bool));
    a7b6:	48 89 05 63 49 00 00 	mov    %rax,0x4963(%rip)        # f120 <_ZL17switch_membership>
  is_center = (bool*)calloc(centers.num,sizeof(bool));
    a7bd:	e8 8e 7b ff ff       	callq  2350 <calloc@plt>
  center_table = (int*)malloc(centers.num*sizeof(int));
    a7c2:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    a7c9:	00 
  is_center = (bool*)calloc(centers.num,sizeof(bool));
    a7ca:	48 89 05 47 49 00 00 	mov    %rax,0x4947(%rip)        # f118 <_ZL9is_center>
  center_table = (int*)malloc(centers.num*sizeof(int));
    a7d1:	e8 aa 7c ff ff       	callq  2480 <malloc@plt>
    a7d6:	48 8d 3d 9a 1a 00 00 	lea    0x1a9a(%rip),%rdi        # c277 <_IO_stdin_used+0x277>
    a7dd:	48 89 05 2c 49 00 00 	mov    %rax,0x492c(%rip)        # f110 <_ZL12center_table>
    a7e4:	e8 07 7d ff ff       	callq  24f0 <puts@plt>
  localSearch( &centers, kmin, kmax ,&kfinal ); // parallel
    a7e9:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
    a7ee:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    a7f3:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    a7f8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    a7fd:	4c 89 ff             	mov    %r15,%rdi
    a800:	e8 1b ee ff ff       	callq  9620 <_Z11localSearchP6PointsllPl>
  contcenters(&centers);
    a805:	4c 89 ff             	mov    %r15,%rdi
    a808:	e8 e3 e2 ff ff       	callq  8af0 <_Z11contcentersP6Points>
  outcenterIDs( &centers, centerIDs, outfile);
    a80d:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
    a812:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    a817:	4c 89 ff             	mov    %r15,%rdi
    a81a:	e8 41 f0 ff ff       	callq  9860 <_Z12outcenterIDsP6PointsPlPc>
}
    a81f:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
    a826:	00 
    a827:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    a82e:	00 00 
    a830:	0f 85 9d 00 00 00    	jne    a8d3 <_Z13streamClusterP7PStreamllillPc+0xa23>
    a836:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    a83d:	5b                   	pop    %rbx
    a83e:	5d                   	pop    %rbp
    a83f:	41 5c                	pop    %r12
    a841:	41 5d                	pop    %r13
    a843:	41 5e                	pop    %r14
    a845:	41 5f                	pop    %r15
    a847:	c3                   	retq   
  for( int i = 0; i< centersize; i++ ) {
    a848:	31 c0                	xor    %eax,%eax
    a84a:	f3 0f 10 0d 72 1d 00 	movss  0x1d72(%rip),%xmm1        # c5c4 <_ZTS10FileStream+0x1c>
    a851:	00 
    a852:	e9 30 fc ff ff       	jmpq   a487 <_Z13streamClusterP7PStreamllillPc+0x5d7>
  for( int i = 0; i < chunksize; i++ ) {
    a857:	31 c0                	xor    %eax,%eax
    a859:	e9 2b f9 ff ff       	jmpq   a189 <_Z13streamClusterP7PStreamllillPc+0x2d9>
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
    a85e:	48 8b 0d bb 47 00 00 	mov    0x47bb(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    a865:	ba 14 00 00 00       	mov    $0x14,%edx
    a86a:	be 01 00 00 00       	mov    $0x1,%esi
    a86f:	48 8d 3d 54 19 00 00 	lea    0x1954(%rip),%rdi        # c1ca <_IO_stdin_used+0x1ca>
    a876:	e8 d5 7c ff ff       	callq  2550 <fwrite@plt>
      exit(1);
    a87b:	bf 01 00 00 00       	mov    $0x1,%edi
    a880:	e8 cb 7b ff ff       	callq  2450 <exit@plt>
    a885:	48 8b 0d 94 47 00 00 	mov    0x4794(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    a88c:	ba 20 00 00 00       	mov    $0x20,%edx
    a891:	be 01 00 00 00       	mov    $0x1,%esi
    a896:	48 8d 3d 5b 1a 00 00 	lea    0x1a5b(%rip),%rdi        # c2f8 <_IO_stdin_used+0x2f8>
    a89d:	e8 ae 7c ff ff       	callq  2550 <fwrite@plt>
      exit(1);
    a8a2:	bf 01 00 00 00       	mov    $0x1,%edi
    a8a7:	e8 a4 7b ff ff       	callq  2450 <exit@plt>
    a8ac:	48 8b 0d 6d 47 00 00 	mov    0x476d(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    a8b3:	ba 1f 00 00 00       	mov    $0x1f,%edx
    a8b8:	be 01 00 00 00       	mov    $0x1,%esi
    a8bd:	48 8d 3d 14 1a 00 00 	lea    0x1a14(%rip),%rdi        # c2d8 <_IO_stdin_used+0x2d8>
    a8c4:	e8 87 7c ff ff       	callq  2550 <fwrite@plt>
    exit(1);
    a8c9:	bf 01 00 00 00       	mov    $0x1,%edi
    a8ce:	e8 7d 7b ff ff       	callq  2450 <exit@plt>
}
    a8d3:	e8 18 7b ff ff       	callq  23f0 <__stack_chk_fail@plt>
    a8d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    a8df:	00 

000000000000a8e0 <_ZN9SimStream6ferrorEv>:
  int ferror() {
    a8e0:	f3 0f 1e fa          	endbr64 
  }
    a8e4:	31 c0                	xor    %eax,%eax
    a8e6:	c3                   	retq   
    a8e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    a8ee:	00 00 

000000000000a8f0 <_ZN9SimStream4feofEv>:
  int feof() {
    a8f0:	f3 0f 1e fa          	endbr64 
    return n <= 0;
    a8f4:	31 c0                	xor    %eax,%eax
    a8f6:	48 83 7f 08 00       	cmpq   $0x0,0x8(%rdi)
    a8fb:	0f 9e c0             	setle  %al
  }
    a8fe:	c3                   	retq   
    a8ff:	90                   	nop

000000000000a900 <_ZN9SimStreamD1Ev>:
  ~SimStream() { 
    a900:	f3 0f 1e fa          	endbr64 
  }
    a904:	c3                   	retq   
    a905:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    a90c:	00 00 00 
    a90f:	90                   	nop

000000000000a910 <_ZN9SimStream4readEPfii>:
  size_t read( float* dest, int dim, int num ) {
    a910:	f3 0f 1e fa          	endbr64 
    a914:	41 57                	push   %r15
    a916:	41 56                	push   %r14
    a918:	41 55                	push   %r13
    a91a:	41 54                	push   %r12
    a91c:	55                   	push   %rbp
    a91d:	53                   	push   %rbx
    a91e:	48 83 ec 38          	sub    $0x38,%rsp
    for( int i = 0; i < num && n > 0; i++ ) {
    a922:	85 c9                	test   %ecx,%ecx
    a924:	0f 8e 46 05 00 00    	jle    ae70 <_ZN9SimStream4readEPfii+0x560>
    a92a:	48 8b 6f 08          	mov    0x8(%rdi),%rbp
    a92e:	48 85 ed             	test   %rbp,%rbp
    a931:	0f 8e 39 05 00 00    	jle    ae70 <_ZN9SimStream4readEPfii+0x560>
    a937:	41 89 d4             	mov    %edx,%r12d
    a93a:	8d 52 ef             	lea    -0x11(%rdx),%edx
    a93d:	49 89 ff             	mov    %rdi,%r15
    a940:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    a945:	8d 79 ff             	lea    -0x1(%rcx),%edi
    a948:	83 e2 f0             	and    $0xfffffff0,%edx
    a94b:	45 31 f6             	xor    %r14d,%r14d
    size_t count = 0;
    a94e:	45 31 ed             	xor    %r13d,%r13d
    a951:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    a956:	8d 4a 10             	lea    0x10(%rdx),%ecx
    a959:	48 83 c7 01          	add    $0x1,%rdi
    a95d:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
    a962:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
    a966:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    a96d:	00 00 00 
      for( int k = 0; k < dim; k++ ) {
    a970:	45 85 e4             	test   %r12d,%r12d
    a973:	0f 8e 82 04 00 00    	jle    adfb <_ZN9SimStream4readEPfii+0x4eb>
    a979:	41 83 fc 10          	cmp    $0x10,%r12d
    a97d:	0f 8e b4 04 00 00    	jle    ae37 <_ZN9SimStream4readEPfii+0x527>
    a983:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    a988:	f3 0f 10 1d 28 1c 00 	movss  0x1c28(%rip),%xmm3        # c5b8 <_ZTS10FileStream+0x10>
    a98f:	00 
    a990:	49 63 f6             	movslq %r14d,%rsi
    a993:	31 ed                	xor    %ebp,%ebp
    a995:	48 8d 5c b0 28       	lea    0x28(%rax,%rsi,4),%rbx
    a99a:	f3 0f 11 5c 24 18    	movss  %xmm3,0x18(%rsp)
    a9a0:	48 89 34 24          	mov    %rsi,(%rsp)
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    a9a4:	0f 18 0b             	prefetcht0 (%rbx)
    a9a7:	83 c5 10             	add    $0x10,%ebp
    a9aa:	48 83 c3 40          	add    $0x40,%rbx
    a9ae:	e8 bd 79 ff ff       	callq  2370 <lrand48@plt>
    a9b3:	66 0f ef c0          	pxor   %xmm0,%xmm0
    a9b7:	f3 48 0f 2a c0       	cvtsi2ss %rax,%xmm0
    a9bc:	f3 0f 59 44 24 18    	mulss  0x18(%rsp),%xmm0
    a9c2:	f3 0f 11 43 98       	movss  %xmm0,-0x68(%rbx)
    a9c7:	e8 a4 79 ff ff       	callq  2370 <lrand48@plt>
    a9cc:	66 0f ef c9          	pxor   %xmm1,%xmm1
    a9d0:	f3 48 0f 2a c8       	cvtsi2ss %rax,%xmm1
    a9d5:	f3 0f 59 4c 24 18    	mulss  0x18(%rsp),%xmm1
    a9db:	f3 0f 11 4b 9c       	movss  %xmm1,-0x64(%rbx)
    a9e0:	e8 8b 79 ff ff       	callq  2370 <lrand48@plt>
    a9e5:	66 0f ef d2          	pxor   %xmm2,%xmm2
    a9e9:	f3 48 0f 2a d0       	cvtsi2ss %rax,%xmm2
    a9ee:	f3 0f 59 54 24 18    	mulss  0x18(%rsp),%xmm2
    a9f4:	f3 0f 11 53 a0       	movss  %xmm2,-0x60(%rbx)
    a9f9:	e8 72 79 ff ff       	callq  2370 <lrand48@plt>
    a9fe:	66 0f ef e4          	pxor   %xmm4,%xmm4
    aa02:	f3 48 0f 2a e0       	cvtsi2ss %rax,%xmm4
    aa07:	f3 0f 59 64 24 18    	mulss  0x18(%rsp),%xmm4
    aa0d:	f3 0f 11 63 a4       	movss  %xmm4,-0x5c(%rbx)
    aa12:	e8 59 79 ff ff       	callq  2370 <lrand48@plt>
    aa17:	66 0f ef ed          	pxor   %xmm5,%xmm5
    aa1b:	f3 48 0f 2a e8       	cvtsi2ss %rax,%xmm5
    aa20:	f3 0f 59 6c 24 18    	mulss  0x18(%rsp),%xmm5
    aa26:	f3 0f 11 6b a8       	movss  %xmm5,-0x58(%rbx)
    aa2b:	e8 40 79 ff ff       	callq  2370 <lrand48@plt>
    aa30:	66 0f ef f6          	pxor   %xmm6,%xmm6
    aa34:	f3 48 0f 2a f0       	cvtsi2ss %rax,%xmm6
    aa39:	f3 0f 59 74 24 18    	mulss  0x18(%rsp),%xmm6
    aa3f:	f3 0f 11 73 ac       	movss  %xmm6,-0x54(%rbx)
    aa44:	e8 27 79 ff ff       	callq  2370 <lrand48@plt>
    aa49:	66 0f ef ff          	pxor   %xmm7,%xmm7
    aa4d:	f3 48 0f 2a f8       	cvtsi2ss %rax,%xmm7
    aa52:	f3 0f 59 7c 24 18    	mulss  0x18(%rsp),%xmm7
    aa58:	f3 0f 11 7b b0       	movss  %xmm7,-0x50(%rbx)
    aa5d:	e8 0e 79 ff ff       	callq  2370 <lrand48@plt>
    aa62:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    aa67:	f3 4c 0f 2a c0       	cvtsi2ss %rax,%xmm8
    aa6c:	f3 44 0f 59 44 24 18 	mulss  0x18(%rsp),%xmm8
    aa73:	f3 44 0f 11 43 b4    	movss  %xmm8,-0x4c(%rbx)
    aa79:	e8 f2 78 ff ff       	callq  2370 <lrand48@plt>
    aa7e:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    aa83:	f3 4c 0f 2a c8       	cvtsi2ss %rax,%xmm9
    aa88:	f3 44 0f 59 4c 24 18 	mulss  0x18(%rsp),%xmm9
    aa8f:	f3 44 0f 11 4b b8    	movss  %xmm9,-0x48(%rbx)
    aa95:	e8 d6 78 ff ff       	callq  2370 <lrand48@plt>
    aa9a:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    aa9f:	f3 4c 0f 2a d0       	cvtsi2ss %rax,%xmm10
    aaa4:	f3 44 0f 59 54 24 18 	mulss  0x18(%rsp),%xmm10
    aaab:	f3 44 0f 11 53 bc    	movss  %xmm10,-0x44(%rbx)
    aab1:	e8 ba 78 ff ff       	callq  2370 <lrand48@plt>
    aab6:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    aabb:	f3 4c 0f 2a d8       	cvtsi2ss %rax,%xmm11
    aac0:	f3 44 0f 59 5c 24 18 	mulss  0x18(%rsp),%xmm11
    aac7:	f3 44 0f 11 5b c0    	movss  %xmm11,-0x40(%rbx)
    aacd:	e8 9e 78 ff ff       	callq  2370 <lrand48@plt>
    aad2:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    aad7:	f3 4c 0f 2a e0       	cvtsi2ss %rax,%xmm12
    aadc:	f3 44 0f 59 64 24 18 	mulss  0x18(%rsp),%xmm12
    aae3:	f3 44 0f 11 63 c4    	movss  %xmm12,-0x3c(%rbx)
    aae9:	e8 82 78 ff ff       	callq  2370 <lrand48@plt>
    aaee:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    aaf3:	f3 4c 0f 2a e8       	cvtsi2ss %rax,%xmm13
    aaf8:	f3 44 0f 59 6c 24 18 	mulss  0x18(%rsp),%xmm13
    aaff:	f3 44 0f 11 6b c8    	movss  %xmm13,-0x38(%rbx)
    ab05:	e8 66 78 ff ff       	callq  2370 <lrand48@plt>
    ab0a:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    ab0f:	f3 4c 0f 2a f0       	cvtsi2ss %rax,%xmm14
    ab14:	f3 44 0f 59 74 24 18 	mulss  0x18(%rsp),%xmm14
    ab1b:	f3 44 0f 11 73 cc    	movss  %xmm14,-0x34(%rbx)
    ab21:	e8 4a 78 ff ff       	callq  2370 <lrand48@plt>
    ab26:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    ab2b:	f3 4c 0f 2a f8       	cvtsi2ss %rax,%xmm15
    ab30:	f3 44 0f 59 7c 24 18 	mulss  0x18(%rsp),%xmm15
    ab37:	f3 44 0f 11 7b d0    	movss  %xmm15,-0x30(%rbx)
    ab3d:	e8 2e 78 ff ff       	callq  2370 <lrand48@plt>
    ab42:	66 0f ef db          	pxor   %xmm3,%xmm3
    ab46:	48 8b 34 24          	mov    (%rsp),%rsi
    ab4a:	f3 48 0f 2a d8       	cvtsi2ss %rax,%xmm3
    ab4f:	f3 0f 59 5c 24 18    	mulss  0x18(%rsp),%xmm3
    ab55:	f3 0f 11 5b d4       	movss  %xmm3,-0x2c(%rbx)
      for( int k = 0; k < dim; k++ ) {
    ab5a:	3b 6c 24 1c          	cmp    0x1c(%rsp),%ebp
    ab5e:	0f 85 3c fe ff ff    	jne    a9a0 <_ZN9SimStream4readEPfii+0x90>
    ab64:	4c 63 c5             	movslq %ebp,%r8
    ab67:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
    ab6c:	4d 89 c2             	mov    %r8,%r10
    ab6f:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
    ab74:	49 f7 d2             	not    %r10
    ab77:	49 8d 2c b1          	lea    (%r9,%rsi,4),%rbp
    ab7b:	45 01 e2             	add    %r12d,%r10d
    ab7e:	41 83 e2 07          	and    $0x7,%r10d
    ab82:	44 89 14 24          	mov    %r10d,(%rsp)
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ab86:	e8 e5 77 ff ff       	callq  2370 <lrand48@plt>
    ab8b:	66 0f ef c0          	pxor   %xmm0,%xmm0
    ab8f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
      for( int k = 0; k < dim; k++ ) {
    ab94:	8b 3c 24             	mov    (%rsp),%edi
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ab97:	f3 48 0f 2a c0       	cvtsi2ss %rax,%xmm0
    ab9c:	f3 0f 59 44 24 18    	mulss  0x18(%rsp),%xmm0
    aba2:	49 8d 5b 01          	lea    0x1(%r11),%rbx
      for( int k = 0; k < dim; k++ ) {
    aba6:	41 39 dc             	cmp    %ebx,%r12d
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    aba9:	f3 42 0f 11 44 9d 00 	movss  %xmm0,0x0(%rbp,%r11,4)
      for( int k = 0; k < dim; k++ ) {
    abb0:	0f 8e 41 02 00 00    	jle    adf7 <_ZN9SimStream4readEPfii+0x4e7>
    abb6:	4c 89 1c 24          	mov    %r11,(%rsp)
    abba:	85 ff                	test   %edi,%edi
    abbc:	0f 84 ee 00 00 00    	je     acb0 <_ZN9SimStream4readEPfii+0x3a0>
    abc2:	83 ff 01             	cmp    $0x1,%edi
    abc5:	0f 84 b7 00 00 00    	je     ac82 <_ZN9SimStream4readEPfii+0x372>
    abcb:	83 ff 02             	cmp    $0x2,%edi
    abce:	0f 84 90 00 00 00    	je     ac64 <_ZN9SimStream4readEPfii+0x354>
    abd4:	83 ff 03             	cmp    $0x3,%edi
    abd7:	74 6d                	je     ac46 <_ZN9SimStream4readEPfii+0x336>
    abd9:	83 ff 04             	cmp    $0x4,%edi
    abdc:	74 4a                	je     ac28 <_ZN9SimStream4readEPfii+0x318>
    abde:	83 ff 05             	cmp    $0x5,%edi
    abe1:	74 27                	je     ac0a <_ZN9SimStream4readEPfii+0x2fa>
    abe3:	83 ff 06             	cmp    $0x6,%edi
    abe6:	0f 85 5d 02 00 00    	jne    ae49 <_ZN9SimStream4readEPfii+0x539>
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    abec:	e8 7f 77 ff ff       	callq  2370 <lrand48@plt>
    abf1:	66 0f ef d2          	pxor   %xmm2,%xmm2
    abf5:	f3 48 0f 2a d0       	cvtsi2ss %rax,%xmm2
    abfa:	f3 0f 59 54 24 18    	mulss  0x18(%rsp),%xmm2
    ac00:	f3 0f 11 54 9d 00    	movss  %xmm2,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac06:	48 83 c3 01          	add    $0x1,%rbx
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ac0a:	e8 61 77 ff ff       	callq  2370 <lrand48@plt>
    ac0f:	66 0f ef e4          	pxor   %xmm4,%xmm4
    ac13:	f3 48 0f 2a e0       	cvtsi2ss %rax,%xmm4
    ac18:	f3 0f 59 64 24 18    	mulss  0x18(%rsp),%xmm4
    ac1e:	f3 0f 11 64 9d 00    	movss  %xmm4,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac24:	48 83 c3 01          	add    $0x1,%rbx
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ac28:	e8 43 77 ff ff       	callq  2370 <lrand48@plt>
    ac2d:	66 0f ef ed          	pxor   %xmm5,%xmm5
    ac31:	f3 48 0f 2a e8       	cvtsi2ss %rax,%xmm5
    ac36:	f3 0f 59 6c 24 18    	mulss  0x18(%rsp),%xmm5
    ac3c:	f3 0f 11 6c 9d 00    	movss  %xmm5,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac42:	48 83 c3 01          	add    $0x1,%rbx
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ac46:	e8 25 77 ff ff       	callq  2370 <lrand48@plt>
    ac4b:	66 0f ef f6          	pxor   %xmm6,%xmm6
    ac4f:	f3 48 0f 2a f0       	cvtsi2ss %rax,%xmm6
    ac54:	f3 0f 59 74 24 18    	mulss  0x18(%rsp),%xmm6
    ac5a:	f3 0f 11 74 9d 00    	movss  %xmm6,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac60:	48 83 c3 01          	add    $0x1,%rbx
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ac64:	e8 07 77 ff ff       	callq  2370 <lrand48@plt>
    ac69:	66 0f ef ff          	pxor   %xmm7,%xmm7
    ac6d:	f3 48 0f 2a f8       	cvtsi2ss %rax,%xmm7
    ac72:	f3 0f 59 7c 24 18    	mulss  0x18(%rsp),%xmm7
    ac78:	f3 0f 11 7c 9d 00    	movss  %xmm7,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac7e:	48 83 c3 01          	add    $0x1,%rbx
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ac82:	e8 e9 76 ff ff       	callq  2370 <lrand48@plt>
    ac87:	66 45 0f ef c0       	pxor   %xmm8,%xmm8
    ac8c:	f3 4c 0f 2a c0       	cvtsi2ss %rax,%xmm8
    ac91:	f3 44 0f 59 44 24 18 	mulss  0x18(%rsp),%xmm8
    ac98:	f3 44 0f 11 44 9d 00 	movss  %xmm8,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ac9f:	48 83 c3 01          	add    $0x1,%rbx
    aca3:	41 39 dc             	cmp    %ebx,%r12d
    aca6:	0f 8e 4b 01 00 00    	jle    adf7 <_ZN9SimStream4readEPfii+0x4e7>
    acac:	0f 1f 40 00          	nopl   0x0(%rax)
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    acb0:	e8 bb 76 ff ff       	callq  2370 <lrand48@plt>
    acb5:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    acba:	48 8d 4b 01          	lea    0x1(%rbx),%rcx
    acbe:	f3 4c 0f 2a c8       	cvtsi2ss %rax,%xmm9
    acc3:	f3 44 0f 59 4c 24 18 	mulss  0x18(%rsp),%xmm9
    acca:	48 89 0c 24          	mov    %rcx,(%rsp)
    acce:	f3 44 0f 11 4c 9d 00 	movss  %xmm9,0x0(%rbp,%rbx,4)
    acd5:	e8 96 76 ff ff       	callq  2370 <lrand48@plt>
    acda:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    acdf:	48 8d 73 02          	lea    0x2(%rbx),%rsi
    ace3:	f3 4c 0f 2a d0       	cvtsi2ss %rax,%xmm10
    ace8:	f3 44 0f 59 54 24 18 	mulss  0x18(%rsp),%xmm10
    acef:	48 8b 04 24          	mov    (%rsp),%rax
    acf3:	48 89 34 24          	mov    %rsi,(%rsp)
    acf7:	f3 44 0f 11 54 85 00 	movss  %xmm10,0x0(%rbp,%rax,4)
    acfe:	e8 6d 76 ff ff       	callq  2370 <lrand48@plt>
    ad03:	66 45 0f ef db       	pxor   %xmm11,%xmm11
    ad08:	4c 8b 04 24          	mov    (%rsp),%r8
    ad0c:	4c 8d 4b 03          	lea    0x3(%rbx),%r9
    ad10:	f3 4c 0f 2a d8       	cvtsi2ss %rax,%xmm11
    ad15:	f3 44 0f 59 5c 24 18 	mulss  0x18(%rsp),%xmm11
    ad1c:	4c 89 0c 24          	mov    %r9,(%rsp)
    ad20:	f3 46 0f 11 5c 85 00 	movss  %xmm11,0x0(%rbp,%r8,4)
    ad27:	e8 44 76 ff ff       	callq  2370 <lrand48@plt>
    ad2c:	66 45 0f ef e4       	pxor   %xmm12,%xmm12
    ad31:	4c 8b 14 24          	mov    (%rsp),%r10
    ad35:	4c 8d 5b 04          	lea    0x4(%rbx),%r11
    ad39:	f3 4c 0f 2a e0       	cvtsi2ss %rax,%xmm12
    ad3e:	f3 44 0f 59 64 24 18 	mulss  0x18(%rsp),%xmm12
    ad45:	4c 89 1c 24          	mov    %r11,(%rsp)
    ad49:	f3 46 0f 11 64 95 00 	movss  %xmm12,0x0(%rbp,%r10,4)
    ad50:	e8 1b 76 ff ff       	callq  2370 <lrand48@plt>
    ad55:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    ad5a:	48 8b 3c 24          	mov    (%rsp),%rdi
    ad5e:	48 8d 53 05          	lea    0x5(%rbx),%rdx
    ad62:	f3 4c 0f 2a e8       	cvtsi2ss %rax,%xmm13
    ad67:	f3 44 0f 59 6c 24 18 	mulss  0x18(%rsp),%xmm13
    ad6e:	48 89 14 24          	mov    %rdx,(%rsp)
    ad72:	f3 44 0f 11 6c bd 00 	movss  %xmm13,0x0(%rbp,%rdi,4)
    ad79:	e8 f2 75 ff ff       	callq  2370 <lrand48@plt>
    ad7e:	66 45 0f ef f6       	pxor   %xmm14,%xmm14
    ad83:	48 8b 0c 24          	mov    (%rsp),%rcx
    ad87:	f3 4c 0f 2a f0       	cvtsi2ss %rax,%xmm14
    ad8c:	f3 44 0f 59 74 24 18 	mulss  0x18(%rsp),%xmm14
    ad93:	48 8d 43 06          	lea    0x6(%rbx),%rax
    ad97:	48 89 04 24          	mov    %rax,(%rsp)
    ad9b:	f3 44 0f 11 74 8d 00 	movss  %xmm14,0x0(%rbp,%rcx,4)
    ada2:	e8 c9 75 ff ff       	callq  2370 <lrand48@plt>
    ada7:	66 45 0f ef ff       	pxor   %xmm15,%xmm15
    adac:	48 8b 34 24          	mov    (%rsp),%rsi
    adb0:	4c 8d 43 07          	lea    0x7(%rbx),%r8
    adb4:	f3 4c 0f 2a f8       	cvtsi2ss %rax,%xmm15
    adb9:	f3 44 0f 59 7c 24 18 	mulss  0x18(%rsp),%xmm15
    adc0:	4c 89 04 24          	mov    %r8,(%rsp)
    adc4:	48 83 c3 08          	add    $0x8,%rbx
    adc8:	f3 44 0f 11 7c b5 00 	movss  %xmm15,0x0(%rbp,%rsi,4)
    adcf:	e8 9c 75 ff ff       	callq  2370 <lrand48@plt>
    add4:	66 0f ef db          	pxor   %xmm3,%xmm3
    add8:	4c 8b 0c 24          	mov    (%rsp),%r9
    addc:	f3 48 0f 2a d8       	cvtsi2ss %rax,%xmm3
    ade1:	f3 0f 59 5c 24 18    	mulss  0x18(%rsp),%xmm3
    ade7:	f3 42 0f 11 5c 8d 00 	movss  %xmm3,0x0(%rbp,%r9,4)
      for( int k = 0; k < dim; k++ ) {
    adee:	41 39 dc             	cmp    %ebx,%r12d
    adf1:	0f 8f b9 fe ff ff    	jg     acb0 <_ZN9SimStream4readEPfii+0x3a0>
    adf7:	49 8b 6f 08          	mov    0x8(%r15),%rbp
      n--;
    adfb:	48 83 ed 01          	sub    $0x1,%rbp
      count++;
    adff:	49 8d 5d 01          	lea    0x1(%r13),%rbx
      n--;
    ae03:	49 89 6f 08          	mov    %rbp,0x8(%r15)
    for( int i = 0; i < num && n > 0; i++ ) {
    ae07:	4c 3b 6c 24 08       	cmp    0x8(%rsp),%r13
    ae0c:	74 15                	je     ae23 <_ZN9SimStream4readEPfii+0x513>
    ae0e:	45 01 e6             	add    %r12d,%r14d
    ae11:	48 85 ed             	test   %rbp,%rbp
    ae14:	7e 08                	jle    ae1e <_ZN9SimStream4readEPfii+0x50e>
    ae16:	49 89 dd             	mov    %rbx,%r13
    ae19:	e9 52 fb ff ff       	jmpq   a970 <_ZN9SimStream4readEPfii+0x60>
      count++;
    ae1e:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
  }
    ae23:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    ae28:	48 83 c4 38          	add    $0x38,%rsp
    ae2c:	5b                   	pop    %rbx
    ae2d:	5d                   	pop    %rbp
    ae2e:	41 5c                	pop    %r12
    ae30:	41 5d                	pop    %r13
    ae32:	41 5e                	pop    %r14
    ae34:	41 5f                	pop    %r15
    ae36:	c3                   	retq   
	dest[i*dim + k] = lrand48()/(float)INT_MAX;
    ae37:	31 ed                	xor    %ebp,%ebp
    ae39:	49 63 f6             	movslq %r14d,%rsi
    ae3c:	c7 44 24 18 00 00 00 	movl   $0x30000000,0x18(%rsp)
    ae43:	30 
    ae44:	e9 1b fd ff ff       	jmpq   ab64 <_ZN9SimStream4readEPfii+0x254>
    ae49:	e8 22 75 ff ff       	callq  2370 <lrand48@plt>
    ae4e:	66 0f ef c9          	pxor   %xmm1,%xmm1
    ae52:	48 8b 14 24          	mov    (%rsp),%rdx
    ae56:	f3 48 0f 2a c8       	cvtsi2ss %rax,%xmm1
    ae5b:	f3 0f 59 4c 24 18    	mulss  0x18(%rsp),%xmm1
    ae61:	f3 0f 11 4c 9d 00    	movss  %xmm1,0x0(%rbp,%rbx,4)
      for( int k = 0; k < dim; k++ ) {
    ae67:	48 8d 5a 02          	lea    0x2(%rdx),%rbx
    ae6b:	e9 7c fd ff ff       	jmpq   abec <_ZN9SimStream4readEPfii+0x2dc>
    size_t count = 0;
    ae70:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
    ae77:	00 00 
    ae79:	eb a8                	jmp    ae23 <_ZN9SimStream4readEPfii+0x513>
    ae7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

000000000000ae80 <_ZN10FileStreamD1Ev>:
  ~FileStream() {
    ae80:	f3 0f 1e fa          	endbr64 
    ae84:	48 8d 05 4d 3d 00 00 	lea    0x3d4d(%rip),%rax        # ebd8 <_ZTV10FileStream+0x10>
    ae8b:	53                   	push   %rbx
    ae8c:	48 8b 0d 8d 41 00 00 	mov    0x418d(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    ae93:	48 89 fb             	mov    %rdi,%rbx
    ae96:	48 89 07             	mov    %rax,(%rdi)
    ae99:	ba 14 00 00 00       	mov    $0x14,%edx
    ae9e:	be 01 00 00 00       	mov    $0x1,%esi
    aea3:	48 8d 3d 5a 11 00 00 	lea    0x115a(%rip),%rdi        # c004 <_IO_stdin_used+0x4>
    aeaa:	e8 a1 76 ff ff       	callq  2550 <fwrite@plt>
    fclose(fp);
    aeaf:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  }
    aeb3:	5b                   	pop    %rbx
    fclose(fp);
    aeb4:	e9 07 75 ff ff       	jmpq   23c0 <fclose@plt>
    aeb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

000000000000aec0 <_ZN10FileStream4readEPfii>:
  size_t read( float* dest, int dim, int num ) {
    aec0:	f3 0f 1e fa          	endbr64 
    aec4:	48 89 f0             	mov    %rsi,%rax
    aec7:	48 63 f2             	movslq %edx,%rsi
    aeca:	48 63 d1             	movslq %ecx,%rdx
	return __fread_chk (__ptr, __bos0 (__ptr), __size, __n, __stream);

      if (__size * __n > __bos0 (__ptr))
	return __fread_chk_warn (__ptr, __bos0 (__ptr), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
    aecd:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    return std::fread(dest, sizeof(float)*dim, num, fp); 
    aed1:	48 c1 e6 02          	shl    $0x2,%rsi
    aed5:	48 89 c7             	mov    %rax,%rdi
    aed8:	e9 e3 75 ff ff       	jmpq   24c0 <fread@plt>
    aedd:	0f 1f 00             	nopl   (%rax)

000000000000aee0 <_ZN10FileStream6ferrorEv>:
  int ferror() {
    aee0:	f3 0f 1e fa          	endbr64 
    return std::ferror(fp);
    aee4:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    aee8:	e9 43 76 ff ff       	jmpq   2530 <ferror@plt>
    aeed:	0f 1f 00             	nopl   (%rax)

000000000000aef0 <_ZN10FileStream4feofEv>:
  int feof() {
    aef0:	f3 0f 1e fa          	endbr64 
    return std::feof(fp);
    aef4:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    aef8:	e9 03 76 ff ff       	jmpq   2500 <feof@plt>
    aefd:	0f 1f 00             	nopl   (%rax)

000000000000af00 <_ZN9SimStreamD0Ev>:
  ~SimStream() { 
    af00:	f3 0f 1e fa          	endbr64 
  }
    af04:	be 10 00 00 00       	mov    $0x10,%esi
    af09:	e9 d2 74 ff ff       	jmpq   23e0 <_ZdlPvm@plt>
    af0e:	66 90                	xchg   %ax,%ax

000000000000af10 <_ZN10FileStreamD0Ev>:
  ~FileStream() {
    af10:	f3 0f 1e fa          	endbr64 
    af14:	48 8d 05 bd 3c 00 00 	lea    0x3cbd(%rip),%rax        # ebd8 <_ZTV10FileStream+0x10>
    af1b:	53                   	push   %rbx
  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
    af1c:	48 8b 0d fd 40 00 00 	mov    0x40fd(%rip),%rcx        # f020 <stderr@@GLIBC_2.2.5>
    af23:	48 89 fb             	mov    %rdi,%rbx
    af26:	48 89 07             	mov    %rax,(%rdi)
    af29:	be 01 00 00 00       	mov    $0x1,%esi
    af2e:	ba 14 00 00 00       	mov    $0x14,%edx
    af33:	48 8d 3d ca 10 00 00 	lea    0x10ca(%rip),%rdi        # c004 <_IO_stdin_used+0x4>
    af3a:	e8 11 76 ff ff       	callq  2550 <fwrite@plt>
    fclose(fp);
    af3f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    af43:	e8 78 74 ff ff       	callq  23c0 <fclose@plt>
  }
    af48:	48 89 df             	mov    %rbx,%rdi
    af4b:	be 10 00 00 00       	mov    $0x10,%esi
    af50:	5b                   	pop    %rbx
    af51:	e9 8a 74 ff ff       	jmpq   23e0 <_ZdlPvm@plt>
    af56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    af5d:	00 00 00 

000000000000af60 <_ZN10FileStreamC1EPc>:
  FileStream(char* filename) {
    af60:	f3 0f 1e fa          	endbr64 
    af64:	55                   	push   %rbp
    af65:	48 8d 05 6c 3c 00 00 	lea    0x3c6c(%rip),%rax        # ebd8 <_ZTV10FileStream+0x10>
    af6c:	48 89 f5             	mov    %rsi,%rbp
    fp = fopen( filename, "rb");
    af6f:	48 8d 35 f7 15 00 00 	lea    0x15f7(%rip),%rsi        # c56d <_IO_stdin_used+0x56d>
  FileStream(char* filename) {
    af76:	53                   	push   %rbx
    af77:	48 89 fb             	mov    %rdi,%rbx
    af7a:	48 83 ec 08          	sub    $0x8,%rsp
    af7e:	48 89 07             	mov    %rax,(%rdi)
    fp = fopen( filename, "rb");
    af81:	48 89 ef             	mov    %rbp,%rdi
    af84:	e8 97 74 ff ff       	callq  2420 <fopen@plt>
    af89:	48 89 43 08          	mov    %rax,0x8(%rbx)
    if( fp == NULL ) {
    af8d:	48 85 c0             	test   %rax,%rax
    af90:	74 07                	je     af99 <_ZN10FileStreamC1EPc+0x39>
  }
    af92:	48 83 c4 08          	add    $0x8,%rsp
    af96:	5b                   	pop    %rbx
    af97:	5d                   	pop    %rbp
    af98:	c3                   	retq   
    af99:	48 8b 3d 80 40 00 00 	mov    0x4080(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    afa0:	48 89 e9             	mov    %rbp,%rcx
    afa3:	be 01 00 00 00       	mov    $0x1,%esi
    afa8:	48 8d 15 c1 15 00 00 	lea    0x15c1(%rip),%rdx        # c570 <_IO_stdin_used+0x570>
    afaf:	e8 5c 75 ff ff       	callq  2510 <__fprintf_chk@plt>
      exit(1);
    afb4:	bf 01 00 00 00       	mov    $0x1,%edi
    afb9:	e8 92 74 ff ff       	callq  2450 <exit@plt>
    afbe:	66 90                	xchg   %ax,%ax

000000000000afc0 <_Z19parsec_barrier_initP16parsec_barrier_tPKij>:
static const spin_counter_t SPIN_COUNTER_MAX=350*100;
#endif //ENABLE_SPIN_BARRIER


//Barrier initialization & destruction
int parsec_barrier_init(parsec_barrier_t *barrier, const parsec_barrierattr_t *attr, unsigned count) {
    afc0:	f3 0f 1e fa          	endbr64 
  //check assumptions used in header
  assert(PARSEC_BARRIER_SERIAL_THREAD != 0);

  //check arguments
  if(barrier==NULL) return EINVAL;
  if(count<=0) return EINVAL;
    afc4:	85 d2                	test   %edx,%edx
    afc6:	74 48                	je     b010 <_Z19parsec_barrier_initP16parsec_barrier_tPKij+0x50>
    afc8:	48 85 ff             	test   %rdi,%rdi
    afcb:	74 43                	je     b010 <_Z19parsec_barrier_initP16parsec_barrier_tPKij+0x50>
int parsec_barrier_init(parsec_barrier_t *barrier, const parsec_barrierattr_t *attr, unsigned count) {
    afcd:	53                   	push   %rbx
    afce:	48 89 fb             	mov    %rdi,%rbx
  //only private barriers (the default) are currently supported
  if(attr!=NULL && *attr==PARSEC_PROCESS_PRIVATE) NOT_IMPLEMENTED();
    afd1:	48 85 f6             	test   %rsi,%rsi
    afd4:	74 05                	je     afdb <_Z19parsec_barrier_initP16parsec_barrier_tPKij+0x1b>
    afd6:	83 3e 01             	cmpl   $0x1,(%rsi)
    afd9:	74 3b                	je     b016 <_Z19parsec_barrier_initP16parsec_barrier_tPKij+0x56>

  barrier->max = count;
  barrier->n = 0;
    afdb:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%rbx)
  barrier->is_arrival_phase = 1;

  rv = pthread_mutex_init(&barrier->mutex, NULL);
    afe2:	31 f6                	xor    %esi,%esi
    afe4:	48 89 df             	mov    %rbx,%rdi
  barrier->max = count;
    afe7:	89 53 58             	mov    %edx,0x58(%rbx)
  barrier->is_arrival_phase = 1;
    afea:	c7 43 60 01 00 00 00 	movl   $0x1,0x60(%rbx)
  rv = pthread_mutex_init(&barrier->mutex, NULL);
    aff1:	e8 ba 74 ff ff       	callq  24b0 <pthread_mutex_init@plt>
  if(rv != 0) return rv;
    aff6:	85 c0                	test   %eax,%eax
    aff8:	74 06                	je     b000 <_Z19parsec_barrier_initP16parsec_barrier_tPKij+0x40>
  rv= pthread_cond_init(&barrier->cond, NULL);
  return rv;
}
    affa:	5b                   	pop    %rbx
    affb:	c3                   	retq   
    affc:	0f 1f 40 00          	nopl   0x0(%rax)
  rv= pthread_cond_init(&barrier->cond, NULL);
    b000:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
    b004:	31 f6                	xor    %esi,%esi
}
    b006:	5b                   	pop    %rbx
  rv= pthread_cond_init(&barrier->cond, NULL);
    b007:	e9 34 74 ff ff       	jmpq   2440 <pthread_cond_init@plt>
    b00c:	0f 1f 40 00          	nopl   0x0(%rax)
  if(count<=0) return EINVAL;
    b010:	b8 16 00 00 00       	mov    $0x16,%eax
}
    b015:	c3                   	retq   
    b016:	48 8b 3d 03 40 00 00 	mov    0x4003(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    b01d:	41 b9 45 00 00 00    	mov    $0x45,%r9d
    b023:	31 c0                	xor    %eax,%eax
    b025:	4c 8d 05 34 16 00 00 	lea    0x1634(%rip),%r8        # c660 <_ZTS10FileStream+0xb8>
    b02c:	48 8d 0d fd 16 00 00 	lea    0x16fd(%rip),%rcx        # c730 <_ZZ19parsec_barrier_initP16parsec_barrier_tPKijE12__FUNCTION__>
    b033:	48 8d 15 4e 16 00 00 	lea    0x164e(%rip),%rdx        # c688 <_ZTS10FileStream+0xe0>
    b03a:	be 01 00 00 00       	mov    $0x1,%esi
    b03f:	e8 cc 74 ff ff       	callq  2510 <__fprintf_chk@plt>
  exit(1);
    b044:	bf 01 00 00 00       	mov    $0x1,%edi
    b049:	e8 02 74 ff ff       	callq  2450 <exit@plt>
    b04e:	66 90                	xchg   %ax,%ax

000000000000b050 <_Z22parsec_barrier_destroyP16parsec_barrier_t>:

int parsec_barrier_destroy(parsec_barrier_t *barrier) {
    b050:	f3 0f 1e fa          	endbr64 
    b054:	53                   	push   %rbx
  int rv;

  assert(barrier!=NULL);
    b055:	48 85 ff             	test   %rdi,%rdi
    b058:	74 32                	je     b08c <_Z22parsec_barrier_destroyP16parsec_barrier_t+0x3c>
    b05a:	48 89 fb             	mov    %rdi,%rbx

  rv = pthread_mutex_destroy(&barrier->mutex);
    b05d:	e8 9e 73 ff ff       	callq  2400 <pthread_mutex_destroy@plt>
  if(rv != 0) return rv;
    b062:	85 c0                	test   %eax,%eax
    b064:	74 0a                	je     b070 <_Z22parsec_barrier_destroyP16parsec_barrier_t+0x20>

  //If the barrier is still in use then the pthread_*_destroy functions should
  //have returned an error, but we check anyway to catch any other unexpected errors.
  if(barrier->n != 0) return EBUSY;
  return 0;
}
    b066:	5b                   	pop    %rbx
    b067:	c3                   	retq   
    b068:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    b06f:	00 
  rv= pthread_cond_destroy(&barrier->cond);
    b070:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
    b074:	e8 c7 74 ff ff       	callq  2540 <pthread_cond_destroy@plt>
  if(rv != 0) return rv;
    b079:	85 c0                	test   %eax,%eax
    b07b:	75 e9                	jne    b066 <_Z22parsec_barrier_destroyP16parsec_barrier_t+0x16>
  if(barrier->n != 0) return EBUSY;
    b07d:	8b 53 5c             	mov    0x5c(%rbx),%edx
    b080:	b9 10 00 00 00       	mov    $0x10,%ecx
}
    b085:	5b                   	pop    %rbx
  if(barrier->n != 0) return EBUSY;
    b086:	85 d2                	test   %edx,%edx
    b088:	0f 45 c1             	cmovne %ecx,%eax
}
    b08b:	c3                   	retq   
  assert(barrier!=NULL);
    b08c:	48 8d 0d 6d 16 00 00 	lea    0x166d(%rip),%rcx        # c700 <_ZZ22parsec_barrier_destroyP16parsec_barrier_tE19__PRETTY_FUNCTION__>
    b093:	ba 54 00 00 00       	mov    $0x54,%edx
    b098:	48 8d 35 c1 15 00 00 	lea    0x15c1(%rip),%rsi        # c660 <_ZTS10FileStream+0xb8>
    b09f:	48 8d 3d cd 15 00 00 	lea    0x15cd(%rip),%rdi        # c673 <_ZTS10FileStream+0xcb>
    b0a6:	e8 95 72 ff ff       	callq  2340 <__assert_fail@plt>
    b0ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

000000000000b0b0 <_Z26parsec_barrierattr_destroyPi>:

//Barrier attribute initialization & destruction
int parsec_barrierattr_destroy(parsec_barrierattr_t *attr) {
    b0b0:	f3 0f 1e fa          	endbr64 
  if(attr==NULL) return EINVAL;
    b0b4:	48 83 ff 01          	cmp    $0x1,%rdi
    b0b8:	19 c0                	sbb    %eax,%eax
    b0ba:	83 e0 16             	and    $0x16,%eax
  //simply do nothing
  return 0;
}
    b0bd:	c3                   	retq   
    b0be:	66 90                	xchg   %ax,%ax

000000000000b0c0 <_Z23parsec_barrierattr_initPi>:
    b0c0:	f3 0f 1e fa          	endbr64 
    b0c4:	48 83 ff 01          	cmp    $0x1,%rdi
    b0c8:	19 c0                	sbb    %eax,%eax
    b0ca:	83 e0 16             	and    $0x16,%eax
    b0cd:	c3                   	retq   
    b0ce:	66 90                	xchg   %ax,%ax

000000000000b0d0 <_Z29parsec_barrierattr_getpsharedPKiPi>:
  //simply do nothing
  return 0;
}

//Barrier attribute modification
int parsec_barrierattr_getpshared(const parsec_barrierattr_t *attr, int *pshared) {
    b0d0:	f3 0f 1e fa          	endbr64 
  if(attr==NULL || pshared==NULL) return EINVAL;
    b0d4:	48 85 ff             	test   %rdi,%rdi
    b0d7:	74 0f                	je     b0e8 <_Z29parsec_barrierattr_getpsharedPKiPi+0x18>
    b0d9:	48 85 f6             	test   %rsi,%rsi
    b0dc:	74 0a                	je     b0e8 <_Z29parsec_barrierattr_getpsharedPKiPi+0x18>
  *pshared = *attr;
    b0de:	8b 07                	mov    (%rdi),%eax
    b0e0:	89 06                	mov    %eax,(%rsi)
  return 0;
    b0e2:	31 c0                	xor    %eax,%eax
    b0e4:	c3                   	retq   
    b0e5:	0f 1f 00             	nopl   (%rax)
  if(attr==NULL || pshared==NULL) return EINVAL;
    b0e8:	b8 16 00 00 00       	mov    $0x16,%eax
}
    b0ed:	c3                   	retq   
    b0ee:	66 90                	xchg   %ax,%ax

000000000000b0f0 <_Z29parsec_barrierattr_setpsharedPii>:

int parsec_barrierattr_setpshared(parsec_barrierattr_t *attr, int pshared) {
    b0f0:	f3 0f 1e fa          	endbr64 
  if(attr==NULL) return EINVAL;
    b0f4:	48 85 ff             	test   %rdi,%rdi
    b0f7:	74 17                	je     b110 <_Z29parsec_barrierattr_setpsharedPii+0x20>
  if(pshared!=PARSEC_PROCESS_SHARED && pshared!=PARSEC_PROCESS_PRIVATE) return EINVAL;
    b0f9:	83 fe 01             	cmp    $0x1,%esi
    b0fc:	77 12                	ja     b110 <_Z29parsec_barrierattr_setpsharedPii+0x20>
  //Currently we only support private barriers (the default)
  if(pshared!=PARSEC_PROCESS_PRIVATE) NOT_IMPLEMENTED();
    b0fe:	75 16                	jne    b116 <_Z29parsec_barrierattr_setpsharedPii+0x26>
  *attr = pshared;
    b100:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  return 0;
    b106:	31 c0                	xor    %eax,%eax
    b108:	c3                   	retq   
    b109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  if(attr==NULL) return EINVAL;
    b110:	b8 16 00 00 00       	mov    $0x16,%eax
}
    b115:	c3                   	retq   
int parsec_barrierattr_setpshared(parsec_barrierattr_t *attr, int pshared) {
    b116:	50                   	push   %rax
    b117:	48 8b 3d 02 3f 00 00 	mov    0x3f02(%rip),%rdi        # f020 <stderr@@GLIBC_2.2.5>
    b11e:	31 c0                	xor    %eax,%eax
    b120:	41 b9 79 00 00 00    	mov    $0x79,%r9d
    b126:	4c 8d 05 33 15 00 00 	lea    0x1533(%rip),%r8        # c660 <_ZTS10FileStream+0xb8>
    b12d:	48 8d 0d ac 15 00 00 	lea    0x15ac(%rip),%rcx        # c6e0 <_ZZ29parsec_barrierattr_setpsharedPiiE12__FUNCTION__>
    b134:	be 01 00 00 00       	mov    $0x1,%esi
    b139:	48 8d 15 48 15 00 00 	lea    0x1548(%rip),%rdx        # c688 <_ZTS10FileStream+0xe0>
    b140:	e8 cb 73 ff ff       	callq  2510 <__fprintf_chk@plt>
  exit(1);
    b145:	bf 01 00 00 00       	mov    $0x1,%edi
    b14a:	e8 01 73 ff ff       	callq  2450 <exit@plt>
    b14f:	90                   	nop

000000000000b150 <_Z19parsec_barrier_waitP16parsec_barrier_t>:

//Barrier usage
int parsec_barrier_wait(parsec_barrier_t *barrier) {
    b150:	f3 0f 1e fa          	endbr64 
    b154:	41 56                	push   %r14
    b156:	41 55                	push   %r13
    b158:	41 54                	push   %r12
    b15a:	55                   	push   %rbp
    b15b:	53                   	push   %rbx
    b15c:	48 83 ec 10          	sub    $0x10,%rsp
  int master;
  int rv;

  if(barrier==NULL) return EINVAL;
    b160:	48 85 ff             	test   %rdi,%rdi
    b163:	0f 84 97 01 00 00    	je     b300 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1b0>
    b169:	48 89 fb             	mov    %rdi,%rbx

  rv = pthread_mutex_lock(&barrier->mutex);
    b16c:	e8 2f 73 ff ff       	callq  24a0 <pthread_mutex_lock@plt>
    b171:	89 c5                	mov    %eax,%ebp
  if(rv != 0) return rv;
    b173:	85 c0                	test   %eax,%eax
    b175:	75 5b                	jne    b1d2 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x82>
      return rv;
    }
  }
#else
  //A (necessarily) unsynchronized polling loop followed by fall-back blocking
  if(!barrier->is_arrival_phase) {
    b177:	8b 43 60             	mov    0x60(%rbx),%eax
    b17a:	85 c0                	test   %eax,%eax
    b17c:	74 6a                	je     b1e8 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x98>
    }
  }
#endif //ENABLE_SPIN_BARRIER

  //We are guaranteed to be in an arrival phase, proceed with barrier synchronization
  master = (barrier->n == 0); //Make first thread at barrier the master
    b17e:	44 8b 63 5c          	mov    0x5c(%rbx),%r12d
  barrier->n++;
    b182:	44 8b 4b 5c          	mov    0x5c(%rbx),%r9d
    b186:	41 83 c1 01          	add    $0x1,%r9d
    b18a:	44 89 4b 5c          	mov    %r9d,0x5c(%rbx)
  if(barrier->n >= barrier->max) {
    b18e:	44 8b 53 5c          	mov    0x5c(%rbx),%r10d
    b192:	44 3b 53 58          	cmp    0x58(%rbx),%r10d
    b196:	0f 83 7c 01 00 00    	jae    b318 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1c8>
#ifndef ENABLE_SPIN_BARRIER
    //Standard method to block on a condition variable
    while(barrier->is_arrival_phase) pthread_cond_wait(&barrier->cond, &barrier->mutex);
#else
    //we use again an unsynchronized polling loop followed by synchronized fall-back blocking
    if(barrier->is_arrival_phase) {
    b19c:	44 8b 5b 60          	mov    0x60(%rbx),%r11d
    b1a0:	45 85 db             	test   %r11d,%r11d
    b1a3:	0f 85 cf 00 00 00    	jne    b278 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x128>
        }
      }
    }
#endif //ENABLE_SPIN_BARRIER
  }
  barrier->n--;
    b1a9:	8b 7b 5c             	mov    0x5c(%rbx),%edi
    b1ac:	83 ef 01             	sub    $0x1,%edi
    b1af:	89 7b 5c             	mov    %edi,0x5c(%rbx)
  //last thread to leave barrier starts a new arrival phase
  if(barrier->n == 0) {
    b1b2:	44 8b 43 5c          	mov    0x5c(%rbx),%r8d
    b1b6:	45 85 c0             	test   %r8d,%r8d
    b1b9:	0f 84 71 01 00 00    	je     b330 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1e0>
    barrier->is_arrival_phase = 1;
    pthread_cond_broadcast(&barrier->cond);
  }
  pthread_mutex_unlock(&barrier->mutex);
    b1bf:	48 89 df             	mov    %rbx,%rdi

  return (master ? PARSEC_BARRIER_SERIAL_THREAD : 0);
    b1c2:	bb 04 00 00 00       	mov    $0x4,%ebx
  pthread_mutex_unlock(&barrier->mutex);
    b1c7:	e8 94 71 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
  return (master ? PARSEC_BARRIER_SERIAL_THREAD : 0);
    b1cc:	45 85 e4             	test   %r12d,%r12d
    b1cf:	0f 44 eb             	cmove  %ebx,%ebp
}
    b1d2:	48 83 c4 10          	add    $0x10,%rsp
    b1d6:	89 e8                	mov    %ebp,%eax
    b1d8:	5b                   	pop    %rbx
    b1d9:	5d                   	pop    %rbp
    b1da:	41 5c                	pop    %r12
    b1dc:	41 5d                	pop    %r13
    b1de:	41 5e                	pop    %r14
    b1e0:	c3                   	retq   
    b1e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    pthread_mutex_unlock(&barrier->mutex);
    b1e8:	48 89 df             	mov    %rbx,%rdi
    b1eb:	e8 70 71 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
    volatile spin_counter_t i=0;
    b1f0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    b1f7:	00 
    while(!barrier->is_arrival_phase && i<SPIN_COUNTER_MAX) i++;
    b1f8:	8b 53 60             	mov    0x60(%rbx),%edx
    b1fb:	85 d2                	test   %edx,%edx
    b1fd:	74 1c                	je     b21b <_Z19parsec_barrier_waitP16parsec_barrier_t+0xcb>
    b1ff:	eb 2f                	jmp    b230 <_Z19parsec_barrier_waitP16parsec_barrier_t+0xe0>
    b201:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    b208:	48 8b 34 24          	mov    (%rsp),%rsi
    b20c:	48 83 c6 01          	add    $0x1,%rsi
    b210:	48 89 34 24          	mov    %rsi,(%rsp)
    b214:	8b 7b 60             	mov    0x60(%rbx),%edi
    b217:	85 ff                	test   %edi,%edi
    b219:	75 15                	jne    b230 <_Z19parsec_barrier_waitP16parsec_barrier_t+0xe0>
    b21b:	48 8b 0c 24          	mov    (%rsp),%rcx
    b21f:	48 81 f9 b7 88 00 00 	cmp    $0x88b7,%rcx
    b226:	76 e0                	jbe    b208 <_Z19parsec_barrier_waitP16parsec_barrier_t+0xb8>
    b228:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    b22f:	00 
    while((rv=pthread_mutex_trylock(&barrier->mutex)) == EBUSY);
    b230:	48 89 df             	mov    %rbx,%rdi
    b233:	e8 b8 70 ff ff       	callq  22f0 <pthread_mutex_trylock@plt>
    b238:	83 f8 10             	cmp    $0x10,%eax
    b23b:	74 f3                	je     b230 <_Z19parsec_barrier_waitP16parsec_barrier_t+0xe0>
    if(rv != 0) return rv;
    b23d:	85 c0                	test   %eax,%eax
    b23f:	0f 85 03 01 00 00    	jne    b348 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1f8>
      rv = pthread_cond_wait(&barrier->cond, &barrier->mutex);
    b245:	4c 8d 6b 28          	lea    0x28(%rbx),%r13
    b249:	eb 1b                	jmp    b266 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x116>
    b24b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    b250:	48 89 de             	mov    %rbx,%rsi
    b253:	4c 89 ef             	mov    %r13,%rdi
    b256:	e8 75 72 ff ff       	callq  24d0 <pthread_cond_wait@plt>
    b25b:	41 89 c4             	mov    %eax,%r12d
      if(rv != 0) {
    b25e:	85 c0                	test   %eax,%eax
    b260:	0f 85 ea 00 00 00    	jne    b350 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x200>
    while(!barrier->is_arrival_phase) {
    b266:	44 8b 43 60          	mov    0x60(%rbx),%r8d
    b26a:	45 85 c0             	test   %r8d,%r8d
    b26d:	74 e1                	je     b250 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x100>
    b26f:	e9 0a ff ff ff       	jmpq   b17e <_Z19parsec_barrier_waitP16parsec_barrier_t+0x2e>
    b274:	0f 1f 40 00          	nopl   0x0(%rax)
      pthread_mutex_unlock(&barrier->mutex);
    b278:	48 89 df             	mov    %rbx,%rdi
    b27b:	e8 e0 70 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
      volatile spin_counter_t i=0;
    b280:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    b287:	00 00 
      while(barrier->is_arrival_phase && i<SPIN_COUNTER_MAX) i++;
    b289:	44 8b 73 60          	mov    0x60(%rbx),%r14d
    b28d:	45 85 f6             	test   %r14d,%r14d
    b290:	75 1b                	jne    b2ad <_Z19parsec_barrier_waitP16parsec_barrier_t+0x15d>
    b292:	eb 2c                	jmp    b2c0 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x170>
    b294:	0f 1f 40 00          	nopl   0x0(%rax)
    b298:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    b29d:	48 83 c2 01          	add    $0x1,%rdx
    b2a1:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    b2a6:	8b 4b 60             	mov    0x60(%rbx),%ecx
    b2a9:	85 c9                	test   %ecx,%ecx
    b2ab:	74 13                	je     b2c0 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x170>
    b2ad:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    b2b2:	48 3d b7 88 00 00    	cmp    $0x88b7,%rax
    b2b8:	76 de                	jbe    b298 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x148>
    b2ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
      while((rv=pthread_mutex_trylock(&barrier->mutex)) == EBUSY);
    b2c0:	48 89 df             	mov    %rbx,%rdi
    b2c3:	e8 28 70 ff ff       	callq  22f0 <pthread_mutex_trylock@plt>
    b2c8:	83 f8 10             	cmp    $0x10,%eax
    b2cb:	74 f3                	je     b2c0 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x170>
      if(rv != 0) return rv;
    b2cd:	85 c0                	test   %eax,%eax
    b2cf:	75 77                	jne    b348 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1f8>
        rv = pthread_cond_wait(&barrier->cond, &barrier->mutex);
    b2d1:	4c 8d 73 28          	lea    0x28(%rbx),%r14
    b2d5:	eb 1b                	jmp    b2f2 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x1a2>
    b2d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    b2de:	00 00 
    b2e0:	48 89 de             	mov    %rbx,%rsi
    b2e3:	4c 89 f7             	mov    %r14,%rdi
    b2e6:	e8 e5 71 ff ff       	callq  24d0 <pthread_cond_wait@plt>
    b2eb:	41 89 c5             	mov    %eax,%r13d
        if(rv != 0) {
    b2ee:	85 c0                	test   %eax,%eax
    b2f0:	75 6e                	jne    b360 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x210>
      while(barrier->is_arrival_phase) {
    b2f2:	8b 73 60             	mov    0x60(%rbx),%esi
    b2f5:	85 f6                	test   %esi,%esi
    b2f7:	75 e7                	jne    b2e0 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x190>
    b2f9:	e9 ab fe ff ff       	jmpq   b1a9 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x59>
    b2fe:	66 90                	xchg   %ax,%ax
}
    b300:	48 83 c4 10          	add    $0x10,%rsp
  if(barrier==NULL) return EINVAL;
    b304:	bd 16 00 00 00       	mov    $0x16,%ebp
}
    b309:	5b                   	pop    %rbx
    b30a:	89 e8                	mov    %ebp,%eax
    b30c:	5d                   	pop    %rbp
    b30d:	41 5c                	pop    %r12
    b30f:	41 5d                	pop    %r13
    b311:	41 5e                	pop    %r14
    b313:	c3                   	retq   
    b314:	0f 1f 40 00          	nopl   0x0(%rax)
    barrier->is_arrival_phase = 0;
    b318:	c7 43 60 00 00 00 00 	movl   $0x0,0x60(%rbx)
    pthread_cond_broadcast(&barrier->cond);
    b31f:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
    b323:	e8 d8 6f ff ff       	callq  2300 <pthread_cond_broadcast@plt>
    b328:	e9 7c fe ff ff       	jmpq   b1a9 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x59>
    b32d:	0f 1f 00             	nopl   (%rax)
    barrier->is_arrival_phase = 1;
    b330:	c7 43 60 01 00 00 00 	movl   $0x1,0x60(%rbx)
    pthread_cond_broadcast(&barrier->cond);
    b337:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
    b33b:	e8 c0 6f ff ff       	callq  2300 <pthread_cond_broadcast@plt>
    b340:	e9 7a fe ff ff       	jmpq   b1bf <_Z19parsec_barrier_waitP16parsec_barrier_t+0x6f>
    b345:	0f 1f 00             	nopl   (%rax)
    b348:	89 c5                	mov    %eax,%ebp
    b34a:	e9 83 fe ff ff       	jmpq   b1d2 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x82>
    b34f:	90                   	nop
        pthread_mutex_unlock(&barrier->mutex);
    b350:	48 89 df             	mov    %rbx,%rdi
      rv = pthread_cond_wait(&barrier->cond, &barrier->mutex);
    b353:	44 89 e5             	mov    %r12d,%ebp
        pthread_mutex_unlock(&barrier->mutex);
    b356:	e8 05 70 ff ff       	callq  2360 <pthread_mutex_unlock@plt>
        return rv;
    b35b:	e9 72 fe ff ff       	jmpq   b1d2 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x82>
          pthread_mutex_unlock(&barrier->mutex);
    b360:	48 89 df             	mov    %rbx,%rdi
        rv = pthread_cond_wait(&barrier->cond, &barrier->mutex);
    b363:	44 89 ed             	mov    %r13d,%ebp
          pthread_mutex_unlock(&barrier->mutex);
    b366:	e8 f5 6f ff ff       	callq  2360 <pthread_mutex_unlock@plt>
          return rv;
    b36b:	e9 62 fe ff ff       	jmpq   b1d2 <_Z19parsec_barrier_waitP16parsec_barrier_t+0x82>

000000000000b370 <__libc_csu_init>:
    b370:	f3 0f 1e fa          	endbr64 
    b374:	41 57                	push   %r15
    b376:	4c 8d 3d fb 37 00 00 	lea    0x37fb(%rip),%r15        # eb78 <__frame_dummy_init_array_entry>
    b37d:	41 56                	push   %r14
    b37f:	49 89 d6             	mov    %rdx,%r14
    b382:	41 55                	push   %r13
    b384:	49 89 f5             	mov    %rsi,%r13
    b387:	41 54                	push   %r12
    b389:	41 89 fc             	mov    %edi,%r12d
    b38c:	55                   	push   %rbp
    b38d:	48 8d 2d f4 37 00 00 	lea    0x37f4(%rip),%rbp        # eb88 <__do_global_dtors_aux_fini_array_entry>
    b394:	53                   	push   %rbx
    b395:	4c 29 fd             	sub    %r15,%rbp
    b398:	48 83 ec 08          	sub    $0x8,%rsp
    b39c:	e8 5f 6c ff ff       	callq  2000 <_init>
    b3a1:	48 c1 fd 03          	sar    $0x3,%rbp
    b3a5:	74 1f                	je     b3c6 <__libc_csu_init+0x56>
    b3a7:	31 db                	xor    %ebx,%ebx
    b3a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    b3b0:	4c 89 f2             	mov    %r14,%rdx
    b3b3:	4c 89 ee             	mov    %r13,%rsi
    b3b6:	44 89 e7             	mov    %r12d,%edi
    b3b9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    b3bd:	48 83 c3 01          	add    $0x1,%rbx
    b3c1:	48 39 dd             	cmp    %rbx,%rbp
    b3c4:	75 ea                	jne    b3b0 <__libc_csu_init+0x40>
    b3c6:	48 83 c4 08          	add    $0x8,%rsp
    b3ca:	5b                   	pop    %rbx
    b3cb:	5d                   	pop    %rbp
    b3cc:	41 5c                	pop    %r12
    b3ce:	41 5d                	pop    %r13
    b3d0:	41 5e                	pop    %r14
    b3d2:	41 5f                	pop    %r15
    b3d4:	c3                   	retq   
    b3d5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    b3dc:	00 00 00 00 

000000000000b3e0 <__libc_csu_fini>:
    b3e0:	f3 0f 1e fa          	endbr64 
    b3e4:	c3                   	retq   

Disassembly of section .fini:

000000000000b3e8 <_fini>:
    b3e8:	f3 0f 1e fa          	endbr64 
    b3ec:	48 83 ec 08          	sub    $0x8,%rsp
    b3f0:	48 83 c4 08          	add    $0x8,%rsp
    b3f4:	c3                   	retq   
