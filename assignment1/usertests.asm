
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(stdout, "open test\n");
       6:	a1 5c 58 00 00       	mov    0x585c,%eax
       b:	c7 44 24 04 92 41 00 	movl   $0x4192,0x4(%esp)
      12:	00 
      13:	89 04 24             	mov    %eax,(%esp)
      16:	e8 98 3d 00 00       	call   3db3 <printf>
  fd = open("echo", 0);
      1b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      22:	00 
      23:	c7 04 24 7c 41 00 00 	movl   $0x417c,(%esp)
      2a:	e8 45 3c 00 00       	call   3c74 <open>
      2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      36:	79 1a                	jns    52 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
      38:	a1 5c 58 00 00       	mov    0x585c,%eax
      3d:	c7 44 24 04 9d 41 00 	movl   $0x419d,0x4(%esp)
      44:	00 
      45:	89 04 24             	mov    %eax,(%esp)
      48:	e8 66 3d 00 00       	call   3db3 <printf>
    exit();
      4d:	e8 e2 3b 00 00       	call   3c34 <exit>
  }
  close(fd);
      52:	8b 45 f4             	mov    -0xc(%ebp),%eax
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 ff 3b 00 00       	call   3c5c <close>
  fd = open("doesnotexist", 0);
      5d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      64:	00 
      65:	c7 04 24 b0 41 00 00 	movl   $0x41b0,(%esp)
      6c:	e8 03 3c 00 00       	call   3c74 <open>
      71:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      74:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      78:	78 1a                	js     94 <opentest+0x94>
    printf(stdout, "open doesnotexist succeeded!\n");
      7a:	a1 5c 58 00 00       	mov    0x585c,%eax
      7f:	c7 44 24 04 bd 41 00 	movl   $0x41bd,0x4(%esp)
      86:	00 
      87:	89 04 24             	mov    %eax,(%esp)
      8a:	e8 24 3d 00 00       	call   3db3 <printf>
    exit();
      8f:	e8 a0 3b 00 00       	call   3c34 <exit>
  }
  printf(stdout, "open test ok\n");
      94:	a1 5c 58 00 00       	mov    0x585c,%eax
      99:	c7 44 24 04 db 41 00 	movl   $0x41db,0x4(%esp)
      a0:	00 
      a1:	89 04 24             	mov    %eax,(%esp)
      a4:	e8 0a 3d 00 00       	call   3db3 <printf>
}
      a9:	c9                   	leave  
      aa:	c3                   	ret    

000000ab <writetest>:

void
writetest(void)
{
      ab:	55                   	push   %ebp
      ac:	89 e5                	mov    %esp,%ebp
      ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      b1:	a1 5c 58 00 00       	mov    0x585c,%eax
      b6:	c7 44 24 04 e9 41 00 	movl   $0x41e9,0x4(%esp)
      bd:	00 
      be:	89 04 24             	mov    %eax,(%esp)
      c1:	e8 ed 3c 00 00       	call   3db3 <printf>
  fd = open("small", O_CREATE|O_RDWR);
      c6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
      cd:	00 
      ce:	c7 04 24 fa 41 00 00 	movl   $0x41fa,(%esp)
      d5:	e8 9a 3b 00 00       	call   3c74 <open>
      da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      e1:	78 21                	js     104 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
      e3:	a1 5c 58 00 00       	mov    0x585c,%eax
      e8:	c7 44 24 04 00 42 00 	movl   $0x4200,0x4(%esp)
      ef:	00 
      f0:	89 04 24             	mov    %eax,(%esp)
      f3:	e8 bb 3c 00 00       	call   3db3 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
      f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      ff:	e9 a0 00 00 00       	jmp    1a4 <writetest+0xf9>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     104:	a1 5c 58 00 00       	mov    0x585c,%eax
     109:	c7 44 24 04 1b 42 00 	movl   $0x421b,0x4(%esp)
     110:	00 
     111:	89 04 24             	mov    %eax,(%esp)
     114:	e8 9a 3c 00 00       	call   3db3 <printf>
    exit();
     119:	e8 16 3b 00 00       	call   3c34 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     11e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     125:	00 
     126:	c7 44 24 04 37 42 00 	movl   $0x4237,0x4(%esp)
     12d:	00 
     12e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     131:	89 04 24             	mov    %eax,(%esp)
     134:	e8 1b 3b 00 00       	call   3c54 <write>
     139:	83 f8 0a             	cmp    $0xa,%eax
     13c:	74 21                	je     15f <writetest+0xb4>
      printf(stdout, "error: write aa %d new file failed\n", i);
     13e:	a1 5c 58 00 00       	mov    0x585c,%eax
     143:	8b 55 f4             	mov    -0xc(%ebp),%edx
     146:	89 54 24 08          	mov    %edx,0x8(%esp)
     14a:	c7 44 24 04 44 42 00 	movl   $0x4244,0x4(%esp)
     151:	00 
     152:	89 04 24             	mov    %eax,(%esp)
     155:	e8 59 3c 00 00       	call   3db3 <printf>
      exit();
     15a:	e8 d5 3a 00 00       	call   3c34 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     15f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     166:	00 
     167:	c7 44 24 04 68 42 00 	movl   $0x4268,0x4(%esp)
     16e:	00 
     16f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     172:	89 04 24             	mov    %eax,(%esp)
     175:	e8 da 3a 00 00       	call   3c54 <write>
     17a:	83 f8 0a             	cmp    $0xa,%eax
     17d:	74 21                	je     1a0 <writetest+0xf5>
      printf(stdout, "error: write bb %d new file failed\n", i);
     17f:	a1 5c 58 00 00       	mov    0x585c,%eax
     184:	8b 55 f4             	mov    -0xc(%ebp),%edx
     187:	89 54 24 08          	mov    %edx,0x8(%esp)
     18b:	c7 44 24 04 74 42 00 	movl   $0x4274,0x4(%esp)
     192:	00 
     193:	89 04 24             	mov    %eax,(%esp)
     196:	e8 18 3c 00 00       	call   3db3 <printf>
      exit();
     19b:	e8 94 3a 00 00       	call   3c34 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     1a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1a4:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     1a8:	0f 8e 70 ff ff ff    	jle    11e <writetest+0x73>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1ae:	a1 5c 58 00 00       	mov    0x585c,%eax
     1b3:	c7 44 24 04 98 42 00 	movl   $0x4298,0x4(%esp)
     1ba:	00 
     1bb:	89 04 24             	mov    %eax,(%esp)
     1be:	e8 f0 3b 00 00       	call   3db3 <printf>
  close(fd);
     1c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1c6:	89 04 24             	mov    %eax,(%esp)
     1c9:	e8 8e 3a 00 00       	call   3c5c <close>
  fd = open("small", O_RDONLY);
     1ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1d5:	00 
     1d6:	c7 04 24 fa 41 00 00 	movl   $0x41fa,(%esp)
     1dd:	e8 92 3a 00 00       	call   3c74 <open>
     1e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     1e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1e9:	78 3e                	js     229 <writetest+0x17e>
    printf(stdout, "open small succeeded ok\n");
     1eb:	a1 5c 58 00 00       	mov    0x585c,%eax
     1f0:	c7 44 24 04 a3 42 00 	movl   $0x42a3,0x4(%esp)
     1f7:	00 
     1f8:	89 04 24             	mov    %eax,(%esp)
     1fb:	e8 b3 3b 00 00       	call   3db3 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     200:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     207:	00 
     208:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     20f:	00 
     210:	8b 45 f0             	mov    -0x10(%ebp),%eax
     213:	89 04 24             	mov    %eax,(%esp)
     216:	e8 31 3a 00 00       	call   3c4c <read>
     21b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     21e:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     225:	74 1c                	je     243 <writetest+0x198>
     227:	eb 4c                	jmp    275 <writetest+0x1ca>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     229:	a1 5c 58 00 00       	mov    0x585c,%eax
     22e:	c7 44 24 04 bc 42 00 	movl   $0x42bc,0x4(%esp)
     235:	00 
     236:	89 04 24             	mov    %eax,(%esp)
     239:	e8 75 3b 00 00       	call   3db3 <printf>
    exit();
     23e:	e8 f1 39 00 00       	call   3c34 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     243:	a1 5c 58 00 00       	mov    0x585c,%eax
     248:	c7 44 24 04 d7 42 00 	movl   $0x42d7,0x4(%esp)
     24f:	00 
     250:	89 04 24             	mov    %eax,(%esp)
     253:	e8 5b 3b 00 00       	call   3db3 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     258:	8b 45 f0             	mov    -0x10(%ebp),%eax
     25b:	89 04 24             	mov    %eax,(%esp)
     25e:	e8 f9 39 00 00       	call   3c5c <close>

  if(unlink("small") < 0){
     263:	c7 04 24 fa 41 00 00 	movl   $0x41fa,(%esp)
     26a:	e8 15 3a 00 00       	call   3c84 <unlink>
     26f:	85 c0                	test   %eax,%eax
     271:	78 1c                	js     28f <writetest+0x1e4>
     273:	eb 34                	jmp    2a9 <writetest+0x1fe>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     275:	a1 5c 58 00 00       	mov    0x585c,%eax
     27a:	c7 44 24 04 ea 42 00 	movl   $0x42ea,0x4(%esp)
     281:	00 
     282:	89 04 24             	mov    %eax,(%esp)
     285:	e8 29 3b 00 00       	call   3db3 <printf>
    exit();
     28a:	e8 a5 39 00 00       	call   3c34 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     28f:	a1 5c 58 00 00       	mov    0x585c,%eax
     294:	c7 44 24 04 f7 42 00 	movl   $0x42f7,0x4(%esp)
     29b:	00 
     29c:	89 04 24             	mov    %eax,(%esp)
     29f:	e8 0f 3b 00 00       	call   3db3 <printf>
    exit();
     2a4:	e8 8b 39 00 00       	call   3c34 <exit>
  }
  printf(stdout, "small file test ok\n");
     2a9:	a1 5c 58 00 00       	mov    0x585c,%eax
     2ae:	c7 44 24 04 0c 43 00 	movl   $0x430c,0x4(%esp)
     2b5:	00 
     2b6:	89 04 24             	mov    %eax,(%esp)
     2b9:	e8 f5 3a 00 00       	call   3db3 <printf>
}
     2be:	c9                   	leave  
     2bf:	c3                   	ret    

000002c0 <writetest1>:

void
writetest1(void)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2c6:	a1 5c 58 00 00       	mov    0x585c,%eax
     2cb:	c7 44 24 04 20 43 00 	movl   $0x4320,0x4(%esp)
     2d2:	00 
     2d3:	89 04 24             	mov    %eax,(%esp)
     2d6:	e8 d8 3a 00 00       	call   3db3 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     2db:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     2e2:	00 
     2e3:	c7 04 24 30 43 00 00 	movl   $0x4330,(%esp)
     2ea:	e8 85 39 00 00       	call   3c74 <open>
     2ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     2f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2f6:	79 1a                	jns    312 <writetest1+0x52>
    printf(stdout, "error: creat big failed!\n");
     2f8:	a1 5c 58 00 00       	mov    0x585c,%eax
     2fd:	c7 44 24 04 34 43 00 	movl   $0x4334,0x4(%esp)
     304:	00 
     305:	89 04 24             	mov    %eax,(%esp)
     308:	e8 a6 3a 00 00       	call   3db3 <printf>
    exit();
     30d:	e8 22 39 00 00       	call   3c34 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     312:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     319:	eb 51                	jmp    36c <writetest1+0xac>
    ((int*)buf)[0] = i;
     31b:	b8 40 80 00 00       	mov    $0x8040,%eax
     320:	8b 55 f4             	mov    -0xc(%ebp),%edx
     323:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     325:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     32c:	00 
     32d:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     334:	00 
     335:	8b 45 ec             	mov    -0x14(%ebp),%eax
     338:	89 04 24             	mov    %eax,(%esp)
     33b:	e8 14 39 00 00       	call   3c54 <write>
     340:	3d 00 02 00 00       	cmp    $0x200,%eax
     345:	74 21                	je     368 <writetest1+0xa8>
      printf(stdout, "error: write big file failed\n", i);
     347:	a1 5c 58 00 00       	mov    0x585c,%eax
     34c:	8b 55 f4             	mov    -0xc(%ebp),%edx
     34f:	89 54 24 08          	mov    %edx,0x8(%esp)
     353:	c7 44 24 04 4e 43 00 	movl   $0x434e,0x4(%esp)
     35a:	00 
     35b:	89 04 24             	mov    %eax,(%esp)
     35e:	e8 50 3a 00 00       	call   3db3 <printf>
      exit();
     363:	e8 cc 38 00 00       	call   3c34 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     368:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36f:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     374:	76 a5                	jbe    31b <writetest1+0x5b>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     376:	8b 45 ec             	mov    -0x14(%ebp),%eax
     379:	89 04 24             	mov    %eax,(%esp)
     37c:	e8 db 38 00 00       	call   3c5c <close>

  fd = open("big", O_RDONLY);
     381:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     388:	00 
     389:	c7 04 24 30 43 00 00 	movl   $0x4330,(%esp)
     390:	e8 df 38 00 00       	call   3c74 <open>
     395:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     398:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     39c:	79 1a                	jns    3b8 <writetest1+0xf8>
    printf(stdout, "error: open big failed!\n");
     39e:	a1 5c 58 00 00       	mov    0x585c,%eax
     3a3:	c7 44 24 04 6c 43 00 	movl   $0x436c,0x4(%esp)
     3aa:	00 
     3ab:	89 04 24             	mov    %eax,(%esp)
     3ae:	e8 00 3a 00 00       	call   3db3 <printf>
    exit();
     3b3:	e8 7c 38 00 00       	call   3c34 <exit>
  }

  n = 0;
     3b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     3bf:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     3c6:	00 
     3c7:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     3ce:	00 
     3cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3d2:	89 04 24             	mov    %eax,(%esp)
     3d5:	e8 72 38 00 00       	call   3c4c <read>
     3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     3dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3e1:	75 4a                	jne    42d <writetest1+0x16d>
      if(n == MAXFILE - 1){
     3e3:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     3ea:	75 21                	jne    40d <writetest1+0x14d>
        printf(stdout, "read only %d blocks from big", n);
     3ec:	a1 5c 58 00 00       	mov    0x585c,%eax
     3f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
     3f4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3f8:	c7 44 24 04 85 43 00 	movl   $0x4385,0x4(%esp)
     3ff:	00 
     400:	89 04 24             	mov    %eax,(%esp)
     403:	e8 ab 39 00 00       	call   3db3 <printf>
        exit();
     408:	e8 27 38 00 00       	call   3c34 <exit>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     40d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     410:	89 04 24             	mov    %eax,(%esp)
     413:	e8 44 38 00 00       	call   3c5c <close>
  if(unlink("big") < 0){
     418:	c7 04 24 30 43 00 00 	movl   $0x4330,(%esp)
     41f:	e8 60 38 00 00       	call   3c84 <unlink>
     424:	85 c0                	test   %eax,%eax
     426:	78 70                	js     498 <writetest1+0x1d8>
     428:	e9 85 00 00 00       	jmp    4b2 <writetest1+0x1f2>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     42d:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     434:	74 21                	je     457 <writetest1+0x197>
      printf(stdout, "read failed %d\n", i);
     436:	a1 5c 58 00 00       	mov    0x585c,%eax
     43b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     43e:	89 54 24 08          	mov    %edx,0x8(%esp)
     442:	c7 44 24 04 a2 43 00 	movl   $0x43a2,0x4(%esp)
     449:	00 
     44a:	89 04 24             	mov    %eax,(%esp)
     44d:	e8 61 39 00 00       	call   3db3 <printf>
      exit();
     452:	e8 dd 37 00 00       	call   3c34 <exit>
    }
    if(((int*)buf)[0] != n){
     457:	b8 40 80 00 00       	mov    $0x8040,%eax
     45c:	8b 00                	mov    (%eax),%eax
     45e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     461:	74 2c                	je     48f <writetest1+0x1cf>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     463:	b8 40 80 00 00       	mov    $0x8040,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     468:	8b 10                	mov    (%eax),%edx
     46a:	a1 5c 58 00 00       	mov    0x585c,%eax
     46f:	89 54 24 0c          	mov    %edx,0xc(%esp)
     473:	8b 55 f0             	mov    -0x10(%ebp),%edx
     476:	89 54 24 08          	mov    %edx,0x8(%esp)
     47a:	c7 44 24 04 b4 43 00 	movl   $0x43b4,0x4(%esp)
     481:	00 
     482:	89 04 24             	mov    %eax,(%esp)
     485:	e8 29 39 00 00       	call   3db3 <printf>
             n, ((int*)buf)[0]);
      exit();
     48a:	e8 a5 37 00 00       	call   3c34 <exit>
    }
    n++;
     48f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     493:	e9 27 ff ff ff       	jmp    3bf <writetest1+0xff>
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     498:	a1 5c 58 00 00       	mov    0x585c,%eax
     49d:	c7 44 24 04 d4 43 00 	movl   $0x43d4,0x4(%esp)
     4a4:	00 
     4a5:	89 04 24             	mov    %eax,(%esp)
     4a8:	e8 06 39 00 00       	call   3db3 <printf>
    exit();
     4ad:	e8 82 37 00 00       	call   3c34 <exit>
  }
  printf(stdout, "big files ok\n");
     4b2:	a1 5c 58 00 00       	mov    0x585c,%eax
     4b7:	c7 44 24 04 e7 43 00 	movl   $0x43e7,0x4(%esp)
     4be:	00 
     4bf:	89 04 24             	mov    %eax,(%esp)
     4c2:	e8 ec 38 00 00       	call   3db3 <printf>
}
     4c7:	c9                   	leave  
     4c8:	c3                   	ret    

000004c9 <createtest>:

void
createtest(void)
{
     4c9:	55                   	push   %ebp
     4ca:	89 e5                	mov    %esp,%ebp
     4cc:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4cf:	a1 5c 58 00 00       	mov    0x585c,%eax
     4d4:	c7 44 24 04 f8 43 00 	movl   $0x43f8,0x4(%esp)
     4db:	00 
     4dc:	89 04 24             	mov    %eax,(%esp)
     4df:	e8 cf 38 00 00       	call   3db3 <printf>

  name[0] = 'a';
     4e4:	c6 05 40 a0 00 00 61 	movb   $0x61,0xa040
  name[2] = '\0';
     4eb:	c6 05 42 a0 00 00 00 	movb   $0x0,0xa042
  for(i = 0; i < 52; i++){
     4f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4f9:	eb 31                	jmp    52c <createtest+0x63>
    name[1] = '0' + i;
     4fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4fe:	83 c0 30             	add    $0x30,%eax
     501:	a2 41 a0 00 00       	mov    %al,0xa041
    fd = open(name, O_CREATE|O_RDWR);
     506:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     50d:	00 
     50e:	c7 04 24 40 a0 00 00 	movl   $0xa040,(%esp)
     515:	e8 5a 37 00 00       	call   3c74 <open>
     51a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     51d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     520:	89 04 24             	mov    %eax,(%esp)
     523:	e8 34 37 00 00       	call   3c5c <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     528:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     52c:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     530:	7e c9                	jle    4fb <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     532:	c6 05 40 a0 00 00 61 	movb   $0x61,0xa040
  name[2] = '\0';
     539:	c6 05 42 a0 00 00 00 	movb   $0x0,0xa042
  for(i = 0; i < 52; i++){
     540:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     547:	eb 1b                	jmp    564 <createtest+0x9b>
    name[1] = '0' + i;
     549:	8b 45 f4             	mov    -0xc(%ebp),%eax
     54c:	83 c0 30             	add    $0x30,%eax
     54f:	a2 41 a0 00 00       	mov    %al,0xa041
    unlink(name);
     554:	c7 04 24 40 a0 00 00 	movl   $0xa040,(%esp)
     55b:	e8 24 37 00 00       	call   3c84 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     560:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     564:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     568:	7e df                	jle    549 <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     56a:	a1 5c 58 00 00       	mov    0x585c,%eax
     56f:	c7 44 24 04 20 44 00 	movl   $0x4420,0x4(%esp)
     576:	00 
     577:	89 04 24             	mov    %eax,(%esp)
     57a:	e8 34 38 00 00       	call   3db3 <printf>
}
     57f:	c9                   	leave  
     580:	c3                   	ret    

00000581 <dirtest>:

void dirtest(void)
{
     581:	55                   	push   %ebp
     582:	89 e5                	mov    %esp,%ebp
     584:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     587:	a1 5c 58 00 00       	mov    0x585c,%eax
     58c:	c7 44 24 04 46 44 00 	movl   $0x4446,0x4(%esp)
     593:	00 
     594:	89 04 24             	mov    %eax,(%esp)
     597:	e8 17 38 00 00       	call   3db3 <printf>

  if(mkdir("dir0") < 0){
     59c:	c7 04 24 52 44 00 00 	movl   $0x4452,(%esp)
     5a3:	e8 f4 36 00 00       	call   3c9c <mkdir>
     5a8:	85 c0                	test   %eax,%eax
     5aa:	79 1a                	jns    5c6 <dirtest+0x45>
    printf(stdout, "mkdir failed\n");
     5ac:	a1 5c 58 00 00       	mov    0x585c,%eax
     5b1:	c7 44 24 04 57 44 00 	movl   $0x4457,0x4(%esp)
     5b8:	00 
     5b9:	89 04 24             	mov    %eax,(%esp)
     5bc:	e8 f2 37 00 00       	call   3db3 <printf>
    exit();
     5c1:	e8 6e 36 00 00       	call   3c34 <exit>
  }

  if(chdir("dir0") < 0){
     5c6:	c7 04 24 52 44 00 00 	movl   $0x4452,(%esp)
     5cd:	e8 d2 36 00 00       	call   3ca4 <chdir>
     5d2:	85 c0                	test   %eax,%eax
     5d4:	79 1a                	jns    5f0 <dirtest+0x6f>
    printf(stdout, "chdir dir0 failed\n");
     5d6:	a1 5c 58 00 00       	mov    0x585c,%eax
     5db:	c7 44 24 04 65 44 00 	movl   $0x4465,0x4(%esp)
     5e2:	00 
     5e3:	89 04 24             	mov    %eax,(%esp)
     5e6:	e8 c8 37 00 00       	call   3db3 <printf>
    exit();
     5eb:	e8 44 36 00 00       	call   3c34 <exit>
  }

  if(chdir("..") < 0){
     5f0:	c7 04 24 78 44 00 00 	movl   $0x4478,(%esp)
     5f7:	e8 a8 36 00 00       	call   3ca4 <chdir>
     5fc:	85 c0                	test   %eax,%eax
     5fe:	79 1a                	jns    61a <dirtest+0x99>
    printf(stdout, "chdir .. failed\n");
     600:	a1 5c 58 00 00       	mov    0x585c,%eax
     605:	c7 44 24 04 7b 44 00 	movl   $0x447b,0x4(%esp)
     60c:	00 
     60d:	89 04 24             	mov    %eax,(%esp)
     610:	e8 9e 37 00 00       	call   3db3 <printf>
    exit();
     615:	e8 1a 36 00 00       	call   3c34 <exit>
  }

  if(unlink("dir0") < 0){
     61a:	c7 04 24 52 44 00 00 	movl   $0x4452,(%esp)
     621:	e8 5e 36 00 00       	call   3c84 <unlink>
     626:	85 c0                	test   %eax,%eax
     628:	79 1a                	jns    644 <dirtest+0xc3>
    printf(stdout, "unlink dir0 failed\n");
     62a:	a1 5c 58 00 00       	mov    0x585c,%eax
     62f:	c7 44 24 04 8c 44 00 	movl   $0x448c,0x4(%esp)
     636:	00 
     637:	89 04 24             	mov    %eax,(%esp)
     63a:	e8 74 37 00 00       	call   3db3 <printf>
    exit();
     63f:	e8 f0 35 00 00       	call   3c34 <exit>
  }
  printf(stdout, "mkdir test\n");
     644:	a1 5c 58 00 00       	mov    0x585c,%eax
     649:	c7 44 24 04 46 44 00 	movl   $0x4446,0x4(%esp)
     650:	00 
     651:	89 04 24             	mov    %eax,(%esp)
     654:	e8 5a 37 00 00       	call   3db3 <printf>
}
     659:	c9                   	leave  
     65a:	c3                   	ret    

0000065b <exectest>:

void
exectest(void)
{
     65b:	55                   	push   %ebp
     65c:	89 e5                	mov    %esp,%ebp
     65e:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     661:	a1 5c 58 00 00       	mov    0x585c,%eax
     666:	c7 44 24 04 a0 44 00 	movl   $0x44a0,0x4(%esp)
     66d:	00 
     66e:	89 04 24             	mov    %eax,(%esp)
     671:	e8 3d 37 00 00       	call   3db3 <printf>
  if(exec("echo", echoargv) < 0){
     676:	c7 44 24 04 48 58 00 	movl   $0x5848,0x4(%esp)
     67d:	00 
     67e:	c7 04 24 7c 41 00 00 	movl   $0x417c,(%esp)
     685:	e8 e2 35 00 00       	call   3c6c <exec>
     68a:	85 c0                	test   %eax,%eax
     68c:	79 1a                	jns    6a8 <exectest+0x4d>
    printf(stdout, "exec echo failed\n");
     68e:	a1 5c 58 00 00       	mov    0x585c,%eax
     693:	c7 44 24 04 ab 44 00 	movl   $0x44ab,0x4(%esp)
     69a:	00 
     69b:	89 04 24             	mov    %eax,(%esp)
     69e:	e8 10 37 00 00       	call   3db3 <printf>
    exit();
     6a3:	e8 8c 35 00 00       	call   3c34 <exit>
  }
}
     6a8:	c9                   	leave  
     6a9:	c3                   	ret    

000006aa <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     6aa:	55                   	push   %ebp
     6ab:	89 e5                	mov    %esp,%ebp
     6ad:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6b0:	8d 45 d8             	lea    -0x28(%ebp),%eax
     6b3:	89 04 24             	mov    %eax,(%esp)
     6b6:	e8 89 35 00 00       	call   3c44 <pipe>
     6bb:	85 c0                	test   %eax,%eax
     6bd:	74 19                	je     6d8 <pipe1+0x2e>
    printf(1, "pipe() failed\n");
     6bf:	c7 44 24 04 bd 44 00 	movl   $0x44bd,0x4(%esp)
     6c6:	00 
     6c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6ce:	e8 e0 36 00 00       	call   3db3 <printf>
    exit();
     6d3:	e8 5c 35 00 00       	call   3c34 <exit>
  }
  pid = fork();
     6d8:	e8 4f 35 00 00       	call   3c2c <fork>
     6dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     6e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     6e7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     6eb:	0f 85 86 00 00 00    	jne    777 <pipe1+0xcd>
    close(fds[0]);
     6f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
     6f4:	89 04 24             	mov    %eax,(%esp)
     6f7:	e8 60 35 00 00       	call   3c5c <close>
    for(n = 0; n < 5; n++){
     6fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     703:	eb 67                	jmp    76c <pipe1+0xc2>
      for(i = 0; i < 1033; i++)
     705:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     70c:	eb 16                	jmp    724 <pipe1+0x7a>
        buf[i] = seq++;
     70e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     711:	8b 55 f0             	mov    -0x10(%ebp),%edx
     714:	81 c2 40 80 00 00    	add    $0x8040,%edx
     71a:	88 02                	mov    %al,(%edx)
     71c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     720:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     724:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     72b:	7e e1                	jle    70e <pipe1+0x64>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     72d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     730:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     737:	00 
     738:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     73f:	00 
     740:	89 04 24             	mov    %eax,(%esp)
     743:	e8 0c 35 00 00       	call   3c54 <write>
     748:	3d 09 04 00 00       	cmp    $0x409,%eax
     74d:	74 19                	je     768 <pipe1+0xbe>
        printf(1, "pipe1 oops 1\n");
     74f:	c7 44 24 04 cc 44 00 	movl   $0x44cc,0x4(%esp)
     756:	00 
     757:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     75e:	e8 50 36 00 00       	call   3db3 <printf>
        exit();
     763:	e8 cc 34 00 00       	call   3c34 <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     768:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     76c:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     770:	7e 93                	jle    705 <pipe1+0x5b>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     772:	e8 bd 34 00 00       	call   3c34 <exit>
  } else if(pid > 0){
     777:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     77b:	0f 8e fc 00 00 00    	jle    87d <pipe1+0x1d3>
    close(fds[1]);
     781:	8b 45 dc             	mov    -0x24(%ebp),%eax
     784:	89 04 24             	mov    %eax,(%esp)
     787:	e8 d0 34 00 00       	call   3c5c <close>
    total = 0;
     78c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     793:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     79a:	eb 6b                	jmp    807 <pipe1+0x15d>
      for(i = 0; i < n; i++){
     79c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     7a3:	eb 40                	jmp    7e5 <pipe1+0x13b>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7a8:	05 40 80 00 00       	add    $0x8040,%eax
     7ad:	0f b6 00             	movzbl (%eax),%eax
     7b0:	0f be c0             	movsbl %al,%eax
     7b3:	33 45 f4             	xor    -0xc(%ebp),%eax
     7b6:	25 ff 00 00 00       	and    $0xff,%eax
     7bb:	85 c0                	test   %eax,%eax
     7bd:	0f 95 c0             	setne  %al
     7c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     7c4:	84 c0                	test   %al,%al
     7c6:	74 19                	je     7e1 <pipe1+0x137>
          printf(1, "pipe1 oops 2\n");
     7c8:	c7 44 24 04 da 44 00 	movl   $0x44da,0x4(%esp)
     7cf:	00 
     7d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7d7:	e8 d7 35 00 00       	call   3db3 <printf>
          return;
     7dc:	e9 b5 00 00 00       	jmp    896 <pipe1+0x1ec>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     7e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     7eb:	7c b8                	jl     7a5 <pipe1+0xfb>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     7ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
     7f0:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     7f3:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     7f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7f9:	3d 00 20 00 00       	cmp    $0x2000,%eax
     7fe:	76 07                	jbe    807 <pipe1+0x15d>
        cc = sizeof(buf);
     800:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     807:	8b 45 d8             	mov    -0x28(%ebp),%eax
     80a:	8b 55 e8             	mov    -0x18(%ebp),%edx
     80d:	89 54 24 08          	mov    %edx,0x8(%esp)
     811:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     818:	00 
     819:	89 04 24             	mov    %eax,(%esp)
     81c:	e8 2b 34 00 00       	call   3c4c <read>
     821:	89 45 ec             	mov    %eax,-0x14(%ebp)
     824:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     828:	0f 8f 6e ff ff ff    	jg     79c <pipe1+0xf2>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     82e:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     835:	74 20                	je     857 <pipe1+0x1ad>
      printf(1, "pipe1 oops 3 total %d\n", total);
     837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     83a:	89 44 24 08          	mov    %eax,0x8(%esp)
     83e:	c7 44 24 04 e8 44 00 	movl   $0x44e8,0x4(%esp)
     845:	00 
     846:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     84d:	e8 61 35 00 00       	call   3db3 <printf>
      exit();
     852:	e8 dd 33 00 00       	call   3c34 <exit>
    }
    close(fds[0]);
     857:	8b 45 d8             	mov    -0x28(%ebp),%eax
     85a:	89 04 24             	mov    %eax,(%esp)
     85d:	e8 fa 33 00 00       	call   3c5c <close>
    wait();
     862:	e8 d5 33 00 00       	call   3c3c <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     867:	c7 44 24 04 ff 44 00 	movl   $0x44ff,0x4(%esp)
     86e:	00 
     86f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     876:	e8 38 35 00 00       	call   3db3 <printf>
     87b:	eb 19                	jmp    896 <pipe1+0x1ec>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     87d:	c7 44 24 04 09 45 00 	movl   $0x4509,0x4(%esp)
     884:	00 
     885:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     88c:	e8 22 35 00 00       	call   3db3 <printf>
    exit();
     891:	e8 9e 33 00 00       	call   3c34 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     896:	c9                   	leave  
     897:	c3                   	ret    

00000898 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     898:	55                   	push   %ebp
     899:	89 e5                	mov    %esp,%ebp
     89b:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     89e:	c7 44 24 04 18 45 00 	movl   $0x4518,0x4(%esp)
     8a5:	00 
     8a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8ad:	e8 01 35 00 00       	call   3db3 <printf>
  pid1 = fork();
     8b2:	e8 75 33 00 00       	call   3c2c <fork>
     8b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     8ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8be:	75 02                	jne    8c2 <preempt+0x2a>
    for(;;)
      ;
     8c0:	eb fe                	jmp    8c0 <preempt+0x28>

  pid2 = fork();
     8c2:	e8 65 33 00 00       	call   3c2c <fork>
     8c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     8ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     8ce:	75 02                	jne    8d2 <preempt+0x3a>
    for(;;)
      ;
     8d0:	eb fe                	jmp    8d0 <preempt+0x38>

  pipe(pfds);
     8d2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8d5:	89 04 24             	mov    %eax,(%esp)
     8d8:	e8 67 33 00 00       	call   3c44 <pipe>
  pid3 = fork();
     8dd:	e8 4a 33 00 00       	call   3c2c <fork>
     8e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     8e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8e9:	75 4c                	jne    937 <preempt+0x9f>
    close(pfds[0]);
     8eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8ee:	89 04 24             	mov    %eax,(%esp)
     8f1:	e8 66 33 00 00       	call   3c5c <close>
    if(write(pfds[1], "x", 1) != 1)
     8f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8f9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     900:	00 
     901:	c7 44 24 04 22 45 00 	movl   $0x4522,0x4(%esp)
     908:	00 
     909:	89 04 24             	mov    %eax,(%esp)
     90c:	e8 43 33 00 00       	call   3c54 <write>
     911:	83 f8 01             	cmp    $0x1,%eax
     914:	74 14                	je     92a <preempt+0x92>
      printf(1, "preempt write error");
     916:	c7 44 24 04 24 45 00 	movl   $0x4524,0x4(%esp)
     91d:	00 
     91e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     925:	e8 89 34 00 00       	call   3db3 <printf>
    close(pfds[1]);
     92a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     92d:	89 04 24             	mov    %eax,(%esp)
     930:	e8 27 33 00 00       	call   3c5c <close>
    for(;;)
      ;
     935:	eb fe                	jmp    935 <preempt+0x9d>
  }

  close(pfds[1]);
     937:	8b 45 e8             	mov    -0x18(%ebp),%eax
     93a:	89 04 24             	mov    %eax,(%esp)
     93d:	e8 1a 33 00 00       	call   3c5c <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     942:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     945:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     94c:	00 
     94d:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     954:	00 
     955:	89 04 24             	mov    %eax,(%esp)
     958:	e8 ef 32 00 00       	call   3c4c <read>
     95d:	83 f8 01             	cmp    $0x1,%eax
     960:	74 16                	je     978 <preempt+0xe0>
    printf(1, "preempt read error");
     962:	c7 44 24 04 38 45 00 	movl   $0x4538,0x4(%esp)
     969:	00 
     96a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     971:	e8 3d 34 00 00       	call   3db3 <printf>
    return;
     976:	eb 77                	jmp    9ef <preempt+0x157>
  }
  close(pfds[0]);
     978:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     97b:	89 04 24             	mov    %eax,(%esp)
     97e:	e8 d9 32 00 00       	call   3c5c <close>
  printf(1, "kill... ");
     983:	c7 44 24 04 4b 45 00 	movl   $0x454b,0x4(%esp)
     98a:	00 
     98b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     992:	e8 1c 34 00 00       	call   3db3 <printf>
  kill(pid1);
     997:	8b 45 f4             	mov    -0xc(%ebp),%eax
     99a:	89 04 24             	mov    %eax,(%esp)
     99d:	e8 c2 32 00 00       	call   3c64 <kill>
  kill(pid2);
     9a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9a5:	89 04 24             	mov    %eax,(%esp)
     9a8:	e8 b7 32 00 00       	call   3c64 <kill>
  kill(pid3);
     9ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
     9b0:	89 04 24             	mov    %eax,(%esp)
     9b3:	e8 ac 32 00 00       	call   3c64 <kill>
  printf(1, "wait... ");
     9b8:	c7 44 24 04 54 45 00 	movl   $0x4554,0x4(%esp)
     9bf:	00 
     9c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9c7:	e8 e7 33 00 00       	call   3db3 <printf>
  wait();
     9cc:	e8 6b 32 00 00       	call   3c3c <wait>
  wait();
     9d1:	e8 66 32 00 00       	call   3c3c <wait>
  wait();
     9d6:	e8 61 32 00 00       	call   3c3c <wait>
  printf(1, "preempt ok\n");
     9db:	c7 44 24 04 5d 45 00 	movl   $0x455d,0x4(%esp)
     9e2:	00 
     9e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9ea:	e8 c4 33 00 00       	call   3db3 <printf>
}
     9ef:	c9                   	leave  
     9f0:	c3                   	ret    

000009f1 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     9f1:	55                   	push   %ebp
     9f2:	89 e5                	mov    %esp,%ebp
     9f4:	83 ec 28             	sub    $0x28,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     9f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     9fe:	eb 53                	jmp    a53 <exitwait+0x62>
    pid = fork();
     a00:	e8 27 32 00 00       	call   3c2c <fork>
     a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     a08:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a0c:	79 16                	jns    a24 <exitwait+0x33>
      printf(1, "fork failed\n");
     a0e:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
     a15:	00 
     a16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a1d:	e8 91 33 00 00       	call   3db3 <printf>
      return;
     a22:	eb 49                	jmp    a6d <exitwait+0x7c>
    }
    if(pid){
     a24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a28:	74 20                	je     a4a <exitwait+0x59>
      if(wait() != pid){
     a2a:	e8 0d 32 00 00       	call   3c3c <wait>
     a2f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     a32:	74 1b                	je     a4f <exitwait+0x5e>
        printf(1, "wait wrong pid\n");
     a34:	c7 44 24 04 76 45 00 	movl   $0x4576,0x4(%esp)
     a3b:	00 
     a3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a43:	e8 6b 33 00 00       	call   3db3 <printf>
        return;
     a48:	eb 23                	jmp    a6d <exitwait+0x7c>
      }
    } else {
      exit();
     a4a:	e8 e5 31 00 00       	call   3c34 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     a4f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     a53:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     a57:	7e a7                	jle    a00 <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     a59:	c7 44 24 04 86 45 00 	movl   $0x4586,0x4(%esp)
     a60:	00 
     a61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a68:	e8 46 33 00 00       	call   3db3 <printf>
}
     a6d:	c9                   	leave  
     a6e:	c3                   	ret    

00000a6f <mem>:

void
mem(void)
{
     a6f:	55                   	push   %ebp
     a70:	89 e5                	mov    %esp,%ebp
     a72:	83 ec 28             	sub    $0x28,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     a75:	c7 44 24 04 93 45 00 	movl   $0x4593,0x4(%esp)
     a7c:	00 
     a7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a84:	e8 2a 33 00 00       	call   3db3 <printf>
  ppid = getpid();
     a89:	e8 26 32 00 00       	call   3cb4 <getpid>
     a8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     a91:	e8 96 31 00 00       	call   3c2c <fork>
     a96:	89 45 ec             	mov    %eax,-0x14(%ebp)
     a99:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     a9d:	0f 85 aa 00 00 00    	jne    b4d <mem+0xde>
    m1 = 0;
     aa3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     aaa:	eb 0e                	jmp    aba <mem+0x4b>
      *(char**)m2 = m1;
     aac:	8b 45 e8             	mov    -0x18(%ebp),%eax
     aaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ab2:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     ab4:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ab7:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     aba:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     ac1:	e8 d5 35 00 00       	call   409b <malloc>
     ac6:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ac9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     acd:	75 dd                	jne    aac <mem+0x3d>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     acf:	eb 19                	jmp    aea <mem+0x7b>
      m2 = *(char**)m1;
     ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad4:	8b 00                	mov    (%eax),%eax
     ad6:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     adc:	89 04 24             	mov    %eax,(%esp)
     adf:	e8 88 34 00 00       	call   3f6c <free>
      m1 = m2;
     ae4:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ae7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     aea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     aee:	75 e1                	jne    ad1 <mem+0x62>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     af0:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     af7:	e8 9f 35 00 00       	call   409b <malloc>
     afc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     aff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b03:	75 24                	jne    b29 <mem+0xba>
      printf(1, "couldn't allocate mem?!!\n");
     b05:	c7 44 24 04 9d 45 00 	movl   $0x459d,0x4(%esp)
     b0c:	00 
     b0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b14:	e8 9a 32 00 00       	call   3db3 <printf>
      kill(ppid);
     b19:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b1c:	89 04 24             	mov    %eax,(%esp)
     b1f:	e8 40 31 00 00       	call   3c64 <kill>
      exit();
     b24:	e8 0b 31 00 00       	call   3c34 <exit>
    }
    free(m1);
     b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b2c:	89 04 24             	mov    %eax,(%esp)
     b2f:	e8 38 34 00 00       	call   3f6c <free>
    printf(1, "mem ok\n");
     b34:	c7 44 24 04 b7 45 00 	movl   $0x45b7,0x4(%esp)
     b3b:	00 
     b3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b43:	e8 6b 32 00 00       	call   3db3 <printf>
    exit();
     b48:	e8 e7 30 00 00       	call   3c34 <exit>
  } else {
    wait();
     b4d:	e8 ea 30 00 00       	call   3c3c <wait>
  }
}
     b52:	c9                   	leave  
     b53:	c3                   	ret    

00000b54 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     b54:	55                   	push   %ebp
     b55:	89 e5                	mov    %esp,%ebp
     b57:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     b5a:	c7 44 24 04 bf 45 00 	movl   $0x45bf,0x4(%esp)
     b61:	00 
     b62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b69:	e8 45 32 00 00       	call   3db3 <printf>

  unlink("sharedfd");
     b6e:	c7 04 24 ce 45 00 00 	movl   $0x45ce,(%esp)
     b75:	e8 0a 31 00 00       	call   3c84 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     b7a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     b81:	00 
     b82:	c7 04 24 ce 45 00 00 	movl   $0x45ce,(%esp)
     b89:	e8 e6 30 00 00       	call   3c74 <open>
     b8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     b91:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b95:	79 19                	jns    bb0 <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     b97:	c7 44 24 04 d8 45 00 	movl   $0x45d8,0x4(%esp)
     b9e:	00 
     b9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ba6:	e8 08 32 00 00       	call   3db3 <printf>
    return;
     bab:	e9 9c 01 00 00       	jmp    d4c <sharedfd+0x1f8>
  }
  pid = fork();
     bb0:	e8 77 30 00 00       	call   3c2c <fork>
     bb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     bb8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     bbc:	75 07                	jne    bc5 <sharedfd+0x71>
     bbe:	b8 63 00 00 00       	mov    $0x63,%eax
     bc3:	eb 05                	jmp    bca <sharedfd+0x76>
     bc5:	b8 70 00 00 00       	mov    $0x70,%eax
     bca:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     bd1:	00 
     bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
     bd6:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bd9:	89 04 24             	mov    %eax,(%esp)
     bdc:	e8 ae 2e 00 00       	call   3a8f <memset>
  for(i = 0; i < 1000; i++){
     be1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     be8:	eb 39                	jmp    c23 <sharedfd+0xcf>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     bea:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     bf1:	00 
     bf2:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
     bf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bfc:	89 04 24             	mov    %eax,(%esp)
     bff:	e8 50 30 00 00       	call   3c54 <write>
     c04:	83 f8 0a             	cmp    $0xa,%eax
     c07:	74 16                	je     c1f <sharedfd+0xcb>
      printf(1, "fstests: write sharedfd failed\n");
     c09:	c7 44 24 04 04 46 00 	movl   $0x4604,0x4(%esp)
     c10:	00 
     c11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c18:	e8 96 31 00 00       	call   3db3 <printf>
      break;
     c1d:	eb 0d                	jmp    c2c <sharedfd+0xd8>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     c1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c23:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     c2a:	7e be                	jle    bea <sharedfd+0x96>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     c2c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     c30:	75 05                	jne    c37 <sharedfd+0xe3>
    exit();
     c32:	e8 fd 2f 00 00       	call   3c34 <exit>
  else
    wait();
     c37:	e8 00 30 00 00       	call   3c3c <wait>
  close(fd);
     c3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c3f:	89 04 24             	mov    %eax,(%esp)
     c42:	e8 15 30 00 00       	call   3c5c <close>
  fd = open("sharedfd", 0);
     c47:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     c4e:	00 
     c4f:	c7 04 24 ce 45 00 00 	movl   $0x45ce,(%esp)
     c56:	e8 19 30 00 00       	call   3c74 <open>
     c5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     c5e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     c62:	79 19                	jns    c7d <sharedfd+0x129>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     c64:	c7 44 24 04 24 46 00 	movl   $0x4624,0x4(%esp)
     c6b:	00 
     c6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c73:	e8 3b 31 00 00       	call   3db3 <printf>
    return;
     c78:	e9 cf 00 00 00       	jmp    d4c <sharedfd+0x1f8>
  }
  nc = np = 0;
     c7d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     c84:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c87:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     c8a:	eb 37                	jmp    cc3 <sharedfd+0x16f>
    for(i = 0; i < sizeof(buf); i++){
     c8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c93:	eb 26                	jmp    cbb <sharedfd+0x167>
      if(buf[i] == 'c')
     c95:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     c98:	03 45 f4             	add    -0xc(%ebp),%eax
     c9b:	0f b6 00             	movzbl (%eax),%eax
     c9e:	3c 63                	cmp    $0x63,%al
     ca0:	75 04                	jne    ca6 <sharedfd+0x152>
        nc++;
     ca2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     ca6:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     ca9:	03 45 f4             	add    -0xc(%ebp),%eax
     cac:	0f b6 00             	movzbl (%eax),%eax
     caf:	3c 70                	cmp    $0x70,%al
     cb1:	75 04                	jne    cb7 <sharedfd+0x163>
        np++;
     cb3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     cb7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cbe:	83 f8 09             	cmp    $0x9,%eax
     cc1:	76 d2                	jbe    c95 <sharedfd+0x141>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     cc3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cca:	00 
     ccb:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     cce:	89 44 24 04          	mov    %eax,0x4(%esp)
     cd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cd5:	89 04 24             	mov    %eax,(%esp)
     cd8:	e8 6f 2f 00 00       	call   3c4c <read>
     cdd:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ce0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ce4:	7f a6                	jg     c8c <sharedfd+0x138>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     ce6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ce9:	89 04 24             	mov    %eax,(%esp)
     cec:	e8 6b 2f 00 00       	call   3c5c <close>
  unlink("sharedfd");
     cf1:	c7 04 24 ce 45 00 00 	movl   $0x45ce,(%esp)
     cf8:	e8 87 2f 00 00       	call   3c84 <unlink>
  if(nc == 10000 && np == 10000){
     cfd:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     d04:	75 1f                	jne    d25 <sharedfd+0x1d1>
     d06:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
     d0d:	75 16                	jne    d25 <sharedfd+0x1d1>
    printf(1, "sharedfd ok\n");
     d0f:	c7 44 24 04 4f 46 00 	movl   $0x464f,0x4(%esp)
     d16:	00 
     d17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d1e:	e8 90 30 00 00       	call   3db3 <printf>
     d23:	eb 27                	jmp    d4c <sharedfd+0x1f8>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     d25:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d28:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d2f:	89 44 24 08          	mov    %eax,0x8(%esp)
     d33:	c7 44 24 04 5c 46 00 	movl   $0x465c,0x4(%esp)
     d3a:	00 
     d3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d42:	e8 6c 30 00 00       	call   3db3 <printf>
    exit();
     d47:	e8 e8 2e 00 00       	call   3c34 <exit>
  }
}
     d4c:	c9                   	leave  
     d4d:	c3                   	ret    

00000d4e <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     d4e:	55                   	push   %ebp
     d4f:	89 e5                	mov    %esp,%ebp
     d51:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     d54:	c7 44 24 04 71 46 00 	movl   $0x4671,0x4(%esp)
     d5b:	00 
     d5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d63:	e8 4b 30 00 00       	call   3db3 <printf>

  unlink("f1");
     d68:	c7 04 24 80 46 00 00 	movl   $0x4680,(%esp)
     d6f:	e8 10 2f 00 00       	call   3c84 <unlink>
  unlink("f2");
     d74:	c7 04 24 83 46 00 00 	movl   $0x4683,(%esp)
     d7b:	e8 04 2f 00 00       	call   3c84 <unlink>

  pid = fork();
     d80:	e8 a7 2e 00 00       	call   3c2c <fork>
     d85:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
     d88:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d8c:	79 19                	jns    da7 <twofiles+0x59>
    printf(1, "fork failed\n");
     d8e:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
     d95:	00 
     d96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d9d:	e8 11 30 00 00       	call   3db3 <printf>
    exit();
     da2:	e8 8d 2e 00 00       	call   3c34 <exit>
  }

  fname = pid ? "f1" : "f2";
     da7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     dab:	74 07                	je     db4 <twofiles+0x66>
     dad:	b8 80 46 00 00       	mov    $0x4680,%eax
     db2:	eb 05                	jmp    db9 <twofiles+0x6b>
     db4:	b8 83 46 00 00       	mov    $0x4683,%eax
     db9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     dbc:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     dc3:	00 
     dc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dc7:	89 04 24             	mov    %eax,(%esp)
     dca:	e8 a5 2e 00 00       	call   3c74 <open>
     dcf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     dd2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     dd6:	79 19                	jns    df1 <twofiles+0xa3>
    printf(1, "create failed\n");
     dd8:	c7 44 24 04 86 46 00 	movl   $0x4686,0x4(%esp)
     ddf:	00 
     de0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     de7:	e8 c7 2f 00 00       	call   3db3 <printf>
    exit();
     dec:	e8 43 2e 00 00       	call   3c34 <exit>
  }

  memset(buf, pid?'p':'c', 512);
     df1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     df5:	74 07                	je     dfe <twofiles+0xb0>
     df7:	b8 70 00 00 00       	mov    $0x70,%eax
     dfc:	eb 05                	jmp    e03 <twofiles+0xb5>
     dfe:	b8 63 00 00 00       	mov    $0x63,%eax
     e03:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     e0a:	00 
     e0b:	89 44 24 04          	mov    %eax,0x4(%esp)
     e0f:	c7 04 24 40 80 00 00 	movl   $0x8040,(%esp)
     e16:	e8 74 2c 00 00       	call   3a8f <memset>
  for(i = 0; i < 12; i++){
     e1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e22:	eb 4b                	jmp    e6f <twofiles+0x121>
    if((n = write(fd, buf, 500)) != 500){
     e24:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
     e2b:	00 
     e2c:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     e33:	00 
     e34:	8b 45 e0             	mov    -0x20(%ebp),%eax
     e37:	89 04 24             	mov    %eax,(%esp)
     e3a:	e8 15 2e 00 00       	call   3c54 <write>
     e3f:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e42:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
     e49:	74 20                	je     e6b <twofiles+0x11d>
      printf(1, "write failed %d\n", n);
     e4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
     e4e:	89 44 24 08          	mov    %eax,0x8(%esp)
     e52:	c7 44 24 04 95 46 00 	movl   $0x4695,0x4(%esp)
     e59:	00 
     e5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e61:	e8 4d 2f 00 00       	call   3db3 <printf>
      exit();
     e66:	e8 c9 2d 00 00       	call   3c34 <exit>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     e6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     e6f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
     e73:	7e af                	jle    e24 <twofiles+0xd6>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     e75:	8b 45 e0             	mov    -0x20(%ebp),%eax
     e78:	89 04 24             	mov    %eax,(%esp)
     e7b:	e8 dc 2d 00 00       	call   3c5c <close>
  if(pid)
     e80:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e84:	74 11                	je     e97 <twofiles+0x149>
    wait();
     e86:	e8 b1 2d 00 00       	call   3c3c <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
     e8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e92:	e9 e7 00 00 00       	jmp    f7e <twofiles+0x230>
  }
  close(fd);
  if(pid)
    wait();
  else
    exit();
     e97:	e8 98 2d 00 00       	call   3c34 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     e9c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea0:	74 07                	je     ea9 <twofiles+0x15b>
     ea2:	b8 80 46 00 00       	mov    $0x4680,%eax
     ea7:	eb 05                	jmp    eae <twofiles+0x160>
     ea9:	b8 83 46 00 00       	mov    $0x4683,%eax
     eae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     eb5:	00 
     eb6:	89 04 24             	mov    %eax,(%esp)
     eb9:	e8 b6 2d 00 00       	call   3c74 <open>
     ebe:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
     ec1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ec8:	eb 58                	jmp    f22 <twofiles+0x1d4>
      for(j = 0; j < n; j++){
     eca:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ed1:	eb 41                	jmp    f14 <twofiles+0x1c6>
        if(buf[j] != (i?'p':'c')){
     ed3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ed6:	05 40 80 00 00       	add    $0x8040,%eax
     edb:	0f b6 00             	movzbl (%eax),%eax
     ede:	0f be d0             	movsbl %al,%edx
     ee1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ee5:	74 07                	je     eee <twofiles+0x1a0>
     ee7:	b8 70 00 00 00       	mov    $0x70,%eax
     eec:	eb 05                	jmp    ef3 <twofiles+0x1a5>
     eee:	b8 63 00 00 00       	mov    $0x63,%eax
     ef3:	39 c2                	cmp    %eax,%edx
     ef5:	74 19                	je     f10 <twofiles+0x1c2>
          printf(1, "wrong char\n");
     ef7:	c7 44 24 04 a6 46 00 	movl   $0x46a6,0x4(%esp)
     efe:	00 
     eff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f06:	e8 a8 2e 00 00       	call   3db3 <printf>
          exit();
     f0b:	e8 24 2d 00 00       	call   3c34 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     f10:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     f14:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f17:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     f1a:	7c b7                	jl     ed3 <twofiles+0x185>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     f1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f1f:	01 45 ec             	add    %eax,-0x14(%ebp)
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f22:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     f29:	00 
     f2a:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
     f31:	00 
     f32:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f35:	89 04 24             	mov    %eax,(%esp)
     f38:	e8 0f 2d 00 00       	call   3c4c <read>
     f3d:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f40:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     f44:	7f 84                	jg     eca <twofiles+0x17c>
          exit();
        }
      }
      total += n;
    }
    close(fd);
     f46:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f49:	89 04 24             	mov    %eax,(%esp)
     f4c:	e8 0b 2d 00 00       	call   3c5c <close>
    if(total != 12*500){
     f51:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
     f58:	74 20                	je     f7a <twofiles+0x22c>
      printf(1, "wrong length %d\n", total);
     f5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f5d:	89 44 24 08          	mov    %eax,0x8(%esp)
     f61:	c7 44 24 04 b2 46 00 	movl   $0x46b2,0x4(%esp)
     f68:	00 
     f69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f70:	e8 3e 2e 00 00       	call   3db3 <printf>
      exit();
     f75:	e8 ba 2c 00 00       	call   3c34 <exit>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     f7a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f7e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
     f82:	0f 8e 14 ff ff ff    	jle    e9c <twofiles+0x14e>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     f88:	c7 04 24 80 46 00 00 	movl   $0x4680,(%esp)
     f8f:	e8 f0 2c 00 00       	call   3c84 <unlink>
  unlink("f2");
     f94:	c7 04 24 83 46 00 00 	movl   $0x4683,(%esp)
     f9b:	e8 e4 2c 00 00       	call   3c84 <unlink>

  printf(1, "twofiles ok\n");
     fa0:	c7 44 24 04 c3 46 00 	movl   $0x46c3,0x4(%esp)
     fa7:	00 
     fa8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     faf:	e8 ff 2d 00 00       	call   3db3 <printf>
}
     fb4:	c9                   	leave  
     fb5:	c3                   	ret    

00000fb6 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
     fb6:	55                   	push   %ebp
     fb7:	89 e5                	mov    %esp,%ebp
     fb9:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     fbc:	c7 44 24 04 d0 46 00 	movl   $0x46d0,0x4(%esp)
     fc3:	00 
     fc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fcb:	e8 e3 2d 00 00       	call   3db3 <printf>
  pid = fork();
     fd0:	e8 57 2c 00 00       	call   3c2c <fork>
     fd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid < 0){
     fd8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fdc:	79 19                	jns    ff7 <createdelete+0x41>
    printf(1, "fork failed\n");
     fde:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
     fe5:	00 
     fe6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fed:	e8 c1 2d 00 00       	call   3db3 <printf>
    exit();
     ff2:	e8 3d 2c 00 00       	call   3c34 <exit>
  }

  name[0] = pid ? 'p' : 'c';
     ff7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ffb:	74 07                	je     1004 <createdelete+0x4e>
     ffd:	b8 70 00 00 00       	mov    $0x70,%eax
    1002:	eb 05                	jmp    1009 <createdelete+0x53>
    1004:	b8 63 00 00 00       	mov    $0x63,%eax
    1009:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
    100c:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
    1010:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1017:	e9 98 00 00 00       	jmp    10b4 <createdelete+0xfe>
    name[1] = '0' + i;
    101c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101f:	83 c0 30             	add    $0x30,%eax
    1022:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    1025:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    102c:	00 
    102d:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1030:	89 04 24             	mov    %eax,(%esp)
    1033:	e8 3c 2c 00 00       	call   3c74 <open>
    1038:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    103b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    103f:	79 19                	jns    105a <createdelete+0xa4>
      printf(1, "create failed\n");
    1041:	c7 44 24 04 86 46 00 	movl   $0x4686,0x4(%esp)
    1048:	00 
    1049:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1050:	e8 5e 2d 00 00       	call   3db3 <printf>
      exit();
    1055:	e8 da 2b 00 00       	call   3c34 <exit>
    }
    close(fd);
    105a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    105d:	89 04 24             	mov    %eax,(%esp)
    1060:	e8 f7 2b 00 00       	call   3c5c <close>
    if(i > 0 && (i % 2 ) == 0){
    1065:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1069:	7e 45                	jle    10b0 <createdelete+0xfa>
    106b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106e:	83 e0 01             	and    $0x1,%eax
    1071:	85 c0                	test   %eax,%eax
    1073:	75 3b                	jne    10b0 <createdelete+0xfa>
      name[1] = '0' + (i / 2);
    1075:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1078:	89 c2                	mov    %eax,%edx
    107a:	c1 ea 1f             	shr    $0x1f,%edx
    107d:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1080:	d1 f8                	sar    %eax
    1082:	83 c0 30             	add    $0x30,%eax
    1085:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    1088:	8d 45 cc             	lea    -0x34(%ebp),%eax
    108b:	89 04 24             	mov    %eax,(%esp)
    108e:	e8 f1 2b 00 00       	call   3c84 <unlink>
    1093:	85 c0                	test   %eax,%eax
    1095:	79 19                	jns    10b0 <createdelete+0xfa>
        printf(1, "unlink failed\n");
    1097:	c7 44 24 04 e3 46 00 	movl   $0x46e3,0x4(%esp)
    109e:	00 
    109f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a6:	e8 08 2d 00 00       	call   3db3 <printf>
        exit();
    10ab:	e8 84 2b 00 00       	call   3c34 <exit>
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    10b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10b4:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10b8:	0f 8e 5e ff ff ff    	jle    101c <createdelete+0x66>
        exit();
      }
    }
  }

  if(pid==0)
    10be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10c2:	75 05                	jne    10c9 <createdelete+0x113>
    exit();
    10c4:	e8 6b 2b 00 00       	call   3c34 <exit>
  else
    wait();
    10c9:	e8 6e 2b 00 00       	call   3c3c <wait>

  for(i = 0; i < N; i++){
    10ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10d5:	e9 34 01 00 00       	jmp    120e <createdelete+0x258>
    name[0] = 'p';
    10da:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    10de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e1:	83 c0 30             	add    $0x30,%eax
    10e4:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    10e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10ee:	00 
    10ef:	8d 45 cc             	lea    -0x34(%ebp),%eax
    10f2:	89 04 24             	mov    %eax,(%esp)
    10f5:	e8 7a 2b 00 00       	call   3c74 <open>
    10fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    10fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1101:	74 06                	je     1109 <createdelete+0x153>
    1103:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1107:	7e 26                	jle    112f <createdelete+0x179>
    1109:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    110d:	79 20                	jns    112f <createdelete+0x179>
      printf(1, "oops createdelete %s didn't exist\n", name);
    110f:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1112:	89 44 24 08          	mov    %eax,0x8(%esp)
    1116:	c7 44 24 04 f4 46 00 	movl   $0x46f4,0x4(%esp)
    111d:	00 
    111e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1125:	e8 89 2c 00 00       	call   3db3 <printf>
      exit();
    112a:	e8 05 2b 00 00       	call   3c34 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    112f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1133:	7e 2c                	jle    1161 <createdelete+0x1ab>
    1135:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1139:	7f 26                	jg     1161 <createdelete+0x1ab>
    113b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    113f:	78 20                	js     1161 <createdelete+0x1ab>
      printf(1, "oops createdelete %s did exist\n", name);
    1141:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1144:	89 44 24 08          	mov    %eax,0x8(%esp)
    1148:	c7 44 24 04 18 47 00 	movl   $0x4718,0x4(%esp)
    114f:	00 
    1150:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1157:	e8 57 2c 00 00       	call   3db3 <printf>
      exit();
    115c:	e8 d3 2a 00 00       	call   3c34 <exit>
    }
    if(fd >= 0)
    1161:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1165:	78 0b                	js     1172 <createdelete+0x1bc>
      close(fd);
    1167:	8b 45 ec             	mov    -0x14(%ebp),%eax
    116a:	89 04 24             	mov    %eax,(%esp)
    116d:	e8 ea 2a 00 00       	call   3c5c <close>

    name[0] = 'c';
    1172:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    1176:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1179:	83 c0 30             	add    $0x30,%eax
    117c:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    117f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1186:	00 
    1187:	8d 45 cc             	lea    -0x34(%ebp),%eax
    118a:	89 04 24             	mov    %eax,(%esp)
    118d:	e8 e2 2a 00 00       	call   3c74 <open>
    1192:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    1195:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1199:	74 06                	je     11a1 <createdelete+0x1eb>
    119b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    119f:	7e 26                	jle    11c7 <createdelete+0x211>
    11a1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11a5:	79 20                	jns    11c7 <createdelete+0x211>
      printf(1, "oops createdelete %s didn't exist\n", name);
    11a7:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11aa:	89 44 24 08          	mov    %eax,0x8(%esp)
    11ae:	c7 44 24 04 f4 46 00 	movl   $0x46f4,0x4(%esp)
    11b5:	00 
    11b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11bd:	e8 f1 2b 00 00       	call   3db3 <printf>
      exit();
    11c2:	e8 6d 2a 00 00       	call   3c34 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    11c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11cb:	7e 2c                	jle    11f9 <createdelete+0x243>
    11cd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11d1:	7f 26                	jg     11f9 <createdelete+0x243>
    11d3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11d7:	78 20                	js     11f9 <createdelete+0x243>
      printf(1, "oops createdelete %s did exist\n", name);
    11d9:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e0:	c7 44 24 04 18 47 00 	movl   $0x4718,0x4(%esp)
    11e7:	00 
    11e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11ef:	e8 bf 2b 00 00       	call   3db3 <printf>
      exit();
    11f4:	e8 3b 2a 00 00       	call   3c34 <exit>
    }
    if(fd >= 0)
    11f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11fd:	78 0b                	js     120a <createdelete+0x254>
      close(fd);
    11ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1202:	89 04 24             	mov    %eax,(%esp)
    1205:	e8 52 2a 00 00       	call   3c5c <close>
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    120a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    120e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1212:	0f 8e c2 fe ff ff    	jle    10da <createdelete+0x124>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    1218:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    121f:	eb 2b                	jmp    124c <createdelete+0x296>
    name[0] = 'p';
    1221:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    1225:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1228:	83 c0 30             	add    $0x30,%eax
    122b:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    122e:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1231:	89 04 24             	mov    %eax,(%esp)
    1234:	e8 4b 2a 00 00       	call   3c84 <unlink>
    name[0] = 'c';
    1239:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    123d:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1240:	89 04 24             	mov    %eax,(%esp)
    1243:	e8 3c 2a 00 00       	call   3c84 <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    1248:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    124c:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1250:	7e cf                	jle    1221 <createdelete+0x26b>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    1252:	c7 44 24 04 38 47 00 	movl   $0x4738,0x4(%esp)
    1259:	00 
    125a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1261:	e8 4d 2b 00 00       	call   3db3 <printf>
}
    1266:	c9                   	leave  
    1267:	c3                   	ret    

00001268 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1268:	55                   	push   %ebp
    1269:	89 e5                	mov    %esp,%ebp
    126b:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    126e:	c7 44 24 04 49 47 00 	movl   $0x4749,0x4(%esp)
    1275:	00 
    1276:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127d:	e8 31 2b 00 00       	call   3db3 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1282:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1289:	00 
    128a:	c7 04 24 5a 47 00 00 	movl   $0x475a,(%esp)
    1291:	e8 de 29 00 00       	call   3c74 <open>
    1296:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1299:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    129d:	79 19                	jns    12b8 <unlinkread+0x50>
    printf(1, "create unlinkread failed\n");
    129f:	c7 44 24 04 65 47 00 	movl   $0x4765,0x4(%esp)
    12a6:	00 
    12a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12ae:	e8 00 2b 00 00       	call   3db3 <printf>
    exit();
    12b3:	e8 7c 29 00 00       	call   3c34 <exit>
  }
  write(fd, "hello", 5);
    12b8:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    12bf:	00 
    12c0:	c7 44 24 04 7f 47 00 	movl   $0x477f,0x4(%esp)
    12c7:	00 
    12c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12cb:	89 04 24             	mov    %eax,(%esp)
    12ce:	e8 81 29 00 00       	call   3c54 <write>
  close(fd);
    12d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d6:	89 04 24             	mov    %eax,(%esp)
    12d9:	e8 7e 29 00 00       	call   3c5c <close>

  fd = open("unlinkread", O_RDWR);
    12de:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    12e5:	00 
    12e6:	c7 04 24 5a 47 00 00 	movl   $0x475a,(%esp)
    12ed:	e8 82 29 00 00       	call   3c74 <open>
    12f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    12f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12f9:	79 19                	jns    1314 <unlinkread+0xac>
    printf(1, "open unlinkread failed\n");
    12fb:	c7 44 24 04 85 47 00 	movl   $0x4785,0x4(%esp)
    1302:	00 
    1303:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    130a:	e8 a4 2a 00 00       	call   3db3 <printf>
    exit();
    130f:	e8 20 29 00 00       	call   3c34 <exit>
  }
  if(unlink("unlinkread") != 0){
    1314:	c7 04 24 5a 47 00 00 	movl   $0x475a,(%esp)
    131b:	e8 64 29 00 00       	call   3c84 <unlink>
    1320:	85 c0                	test   %eax,%eax
    1322:	74 19                	je     133d <unlinkread+0xd5>
    printf(1, "unlink unlinkread failed\n");
    1324:	c7 44 24 04 9d 47 00 	movl   $0x479d,0x4(%esp)
    132b:	00 
    132c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1333:	e8 7b 2a 00 00       	call   3db3 <printf>
    exit();
    1338:	e8 f7 28 00 00       	call   3c34 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    133d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1344:	00 
    1345:	c7 04 24 5a 47 00 00 	movl   $0x475a,(%esp)
    134c:	e8 23 29 00 00       	call   3c74 <open>
    1351:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1354:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    135b:	00 
    135c:	c7 44 24 04 b7 47 00 	movl   $0x47b7,0x4(%esp)
    1363:	00 
    1364:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1367:	89 04 24             	mov    %eax,(%esp)
    136a:	e8 e5 28 00 00       	call   3c54 <write>
  close(fd1);
    136f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1372:	89 04 24             	mov    %eax,(%esp)
    1375:	e8 e2 28 00 00       	call   3c5c <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    137a:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1381:	00 
    1382:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    1389:	00 
    138a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    138d:	89 04 24             	mov    %eax,(%esp)
    1390:	e8 b7 28 00 00       	call   3c4c <read>
    1395:	83 f8 05             	cmp    $0x5,%eax
    1398:	74 19                	je     13b3 <unlinkread+0x14b>
    printf(1, "unlinkread read failed");
    139a:	c7 44 24 04 bb 47 00 	movl   $0x47bb,0x4(%esp)
    13a1:	00 
    13a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13a9:	e8 05 2a 00 00       	call   3db3 <printf>
    exit();
    13ae:	e8 81 28 00 00       	call   3c34 <exit>
  }
  if(buf[0] != 'h'){
    13b3:	0f b6 05 40 80 00 00 	movzbl 0x8040,%eax
    13ba:	3c 68                	cmp    $0x68,%al
    13bc:	74 19                	je     13d7 <unlinkread+0x16f>
    printf(1, "unlinkread wrong data\n");
    13be:	c7 44 24 04 d2 47 00 	movl   $0x47d2,0x4(%esp)
    13c5:	00 
    13c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13cd:	e8 e1 29 00 00       	call   3db3 <printf>
    exit();
    13d2:	e8 5d 28 00 00       	call   3c34 <exit>
  }
  if(write(fd, buf, 10) != 10){
    13d7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    13de:	00 
    13df:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    13e6:	00 
    13e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ea:	89 04 24             	mov    %eax,(%esp)
    13ed:	e8 62 28 00 00       	call   3c54 <write>
    13f2:	83 f8 0a             	cmp    $0xa,%eax
    13f5:	74 19                	je     1410 <unlinkread+0x1a8>
    printf(1, "unlinkread write failed\n");
    13f7:	c7 44 24 04 e9 47 00 	movl   $0x47e9,0x4(%esp)
    13fe:	00 
    13ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1406:	e8 a8 29 00 00       	call   3db3 <printf>
    exit();
    140b:	e8 24 28 00 00       	call   3c34 <exit>
  }
  close(fd);
    1410:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1413:	89 04 24             	mov    %eax,(%esp)
    1416:	e8 41 28 00 00       	call   3c5c <close>
  unlink("unlinkread");
    141b:	c7 04 24 5a 47 00 00 	movl   $0x475a,(%esp)
    1422:	e8 5d 28 00 00       	call   3c84 <unlink>
  printf(1, "unlinkread ok\n");
    1427:	c7 44 24 04 02 48 00 	movl   $0x4802,0x4(%esp)
    142e:	00 
    142f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1436:	e8 78 29 00 00       	call   3db3 <printf>
}
    143b:	c9                   	leave  
    143c:	c3                   	ret    

0000143d <linktest>:

void
linktest(void)
{
    143d:	55                   	push   %ebp
    143e:	89 e5                	mov    %esp,%ebp
    1440:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    1443:	c7 44 24 04 11 48 00 	movl   $0x4811,0x4(%esp)
    144a:	00 
    144b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1452:	e8 5c 29 00 00       	call   3db3 <printf>

  unlink("lf1");
    1457:	c7 04 24 1b 48 00 00 	movl   $0x481b,(%esp)
    145e:	e8 21 28 00 00       	call   3c84 <unlink>
  unlink("lf2");
    1463:	c7 04 24 1f 48 00 00 	movl   $0x481f,(%esp)
    146a:	e8 15 28 00 00       	call   3c84 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    146f:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1476:	00 
    1477:	c7 04 24 1b 48 00 00 	movl   $0x481b,(%esp)
    147e:	e8 f1 27 00 00       	call   3c74 <open>
    1483:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1486:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    148a:	79 19                	jns    14a5 <linktest+0x68>
    printf(1, "create lf1 failed\n");
    148c:	c7 44 24 04 23 48 00 	movl   $0x4823,0x4(%esp)
    1493:	00 
    1494:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    149b:	e8 13 29 00 00       	call   3db3 <printf>
    exit();
    14a0:	e8 8f 27 00 00       	call   3c34 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    14a5:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    14ac:	00 
    14ad:	c7 44 24 04 7f 47 00 	movl   $0x477f,0x4(%esp)
    14b4:	00 
    14b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14b8:	89 04 24             	mov    %eax,(%esp)
    14bb:	e8 94 27 00 00       	call   3c54 <write>
    14c0:	83 f8 05             	cmp    $0x5,%eax
    14c3:	74 19                	je     14de <linktest+0xa1>
    printf(1, "write lf1 failed\n");
    14c5:	c7 44 24 04 36 48 00 	movl   $0x4836,0x4(%esp)
    14cc:	00 
    14cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14d4:	e8 da 28 00 00       	call   3db3 <printf>
    exit();
    14d9:	e8 56 27 00 00       	call   3c34 <exit>
  }
  close(fd);
    14de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e1:	89 04 24             	mov    %eax,(%esp)
    14e4:	e8 73 27 00 00       	call   3c5c <close>

  if(link("lf1", "lf2") < 0){
    14e9:	c7 44 24 04 1f 48 00 	movl   $0x481f,0x4(%esp)
    14f0:	00 
    14f1:	c7 04 24 1b 48 00 00 	movl   $0x481b,(%esp)
    14f8:	e8 97 27 00 00       	call   3c94 <link>
    14fd:	85 c0                	test   %eax,%eax
    14ff:	79 19                	jns    151a <linktest+0xdd>
    printf(1, "link lf1 lf2 failed\n");
    1501:	c7 44 24 04 48 48 00 	movl   $0x4848,0x4(%esp)
    1508:	00 
    1509:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1510:	e8 9e 28 00 00       	call   3db3 <printf>
    exit();
    1515:	e8 1a 27 00 00       	call   3c34 <exit>
  }
  unlink("lf1");
    151a:	c7 04 24 1b 48 00 00 	movl   $0x481b,(%esp)
    1521:	e8 5e 27 00 00       	call   3c84 <unlink>

  if(open("lf1", 0) >= 0){
    1526:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    152d:	00 
    152e:	c7 04 24 1b 48 00 00 	movl   $0x481b,(%esp)
    1535:	e8 3a 27 00 00       	call   3c74 <open>
    153a:	85 c0                	test   %eax,%eax
    153c:	78 19                	js     1557 <linktest+0x11a>
    printf(1, "unlinked lf1 but it is still there!\n");
    153e:	c7 44 24 04 60 48 00 	movl   $0x4860,0x4(%esp)
    1545:	00 
    1546:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    154d:	e8 61 28 00 00       	call   3db3 <printf>
    exit();
    1552:	e8 dd 26 00 00       	call   3c34 <exit>
  }

  fd = open("lf2", 0);
    1557:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    155e:	00 
    155f:	c7 04 24 1f 48 00 00 	movl   $0x481f,(%esp)
    1566:	e8 09 27 00 00       	call   3c74 <open>
    156b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    156e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1572:	79 19                	jns    158d <linktest+0x150>
    printf(1, "open lf2 failed\n");
    1574:	c7 44 24 04 85 48 00 	movl   $0x4885,0x4(%esp)
    157b:	00 
    157c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1583:	e8 2b 28 00 00       	call   3db3 <printf>
    exit();
    1588:	e8 a7 26 00 00       	call   3c34 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    158d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1594:	00 
    1595:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    159c:	00 
    159d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a0:	89 04 24             	mov    %eax,(%esp)
    15a3:	e8 a4 26 00 00       	call   3c4c <read>
    15a8:	83 f8 05             	cmp    $0x5,%eax
    15ab:	74 19                	je     15c6 <linktest+0x189>
    printf(1, "read lf2 failed\n");
    15ad:	c7 44 24 04 96 48 00 	movl   $0x4896,0x4(%esp)
    15b4:	00 
    15b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15bc:	e8 f2 27 00 00       	call   3db3 <printf>
    exit();
    15c1:	e8 6e 26 00 00       	call   3c34 <exit>
  }
  close(fd);
    15c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c9:	89 04 24             	mov    %eax,(%esp)
    15cc:	e8 8b 26 00 00       	call   3c5c <close>

  if(link("lf2", "lf2") >= 0){
    15d1:	c7 44 24 04 1f 48 00 	movl   $0x481f,0x4(%esp)
    15d8:	00 
    15d9:	c7 04 24 1f 48 00 00 	movl   $0x481f,(%esp)
    15e0:	e8 af 26 00 00       	call   3c94 <link>
    15e5:	85 c0                	test   %eax,%eax
    15e7:	78 19                	js     1602 <linktest+0x1c5>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15e9:	c7 44 24 04 a7 48 00 	movl   $0x48a7,0x4(%esp)
    15f0:	00 
    15f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15f8:	e8 b6 27 00 00       	call   3db3 <printf>
    exit();
    15fd:	e8 32 26 00 00       	call   3c34 <exit>
  }

  unlink("lf2");
    1602:	c7 04 24 1f 48 00 00 	movl   $0x481f,(%esp)
    1609:	e8 76 26 00 00       	call   3c84 <unlink>
  if(link("lf2", "lf1") >= 0){
    160e:	c7 44 24 04 1b 48 00 	movl   $0x481b,0x4(%esp)
    1615:	00 
    1616:	c7 04 24 1f 48 00 00 	movl   $0x481f,(%esp)
    161d:	e8 72 26 00 00       	call   3c94 <link>
    1622:	85 c0                	test   %eax,%eax
    1624:	78 19                	js     163f <linktest+0x202>
    printf(1, "link non-existant succeeded! oops\n");
    1626:	c7 44 24 04 c8 48 00 	movl   $0x48c8,0x4(%esp)
    162d:	00 
    162e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1635:	e8 79 27 00 00       	call   3db3 <printf>
    exit();
    163a:	e8 f5 25 00 00       	call   3c34 <exit>
  }

  if(link(".", "lf1") >= 0){
    163f:	c7 44 24 04 1b 48 00 	movl   $0x481b,0x4(%esp)
    1646:	00 
    1647:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    164e:	e8 41 26 00 00       	call   3c94 <link>
    1653:	85 c0                	test   %eax,%eax
    1655:	78 19                	js     1670 <linktest+0x233>
    printf(1, "link . lf1 succeeded! oops\n");
    1657:	c7 44 24 04 ed 48 00 	movl   $0x48ed,0x4(%esp)
    165e:	00 
    165f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1666:	e8 48 27 00 00       	call   3db3 <printf>
    exit();
    166b:	e8 c4 25 00 00       	call   3c34 <exit>
  }

  printf(1, "linktest ok\n");
    1670:	c7 44 24 04 09 49 00 	movl   $0x4909,0x4(%esp)
    1677:	00 
    1678:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    167f:	e8 2f 27 00 00       	call   3db3 <printf>
}
    1684:	c9                   	leave  
    1685:	c3                   	ret    

00001686 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1686:	55                   	push   %ebp
    1687:	89 e5                	mov    %esp,%ebp
    1689:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    168c:	c7 44 24 04 16 49 00 	movl   $0x4916,0x4(%esp)
    1693:	00 
    1694:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    169b:	e8 13 27 00 00       	call   3db3 <printf>
  file[0] = 'C';
    16a0:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    16a4:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    16a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    16af:	e9 f7 00 00 00       	jmp    17ab <concreate+0x125>
    file[1] = '0' + i;
    16b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16b7:	83 c0 30             	add    $0x30,%eax
    16ba:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    16bd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16c0:	89 04 24             	mov    %eax,(%esp)
    16c3:	e8 bc 25 00 00       	call   3c84 <unlink>
    pid = fork();
    16c8:	e8 5f 25 00 00       	call   3c2c <fork>
    16cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    16d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    16d4:	74 3a                	je     1710 <concreate+0x8a>
    16d6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16d9:	ba 56 55 55 55       	mov    $0x55555556,%edx
    16de:	89 c8                	mov    %ecx,%eax
    16e0:	f7 ea                	imul   %edx
    16e2:	89 c8                	mov    %ecx,%eax
    16e4:	c1 f8 1f             	sar    $0x1f,%eax
    16e7:	29 c2                	sub    %eax,%edx
    16e9:	89 d0                	mov    %edx,%eax
    16eb:	01 c0                	add    %eax,%eax
    16ed:	01 d0                	add    %edx,%eax
    16ef:	89 ca                	mov    %ecx,%edx
    16f1:	29 c2                	sub    %eax,%edx
    16f3:	83 fa 01             	cmp    $0x1,%edx
    16f6:	75 18                	jne    1710 <concreate+0x8a>
      link("C0", file);
    16f8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    16ff:	c7 04 24 26 49 00 00 	movl   $0x4926,(%esp)
    1706:	e8 89 25 00 00       	call   3c94 <link>
    170b:	e9 87 00 00 00       	jmp    1797 <concreate+0x111>
    } else if(pid == 0 && (i % 5) == 1){
    1710:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1714:	75 3a                	jne    1750 <concreate+0xca>
    1716:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1719:	ba 67 66 66 66       	mov    $0x66666667,%edx
    171e:	89 c8                	mov    %ecx,%eax
    1720:	f7 ea                	imul   %edx
    1722:	d1 fa                	sar    %edx
    1724:	89 c8                	mov    %ecx,%eax
    1726:	c1 f8 1f             	sar    $0x1f,%eax
    1729:	29 c2                	sub    %eax,%edx
    172b:	89 d0                	mov    %edx,%eax
    172d:	c1 e0 02             	shl    $0x2,%eax
    1730:	01 d0                	add    %edx,%eax
    1732:	89 ca                	mov    %ecx,%edx
    1734:	29 c2                	sub    %eax,%edx
    1736:	83 fa 01             	cmp    $0x1,%edx
    1739:	75 15                	jne    1750 <concreate+0xca>
      link("C0", file);
    173b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    173e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1742:	c7 04 24 26 49 00 00 	movl   $0x4926,(%esp)
    1749:	e8 46 25 00 00       	call   3c94 <link>
    174e:	eb 47                	jmp    1797 <concreate+0x111>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1750:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1757:	00 
    1758:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    175b:	89 04 24             	mov    %eax,(%esp)
    175e:	e8 11 25 00 00       	call   3c74 <open>
    1763:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1766:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    176a:	79 20                	jns    178c <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    176c:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    176f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1773:	c7 44 24 04 29 49 00 	movl   $0x4929,0x4(%esp)
    177a:	00 
    177b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1782:	e8 2c 26 00 00       	call   3db3 <printf>
        exit();
    1787:	e8 a8 24 00 00       	call   3c34 <exit>
      }
      close(fd);
    178c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    178f:	89 04 24             	mov    %eax,(%esp)
    1792:	e8 c5 24 00 00       	call   3c5c <close>
    }
    if(pid == 0)
    1797:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    179b:	75 05                	jne    17a2 <concreate+0x11c>
      exit();
    179d:	e8 92 24 00 00       	call   3c34 <exit>
    else
      wait();
    17a2:	e8 95 24 00 00       	call   3c3c <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    17ab:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    17af:	0f 8e ff fe ff ff    	jle    16b4 <concreate+0x2e>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    17b5:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    17bc:	00 
    17bd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17c4:	00 
    17c5:	8d 45 bd             	lea    -0x43(%ebp),%eax
    17c8:	89 04 24             	mov    %eax,(%esp)
    17cb:	e8 bf 22 00 00       	call   3a8f <memset>
  fd = open(".", 0);
    17d0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17d7:	00 
    17d8:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    17df:	e8 90 24 00 00       	call   3c74 <open>
    17e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    17e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    17ee:	e9 9f 00 00 00       	jmp    1892 <concreate+0x20c>
    if(de.inum == 0)
    17f3:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    17f7:	66 85 c0             	test   %ax,%ax
    17fa:	0f 84 91 00 00 00    	je     1891 <concreate+0x20b>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1800:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1804:	3c 43                	cmp    $0x43,%al
    1806:	0f 85 86 00 00 00    	jne    1892 <concreate+0x20c>
    180c:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1810:	84 c0                	test   %al,%al
    1812:	75 7e                	jne    1892 <concreate+0x20c>
      i = de.name[1] - '0';
    1814:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1818:	0f be c0             	movsbl %al,%eax
    181b:	83 e8 30             	sub    $0x30,%eax
    181e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1821:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1825:	78 08                	js     182f <concreate+0x1a9>
    1827:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182a:	83 f8 27             	cmp    $0x27,%eax
    182d:	76 23                	jbe    1852 <concreate+0x1cc>
        printf(1, "concreate weird file %s\n", de.name);
    182f:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1832:	83 c0 02             	add    $0x2,%eax
    1835:	89 44 24 08          	mov    %eax,0x8(%esp)
    1839:	c7 44 24 04 45 49 00 	movl   $0x4945,0x4(%esp)
    1840:	00 
    1841:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1848:	e8 66 25 00 00       	call   3db3 <printf>
        exit();
    184d:	e8 e2 23 00 00       	call   3c34 <exit>
      }
      if(fa[i]){
    1852:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1855:	03 45 f4             	add    -0xc(%ebp),%eax
    1858:	0f b6 00             	movzbl (%eax),%eax
    185b:	84 c0                	test   %al,%al
    185d:	74 23                	je     1882 <concreate+0x1fc>
        printf(1, "concreate duplicate file %s\n", de.name);
    185f:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1862:	83 c0 02             	add    $0x2,%eax
    1865:	89 44 24 08          	mov    %eax,0x8(%esp)
    1869:	c7 44 24 04 5e 49 00 	movl   $0x495e,0x4(%esp)
    1870:	00 
    1871:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1878:	e8 36 25 00 00       	call   3db3 <printf>
        exit();
    187d:	e8 b2 23 00 00       	call   3c34 <exit>
      }
      fa[i] = 1;
    1882:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1885:	03 45 f4             	add    -0xc(%ebp),%eax
    1888:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    188b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    188f:	eb 01                	jmp    1892 <concreate+0x20c>
  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    if(de.inum == 0)
      continue;
    1891:	90                   	nop
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1892:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1899:	00 
    189a:	8d 45 ac             	lea    -0x54(%ebp),%eax
    189d:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18a4:	89 04 24             	mov    %eax,(%esp)
    18a7:	e8 a0 23 00 00       	call   3c4c <read>
    18ac:	85 c0                	test   %eax,%eax
    18ae:	0f 8f 3f ff ff ff    	jg     17f3 <concreate+0x16d>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    18b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18b7:	89 04 24             	mov    %eax,(%esp)
    18ba:	e8 9d 23 00 00       	call   3c5c <close>

  if(n != 40){
    18bf:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    18c3:	74 19                	je     18de <concreate+0x258>
    printf(1, "concreate not enough files in directory listing\n");
    18c5:	c7 44 24 04 7c 49 00 	movl   $0x497c,0x4(%esp)
    18cc:	00 
    18cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18d4:	e8 da 24 00 00       	call   3db3 <printf>
    exit();
    18d9:	e8 56 23 00 00       	call   3c34 <exit>
  }

  for(i = 0; i < 40; i++){
    18de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    18e5:	e9 2d 01 00 00       	jmp    1a17 <concreate+0x391>
    file[1] = '0' + i;
    18ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18ed:	83 c0 30             	add    $0x30,%eax
    18f0:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    18f3:	e8 34 23 00 00       	call   3c2c <fork>
    18f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    18fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18ff:	79 19                	jns    191a <concreate+0x294>
      printf(1, "fork failed\n");
    1901:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
    1908:	00 
    1909:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1910:	e8 9e 24 00 00       	call   3db3 <printf>
      exit();
    1915:	e8 1a 23 00 00       	call   3c34 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    191a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    191d:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1922:	89 c8                	mov    %ecx,%eax
    1924:	f7 ea                	imul   %edx
    1926:	89 c8                	mov    %ecx,%eax
    1928:	c1 f8 1f             	sar    $0x1f,%eax
    192b:	29 c2                	sub    %eax,%edx
    192d:	89 d0                	mov    %edx,%eax
    192f:	01 c0                	add    %eax,%eax
    1931:	01 d0                	add    %edx,%eax
    1933:	89 ca                	mov    %ecx,%edx
    1935:	29 c2                	sub    %eax,%edx
    1937:	85 d2                	test   %edx,%edx
    1939:	75 06                	jne    1941 <concreate+0x2bb>
    193b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    193f:	74 28                	je     1969 <concreate+0x2e3>
       ((i % 3) == 1 && pid != 0)){
    1941:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1944:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1949:	89 c8                	mov    %ecx,%eax
    194b:	f7 ea                	imul   %edx
    194d:	89 c8                	mov    %ecx,%eax
    194f:	c1 f8 1f             	sar    $0x1f,%eax
    1952:	29 c2                	sub    %eax,%edx
    1954:	89 d0                	mov    %edx,%eax
    1956:	01 c0                	add    %eax,%eax
    1958:	01 d0                	add    %edx,%eax
    195a:	89 ca                	mov    %ecx,%edx
    195c:	29 c2                	sub    %eax,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    195e:	83 fa 01             	cmp    $0x1,%edx
    1961:	75 74                	jne    19d7 <concreate+0x351>
       ((i % 3) == 1 && pid != 0)){
    1963:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1967:	74 6e                	je     19d7 <concreate+0x351>
      close(open(file, 0));
    1969:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1970:	00 
    1971:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1974:	89 04 24             	mov    %eax,(%esp)
    1977:	e8 f8 22 00 00       	call   3c74 <open>
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 d8 22 00 00       	call   3c5c <close>
      close(open(file, 0));
    1984:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    198b:	00 
    198c:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    198f:	89 04 24             	mov    %eax,(%esp)
    1992:	e8 dd 22 00 00       	call   3c74 <open>
    1997:	89 04 24             	mov    %eax,(%esp)
    199a:	e8 bd 22 00 00       	call   3c5c <close>
      close(open(file, 0));
    199f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19a6:	00 
    19a7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19aa:	89 04 24             	mov    %eax,(%esp)
    19ad:	e8 c2 22 00 00       	call   3c74 <open>
    19b2:	89 04 24             	mov    %eax,(%esp)
    19b5:	e8 a2 22 00 00       	call   3c5c <close>
      close(open(file, 0));
    19ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19c1:	00 
    19c2:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19c5:	89 04 24             	mov    %eax,(%esp)
    19c8:	e8 a7 22 00 00       	call   3c74 <open>
    19cd:	89 04 24             	mov    %eax,(%esp)
    19d0:	e8 87 22 00 00       	call   3c5c <close>
    19d5:	eb 2c                	jmp    1a03 <concreate+0x37d>
    } else {
      unlink(file);
    19d7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19da:	89 04 24             	mov    %eax,(%esp)
    19dd:	e8 a2 22 00 00       	call   3c84 <unlink>
      unlink(file);
    19e2:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19e5:	89 04 24             	mov    %eax,(%esp)
    19e8:	e8 97 22 00 00       	call   3c84 <unlink>
      unlink(file);
    19ed:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19f0:	89 04 24             	mov    %eax,(%esp)
    19f3:	e8 8c 22 00 00       	call   3c84 <unlink>
      unlink(file);
    19f8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19fb:	89 04 24             	mov    %eax,(%esp)
    19fe:	e8 81 22 00 00       	call   3c84 <unlink>
    }
    if(pid == 0)
    1a03:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a07:	75 05                	jne    1a0e <concreate+0x388>
      exit();
    1a09:	e8 26 22 00 00       	call   3c34 <exit>
    else
      wait();
    1a0e:	e8 29 22 00 00       	call   3c3c <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1a13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1a17:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1a1b:	0f 8e c9 fe ff ff    	jle    18ea <concreate+0x264>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a21:	c7 44 24 04 ad 49 00 	movl   $0x49ad,0x4(%esp)
    1a28:	00 
    1a29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a30:	e8 7e 23 00 00       	call   3db3 <printf>
}
    1a35:	c9                   	leave  
    1a36:	c3                   	ret    

00001a37 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1a37:	55                   	push   %ebp
    1a38:	89 e5                	mov    %esp,%ebp
    1a3a:	83 ec 28             	sub    $0x28,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1a3d:	c7 44 24 04 bb 49 00 	movl   $0x49bb,0x4(%esp)
    1a44:	00 
    1a45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a4c:	e8 62 23 00 00       	call   3db3 <printf>

  unlink("x");
    1a51:	c7 04 24 22 45 00 00 	movl   $0x4522,(%esp)
    1a58:	e8 27 22 00 00       	call   3c84 <unlink>
  pid = fork();
    1a5d:	e8 ca 21 00 00       	call   3c2c <fork>
    1a62:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1a65:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a69:	79 19                	jns    1a84 <linkunlink+0x4d>
    printf(1, "fork failed\n");
    1a6b:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
    1a72:	00 
    1a73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a7a:	e8 34 23 00 00       	call   3db3 <printf>
    exit();
    1a7f:	e8 b0 21 00 00       	call   3c34 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1a84:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a88:	74 07                	je     1a91 <linkunlink+0x5a>
    1a8a:	b8 01 00 00 00       	mov    $0x1,%eax
    1a8f:	eb 05                	jmp    1a96 <linkunlink+0x5f>
    1a91:	b8 61 00 00 00       	mov    $0x61,%eax
    1a96:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1a99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1aa0:	e9 8e 00 00 00       	jmp    1b33 <linkunlink+0xfc>
    x = x * 1103515245 + 12345;
    1aa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aa8:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1aae:	05 39 30 00 00       	add    $0x3039,%eax
    1ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1ab6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1ab9:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1abe:	89 c8                	mov    %ecx,%eax
    1ac0:	f7 e2                	mul    %edx
    1ac2:	d1 ea                	shr    %edx
    1ac4:	89 d0                	mov    %edx,%eax
    1ac6:	01 c0                	add    %eax,%eax
    1ac8:	01 d0                	add    %edx,%eax
    1aca:	89 ca                	mov    %ecx,%edx
    1acc:	29 c2                	sub    %eax,%edx
    1ace:	85 d2                	test   %edx,%edx
    1ad0:	75 1e                	jne    1af0 <linkunlink+0xb9>
      close(open("x", O_RDWR | O_CREATE));
    1ad2:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1ad9:	00 
    1ada:	c7 04 24 22 45 00 00 	movl   $0x4522,(%esp)
    1ae1:	e8 8e 21 00 00       	call   3c74 <open>
    1ae6:	89 04 24             	mov    %eax,(%esp)
    1ae9:	e8 6e 21 00 00       	call   3c5c <close>
    1aee:	eb 3f                	jmp    1b2f <linkunlink+0xf8>
    } else if((x % 3) == 1){
    1af0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1af3:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1af8:	89 c8                	mov    %ecx,%eax
    1afa:	f7 e2                	mul    %edx
    1afc:	d1 ea                	shr    %edx
    1afe:	89 d0                	mov    %edx,%eax
    1b00:	01 c0                	add    %eax,%eax
    1b02:	01 d0                	add    %edx,%eax
    1b04:	89 ca                	mov    %ecx,%edx
    1b06:	29 c2                	sub    %eax,%edx
    1b08:	83 fa 01             	cmp    $0x1,%edx
    1b0b:	75 16                	jne    1b23 <linkunlink+0xec>
      link("cat", "x");
    1b0d:	c7 44 24 04 22 45 00 	movl   $0x4522,0x4(%esp)
    1b14:	00 
    1b15:	c7 04 24 cc 49 00 00 	movl   $0x49cc,(%esp)
    1b1c:	e8 73 21 00 00       	call   3c94 <link>
    1b21:	eb 0c                	jmp    1b2f <linkunlink+0xf8>
    } else {
      unlink("x");
    1b23:	c7 04 24 22 45 00 00 	movl   $0x4522,(%esp)
    1b2a:	e8 55 21 00 00       	call   3c84 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b2f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b33:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1b37:	0f 8e 68 ff ff ff    	jle    1aa5 <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b3d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b41:	74 1b                	je     1b5e <linkunlink+0x127>
    wait();
    1b43:	e8 f4 20 00 00       	call   3c3c <wait>
  else 
    exit();

  printf(1, "linkunlink ok\n");
    1b48:	c7 44 24 04 d0 49 00 	movl   $0x49d0,0x4(%esp)
    1b4f:	00 
    1b50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b57:	e8 57 22 00 00       	call   3db3 <printf>
}
    1b5c:	c9                   	leave  
    1b5d:	c3                   	ret    
  }

  if(pid)
    wait();
  else 
    exit();
    1b5e:	e8 d1 20 00 00       	call   3c34 <exit>

00001b63 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1b63:	55                   	push   %ebp
    1b64:	89 e5                	mov    %esp,%ebp
    1b66:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1b69:	c7 44 24 04 df 49 00 	movl   $0x49df,0x4(%esp)
    1b70:	00 
    1b71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b78:	e8 36 22 00 00       	call   3db3 <printf>
  unlink("bd");
    1b7d:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
    1b84:	e8 fb 20 00 00       	call   3c84 <unlink>

  fd = open("bd", O_CREATE);
    1b89:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1b90:	00 
    1b91:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
    1b98:	e8 d7 20 00 00       	call   3c74 <open>
    1b9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1ba0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ba4:	79 19                	jns    1bbf <bigdir+0x5c>
    printf(1, "bigdir create failed\n");
    1ba6:	c7 44 24 04 ef 49 00 	movl   $0x49ef,0x4(%esp)
    1bad:	00 
    1bae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bb5:	e8 f9 21 00 00       	call   3db3 <printf>
    exit();
    1bba:	e8 75 20 00 00       	call   3c34 <exit>
  }
  close(fd);
    1bbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bc2:	89 04 24             	mov    %eax,(%esp)
    1bc5:	e8 92 20 00 00       	call   3c5c <close>

  for(i = 0; i < 500; i++){
    1bca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1bd1:	eb 68                	jmp    1c3b <bigdir+0xd8>
    name[0] = 'x';
    1bd3:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bda:	8d 50 3f             	lea    0x3f(%eax),%edx
    1bdd:	85 c0                	test   %eax,%eax
    1bdf:	0f 48 c2             	cmovs  %edx,%eax
    1be2:	c1 f8 06             	sar    $0x6,%eax
    1be5:	83 c0 30             	add    $0x30,%eax
    1be8:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1beb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bee:	89 c2                	mov    %eax,%edx
    1bf0:	c1 fa 1f             	sar    $0x1f,%edx
    1bf3:	c1 ea 1a             	shr    $0x1a,%edx
    1bf6:	01 d0                	add    %edx,%eax
    1bf8:	83 e0 3f             	and    $0x3f,%eax
    1bfb:	29 d0                	sub    %edx,%eax
    1bfd:	83 c0 30             	add    $0x30,%eax
    1c00:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c03:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1c07:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c0e:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
    1c15:	e8 7a 20 00 00       	call   3c94 <link>
    1c1a:	85 c0                	test   %eax,%eax
    1c1c:	74 19                	je     1c37 <bigdir+0xd4>
      printf(1, "bigdir link failed\n");
    1c1e:	c7 44 24 04 05 4a 00 	movl   $0x4a05,0x4(%esp)
    1c25:	00 
    1c26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c2d:	e8 81 21 00 00       	call   3db3 <printf>
      exit();
    1c32:	e8 fd 1f 00 00       	call   3c34 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c3b:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1c42:	7e 8f                	jle    1bd3 <bigdir+0x70>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c44:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
    1c4b:	e8 34 20 00 00       	call   3c84 <unlink>
  for(i = 0; i < 500; i++){
    1c50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c57:	eb 60                	jmp    1cb9 <bigdir+0x156>
    name[0] = 'x';
    1c59:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c60:	8d 50 3f             	lea    0x3f(%eax),%edx
    1c63:	85 c0                	test   %eax,%eax
    1c65:	0f 48 c2             	cmovs  %edx,%eax
    1c68:	c1 f8 06             	sar    $0x6,%eax
    1c6b:	83 c0 30             	add    $0x30,%eax
    1c6e:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1c71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c74:	89 c2                	mov    %eax,%edx
    1c76:	c1 fa 1f             	sar    $0x1f,%edx
    1c79:	c1 ea 1a             	shr    $0x1a,%edx
    1c7c:	01 d0                	add    %edx,%eax
    1c7e:	83 e0 3f             	and    $0x3f,%eax
    1c81:	29 d0                	sub    %edx,%eax
    1c83:	83 c0 30             	add    $0x30,%eax
    1c86:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c89:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1c8d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c90:	89 04 24             	mov    %eax,(%esp)
    1c93:	e8 ec 1f 00 00       	call   3c84 <unlink>
    1c98:	85 c0                	test   %eax,%eax
    1c9a:	74 19                	je     1cb5 <bigdir+0x152>
      printf(1, "bigdir unlink failed");
    1c9c:	c7 44 24 04 19 4a 00 	movl   $0x4a19,0x4(%esp)
    1ca3:	00 
    1ca4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cab:	e8 03 21 00 00       	call   3db3 <printf>
      exit();
    1cb0:	e8 7f 1f 00 00       	call   3c34 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1cb9:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1cc0:	7e 97                	jle    1c59 <bigdir+0xf6>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cc2:	c7 44 24 04 2e 4a 00 	movl   $0x4a2e,0x4(%esp)
    1cc9:	00 
    1cca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cd1:	e8 dd 20 00 00       	call   3db3 <printf>
}
    1cd6:	c9                   	leave  
    1cd7:	c3                   	ret    

00001cd8 <subdir>:

void
subdir(void)
{
    1cd8:	55                   	push   %ebp
    1cd9:	89 e5                	mov    %esp,%ebp
    1cdb:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1cde:	c7 44 24 04 39 4a 00 	movl   $0x4a39,0x4(%esp)
    1ce5:	00 
    1ce6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ced:	e8 c1 20 00 00       	call   3db3 <printf>

  unlink("ff");
    1cf2:	c7 04 24 46 4a 00 00 	movl   $0x4a46,(%esp)
    1cf9:	e8 86 1f 00 00       	call   3c84 <unlink>
  if(mkdir("dd") != 0){
    1cfe:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    1d05:	e8 92 1f 00 00       	call   3c9c <mkdir>
    1d0a:	85 c0                	test   %eax,%eax
    1d0c:	74 19                	je     1d27 <subdir+0x4f>
    printf(1, "subdir mkdir dd failed\n");
    1d0e:	c7 44 24 04 4c 4a 00 	movl   $0x4a4c,0x4(%esp)
    1d15:	00 
    1d16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d1d:	e8 91 20 00 00       	call   3db3 <printf>
    exit();
    1d22:	e8 0d 1f 00 00       	call   3c34 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d27:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1d2e:	00 
    1d2f:	c7 04 24 64 4a 00 00 	movl   $0x4a64,(%esp)
    1d36:	e8 39 1f 00 00       	call   3c74 <open>
    1d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1d3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d42:	79 19                	jns    1d5d <subdir+0x85>
    printf(1, "create dd/ff failed\n");
    1d44:	c7 44 24 04 6a 4a 00 	movl   $0x4a6a,0x4(%esp)
    1d4b:	00 
    1d4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d53:	e8 5b 20 00 00       	call   3db3 <printf>
    exit();
    1d58:	e8 d7 1e 00 00       	call   3c34 <exit>
  }
  write(fd, "ff", 2);
    1d5d:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1d64:	00 
    1d65:	c7 44 24 04 46 4a 00 	movl   $0x4a46,0x4(%esp)
    1d6c:	00 
    1d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d70:	89 04 24             	mov    %eax,(%esp)
    1d73:	e8 dc 1e 00 00       	call   3c54 <write>
  close(fd);
    1d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d7b:	89 04 24             	mov    %eax,(%esp)
    1d7e:	e8 d9 1e 00 00       	call   3c5c <close>
  
  if(unlink("dd") >= 0){
    1d83:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    1d8a:	e8 f5 1e 00 00       	call   3c84 <unlink>
    1d8f:	85 c0                	test   %eax,%eax
    1d91:	78 19                	js     1dac <subdir+0xd4>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1d93:	c7 44 24 04 80 4a 00 	movl   $0x4a80,0x4(%esp)
    1d9a:	00 
    1d9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1da2:	e8 0c 20 00 00       	call   3db3 <printf>
    exit();
    1da7:	e8 88 1e 00 00       	call   3c34 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    1dac:	c7 04 24 a6 4a 00 00 	movl   $0x4aa6,(%esp)
    1db3:	e8 e4 1e 00 00       	call   3c9c <mkdir>
    1db8:	85 c0                	test   %eax,%eax
    1dba:	74 19                	je     1dd5 <subdir+0xfd>
    printf(1, "subdir mkdir dd/dd failed\n");
    1dbc:	c7 44 24 04 ad 4a 00 	movl   $0x4aad,0x4(%esp)
    1dc3:	00 
    1dc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dcb:	e8 e3 1f 00 00       	call   3db3 <printf>
    exit();
    1dd0:	e8 5f 1e 00 00       	call   3c34 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dd5:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1ddc:	00 
    1ddd:	c7 04 24 c8 4a 00 00 	movl   $0x4ac8,(%esp)
    1de4:	e8 8b 1e 00 00       	call   3c74 <open>
    1de9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1dec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1df0:	79 19                	jns    1e0b <subdir+0x133>
    printf(1, "create dd/dd/ff failed\n");
    1df2:	c7 44 24 04 d1 4a 00 	movl   $0x4ad1,0x4(%esp)
    1df9:	00 
    1dfa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e01:	e8 ad 1f 00 00       	call   3db3 <printf>
    exit();
    1e06:	e8 29 1e 00 00       	call   3c34 <exit>
  }
  write(fd, "FF", 2);
    1e0b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1e12:	00 
    1e13:	c7 44 24 04 e9 4a 00 	movl   $0x4ae9,0x4(%esp)
    1e1a:	00 
    1e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e1e:	89 04 24             	mov    %eax,(%esp)
    1e21:	e8 2e 1e 00 00       	call   3c54 <write>
  close(fd);
    1e26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e29:	89 04 24             	mov    %eax,(%esp)
    1e2c:	e8 2b 1e 00 00       	call   3c5c <close>

  fd = open("dd/dd/../ff", 0);
    1e31:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e38:	00 
    1e39:	c7 04 24 ec 4a 00 00 	movl   $0x4aec,(%esp)
    1e40:	e8 2f 1e 00 00       	call   3c74 <open>
    1e45:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1e48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e4c:	79 19                	jns    1e67 <subdir+0x18f>
    printf(1, "open dd/dd/../ff failed\n");
    1e4e:	c7 44 24 04 f8 4a 00 	movl   $0x4af8,0x4(%esp)
    1e55:	00 
    1e56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e5d:	e8 51 1f 00 00       	call   3db3 <printf>
    exit();
    1e62:	e8 cd 1d 00 00       	call   3c34 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    1e67:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1e6e:	00 
    1e6f:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    1e76:	00 
    1e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e7a:	89 04 24             	mov    %eax,(%esp)
    1e7d:	e8 ca 1d 00 00       	call   3c4c <read>
    1e82:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    1e85:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1e89:	75 0b                	jne    1e96 <subdir+0x1be>
    1e8b:	0f b6 05 40 80 00 00 	movzbl 0x8040,%eax
    1e92:	3c 66                	cmp    $0x66,%al
    1e94:	74 19                	je     1eaf <subdir+0x1d7>
    printf(1, "dd/dd/../ff wrong content\n");
    1e96:	c7 44 24 04 11 4b 00 	movl   $0x4b11,0x4(%esp)
    1e9d:	00 
    1e9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ea5:	e8 09 1f 00 00       	call   3db3 <printf>
    exit();
    1eaa:	e8 85 1d 00 00       	call   3c34 <exit>
  }
  close(fd);
    1eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb2:	89 04 24             	mov    %eax,(%esp)
    1eb5:	e8 a2 1d 00 00       	call   3c5c <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1eba:	c7 44 24 04 2c 4b 00 	movl   $0x4b2c,0x4(%esp)
    1ec1:	00 
    1ec2:	c7 04 24 c8 4a 00 00 	movl   $0x4ac8,(%esp)
    1ec9:	e8 c6 1d 00 00       	call   3c94 <link>
    1ece:	85 c0                	test   %eax,%eax
    1ed0:	74 19                	je     1eeb <subdir+0x213>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1ed2:	c7 44 24 04 38 4b 00 	movl   $0x4b38,0x4(%esp)
    1ed9:	00 
    1eda:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ee1:	e8 cd 1e 00 00       	call   3db3 <printf>
    exit();
    1ee6:	e8 49 1d 00 00       	call   3c34 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    1eeb:	c7 04 24 c8 4a 00 00 	movl   $0x4ac8,(%esp)
    1ef2:	e8 8d 1d 00 00       	call   3c84 <unlink>
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	74 19                	je     1f14 <subdir+0x23c>
    printf(1, "unlink dd/dd/ff failed\n");
    1efb:	c7 44 24 04 59 4b 00 	movl   $0x4b59,0x4(%esp)
    1f02:	00 
    1f03:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f0a:	e8 a4 1e 00 00       	call   3db3 <printf>
    exit();
    1f0f:	e8 20 1d 00 00       	call   3c34 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f14:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f1b:	00 
    1f1c:	c7 04 24 c8 4a 00 00 	movl   $0x4ac8,(%esp)
    1f23:	e8 4c 1d 00 00       	call   3c74 <open>
    1f28:	85 c0                	test   %eax,%eax
    1f2a:	78 19                	js     1f45 <subdir+0x26d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1f2c:	c7 44 24 04 74 4b 00 	movl   $0x4b74,0x4(%esp)
    1f33:	00 
    1f34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f3b:	e8 73 1e 00 00       	call   3db3 <printf>
    exit();
    1f40:	e8 ef 1c 00 00       	call   3c34 <exit>
  }

  if(chdir("dd") != 0){
    1f45:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    1f4c:	e8 53 1d 00 00       	call   3ca4 <chdir>
    1f51:	85 c0                	test   %eax,%eax
    1f53:	74 19                	je     1f6e <subdir+0x296>
    printf(1, "chdir dd failed\n");
    1f55:	c7 44 24 04 98 4b 00 	movl   $0x4b98,0x4(%esp)
    1f5c:	00 
    1f5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f64:	e8 4a 1e 00 00       	call   3db3 <printf>
    exit();
    1f69:	e8 c6 1c 00 00       	call   3c34 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    1f6e:	c7 04 24 a9 4b 00 00 	movl   $0x4ba9,(%esp)
    1f75:	e8 2a 1d 00 00       	call   3ca4 <chdir>
    1f7a:	85 c0                	test   %eax,%eax
    1f7c:	74 19                	je     1f97 <subdir+0x2bf>
    printf(1, "chdir dd/../../dd failed\n");
    1f7e:	c7 44 24 04 b5 4b 00 	movl   $0x4bb5,0x4(%esp)
    1f85:	00 
    1f86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f8d:	e8 21 1e 00 00       	call   3db3 <printf>
    exit();
    1f92:	e8 9d 1c 00 00       	call   3c34 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    1f97:	c7 04 24 cf 4b 00 00 	movl   $0x4bcf,(%esp)
    1f9e:	e8 01 1d 00 00       	call   3ca4 <chdir>
    1fa3:	85 c0                	test   %eax,%eax
    1fa5:	74 19                	je     1fc0 <subdir+0x2e8>
    printf(1, "chdir dd/../../dd failed\n");
    1fa7:	c7 44 24 04 b5 4b 00 	movl   $0x4bb5,0x4(%esp)
    1fae:	00 
    1faf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fb6:	e8 f8 1d 00 00       	call   3db3 <printf>
    exit();
    1fbb:	e8 74 1c 00 00       	call   3c34 <exit>
  }
  if(chdir("./..") != 0){
    1fc0:	c7 04 24 de 4b 00 00 	movl   $0x4bde,(%esp)
    1fc7:	e8 d8 1c 00 00       	call   3ca4 <chdir>
    1fcc:	85 c0                	test   %eax,%eax
    1fce:	74 19                	je     1fe9 <subdir+0x311>
    printf(1, "chdir ./.. failed\n");
    1fd0:	c7 44 24 04 e3 4b 00 	movl   $0x4be3,0x4(%esp)
    1fd7:	00 
    1fd8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fdf:	e8 cf 1d 00 00       	call   3db3 <printf>
    exit();
    1fe4:	e8 4b 1c 00 00       	call   3c34 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    1fe9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ff0:	00 
    1ff1:	c7 04 24 2c 4b 00 00 	movl   $0x4b2c,(%esp)
    1ff8:	e8 77 1c 00 00       	call   3c74 <open>
    1ffd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2000:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2004:	79 19                	jns    201f <subdir+0x347>
    printf(1, "open dd/dd/ffff failed\n");
    2006:	c7 44 24 04 f6 4b 00 	movl   $0x4bf6,0x4(%esp)
    200d:	00 
    200e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2015:	e8 99 1d 00 00       	call   3db3 <printf>
    exit();
    201a:	e8 15 1c 00 00       	call   3c34 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    201f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2026:	00 
    2027:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    202e:	00 
    202f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2032:	89 04 24             	mov    %eax,(%esp)
    2035:	e8 12 1c 00 00       	call   3c4c <read>
    203a:	83 f8 02             	cmp    $0x2,%eax
    203d:	74 19                	je     2058 <subdir+0x380>
    printf(1, "read dd/dd/ffff wrong len\n");
    203f:	c7 44 24 04 0e 4c 00 	movl   $0x4c0e,0x4(%esp)
    2046:	00 
    2047:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    204e:	e8 60 1d 00 00       	call   3db3 <printf>
    exit();
    2053:	e8 dc 1b 00 00       	call   3c34 <exit>
  }
  close(fd);
    2058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    205b:	89 04 24             	mov    %eax,(%esp)
    205e:	e8 f9 1b 00 00       	call   3c5c <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2063:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    206a:	00 
    206b:	c7 04 24 c8 4a 00 00 	movl   $0x4ac8,(%esp)
    2072:	e8 fd 1b 00 00       	call   3c74 <open>
    2077:	85 c0                	test   %eax,%eax
    2079:	78 19                	js     2094 <subdir+0x3bc>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    207b:	c7 44 24 04 2c 4c 00 	movl   $0x4c2c,0x4(%esp)
    2082:	00 
    2083:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    208a:	e8 24 1d 00 00       	call   3db3 <printf>
    exit();
    208f:	e8 a0 1b 00 00       	call   3c34 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2094:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    209b:	00 
    209c:	c7 04 24 51 4c 00 00 	movl   $0x4c51,(%esp)
    20a3:	e8 cc 1b 00 00       	call   3c74 <open>
    20a8:	85 c0                	test   %eax,%eax
    20aa:	78 19                	js     20c5 <subdir+0x3ed>
    printf(1, "create dd/ff/ff succeeded!\n");
    20ac:	c7 44 24 04 5a 4c 00 	movl   $0x4c5a,0x4(%esp)
    20b3:	00 
    20b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20bb:	e8 f3 1c 00 00       	call   3db3 <printf>
    exit();
    20c0:	e8 6f 1b 00 00       	call   3c34 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    20c5:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    20cc:	00 
    20cd:	c7 04 24 76 4c 00 00 	movl   $0x4c76,(%esp)
    20d4:	e8 9b 1b 00 00       	call   3c74 <open>
    20d9:	85 c0                	test   %eax,%eax
    20db:	78 19                	js     20f6 <subdir+0x41e>
    printf(1, "create dd/xx/ff succeeded!\n");
    20dd:	c7 44 24 04 7f 4c 00 	movl   $0x4c7f,0x4(%esp)
    20e4:	00 
    20e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20ec:	e8 c2 1c 00 00       	call   3db3 <printf>
    exit();
    20f1:	e8 3e 1b 00 00       	call   3c34 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    20f6:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    20fd:	00 
    20fe:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    2105:	e8 6a 1b 00 00       	call   3c74 <open>
    210a:	85 c0                	test   %eax,%eax
    210c:	78 19                	js     2127 <subdir+0x44f>
    printf(1, "create dd succeeded!\n");
    210e:	c7 44 24 04 9b 4c 00 	movl   $0x4c9b,0x4(%esp)
    2115:	00 
    2116:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    211d:	e8 91 1c 00 00       	call   3db3 <printf>
    exit();
    2122:	e8 0d 1b 00 00       	call   3c34 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    2127:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    212e:	00 
    212f:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    2136:	e8 39 1b 00 00       	call   3c74 <open>
    213b:	85 c0                	test   %eax,%eax
    213d:	78 19                	js     2158 <subdir+0x480>
    printf(1, "open dd rdwr succeeded!\n");
    213f:	c7 44 24 04 b1 4c 00 	movl   $0x4cb1,0x4(%esp)
    2146:	00 
    2147:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    214e:	e8 60 1c 00 00       	call   3db3 <printf>
    exit();
    2153:	e8 dc 1a 00 00       	call   3c34 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    2158:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    215f:	00 
    2160:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    2167:	e8 08 1b 00 00       	call   3c74 <open>
    216c:	85 c0                	test   %eax,%eax
    216e:	78 19                	js     2189 <subdir+0x4b1>
    printf(1, "open dd wronly succeeded!\n");
    2170:	c7 44 24 04 ca 4c 00 	movl   $0x4cca,0x4(%esp)
    2177:	00 
    2178:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    217f:	e8 2f 1c 00 00       	call   3db3 <printf>
    exit();
    2184:	e8 ab 1a 00 00       	call   3c34 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2189:	c7 44 24 04 e5 4c 00 	movl   $0x4ce5,0x4(%esp)
    2190:	00 
    2191:	c7 04 24 51 4c 00 00 	movl   $0x4c51,(%esp)
    2198:	e8 f7 1a 00 00       	call   3c94 <link>
    219d:	85 c0                	test   %eax,%eax
    219f:	75 19                	jne    21ba <subdir+0x4e2>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    21a1:	c7 44 24 04 f0 4c 00 	movl   $0x4cf0,0x4(%esp)
    21a8:	00 
    21a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21b0:	e8 fe 1b 00 00       	call   3db3 <printf>
    exit();
    21b5:	e8 7a 1a 00 00       	call   3c34 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    21ba:	c7 44 24 04 e5 4c 00 	movl   $0x4ce5,0x4(%esp)
    21c1:	00 
    21c2:	c7 04 24 76 4c 00 00 	movl   $0x4c76,(%esp)
    21c9:	e8 c6 1a 00 00       	call   3c94 <link>
    21ce:	85 c0                	test   %eax,%eax
    21d0:	75 19                	jne    21eb <subdir+0x513>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    21d2:	c7 44 24 04 14 4d 00 	movl   $0x4d14,0x4(%esp)
    21d9:	00 
    21da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21e1:	e8 cd 1b 00 00       	call   3db3 <printf>
    exit();
    21e6:	e8 49 1a 00 00       	call   3c34 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    21eb:	c7 44 24 04 2c 4b 00 	movl   $0x4b2c,0x4(%esp)
    21f2:	00 
    21f3:	c7 04 24 64 4a 00 00 	movl   $0x4a64,(%esp)
    21fa:	e8 95 1a 00 00       	call   3c94 <link>
    21ff:	85 c0                	test   %eax,%eax
    2201:	75 19                	jne    221c <subdir+0x544>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2203:	c7 44 24 04 38 4d 00 	movl   $0x4d38,0x4(%esp)
    220a:	00 
    220b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2212:	e8 9c 1b 00 00       	call   3db3 <printf>
    exit();
    2217:	e8 18 1a 00 00       	call   3c34 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    221c:	c7 04 24 51 4c 00 00 	movl   $0x4c51,(%esp)
    2223:	e8 74 1a 00 00       	call   3c9c <mkdir>
    2228:	85 c0                	test   %eax,%eax
    222a:	75 19                	jne    2245 <subdir+0x56d>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    222c:	c7 44 24 04 5a 4d 00 	movl   $0x4d5a,0x4(%esp)
    2233:	00 
    2234:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    223b:	e8 73 1b 00 00       	call   3db3 <printf>
    exit();
    2240:	e8 ef 19 00 00       	call   3c34 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    2245:	c7 04 24 76 4c 00 00 	movl   $0x4c76,(%esp)
    224c:	e8 4b 1a 00 00       	call   3c9c <mkdir>
    2251:	85 c0                	test   %eax,%eax
    2253:	75 19                	jne    226e <subdir+0x596>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2255:	c7 44 24 04 75 4d 00 	movl   $0x4d75,0x4(%esp)
    225c:	00 
    225d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2264:	e8 4a 1b 00 00       	call   3db3 <printf>
    exit();
    2269:	e8 c6 19 00 00       	call   3c34 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    226e:	c7 04 24 2c 4b 00 00 	movl   $0x4b2c,(%esp)
    2275:	e8 22 1a 00 00       	call   3c9c <mkdir>
    227a:	85 c0                	test   %eax,%eax
    227c:	75 19                	jne    2297 <subdir+0x5bf>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    227e:	c7 44 24 04 90 4d 00 	movl   $0x4d90,0x4(%esp)
    2285:	00 
    2286:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    228d:	e8 21 1b 00 00       	call   3db3 <printf>
    exit();
    2292:	e8 9d 19 00 00       	call   3c34 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    2297:	c7 04 24 76 4c 00 00 	movl   $0x4c76,(%esp)
    229e:	e8 e1 19 00 00       	call   3c84 <unlink>
    22a3:	85 c0                	test   %eax,%eax
    22a5:	75 19                	jne    22c0 <subdir+0x5e8>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    22a7:	c7 44 24 04 ad 4d 00 	movl   $0x4dad,0x4(%esp)
    22ae:	00 
    22af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22b6:	e8 f8 1a 00 00       	call   3db3 <printf>
    exit();
    22bb:	e8 74 19 00 00       	call   3c34 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    22c0:	c7 04 24 51 4c 00 00 	movl   $0x4c51,(%esp)
    22c7:	e8 b8 19 00 00       	call   3c84 <unlink>
    22cc:	85 c0                	test   %eax,%eax
    22ce:	75 19                	jne    22e9 <subdir+0x611>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    22d0:	c7 44 24 04 c9 4d 00 	movl   $0x4dc9,0x4(%esp)
    22d7:	00 
    22d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22df:	e8 cf 1a 00 00       	call   3db3 <printf>
    exit();
    22e4:	e8 4b 19 00 00       	call   3c34 <exit>
  }
  if(chdir("dd/ff") == 0){
    22e9:	c7 04 24 64 4a 00 00 	movl   $0x4a64,(%esp)
    22f0:	e8 af 19 00 00       	call   3ca4 <chdir>
    22f5:	85 c0                	test   %eax,%eax
    22f7:	75 19                	jne    2312 <subdir+0x63a>
    printf(1, "chdir dd/ff succeeded!\n");
    22f9:	c7 44 24 04 e5 4d 00 	movl   $0x4de5,0x4(%esp)
    2300:	00 
    2301:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2308:	e8 a6 1a 00 00       	call   3db3 <printf>
    exit();
    230d:	e8 22 19 00 00       	call   3c34 <exit>
  }
  if(chdir("dd/xx") == 0){
    2312:	c7 04 24 fd 4d 00 00 	movl   $0x4dfd,(%esp)
    2319:	e8 86 19 00 00       	call   3ca4 <chdir>
    231e:	85 c0                	test   %eax,%eax
    2320:	75 19                	jne    233b <subdir+0x663>
    printf(1, "chdir dd/xx succeeded!\n");
    2322:	c7 44 24 04 03 4e 00 	movl   $0x4e03,0x4(%esp)
    2329:	00 
    232a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2331:	e8 7d 1a 00 00       	call   3db3 <printf>
    exit();
    2336:	e8 f9 18 00 00       	call   3c34 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    233b:	c7 04 24 2c 4b 00 00 	movl   $0x4b2c,(%esp)
    2342:	e8 3d 19 00 00       	call   3c84 <unlink>
    2347:	85 c0                	test   %eax,%eax
    2349:	74 19                	je     2364 <subdir+0x68c>
    printf(1, "unlink dd/dd/ff failed\n");
    234b:	c7 44 24 04 59 4b 00 	movl   $0x4b59,0x4(%esp)
    2352:	00 
    2353:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    235a:	e8 54 1a 00 00       	call   3db3 <printf>
    exit();
    235f:	e8 d0 18 00 00       	call   3c34 <exit>
  }
  if(unlink("dd/ff") != 0){
    2364:	c7 04 24 64 4a 00 00 	movl   $0x4a64,(%esp)
    236b:	e8 14 19 00 00       	call   3c84 <unlink>
    2370:	85 c0                	test   %eax,%eax
    2372:	74 19                	je     238d <subdir+0x6b5>
    printf(1, "unlink dd/ff failed\n");
    2374:	c7 44 24 04 1b 4e 00 	movl   $0x4e1b,0x4(%esp)
    237b:	00 
    237c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2383:	e8 2b 1a 00 00       	call   3db3 <printf>
    exit();
    2388:	e8 a7 18 00 00       	call   3c34 <exit>
  }
  if(unlink("dd") == 0){
    238d:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    2394:	e8 eb 18 00 00       	call   3c84 <unlink>
    2399:	85 c0                	test   %eax,%eax
    239b:	75 19                	jne    23b6 <subdir+0x6de>
    printf(1, "unlink non-empty dd succeeded!\n");
    239d:	c7 44 24 04 30 4e 00 	movl   $0x4e30,0x4(%esp)
    23a4:	00 
    23a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ac:	e8 02 1a 00 00       	call   3db3 <printf>
    exit();
    23b1:	e8 7e 18 00 00       	call   3c34 <exit>
  }
  if(unlink("dd/dd") < 0){
    23b6:	c7 04 24 50 4e 00 00 	movl   $0x4e50,(%esp)
    23bd:	e8 c2 18 00 00       	call   3c84 <unlink>
    23c2:	85 c0                	test   %eax,%eax
    23c4:	79 19                	jns    23df <subdir+0x707>
    printf(1, "unlink dd/dd failed\n");
    23c6:	c7 44 24 04 56 4e 00 	movl   $0x4e56,0x4(%esp)
    23cd:	00 
    23ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23d5:	e8 d9 19 00 00       	call   3db3 <printf>
    exit();
    23da:	e8 55 18 00 00       	call   3c34 <exit>
  }
  if(unlink("dd") < 0){
    23df:	c7 04 24 49 4a 00 00 	movl   $0x4a49,(%esp)
    23e6:	e8 99 18 00 00       	call   3c84 <unlink>
    23eb:	85 c0                	test   %eax,%eax
    23ed:	79 19                	jns    2408 <subdir+0x730>
    printf(1, "unlink dd failed\n");
    23ef:	c7 44 24 04 6b 4e 00 	movl   $0x4e6b,0x4(%esp)
    23f6:	00 
    23f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23fe:	e8 b0 19 00 00       	call   3db3 <printf>
    exit();
    2403:	e8 2c 18 00 00       	call   3c34 <exit>
  }

  printf(1, "subdir ok\n");
    2408:	c7 44 24 04 7d 4e 00 	movl   $0x4e7d,0x4(%esp)
    240f:	00 
    2410:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2417:	e8 97 19 00 00       	call   3db3 <printf>
}
    241c:	c9                   	leave  
    241d:	c3                   	ret    

0000241e <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    241e:	55                   	push   %ebp
    241f:	89 e5                	mov    %esp,%ebp
    2421:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2424:	c7 44 24 04 88 4e 00 	movl   $0x4e88,0x4(%esp)
    242b:	00 
    242c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2433:	e8 7b 19 00 00       	call   3db3 <printf>

  unlink("bigwrite");
    2438:	c7 04 24 97 4e 00 00 	movl   $0x4e97,(%esp)
    243f:	e8 40 18 00 00       	call   3c84 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2444:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    244b:	e9 b3 00 00 00       	jmp    2503 <bigwrite+0xe5>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2450:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2457:	00 
    2458:	c7 04 24 97 4e 00 00 	movl   $0x4e97,(%esp)
    245f:	e8 10 18 00 00       	call   3c74 <open>
    2464:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    2467:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    246b:	79 19                	jns    2486 <bigwrite+0x68>
      printf(1, "cannot create bigwrite\n");
    246d:	c7 44 24 04 a0 4e 00 	movl   $0x4ea0,0x4(%esp)
    2474:	00 
    2475:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    247c:	e8 32 19 00 00       	call   3db3 <printf>
      exit();
    2481:	e8 ae 17 00 00       	call   3c34 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    2486:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    248d:	eb 50                	jmp    24df <bigwrite+0xc1>
      int cc = write(fd, buf, sz);
    248f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2492:	89 44 24 08          	mov    %eax,0x8(%esp)
    2496:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    249d:	00 
    249e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a1:	89 04 24             	mov    %eax,(%esp)
    24a4:	e8 ab 17 00 00       	call   3c54 <write>
    24a9:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    24ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24af:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    24b2:	74 27                	je     24db <bigwrite+0xbd>
        printf(1, "write(%d) ret %d\n", sz, cc);
    24b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24be:	89 44 24 08          	mov    %eax,0x8(%esp)
    24c2:	c7 44 24 04 b8 4e 00 	movl   $0x4eb8,0x4(%esp)
    24c9:	00 
    24ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24d1:	e8 dd 18 00 00       	call   3db3 <printf>
        exit();
    24d6:	e8 59 17 00 00       	call   3c34 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    24db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    24df:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    24e3:	7e aa                	jle    248f <bigwrite+0x71>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    24e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24e8:	89 04 24             	mov    %eax,(%esp)
    24eb:	e8 6c 17 00 00       	call   3c5c <close>
    unlink("bigwrite");
    24f0:	c7 04 24 97 4e 00 00 	movl   $0x4e97,(%esp)
    24f7:	e8 88 17 00 00       	call   3c84 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24fc:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    2503:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    250a:	0f 8e 40 ff ff ff    	jle    2450 <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2510:	c7 44 24 04 ca 4e 00 	movl   $0x4eca,0x4(%esp)
    2517:	00 
    2518:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    251f:	e8 8f 18 00 00       	call   3db3 <printf>
}
    2524:	c9                   	leave  
    2525:	c3                   	ret    

00002526 <bigfile>:

void
bigfile(void)
{
    2526:	55                   	push   %ebp
    2527:	89 e5                	mov    %esp,%ebp
    2529:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    252c:	c7 44 24 04 d7 4e 00 	movl   $0x4ed7,0x4(%esp)
    2533:	00 
    2534:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    253b:	e8 73 18 00 00       	call   3db3 <printf>

  unlink("bigfile");
    2540:	c7 04 24 e5 4e 00 00 	movl   $0x4ee5,(%esp)
    2547:	e8 38 17 00 00       	call   3c84 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    254c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2553:	00 
    2554:	c7 04 24 e5 4e 00 00 	movl   $0x4ee5,(%esp)
    255b:	e8 14 17 00 00       	call   3c74 <open>
    2560:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2563:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2567:	79 19                	jns    2582 <bigfile+0x5c>
    printf(1, "cannot create bigfile");
    2569:	c7 44 24 04 ed 4e 00 	movl   $0x4eed,0x4(%esp)
    2570:	00 
    2571:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2578:	e8 36 18 00 00       	call   3db3 <printf>
    exit();
    257d:	e8 b2 16 00 00       	call   3c34 <exit>
  }
  for(i = 0; i < 20; i++){
    2582:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2589:	eb 5a                	jmp    25e5 <bigfile+0xbf>
    memset(buf, i, 600);
    258b:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    2592:	00 
    2593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2596:	89 44 24 04          	mov    %eax,0x4(%esp)
    259a:	c7 04 24 40 80 00 00 	movl   $0x8040,(%esp)
    25a1:	e8 e9 14 00 00       	call   3a8f <memset>
    if(write(fd, buf, 600) != 600){
    25a6:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    25ad:	00 
    25ae:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    25b5:	00 
    25b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25b9:	89 04 24             	mov    %eax,(%esp)
    25bc:	e8 93 16 00 00       	call   3c54 <write>
    25c1:	3d 58 02 00 00       	cmp    $0x258,%eax
    25c6:	74 19                	je     25e1 <bigfile+0xbb>
      printf(1, "write bigfile failed\n");
    25c8:	c7 44 24 04 03 4f 00 	movl   $0x4f03,0x4(%esp)
    25cf:	00 
    25d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25d7:	e8 d7 17 00 00       	call   3db3 <printf>
      exit();
    25dc:	e8 53 16 00 00       	call   3c34 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    25e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    25e5:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    25e9:	7e a0                	jle    258b <bigfile+0x65>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    25eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25ee:	89 04 24             	mov    %eax,(%esp)
    25f1:	e8 66 16 00 00       	call   3c5c <close>

  fd = open("bigfile", 0);
    25f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    25fd:	00 
    25fe:	c7 04 24 e5 4e 00 00 	movl   $0x4ee5,(%esp)
    2605:	e8 6a 16 00 00       	call   3c74 <open>
    260a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    260d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2611:	79 19                	jns    262c <bigfile+0x106>
    printf(1, "cannot open bigfile\n");
    2613:	c7 44 24 04 19 4f 00 	movl   $0x4f19,0x4(%esp)
    261a:	00 
    261b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2622:	e8 8c 17 00 00       	call   3db3 <printf>
    exit();
    2627:	e8 08 16 00 00       	call   3c34 <exit>
  }
  total = 0;
    262c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    2633:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    263a:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    2641:	00 
    2642:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    2649:	00 
    264a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    264d:	89 04 24             	mov    %eax,(%esp)
    2650:	e8 f7 15 00 00       	call   3c4c <read>
    2655:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    2658:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    265c:	79 19                	jns    2677 <bigfile+0x151>
      printf(1, "read bigfile failed\n");
    265e:	c7 44 24 04 2e 4f 00 	movl   $0x4f2e,0x4(%esp)
    2665:	00 
    2666:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    266d:	e8 41 17 00 00       	call   3db3 <printf>
      exit();
    2672:	e8 bd 15 00 00       	call   3c34 <exit>
    }
    if(cc == 0)
    2677:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    267b:	75 1d                	jne    269a <bigfile+0x174>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    267d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2680:	89 04 24             	mov    %eax,(%esp)
    2683:	e8 d4 15 00 00       	call   3c5c <close>
  if(total != 20*600){
    2688:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    268f:	0f 85 85 00 00 00    	jne    271a <bigfile+0x1f4>
    2695:	e9 99 00 00 00       	jmp    2733 <bigfile+0x20d>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    269a:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    26a1:	74 19                	je     26bc <bigfile+0x196>
      printf(1, "short read bigfile\n");
    26a3:	c7 44 24 04 43 4f 00 	movl   $0x4f43,0x4(%esp)
    26aa:	00 
    26ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26b2:	e8 fc 16 00 00       	call   3db3 <printf>
      exit();
    26b7:	e8 78 15 00 00       	call   3c34 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    26bc:	0f b6 05 40 80 00 00 	movzbl 0x8040,%eax
    26c3:	0f be d0             	movsbl %al,%edx
    26c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c9:	89 c1                	mov    %eax,%ecx
    26cb:	c1 e9 1f             	shr    $0x1f,%ecx
    26ce:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    26d1:	d1 f8                	sar    %eax
    26d3:	39 c2                	cmp    %eax,%edx
    26d5:	75 1b                	jne    26f2 <bigfile+0x1cc>
    26d7:	0f b6 05 6b 81 00 00 	movzbl 0x816b,%eax
    26de:	0f be d0             	movsbl %al,%edx
    26e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e4:	89 c1                	mov    %eax,%ecx
    26e6:	c1 e9 1f             	shr    $0x1f,%ecx
    26e9:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    26ec:	d1 f8                	sar    %eax
    26ee:	39 c2                	cmp    %eax,%edx
    26f0:	74 19                	je     270b <bigfile+0x1e5>
      printf(1, "read bigfile wrong data\n");
    26f2:	c7 44 24 04 57 4f 00 	movl   $0x4f57,0x4(%esp)
    26f9:	00 
    26fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2701:	e8 ad 16 00 00       	call   3db3 <printf>
      exit();
    2706:	e8 29 15 00 00       	call   3c34 <exit>
    }
    total += cc;
    270b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    270e:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2711:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    2715:	e9 20 ff ff ff       	jmp    263a <bigfile+0x114>
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    271a:	c7 44 24 04 70 4f 00 	movl   $0x4f70,0x4(%esp)
    2721:	00 
    2722:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2729:	e8 85 16 00 00       	call   3db3 <printf>
    exit();
    272e:	e8 01 15 00 00       	call   3c34 <exit>
  }
  unlink("bigfile");
    2733:	c7 04 24 e5 4e 00 00 	movl   $0x4ee5,(%esp)
    273a:	e8 45 15 00 00       	call   3c84 <unlink>

  printf(1, "bigfile test ok\n");
    273f:	c7 44 24 04 8a 4f 00 	movl   $0x4f8a,0x4(%esp)
    2746:	00 
    2747:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    274e:	e8 60 16 00 00       	call   3db3 <printf>
}
    2753:	c9                   	leave  
    2754:	c3                   	ret    

00002755 <fourteen>:

void
fourteen(void)
{
    2755:	55                   	push   %ebp
    2756:	89 e5                	mov    %esp,%ebp
    2758:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    275b:	c7 44 24 04 9b 4f 00 	movl   $0x4f9b,0x4(%esp)
    2762:	00 
    2763:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    276a:	e8 44 16 00 00       	call   3db3 <printf>

  if(mkdir("12345678901234") != 0){
    276f:	c7 04 24 aa 4f 00 00 	movl   $0x4faa,(%esp)
    2776:	e8 21 15 00 00       	call   3c9c <mkdir>
    277b:	85 c0                	test   %eax,%eax
    277d:	74 19                	je     2798 <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    277f:	c7 44 24 04 b9 4f 00 	movl   $0x4fb9,0x4(%esp)
    2786:	00 
    2787:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    278e:	e8 20 16 00 00       	call   3db3 <printf>
    exit();
    2793:	e8 9c 14 00 00       	call   3c34 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2798:	c7 04 24 d8 4f 00 00 	movl   $0x4fd8,(%esp)
    279f:	e8 f8 14 00 00       	call   3c9c <mkdir>
    27a4:	85 c0                	test   %eax,%eax
    27a6:	74 19                	je     27c1 <fourteen+0x6c>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27a8:	c7 44 24 04 f8 4f 00 	movl   $0x4ff8,0x4(%esp)
    27af:	00 
    27b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27b7:	e8 f7 15 00 00       	call   3db3 <printf>
    exit();
    27bc:	e8 73 14 00 00       	call   3c34 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    27c1:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    27c8:	00 
    27c9:	c7 04 24 28 50 00 00 	movl   $0x5028,(%esp)
    27d0:	e8 9f 14 00 00       	call   3c74 <open>
    27d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    27d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    27dc:	79 19                	jns    27f7 <fourteen+0xa2>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27de:	c7 44 24 04 58 50 00 	movl   $0x5058,0x4(%esp)
    27e5:	00 
    27e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27ed:	e8 c1 15 00 00       	call   3db3 <printf>
    exit();
    27f2:	e8 3d 14 00 00       	call   3c34 <exit>
  }
  close(fd);
    27f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27fa:	89 04 24             	mov    %eax,(%esp)
    27fd:	e8 5a 14 00 00       	call   3c5c <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2802:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2809:	00 
    280a:	c7 04 24 98 50 00 00 	movl   $0x5098,(%esp)
    2811:	e8 5e 14 00 00       	call   3c74 <open>
    2816:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2819:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    281d:	79 19                	jns    2838 <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    281f:	c7 44 24 04 c8 50 00 	movl   $0x50c8,0x4(%esp)
    2826:	00 
    2827:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    282e:	e8 80 15 00 00       	call   3db3 <printf>
    exit();
    2833:	e8 fc 13 00 00       	call   3c34 <exit>
  }
  close(fd);
    2838:	8b 45 f4             	mov    -0xc(%ebp),%eax
    283b:	89 04 24             	mov    %eax,(%esp)
    283e:	e8 19 14 00 00       	call   3c5c <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2843:	c7 04 24 02 51 00 00 	movl   $0x5102,(%esp)
    284a:	e8 4d 14 00 00       	call   3c9c <mkdir>
    284f:	85 c0                	test   %eax,%eax
    2851:	75 19                	jne    286c <fourteen+0x117>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2853:	c7 44 24 04 20 51 00 	movl   $0x5120,0x4(%esp)
    285a:	00 
    285b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2862:	e8 4c 15 00 00       	call   3db3 <printf>
    exit();
    2867:	e8 c8 13 00 00       	call   3c34 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    286c:	c7 04 24 50 51 00 00 	movl   $0x5150,(%esp)
    2873:	e8 24 14 00 00       	call   3c9c <mkdir>
    2878:	85 c0                	test   %eax,%eax
    287a:	75 19                	jne    2895 <fourteen+0x140>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    287c:	c7 44 24 04 70 51 00 	movl   $0x5170,0x4(%esp)
    2883:	00 
    2884:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    288b:	e8 23 15 00 00       	call   3db3 <printf>
    exit();
    2890:	e8 9f 13 00 00       	call   3c34 <exit>
  }

  printf(1, "fourteen ok\n");
    2895:	c7 44 24 04 a1 51 00 	movl   $0x51a1,0x4(%esp)
    289c:	00 
    289d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28a4:	e8 0a 15 00 00       	call   3db3 <printf>
}
    28a9:	c9                   	leave  
    28aa:	c3                   	ret    

000028ab <rmdot>:

void
rmdot(void)
{
    28ab:	55                   	push   %ebp
    28ac:	89 e5                	mov    %esp,%ebp
    28ae:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    28b1:	c7 44 24 04 ae 51 00 	movl   $0x51ae,0x4(%esp)
    28b8:	00 
    28b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28c0:	e8 ee 14 00 00       	call   3db3 <printf>
  if(mkdir("dots") != 0){
    28c5:	c7 04 24 ba 51 00 00 	movl   $0x51ba,(%esp)
    28cc:	e8 cb 13 00 00       	call   3c9c <mkdir>
    28d1:	85 c0                	test   %eax,%eax
    28d3:	74 19                	je     28ee <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    28d5:	c7 44 24 04 bf 51 00 	movl   $0x51bf,0x4(%esp)
    28dc:	00 
    28dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28e4:	e8 ca 14 00 00       	call   3db3 <printf>
    exit();
    28e9:	e8 46 13 00 00       	call   3c34 <exit>
  }
  if(chdir("dots") != 0){
    28ee:	c7 04 24 ba 51 00 00 	movl   $0x51ba,(%esp)
    28f5:	e8 aa 13 00 00       	call   3ca4 <chdir>
    28fa:	85 c0                	test   %eax,%eax
    28fc:	74 19                	je     2917 <rmdot+0x6c>
    printf(1, "chdir dots failed\n");
    28fe:	c7 44 24 04 d2 51 00 	movl   $0x51d2,0x4(%esp)
    2905:	00 
    2906:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    290d:	e8 a1 14 00 00       	call   3db3 <printf>
    exit();
    2912:	e8 1d 13 00 00       	call   3c34 <exit>
  }
  if(unlink(".") == 0){
    2917:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    291e:	e8 61 13 00 00       	call   3c84 <unlink>
    2923:	85 c0                	test   %eax,%eax
    2925:	75 19                	jne    2940 <rmdot+0x95>
    printf(1, "rm . worked!\n");
    2927:	c7 44 24 04 e5 51 00 	movl   $0x51e5,0x4(%esp)
    292e:	00 
    292f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2936:	e8 78 14 00 00       	call   3db3 <printf>
    exit();
    293b:	e8 f4 12 00 00       	call   3c34 <exit>
  }
  if(unlink("..") == 0){
    2940:	c7 04 24 78 44 00 00 	movl   $0x4478,(%esp)
    2947:	e8 38 13 00 00       	call   3c84 <unlink>
    294c:	85 c0                	test   %eax,%eax
    294e:	75 19                	jne    2969 <rmdot+0xbe>
    printf(1, "rm .. worked!\n");
    2950:	c7 44 24 04 f3 51 00 	movl   $0x51f3,0x4(%esp)
    2957:	00 
    2958:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    295f:	e8 4f 14 00 00       	call   3db3 <printf>
    exit();
    2964:	e8 cb 12 00 00       	call   3c34 <exit>
  }
  if(chdir("/") != 0){
    2969:	c7 04 24 02 52 00 00 	movl   $0x5202,(%esp)
    2970:	e8 2f 13 00 00       	call   3ca4 <chdir>
    2975:	85 c0                	test   %eax,%eax
    2977:	74 19                	je     2992 <rmdot+0xe7>
    printf(1, "chdir / failed\n");
    2979:	c7 44 24 04 04 52 00 	movl   $0x5204,0x4(%esp)
    2980:	00 
    2981:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2988:	e8 26 14 00 00       	call   3db3 <printf>
    exit();
    298d:	e8 a2 12 00 00       	call   3c34 <exit>
  }
  if(unlink("dots/.") == 0){
    2992:	c7 04 24 14 52 00 00 	movl   $0x5214,(%esp)
    2999:	e8 e6 12 00 00       	call   3c84 <unlink>
    299e:	85 c0                	test   %eax,%eax
    29a0:	75 19                	jne    29bb <rmdot+0x110>
    printf(1, "unlink dots/. worked!\n");
    29a2:	c7 44 24 04 1b 52 00 	movl   $0x521b,0x4(%esp)
    29a9:	00 
    29aa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29b1:	e8 fd 13 00 00       	call   3db3 <printf>
    exit();
    29b6:	e8 79 12 00 00       	call   3c34 <exit>
  }
  if(unlink("dots/..") == 0){
    29bb:	c7 04 24 32 52 00 00 	movl   $0x5232,(%esp)
    29c2:	e8 bd 12 00 00       	call   3c84 <unlink>
    29c7:	85 c0                	test   %eax,%eax
    29c9:	75 19                	jne    29e4 <rmdot+0x139>
    printf(1, "unlink dots/.. worked!\n");
    29cb:	c7 44 24 04 3a 52 00 	movl   $0x523a,0x4(%esp)
    29d2:	00 
    29d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29da:	e8 d4 13 00 00       	call   3db3 <printf>
    exit();
    29df:	e8 50 12 00 00       	call   3c34 <exit>
  }
  if(unlink("dots") != 0){
    29e4:	c7 04 24 ba 51 00 00 	movl   $0x51ba,(%esp)
    29eb:	e8 94 12 00 00       	call   3c84 <unlink>
    29f0:	85 c0                	test   %eax,%eax
    29f2:	74 19                	je     2a0d <rmdot+0x162>
    printf(1, "unlink dots failed!\n");
    29f4:	c7 44 24 04 52 52 00 	movl   $0x5252,0x4(%esp)
    29fb:	00 
    29fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a03:	e8 ab 13 00 00       	call   3db3 <printf>
    exit();
    2a08:	e8 27 12 00 00       	call   3c34 <exit>
  }
  printf(1, "rmdot ok\n");
    2a0d:	c7 44 24 04 67 52 00 	movl   $0x5267,0x4(%esp)
    2a14:	00 
    2a15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a1c:	e8 92 13 00 00       	call   3db3 <printf>
}
    2a21:	c9                   	leave  
    2a22:	c3                   	ret    

00002a23 <dirfile>:

void
dirfile(void)
{
    2a23:	55                   	push   %ebp
    2a24:	89 e5                	mov    %esp,%ebp
    2a26:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    2a29:	c7 44 24 04 71 52 00 	movl   $0x5271,0x4(%esp)
    2a30:	00 
    2a31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a38:	e8 76 13 00 00       	call   3db3 <printf>

  fd = open("dirfile", O_CREATE);
    2a3d:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2a44:	00 
    2a45:	c7 04 24 7e 52 00 00 	movl   $0x527e,(%esp)
    2a4c:	e8 23 12 00 00       	call   3c74 <open>
    2a51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2a54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a58:	79 19                	jns    2a73 <dirfile+0x50>
    printf(1, "create dirfile failed\n");
    2a5a:	c7 44 24 04 86 52 00 	movl   $0x5286,0x4(%esp)
    2a61:	00 
    2a62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a69:	e8 45 13 00 00       	call   3db3 <printf>
    exit();
    2a6e:	e8 c1 11 00 00       	call   3c34 <exit>
  }
  close(fd);
    2a73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a76:	89 04 24             	mov    %eax,(%esp)
    2a79:	e8 de 11 00 00       	call   3c5c <close>
  if(chdir("dirfile") == 0){
    2a7e:	c7 04 24 7e 52 00 00 	movl   $0x527e,(%esp)
    2a85:	e8 1a 12 00 00       	call   3ca4 <chdir>
    2a8a:	85 c0                	test   %eax,%eax
    2a8c:	75 19                	jne    2aa7 <dirfile+0x84>
    printf(1, "chdir dirfile succeeded!\n");
    2a8e:	c7 44 24 04 9d 52 00 	movl   $0x529d,0x4(%esp)
    2a95:	00 
    2a96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a9d:	e8 11 13 00 00       	call   3db3 <printf>
    exit();
    2aa2:	e8 8d 11 00 00       	call   3c34 <exit>
  }
  fd = open("dirfile/xx", 0);
    2aa7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2aae:	00 
    2aaf:	c7 04 24 b7 52 00 00 	movl   $0x52b7,(%esp)
    2ab6:	e8 b9 11 00 00       	call   3c74 <open>
    2abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2abe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ac2:	78 19                	js     2add <dirfile+0xba>
    printf(1, "create dirfile/xx succeeded!\n");
    2ac4:	c7 44 24 04 c2 52 00 	movl   $0x52c2,0x4(%esp)
    2acb:	00 
    2acc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ad3:	e8 db 12 00 00       	call   3db3 <printf>
    exit();
    2ad8:	e8 57 11 00 00       	call   3c34 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2add:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2ae4:	00 
    2ae5:	c7 04 24 b7 52 00 00 	movl   $0x52b7,(%esp)
    2aec:	e8 83 11 00 00       	call   3c74 <open>
    2af1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2af4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2af8:	78 19                	js     2b13 <dirfile+0xf0>
    printf(1, "create dirfile/xx succeeded!\n");
    2afa:	c7 44 24 04 c2 52 00 	movl   $0x52c2,0x4(%esp)
    2b01:	00 
    2b02:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b09:	e8 a5 12 00 00       	call   3db3 <printf>
    exit();
    2b0e:	e8 21 11 00 00       	call   3c34 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2b13:	c7 04 24 b7 52 00 00 	movl   $0x52b7,(%esp)
    2b1a:	e8 7d 11 00 00       	call   3c9c <mkdir>
    2b1f:	85 c0                	test   %eax,%eax
    2b21:	75 19                	jne    2b3c <dirfile+0x119>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b23:	c7 44 24 04 e0 52 00 	movl   $0x52e0,0x4(%esp)
    2b2a:	00 
    2b2b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b32:	e8 7c 12 00 00       	call   3db3 <printf>
    exit();
    2b37:	e8 f8 10 00 00       	call   3c34 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2b3c:	c7 04 24 b7 52 00 00 	movl   $0x52b7,(%esp)
    2b43:	e8 3c 11 00 00       	call   3c84 <unlink>
    2b48:	85 c0                	test   %eax,%eax
    2b4a:	75 19                	jne    2b65 <dirfile+0x142>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b4c:	c7 44 24 04 fd 52 00 	movl   $0x52fd,0x4(%esp)
    2b53:	00 
    2b54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b5b:	e8 53 12 00 00       	call   3db3 <printf>
    exit();
    2b60:	e8 cf 10 00 00       	call   3c34 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2b65:	c7 44 24 04 b7 52 00 	movl   $0x52b7,0x4(%esp)
    2b6c:	00 
    2b6d:	c7 04 24 1b 53 00 00 	movl   $0x531b,(%esp)
    2b74:	e8 1b 11 00 00       	call   3c94 <link>
    2b79:	85 c0                	test   %eax,%eax
    2b7b:	75 19                	jne    2b96 <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b7d:	c7 44 24 04 24 53 00 	movl   $0x5324,0x4(%esp)
    2b84:	00 
    2b85:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b8c:	e8 22 12 00 00       	call   3db3 <printf>
    exit();
    2b91:	e8 9e 10 00 00       	call   3c34 <exit>
  }
  if(unlink("dirfile") != 0){
    2b96:	c7 04 24 7e 52 00 00 	movl   $0x527e,(%esp)
    2b9d:	e8 e2 10 00 00       	call   3c84 <unlink>
    2ba2:	85 c0                	test   %eax,%eax
    2ba4:	74 19                	je     2bbf <dirfile+0x19c>
    printf(1, "unlink dirfile failed!\n");
    2ba6:	c7 44 24 04 43 53 00 	movl   $0x5343,0x4(%esp)
    2bad:	00 
    2bae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bb5:	e8 f9 11 00 00       	call   3db3 <printf>
    exit();
    2bba:	e8 75 10 00 00       	call   3c34 <exit>
  }

  fd = open(".", O_RDWR);
    2bbf:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2bc6:	00 
    2bc7:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    2bce:	e8 a1 10 00 00       	call   3c74 <open>
    2bd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2bd6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bda:	78 19                	js     2bf5 <dirfile+0x1d2>
    printf(1, "open . for writing succeeded!\n");
    2bdc:	c7 44 24 04 5c 53 00 	movl   $0x535c,0x4(%esp)
    2be3:	00 
    2be4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2beb:	e8 c3 11 00 00       	call   3db3 <printf>
    exit();
    2bf0:	e8 3f 10 00 00       	call   3c34 <exit>
  }
  fd = open(".", 0);
    2bf5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2bfc:	00 
    2bfd:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    2c04:	e8 6b 10 00 00       	call   3c74 <open>
    2c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2c0c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2c13:	00 
    2c14:	c7 44 24 04 22 45 00 	movl   $0x4522,0x4(%esp)
    2c1b:	00 
    2c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c1f:	89 04 24             	mov    %eax,(%esp)
    2c22:	e8 2d 10 00 00       	call   3c54 <write>
    2c27:	85 c0                	test   %eax,%eax
    2c29:	7e 19                	jle    2c44 <dirfile+0x221>
    printf(1, "write . succeeded!\n");
    2c2b:	c7 44 24 04 7b 53 00 	movl   $0x537b,0x4(%esp)
    2c32:	00 
    2c33:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c3a:	e8 74 11 00 00       	call   3db3 <printf>
    exit();
    2c3f:	e8 f0 0f 00 00       	call   3c34 <exit>
  }
  close(fd);
    2c44:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c47:	89 04 24             	mov    %eax,(%esp)
    2c4a:	e8 0d 10 00 00       	call   3c5c <close>

  printf(1, "dir vs file OK\n");
    2c4f:	c7 44 24 04 8f 53 00 	movl   $0x538f,0x4(%esp)
    2c56:	00 
    2c57:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c5e:	e8 50 11 00 00       	call   3db3 <printf>
}
    2c63:	c9                   	leave  
    2c64:	c3                   	ret    

00002c65 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2c65:	55                   	push   %ebp
    2c66:	89 e5                	mov    %esp,%ebp
    2c68:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2c6b:	c7 44 24 04 9f 53 00 	movl   $0x539f,0x4(%esp)
    2c72:	00 
    2c73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c7a:	e8 34 11 00 00       	call   3db3 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c86:	e9 d2 00 00 00       	jmp    2d5d <iref+0xf8>
    if(mkdir("irefd") != 0){
    2c8b:	c7 04 24 b0 53 00 00 	movl   $0x53b0,(%esp)
    2c92:	e8 05 10 00 00       	call   3c9c <mkdir>
    2c97:	85 c0                	test   %eax,%eax
    2c99:	74 19                	je     2cb4 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2c9b:	c7 44 24 04 b6 53 00 	movl   $0x53b6,0x4(%esp)
    2ca2:	00 
    2ca3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2caa:	e8 04 11 00 00       	call   3db3 <printf>
      exit();
    2caf:	e8 80 0f 00 00       	call   3c34 <exit>
    }
    if(chdir("irefd") != 0){
    2cb4:	c7 04 24 b0 53 00 00 	movl   $0x53b0,(%esp)
    2cbb:	e8 e4 0f 00 00       	call   3ca4 <chdir>
    2cc0:	85 c0                	test   %eax,%eax
    2cc2:	74 19                	je     2cdd <iref+0x78>
      printf(1, "chdir irefd failed\n");
    2cc4:	c7 44 24 04 ca 53 00 	movl   $0x53ca,0x4(%esp)
    2ccb:	00 
    2ccc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cd3:	e8 db 10 00 00       	call   3db3 <printf>
      exit();
    2cd8:	e8 57 0f 00 00       	call   3c34 <exit>
    }

    mkdir("");
    2cdd:	c7 04 24 de 53 00 00 	movl   $0x53de,(%esp)
    2ce4:	e8 b3 0f 00 00       	call   3c9c <mkdir>
    link("README", "");
    2ce9:	c7 44 24 04 de 53 00 	movl   $0x53de,0x4(%esp)
    2cf0:	00 
    2cf1:	c7 04 24 1b 53 00 00 	movl   $0x531b,(%esp)
    2cf8:	e8 97 0f 00 00       	call   3c94 <link>
    fd = open("", O_CREATE);
    2cfd:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2d04:	00 
    2d05:	c7 04 24 de 53 00 00 	movl   $0x53de,(%esp)
    2d0c:	e8 63 0f 00 00       	call   3c74 <open>
    2d11:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2d14:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d18:	78 0b                	js     2d25 <iref+0xc0>
      close(fd);
    2d1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d1d:	89 04 24             	mov    %eax,(%esp)
    2d20:	e8 37 0f 00 00       	call   3c5c <close>
    fd = open("xx", O_CREATE);
    2d25:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2d2c:	00 
    2d2d:	c7 04 24 df 53 00 00 	movl   $0x53df,(%esp)
    2d34:	e8 3b 0f 00 00       	call   3c74 <open>
    2d39:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2d3c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d40:	78 0b                	js     2d4d <iref+0xe8>
      close(fd);
    2d42:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d45:	89 04 24             	mov    %eax,(%esp)
    2d48:	e8 0f 0f 00 00       	call   3c5c <close>
    unlink("xx");
    2d4d:	c7 04 24 df 53 00 00 	movl   $0x53df,(%esp)
    2d54:	e8 2b 0f 00 00       	call   3c84 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2d59:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d5d:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    2d61:	0f 8e 24 ff ff ff    	jle    2c8b <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2d67:	c7 04 24 02 52 00 00 	movl   $0x5202,(%esp)
    2d6e:	e8 31 0f 00 00       	call   3ca4 <chdir>
  printf(1, "empty file name OK\n");
    2d73:	c7 44 24 04 e2 53 00 	movl   $0x53e2,0x4(%esp)
    2d7a:	00 
    2d7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d82:	e8 2c 10 00 00       	call   3db3 <printf>
}
    2d87:	c9                   	leave  
    2d88:	c3                   	ret    

00002d89 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2d89:	55                   	push   %ebp
    2d8a:	89 e5                	mov    %esp,%ebp
    2d8c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    2d8f:	c7 44 24 04 f6 53 00 	movl   $0x53f6,0x4(%esp)
    2d96:	00 
    2d97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d9e:	e8 10 10 00 00       	call   3db3 <printf>

  for(n=0; n<1000; n++){
    2da3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2daa:	eb 1d                	jmp    2dc9 <forktest+0x40>
    pid = fork();
    2dac:	e8 7b 0e 00 00       	call   3c2c <fork>
    2db1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    2db4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2db8:	78 1a                	js     2dd4 <forktest+0x4b>
      break;
    if(pid == 0)
    2dba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2dbe:	75 05                	jne    2dc5 <forktest+0x3c>
      exit();
    2dc0:	e8 6f 0e 00 00       	call   3c34 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2dc5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2dc9:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2dd0:	7e da                	jle    2dac <forktest+0x23>
    2dd2:	eb 01                	jmp    2dd5 <forktest+0x4c>
    pid = fork();
    if(pid < 0)
      break;
    2dd4:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    2dd5:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    2ddc:	75 3f                	jne    2e1d <forktest+0x94>
    printf(1, "fork claimed to work 1000 times!\n");
    2dde:	c7 44 24 04 04 54 00 	movl   $0x5404,0x4(%esp)
    2de5:	00 
    2de6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ded:	e8 c1 0f 00 00       	call   3db3 <printf>
    exit();
    2df2:	e8 3d 0e 00 00       	call   3c34 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    2df7:	e8 40 0e 00 00       	call   3c3c <wait>
    2dfc:	85 c0                	test   %eax,%eax
    2dfe:	79 19                	jns    2e19 <forktest+0x90>
      printf(1, "wait stopped early\n");
    2e00:	c7 44 24 04 26 54 00 	movl   $0x5426,0x4(%esp)
    2e07:	00 
    2e08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e0f:	e8 9f 0f 00 00       	call   3db3 <printf>
      exit();
    2e14:	e8 1b 0e 00 00       	call   3c34 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2e19:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2e1d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e21:	7f d4                	jg     2df7 <forktest+0x6e>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    2e23:	e8 14 0e 00 00       	call   3c3c <wait>
    2e28:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e2b:	74 19                	je     2e46 <forktest+0xbd>
    printf(1, "wait got too many\n");
    2e2d:	c7 44 24 04 3a 54 00 	movl   $0x543a,0x4(%esp)
    2e34:	00 
    2e35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e3c:	e8 72 0f 00 00       	call   3db3 <printf>
    exit();
    2e41:	e8 ee 0d 00 00       	call   3c34 <exit>
  }
  
  printf(1, "fork test OK\n");
    2e46:	c7 44 24 04 4d 54 00 	movl   $0x544d,0x4(%esp)
    2e4d:	00 
    2e4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e55:	e8 59 0f 00 00       	call   3db3 <printf>
}
    2e5a:	c9                   	leave  
    2e5b:	c3                   	ret    

00002e5c <sbrktest>:

void
sbrktest(void)
{
    2e5c:	55                   	push   %ebp
    2e5d:	89 e5                	mov    %esp,%ebp
    2e5f:	53                   	push   %ebx
    2e60:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2e66:	a1 5c 58 00 00       	mov    0x585c,%eax
    2e6b:	c7 44 24 04 5b 54 00 	movl   $0x545b,0x4(%esp)
    2e72:	00 
    2e73:	89 04 24             	mov    %eax,(%esp)
    2e76:	e8 38 0f 00 00       	call   3db3 <printf>
  oldbrk = sbrk(0);
    2e7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e82:	e8 35 0e 00 00       	call   3cbc <sbrk>
    2e87:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2e8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e91:	e8 26 0e 00 00       	call   3cbc <sbrk>
    2e96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    2e99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2ea0:	eb 59                	jmp    2efb <sbrktest+0x9f>
    b = sbrk(1);
    2ea2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ea9:	e8 0e 0e 00 00       	call   3cbc <sbrk>
    2eae:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    2eb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2eb4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2eb7:	74 2f                	je     2ee8 <sbrktest+0x8c>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2eb9:	a1 5c 58 00 00       	mov    0x585c,%eax
    2ebe:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2ec1:	89 54 24 10          	mov    %edx,0x10(%esp)
    2ec5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ec8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2ecc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2ecf:	89 54 24 08          	mov    %edx,0x8(%esp)
    2ed3:	c7 44 24 04 66 54 00 	movl   $0x5466,0x4(%esp)
    2eda:	00 
    2edb:	89 04 24             	mov    %eax,(%esp)
    2ede:	e8 d0 0e 00 00       	call   3db3 <printf>
      exit();
    2ee3:	e8 4c 0d 00 00       	call   3c34 <exit>
    }
    *b = 1;
    2ee8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2eeb:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2eee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ef1:	83 c0 01             	add    $0x1,%eax
    2ef4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2ef7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2efb:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    2f02:	7e 9e                	jle    2ea2 <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2f04:	e8 23 0d 00 00       	call   3c2c <fork>
    2f09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2f0c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2f10:	79 1a                	jns    2f2c <sbrktest+0xd0>
    printf(stdout, "sbrk test fork failed\n");
    2f12:	a1 5c 58 00 00       	mov    0x585c,%eax
    2f17:	c7 44 24 04 81 54 00 	movl   $0x5481,0x4(%esp)
    2f1e:	00 
    2f1f:	89 04 24             	mov    %eax,(%esp)
    2f22:	e8 8c 0e 00 00       	call   3db3 <printf>
    exit();
    2f27:	e8 08 0d 00 00       	call   3c34 <exit>
  }
  c = sbrk(1);
    2f2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f33:	e8 84 0d 00 00       	call   3cbc <sbrk>
    2f38:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    2f3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f42:	e8 75 0d 00 00       	call   3cbc <sbrk>
    2f47:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    2f4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f4d:	83 c0 01             	add    $0x1,%eax
    2f50:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    2f53:	74 1a                	je     2f6f <sbrktest+0x113>
    printf(stdout, "sbrk test failed post-fork\n");
    2f55:	a1 5c 58 00 00       	mov    0x585c,%eax
    2f5a:	c7 44 24 04 98 54 00 	movl   $0x5498,0x4(%esp)
    2f61:	00 
    2f62:	89 04 24             	mov    %eax,(%esp)
    2f65:	e8 49 0e 00 00       	call   3db3 <printf>
    exit();
    2f6a:	e8 c5 0c 00 00       	call   3c34 <exit>
  }
  if(pid == 0)
    2f6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2f73:	75 05                	jne    2f7a <sbrktest+0x11e>
    exit();
    2f75:	e8 ba 0c 00 00       	call   3c34 <exit>
  wait();
    2f7a:	e8 bd 0c 00 00       	call   3c3c <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2f7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f86:	e8 31 0d 00 00       	call   3cbc <sbrk>
    2f8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    2f8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f91:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f96:	89 d1                	mov    %edx,%ecx
    2f98:	29 c1                	sub    %eax,%ecx
    2f9a:	89 c8                	mov    %ecx,%eax
    2f9c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    2f9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2fa2:	89 04 24             	mov    %eax,(%esp)
    2fa5:	e8 12 0d 00 00       	call   3cbc <sbrk>
    2faa:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    2fad:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2fb0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2fb3:	74 1a                	je     2fcf <sbrktest+0x173>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2fb5:	a1 5c 58 00 00       	mov    0x585c,%eax
    2fba:	c7 44 24 04 b4 54 00 	movl   $0x54b4,0x4(%esp)
    2fc1:	00 
    2fc2:	89 04 24             	mov    %eax,(%esp)
    2fc5:	e8 e9 0d 00 00       	call   3db3 <printf>
    exit();
    2fca:	e8 65 0c 00 00       	call   3c34 <exit>
  }
  lastaddr = (char*) (BIG-1);
    2fcf:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    2fd6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2fd9:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    2fdc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fe3:	e8 d4 0c 00 00       	call   3cbc <sbrk>
    2fe8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    2feb:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2ff2:	e8 c5 0c 00 00       	call   3cbc <sbrk>
    2ff7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    2ffa:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    2ffe:	75 1a                	jne    301a <sbrktest+0x1be>
    printf(stdout, "sbrk could not deallocate\n");
    3000:	a1 5c 58 00 00       	mov    0x585c,%eax
    3005:	c7 44 24 04 f2 54 00 	movl   $0x54f2,0x4(%esp)
    300c:	00 
    300d:	89 04 24             	mov    %eax,(%esp)
    3010:	e8 9e 0d 00 00       	call   3db3 <printf>
    exit();
    3015:	e8 1a 0c 00 00       	call   3c34 <exit>
  }
  c = sbrk(0);
    301a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3021:	e8 96 0c 00 00       	call   3cbc <sbrk>
    3026:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    3029:	8b 45 f4             	mov    -0xc(%ebp),%eax
    302c:	2d 00 10 00 00       	sub    $0x1000,%eax
    3031:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    3034:	74 28                	je     305e <sbrktest+0x202>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3036:	a1 5c 58 00 00       	mov    0x585c,%eax
    303b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    303e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3042:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3045:	89 54 24 08          	mov    %edx,0x8(%esp)
    3049:	c7 44 24 04 10 55 00 	movl   $0x5510,0x4(%esp)
    3050:	00 
    3051:	89 04 24             	mov    %eax,(%esp)
    3054:	e8 5a 0d 00 00       	call   3db3 <printf>
    exit();
    3059:	e8 d6 0b 00 00       	call   3c34 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    305e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3065:	e8 52 0c 00 00       	call   3cbc <sbrk>
    306a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    306d:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3074:	e8 43 0c 00 00       	call   3cbc <sbrk>
    3079:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    307c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    307f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3082:	75 19                	jne    309d <sbrktest+0x241>
    3084:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    308b:	e8 2c 0c 00 00       	call   3cbc <sbrk>
    3090:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3093:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3099:	39 d0                	cmp    %edx,%eax
    309b:	74 28                	je     30c5 <sbrktest+0x269>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    309d:	a1 5c 58 00 00       	mov    0x585c,%eax
    30a2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    30a5:	89 54 24 0c          	mov    %edx,0xc(%esp)
    30a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    30ac:	89 54 24 08          	mov    %edx,0x8(%esp)
    30b0:	c7 44 24 04 48 55 00 	movl   $0x5548,0x4(%esp)
    30b7:	00 
    30b8:	89 04 24             	mov    %eax,(%esp)
    30bb:	e8 f3 0c 00 00       	call   3db3 <printf>
    exit();
    30c0:	e8 6f 0b 00 00       	call   3c34 <exit>
  }
  if(*lastaddr == 99){
    30c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    30c8:	0f b6 00             	movzbl (%eax),%eax
    30cb:	3c 63                	cmp    $0x63,%al
    30cd:	75 1a                	jne    30e9 <sbrktest+0x28d>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30cf:	a1 5c 58 00 00       	mov    0x585c,%eax
    30d4:	c7 44 24 04 70 55 00 	movl   $0x5570,0x4(%esp)
    30db:	00 
    30dc:	89 04 24             	mov    %eax,(%esp)
    30df:	e8 cf 0c 00 00       	call   3db3 <printf>
    exit();
    30e4:	e8 4b 0b 00 00       	call   3c34 <exit>
  }

  a = sbrk(0);
    30e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30f0:	e8 c7 0b 00 00       	call   3cbc <sbrk>
    30f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    30f8:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    30fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3102:	e8 b5 0b 00 00       	call   3cbc <sbrk>
    3107:	89 da                	mov    %ebx,%edx
    3109:	29 c2                	sub    %eax,%edx
    310b:	89 d0                	mov    %edx,%eax
    310d:	89 04 24             	mov    %eax,(%esp)
    3110:	e8 a7 0b 00 00       	call   3cbc <sbrk>
    3115:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    3118:	8b 45 e0             	mov    -0x20(%ebp),%eax
    311b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    311e:	74 28                	je     3148 <sbrktest+0x2ec>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3120:	a1 5c 58 00 00       	mov    0x585c,%eax
    3125:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3128:	89 54 24 0c          	mov    %edx,0xc(%esp)
    312c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    312f:	89 54 24 08          	mov    %edx,0x8(%esp)
    3133:	c7 44 24 04 a0 55 00 	movl   $0x55a0,0x4(%esp)
    313a:	00 
    313b:	89 04 24             	mov    %eax,(%esp)
    313e:	e8 70 0c 00 00       	call   3db3 <printf>
    exit();
    3143:	e8 ec 0a 00 00       	call   3c34 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3148:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    314f:	eb 7b                	jmp    31cc <sbrktest+0x370>
    ppid = getpid();
    3151:	e8 5e 0b 00 00       	call   3cb4 <getpid>
    3156:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    3159:	e8 ce 0a 00 00       	call   3c2c <fork>
    315e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    3161:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3165:	79 1a                	jns    3181 <sbrktest+0x325>
      printf(stdout, "fork failed\n");
    3167:	a1 5c 58 00 00       	mov    0x585c,%eax
    316c:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
    3173:	00 
    3174:	89 04 24             	mov    %eax,(%esp)
    3177:	e8 37 0c 00 00       	call   3db3 <printf>
      exit();
    317c:	e8 b3 0a 00 00       	call   3c34 <exit>
    }
    if(pid == 0){
    3181:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3185:	75 39                	jne    31c0 <sbrktest+0x364>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3187:	8b 45 f4             	mov    -0xc(%ebp),%eax
    318a:	0f b6 00             	movzbl (%eax),%eax
    318d:	0f be d0             	movsbl %al,%edx
    3190:	a1 5c 58 00 00       	mov    0x585c,%eax
    3195:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3199:	8b 55 f4             	mov    -0xc(%ebp),%edx
    319c:	89 54 24 08          	mov    %edx,0x8(%esp)
    31a0:	c7 44 24 04 c1 55 00 	movl   $0x55c1,0x4(%esp)
    31a7:	00 
    31a8:	89 04 24             	mov    %eax,(%esp)
    31ab:	e8 03 0c 00 00       	call   3db3 <printf>
      kill(ppid);
    31b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31b3:	89 04 24             	mov    %eax,(%esp)
    31b6:	e8 a9 0a 00 00       	call   3c64 <kill>
      exit();
    31bb:	e8 74 0a 00 00       	call   3c34 <exit>
    }
    wait();
    31c0:	e8 77 0a 00 00       	call   3c3c <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    31c5:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    31cc:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    31d3:	0f 86 78 ff ff ff    	jbe    3151 <sbrktest+0x2f5>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    31d9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    31dc:	89 04 24             	mov    %eax,(%esp)
    31df:	e8 60 0a 00 00       	call   3c44 <pipe>
    31e4:	85 c0                	test   %eax,%eax
    31e6:	74 19                	je     3201 <sbrktest+0x3a5>
    printf(1, "pipe() failed\n");
    31e8:	c7 44 24 04 bd 44 00 	movl   $0x44bd,0x4(%esp)
    31ef:	00 
    31f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31f7:	e8 b7 0b 00 00       	call   3db3 <printf>
    exit();
    31fc:	e8 33 0a 00 00       	call   3c34 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3201:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3208:	e9 89 00 00 00       	jmp    3296 <sbrktest+0x43a>
    if((pids[i] = fork()) == 0){
    320d:	e8 1a 0a 00 00       	call   3c2c <fork>
    3212:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3215:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    3219:	8b 45 f0             	mov    -0x10(%ebp),%eax
    321c:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3220:	85 c0                	test   %eax,%eax
    3222:	75 48                	jne    326c <sbrktest+0x410>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3224:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    322b:	e8 8c 0a 00 00       	call   3cbc <sbrk>
    3230:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3235:	89 d1                	mov    %edx,%ecx
    3237:	29 c1                	sub    %eax,%ecx
    3239:	89 c8                	mov    %ecx,%eax
    323b:	89 04 24             	mov    %eax,(%esp)
    323e:	e8 79 0a 00 00       	call   3cbc <sbrk>
      write(fds[1], "x", 1);
    3243:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3246:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    324d:	00 
    324e:	c7 44 24 04 22 45 00 	movl   $0x4522,0x4(%esp)
    3255:	00 
    3256:	89 04 24             	mov    %eax,(%esp)
    3259:	e8 f6 09 00 00       	call   3c54 <write>
      // sit around until killed
      for(;;) sleep(1000);
    325e:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    3265:	e8 5a 0a 00 00       	call   3cc4 <sleep>
    326a:	eb f2                	jmp    325e <sbrktest+0x402>
    }
    if(pids[i] != -1)
    326c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    326f:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3273:	83 f8 ff             	cmp    $0xffffffff,%eax
    3276:	74 1a                	je     3292 <sbrktest+0x436>
      read(fds[0], &scratch, 1);
    3278:	8b 45 c8             	mov    -0x38(%ebp),%eax
    327b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3282:	00 
    3283:	8d 55 9f             	lea    -0x61(%ebp),%edx
    3286:	89 54 24 04          	mov    %edx,0x4(%esp)
    328a:	89 04 24             	mov    %eax,(%esp)
    328d:	e8 ba 09 00 00       	call   3c4c <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3292:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3296:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3299:	83 f8 09             	cmp    $0x9,%eax
    329c:	0f 86 6b ff ff ff    	jbe    320d <sbrktest+0x3b1>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    32a2:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    32a9:	e8 0e 0a 00 00       	call   3cbc <sbrk>
    32ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    32b8:	eb 27                	jmp    32e1 <sbrktest+0x485>
    if(pids[i] == -1)
    32ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32bd:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    32c1:	83 f8 ff             	cmp    $0xffffffff,%eax
    32c4:	74 16                	je     32dc <sbrktest+0x480>
      continue;
    kill(pids[i]);
    32c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32c9:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    32cd:	89 04 24             	mov    %eax,(%esp)
    32d0:	e8 8f 09 00 00       	call   3c64 <kill>
    wait();
    32d5:	e8 62 09 00 00       	call   3c3c <wait>
    32da:	eb 01                	jmp    32dd <sbrktest+0x481>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    32dc:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32e4:	83 f8 09             	cmp    $0x9,%eax
    32e7:	76 d1                	jbe    32ba <sbrktest+0x45e>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    32e9:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    32ed:	75 1a                	jne    3309 <sbrktest+0x4ad>
    printf(stdout, "failed sbrk leaked memory\n");
    32ef:	a1 5c 58 00 00       	mov    0x585c,%eax
    32f4:	c7 44 24 04 da 55 00 	movl   $0x55da,0x4(%esp)
    32fb:	00 
    32fc:	89 04 24             	mov    %eax,(%esp)
    32ff:	e8 af 0a 00 00       	call   3db3 <printf>
    exit();
    3304:	e8 2b 09 00 00       	call   3c34 <exit>
  }

  if(sbrk(0) > oldbrk)
    3309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3310:	e8 a7 09 00 00       	call   3cbc <sbrk>
    3315:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3318:	76 1d                	jbe    3337 <sbrktest+0x4db>
    sbrk(-(sbrk(0) - oldbrk));
    331a:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    331d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3324:	e8 93 09 00 00       	call   3cbc <sbrk>
    3329:	89 da                	mov    %ebx,%edx
    332b:	29 c2                	sub    %eax,%edx
    332d:	89 d0                	mov    %edx,%eax
    332f:	89 04 24             	mov    %eax,(%esp)
    3332:	e8 85 09 00 00       	call   3cbc <sbrk>

  printf(stdout, "sbrk test OK\n");
    3337:	a1 5c 58 00 00       	mov    0x585c,%eax
    333c:	c7 44 24 04 f5 55 00 	movl   $0x55f5,0x4(%esp)
    3343:	00 
    3344:	89 04 24             	mov    %eax,(%esp)
    3347:	e8 67 0a 00 00       	call   3db3 <printf>
}
    334c:	81 c4 84 00 00 00    	add    $0x84,%esp
    3352:	5b                   	pop    %ebx
    3353:	5d                   	pop    %ebp
    3354:	c3                   	ret    

00003355 <validateint>:

void
validateint(int *p)
{
    3355:	55                   	push   %ebp
    3356:	89 e5                	mov    %esp,%ebp
    3358:	56                   	push   %esi
    3359:	53                   	push   %ebx
    335a:	83 ec 14             	sub    $0x14,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    335d:	c7 45 e4 0d 00 00 00 	movl   $0xd,-0x1c(%ebp)
    3364:	8b 55 08             	mov    0x8(%ebp),%edx
    3367:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    336a:	89 d1                	mov    %edx,%ecx
    336c:	89 e3                	mov    %esp,%ebx
    336e:	89 cc                	mov    %ecx,%esp
    3370:	cd 40                	int    $0x40
    3372:	89 dc                	mov    %ebx,%esp
    3374:	89 c6                	mov    %eax,%esi
    3376:	89 75 f4             	mov    %esi,-0xc(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3379:	83 c4 14             	add    $0x14,%esp
    337c:	5b                   	pop    %ebx
    337d:	5e                   	pop    %esi
    337e:	5d                   	pop    %ebp
    337f:	c3                   	ret    

00003380 <validatetest>:

void
validatetest(void)
{
    3380:	55                   	push   %ebp
    3381:	89 e5                	mov    %esp,%ebp
    3383:	83 ec 28             	sub    $0x28,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3386:	a1 5c 58 00 00       	mov    0x585c,%eax
    338b:	c7 44 24 04 03 56 00 	movl   $0x5603,0x4(%esp)
    3392:	00 
    3393:	89 04 24             	mov    %eax,(%esp)
    3396:	e8 18 0a 00 00       	call   3db3 <printf>
  hi = 1100*1024;
    339b:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    33a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33a9:	eb 7f                	jmp    342a <validatetest+0xaa>
    if((pid = fork()) == 0){
    33ab:	e8 7c 08 00 00       	call   3c2c <fork>
    33b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    33b3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    33b7:	75 10                	jne    33c9 <validatetest+0x49>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    33b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33bc:	89 04 24             	mov    %eax,(%esp)
    33bf:	e8 91 ff ff ff       	call   3355 <validateint>
      exit();
    33c4:	e8 6b 08 00 00       	call   3c34 <exit>
    }
    sleep(0);
    33c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33d0:	e8 ef 08 00 00       	call   3cc4 <sleep>
    sleep(0);
    33d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33dc:	e8 e3 08 00 00       	call   3cc4 <sleep>
    kill(pid);
    33e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e4:	89 04 24             	mov    %eax,(%esp)
    33e7:	e8 78 08 00 00       	call   3c64 <kill>
    wait();
    33ec:	e8 4b 08 00 00       	call   3c3c <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    33f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    33f8:	c7 04 24 12 56 00 00 	movl   $0x5612,(%esp)
    33ff:	e8 90 08 00 00       	call   3c94 <link>
    3404:	83 f8 ff             	cmp    $0xffffffff,%eax
    3407:	74 1a                	je     3423 <validatetest+0xa3>
      printf(stdout, "link should not succeed\n");
    3409:	a1 5c 58 00 00       	mov    0x585c,%eax
    340e:	c7 44 24 04 1d 56 00 	movl   $0x561d,0x4(%esp)
    3415:	00 
    3416:	89 04 24             	mov    %eax,(%esp)
    3419:	e8 95 09 00 00       	call   3db3 <printf>
      exit();
    341e:	e8 11 08 00 00       	call   3c34 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3423:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    342a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    342d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3430:	0f 83 75 ff ff ff    	jae    33ab <validatetest+0x2b>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3436:	a1 5c 58 00 00       	mov    0x585c,%eax
    343b:	c7 44 24 04 36 56 00 	movl   $0x5636,0x4(%esp)
    3442:	00 
    3443:	89 04 24             	mov    %eax,(%esp)
    3446:	e8 68 09 00 00       	call   3db3 <printf>
}
    344b:	c9                   	leave  
    344c:	c3                   	ret    

0000344d <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    344d:	55                   	push   %ebp
    344e:	89 e5                	mov    %esp,%ebp
    3450:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    3453:	a1 5c 58 00 00       	mov    0x585c,%eax
    3458:	c7 44 24 04 43 56 00 	movl   $0x5643,0x4(%esp)
    345f:	00 
    3460:	89 04 24             	mov    %eax,(%esp)
    3463:	e8 4b 09 00 00       	call   3db3 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3468:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    346f:	eb 2d                	jmp    349e <bsstest+0x51>
    if(uninit[i] != '\0'){
    3471:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3474:	05 20 59 00 00       	add    $0x5920,%eax
    3479:	0f b6 00             	movzbl (%eax),%eax
    347c:	84 c0                	test   %al,%al
    347e:	74 1a                	je     349a <bsstest+0x4d>
      printf(stdout, "bss test failed\n");
    3480:	a1 5c 58 00 00       	mov    0x585c,%eax
    3485:	c7 44 24 04 4d 56 00 	movl   $0x564d,0x4(%esp)
    348c:	00 
    348d:	89 04 24             	mov    %eax,(%esp)
    3490:	e8 1e 09 00 00       	call   3db3 <printf>
      exit();
    3495:	e8 9a 07 00 00       	call   3c34 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    349a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    349e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a1:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    34a6:	76 c9                	jbe    3471 <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    34a8:	a1 5c 58 00 00       	mov    0x585c,%eax
    34ad:	c7 44 24 04 5e 56 00 	movl   $0x565e,0x4(%esp)
    34b4:	00 
    34b5:	89 04 24             	mov    %eax,(%esp)
    34b8:	e8 f6 08 00 00       	call   3db3 <printf>
}
    34bd:	c9                   	leave  
    34be:	c3                   	ret    

000034bf <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    34bf:	55                   	push   %ebp
    34c0:	89 e5                	mov    %esp,%ebp
    34c2:	83 ec 28             	sub    $0x28,%esp
  int pid, fd;

  unlink("bigarg-ok");
    34c5:	c7 04 24 6b 56 00 00 	movl   $0x566b,(%esp)
    34cc:	e8 b3 07 00 00       	call   3c84 <unlink>
  pid = fork();
    34d1:	e8 56 07 00 00       	call   3c2c <fork>
    34d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    34d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34dd:	0f 85 90 00 00 00    	jne    3573 <bigargtest+0xb4>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34ea:	eb 12                	jmp    34fe <bigargtest+0x3f>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    34ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34ef:	c7 04 85 80 58 00 00 	movl   $0x5678,0x5880(,%eax,4)
    34f6:	78 56 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    34fe:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    3502:	7e e8                	jle    34ec <bigargtest+0x2d>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3504:	c7 05 fc 58 00 00 00 	movl   $0x0,0x58fc
    350b:	00 00 00 
    printf(stdout, "bigarg test\n");
    350e:	a1 5c 58 00 00       	mov    0x585c,%eax
    3513:	c7 44 24 04 55 57 00 	movl   $0x5755,0x4(%esp)
    351a:	00 
    351b:	89 04 24             	mov    %eax,(%esp)
    351e:	e8 90 08 00 00       	call   3db3 <printf>
    exec("echo", args);
    3523:	c7 44 24 04 80 58 00 	movl   $0x5880,0x4(%esp)
    352a:	00 
    352b:	c7 04 24 7c 41 00 00 	movl   $0x417c,(%esp)
    3532:	e8 35 07 00 00       	call   3c6c <exec>
    printf(stdout, "bigarg test ok\n");
    3537:	a1 5c 58 00 00       	mov    0x585c,%eax
    353c:	c7 44 24 04 62 57 00 	movl   $0x5762,0x4(%esp)
    3543:	00 
    3544:	89 04 24             	mov    %eax,(%esp)
    3547:	e8 67 08 00 00       	call   3db3 <printf>
    fd = open("bigarg-ok", O_CREATE);
    354c:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3553:	00 
    3554:	c7 04 24 6b 56 00 00 	movl   $0x566b,(%esp)
    355b:	e8 14 07 00 00       	call   3c74 <open>
    3560:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    3563:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3566:	89 04 24             	mov    %eax,(%esp)
    3569:	e8 ee 06 00 00       	call   3c5c <close>
    exit();
    356e:	e8 c1 06 00 00       	call   3c34 <exit>
  } else if(pid < 0){
    3573:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3577:	79 1a                	jns    3593 <bigargtest+0xd4>
    printf(stdout, "bigargtest: fork failed\n");
    3579:	a1 5c 58 00 00       	mov    0x585c,%eax
    357e:	c7 44 24 04 72 57 00 	movl   $0x5772,0x4(%esp)
    3585:	00 
    3586:	89 04 24             	mov    %eax,(%esp)
    3589:	e8 25 08 00 00       	call   3db3 <printf>
    exit();
    358e:	e8 a1 06 00 00       	call   3c34 <exit>
  }
  wait();
    3593:	e8 a4 06 00 00       	call   3c3c <wait>
  fd = open("bigarg-ok", 0);
    3598:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    359f:	00 
    35a0:	c7 04 24 6b 56 00 00 	movl   $0x566b,(%esp)
    35a7:	e8 c8 06 00 00       	call   3c74 <open>
    35ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    35af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    35b3:	79 1a                	jns    35cf <bigargtest+0x110>
    printf(stdout, "bigarg test failed!\n");
    35b5:	a1 5c 58 00 00       	mov    0x585c,%eax
    35ba:	c7 44 24 04 8b 57 00 	movl   $0x578b,0x4(%esp)
    35c1:	00 
    35c2:	89 04 24             	mov    %eax,(%esp)
    35c5:	e8 e9 07 00 00       	call   3db3 <printf>
    exit();
    35ca:	e8 65 06 00 00       	call   3c34 <exit>
  }
  close(fd);
    35cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35d2:	89 04 24             	mov    %eax,(%esp)
    35d5:	e8 82 06 00 00       	call   3c5c <close>
  unlink("bigarg-ok");
    35da:	c7 04 24 6b 56 00 00 	movl   $0x566b,(%esp)
    35e1:	e8 9e 06 00 00       	call   3c84 <unlink>
}
    35e6:	c9                   	leave  
    35e7:	c3                   	ret    

000035e8 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    35e8:	55                   	push   %ebp
    35e9:	89 e5                	mov    %esp,%ebp
    35eb:	53                   	push   %ebx
    35ec:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    35ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    35f6:	c7 44 24 04 a0 57 00 	movl   $0x57a0,0x4(%esp)
    35fd:	00 
    35fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3605:	e8 a9 07 00 00       	call   3db3 <printf>

  for(nfiles = 0; ; nfiles++){
    360a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    3611:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3615:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3618:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    361d:	89 c8                	mov    %ecx,%eax
    361f:	f7 ea                	imul   %edx
    3621:	c1 fa 06             	sar    $0x6,%edx
    3624:	89 c8                	mov    %ecx,%eax
    3626:	c1 f8 1f             	sar    $0x1f,%eax
    3629:	89 d1                	mov    %edx,%ecx
    362b:	29 c1                	sub    %eax,%ecx
    362d:	89 c8                	mov    %ecx,%eax
    362f:	83 c0 30             	add    $0x30,%eax
    3632:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3635:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3638:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    363d:	89 d8                	mov    %ebx,%eax
    363f:	f7 ea                	imul   %edx
    3641:	c1 fa 06             	sar    $0x6,%edx
    3644:	89 d8                	mov    %ebx,%eax
    3646:	c1 f8 1f             	sar    $0x1f,%eax
    3649:	89 d1                	mov    %edx,%ecx
    364b:	29 c1                	sub    %eax,%ecx
    364d:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3653:	89 d9                	mov    %ebx,%ecx
    3655:	29 c1                	sub    %eax,%ecx
    3657:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    365c:	89 c8                	mov    %ecx,%eax
    365e:	f7 ea                	imul   %edx
    3660:	c1 fa 05             	sar    $0x5,%edx
    3663:	89 c8                	mov    %ecx,%eax
    3665:	c1 f8 1f             	sar    $0x1f,%eax
    3668:	89 d1                	mov    %edx,%ecx
    366a:	29 c1                	sub    %eax,%ecx
    366c:	89 c8                	mov    %ecx,%eax
    366e:	83 c0 30             	add    $0x30,%eax
    3671:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3674:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3677:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    367c:	89 d8                	mov    %ebx,%eax
    367e:	f7 ea                	imul   %edx
    3680:	c1 fa 05             	sar    $0x5,%edx
    3683:	89 d8                	mov    %ebx,%eax
    3685:	c1 f8 1f             	sar    $0x1f,%eax
    3688:	89 d1                	mov    %edx,%ecx
    368a:	29 c1                	sub    %eax,%ecx
    368c:	6b c1 64             	imul   $0x64,%ecx,%eax
    368f:	89 d9                	mov    %ebx,%ecx
    3691:	29 c1                	sub    %eax,%ecx
    3693:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3698:	89 c8                	mov    %ecx,%eax
    369a:	f7 ea                	imul   %edx
    369c:	c1 fa 02             	sar    $0x2,%edx
    369f:	89 c8                	mov    %ecx,%eax
    36a1:	c1 f8 1f             	sar    $0x1f,%eax
    36a4:	89 d1                	mov    %edx,%ecx
    36a6:	29 c1                	sub    %eax,%ecx
    36a8:	89 c8                	mov    %ecx,%eax
    36aa:	83 c0 30             	add    $0x30,%eax
    36ad:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    36b0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    36b3:	ba 67 66 66 66       	mov    $0x66666667,%edx
    36b8:	89 c8                	mov    %ecx,%eax
    36ba:	f7 ea                	imul   %edx
    36bc:	c1 fa 02             	sar    $0x2,%edx
    36bf:	89 c8                	mov    %ecx,%eax
    36c1:	c1 f8 1f             	sar    $0x1f,%eax
    36c4:	29 c2                	sub    %eax,%edx
    36c6:	89 d0                	mov    %edx,%eax
    36c8:	c1 e0 02             	shl    $0x2,%eax
    36cb:	01 d0                	add    %edx,%eax
    36cd:	01 c0                	add    %eax,%eax
    36cf:	89 ca                	mov    %ecx,%edx
    36d1:	29 c2                	sub    %eax,%edx
    36d3:	89 d0                	mov    %edx,%eax
    36d5:	83 c0 30             	add    $0x30,%eax
    36d8:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    36db:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    36df:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    36e6:	c7 44 24 04 ad 57 00 	movl   $0x57ad,0x4(%esp)
    36ed:	00 
    36ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36f5:	e8 b9 06 00 00       	call   3db3 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    36fa:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3701:	00 
    3702:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3705:	89 04 24             	mov    %eax,(%esp)
    3708:	e8 67 05 00 00       	call   3c74 <open>
    370d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    3710:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3714:	79 1d                	jns    3733 <fsfull+0x14b>
      printf(1, "open %s failed\n", name);
    3716:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3719:	89 44 24 08          	mov    %eax,0x8(%esp)
    371d:	c7 44 24 04 b9 57 00 	movl   $0x57b9,0x4(%esp)
    3724:	00 
    3725:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    372c:	e8 82 06 00 00       	call   3db3 <printf>
      break;
    3731:	eb 73                	jmp    37a6 <fsfull+0x1be>
    }
    int total = 0;
    3733:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    373a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3741:	00 
    3742:	c7 44 24 04 40 80 00 	movl   $0x8040,0x4(%esp)
    3749:	00 
    374a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    374d:	89 04 24             	mov    %eax,(%esp)
    3750:	e8 ff 04 00 00       	call   3c54 <write>
    3755:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3758:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    375f:	7f 2e                	jg     378f <fsfull+0x1a7>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3761:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3764:	89 44 24 08          	mov    %eax,0x8(%esp)
    3768:	c7 44 24 04 c9 57 00 	movl   $0x57c9,0x4(%esp)
    376f:	00 
    3770:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3777:	e8 37 06 00 00       	call   3db3 <printf>
    close(fd);
    377c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    377f:	89 04 24             	mov    %eax,(%esp)
    3782:	e8 d5 04 00 00       	call   3c5c <close>
    if(total == 0)
    3787:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    378b:	74 0e                	je     379b <fsfull+0x1b3>
    378d:	eb 0e                	jmp    379d <fsfull+0x1b5>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    378f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3792:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3795:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3799:	eb 9f                	jmp    373a <fsfull+0x152>
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    379b:	eb 09                	jmp    37a6 <fsfull+0x1be>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    379d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    37a1:	e9 6b fe ff ff       	jmp    3611 <fsfull+0x29>

  while(nfiles >= 0){
    37a6:	e9 dd 00 00 00       	jmp    3888 <fsfull+0x2a0>
    char name[64];
    name[0] = 'f';
    37ab:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    37af:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    37b2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    37b7:	89 c8                	mov    %ecx,%eax
    37b9:	f7 ea                	imul   %edx
    37bb:	c1 fa 06             	sar    $0x6,%edx
    37be:	89 c8                	mov    %ecx,%eax
    37c0:	c1 f8 1f             	sar    $0x1f,%eax
    37c3:	89 d1                	mov    %edx,%ecx
    37c5:	29 c1                	sub    %eax,%ecx
    37c7:	89 c8                	mov    %ecx,%eax
    37c9:	83 c0 30             	add    $0x30,%eax
    37cc:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    37cf:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    37d2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    37d7:	89 d8                	mov    %ebx,%eax
    37d9:	f7 ea                	imul   %edx
    37db:	c1 fa 06             	sar    $0x6,%edx
    37de:	89 d8                	mov    %ebx,%eax
    37e0:	c1 f8 1f             	sar    $0x1f,%eax
    37e3:	89 d1                	mov    %edx,%ecx
    37e5:	29 c1                	sub    %eax,%ecx
    37e7:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    37ed:	89 d9                	mov    %ebx,%ecx
    37ef:	29 c1                	sub    %eax,%ecx
    37f1:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    37f6:	89 c8                	mov    %ecx,%eax
    37f8:	f7 ea                	imul   %edx
    37fa:	c1 fa 05             	sar    $0x5,%edx
    37fd:	89 c8                	mov    %ecx,%eax
    37ff:	c1 f8 1f             	sar    $0x1f,%eax
    3802:	89 d1                	mov    %edx,%ecx
    3804:	29 c1                	sub    %eax,%ecx
    3806:	89 c8                	mov    %ecx,%eax
    3808:	83 c0 30             	add    $0x30,%eax
    380b:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    380e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3811:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3816:	89 d8                	mov    %ebx,%eax
    3818:	f7 ea                	imul   %edx
    381a:	c1 fa 05             	sar    $0x5,%edx
    381d:	89 d8                	mov    %ebx,%eax
    381f:	c1 f8 1f             	sar    $0x1f,%eax
    3822:	89 d1                	mov    %edx,%ecx
    3824:	29 c1                	sub    %eax,%ecx
    3826:	6b c1 64             	imul   $0x64,%ecx,%eax
    3829:	89 d9                	mov    %ebx,%ecx
    382b:	29 c1                	sub    %eax,%ecx
    382d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3832:	89 c8                	mov    %ecx,%eax
    3834:	f7 ea                	imul   %edx
    3836:	c1 fa 02             	sar    $0x2,%edx
    3839:	89 c8                	mov    %ecx,%eax
    383b:	c1 f8 1f             	sar    $0x1f,%eax
    383e:	89 d1                	mov    %edx,%ecx
    3840:	29 c1                	sub    %eax,%ecx
    3842:	89 c8                	mov    %ecx,%eax
    3844:	83 c0 30             	add    $0x30,%eax
    3847:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    384a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    384d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3852:	89 c8                	mov    %ecx,%eax
    3854:	f7 ea                	imul   %edx
    3856:	c1 fa 02             	sar    $0x2,%edx
    3859:	89 c8                	mov    %ecx,%eax
    385b:	c1 f8 1f             	sar    $0x1f,%eax
    385e:	29 c2                	sub    %eax,%edx
    3860:	89 d0                	mov    %edx,%eax
    3862:	c1 e0 02             	shl    $0x2,%eax
    3865:	01 d0                	add    %edx,%eax
    3867:	01 c0                	add    %eax,%eax
    3869:	89 ca                	mov    %ecx,%edx
    386b:	29 c2                	sub    %eax,%edx
    386d:	89 d0                	mov    %edx,%eax
    386f:	83 c0 30             	add    $0x30,%eax
    3872:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3875:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3879:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    387c:	89 04 24             	mov    %eax,(%esp)
    387f:	e8 00 04 00 00       	call   3c84 <unlink>
    nfiles--;
    3884:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3888:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    388c:	0f 89 19 ff ff ff    	jns    37ab <fsfull+0x1c3>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3892:	c7 44 24 04 d9 57 00 	movl   $0x57d9,0x4(%esp)
    3899:	00 
    389a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38a1:	e8 0d 05 00 00       	call   3db3 <printf>
}
    38a6:	83 c4 74             	add    $0x74,%esp
    38a9:	5b                   	pop    %ebx
    38aa:	5d                   	pop    %ebp
    38ab:	c3                   	ret    

000038ac <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    38ac:	55                   	push   %ebp
    38ad:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    38af:	a1 60 58 00 00       	mov    0x5860,%eax
    38b4:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    38ba:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    38bf:	a3 60 58 00 00       	mov    %eax,0x5860
  return randstate;
    38c4:	a1 60 58 00 00       	mov    0x5860,%eax
}
    38c9:	5d                   	pop    %ebp
    38ca:	c3                   	ret    

000038cb <main>:

int
main(int argc, char *argv[])
{
    38cb:	55                   	push   %ebp
    38cc:	89 e5                	mov    %esp,%ebp
    38ce:	83 e4 f0             	and    $0xfffffff0,%esp
    38d1:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    38d4:	c7 44 24 04 ef 57 00 	movl   $0x57ef,0x4(%esp)
    38db:	00 
    38dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38e3:	e8 cb 04 00 00       	call   3db3 <printf>

  if(open("usertests.ran", 0) >= 0){
    38e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    38ef:	00 
    38f0:	c7 04 24 03 58 00 00 	movl   $0x5803,(%esp)
    38f7:	e8 78 03 00 00       	call   3c74 <open>
    38fc:	85 c0                	test   %eax,%eax
    38fe:	78 19                	js     3919 <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3900:	c7 44 24 04 14 58 00 	movl   $0x5814,0x4(%esp)
    3907:	00 
    3908:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    390f:	e8 9f 04 00 00       	call   3db3 <printf>
    exit();
    3914:	e8 1b 03 00 00       	call   3c34 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3919:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3920:	00 
    3921:	c7 04 24 03 58 00 00 	movl   $0x5803,(%esp)
    3928:	e8 47 03 00 00       	call   3c74 <open>
    392d:	89 04 24             	mov    %eax,(%esp)
    3930:	e8 27 03 00 00       	call   3c5c <close>

  bigargtest();
    3935:	e8 85 fb ff ff       	call   34bf <bigargtest>
  bigwrite();
    393a:	e8 df ea ff ff       	call   241e <bigwrite>
  bigargtest();
    393f:	e8 7b fb ff ff       	call   34bf <bigargtest>
  bsstest();
    3944:	e8 04 fb ff ff       	call   344d <bsstest>
  sbrktest();
    3949:	e8 0e f5 ff ff       	call   2e5c <sbrktest>
  validatetest();
    394e:	e8 2d fa ff ff       	call   3380 <validatetest>

  opentest();
    3953:	e8 a8 c6 ff ff       	call   0 <opentest>
  writetest();
    3958:	e8 4e c7 ff ff       	call   ab <writetest>
  writetest1();
    395d:	e8 5e c9 ff ff       	call   2c0 <writetest1>
  createtest();
    3962:	e8 62 cb ff ff       	call   4c9 <createtest>

  mem();
    3967:	e8 03 d1 ff ff       	call   a6f <mem>
  pipe1();
    396c:	e8 39 cd ff ff       	call   6aa <pipe1>
  preempt();
    3971:	e8 22 cf ff ff       	call   898 <preempt>
  exitwait();
    3976:	e8 76 d0 ff ff       	call   9f1 <exitwait>

  rmdot();
    397b:	e8 2b ef ff ff       	call   28ab <rmdot>
  fourteen();
    3980:	e8 d0 ed ff ff       	call   2755 <fourteen>
  bigfile();
    3985:	e8 9c eb ff ff       	call   2526 <bigfile>
  subdir();
    398a:	e8 49 e3 ff ff       	call   1cd8 <subdir>
  concreate();
    398f:	e8 f2 dc ff ff       	call   1686 <concreate>
  linkunlink();
    3994:	e8 9e e0 ff ff       	call   1a37 <linkunlink>
  linktest();
    3999:	e8 9f da ff ff       	call   143d <linktest>
  unlinkread();
    399e:	e8 c5 d8 ff ff       	call   1268 <unlinkread>
  createdelete();
    39a3:	e8 0e d6 ff ff       	call   fb6 <createdelete>
  twofiles();
    39a8:	e8 a1 d3 ff ff       	call   d4e <twofiles>
  sharedfd();
    39ad:	e8 a2 d1 ff ff       	call   b54 <sharedfd>
  dirfile();
    39b2:	e8 6c f0 ff ff       	call   2a23 <dirfile>
  iref();
    39b7:	e8 a9 f2 ff ff       	call   2c65 <iref>
  forktest();
    39bc:	e8 c8 f3 ff ff       	call   2d89 <forktest>
  bigdir(); // slow
    39c1:	e8 9d e1 ff ff       	call   1b63 <bigdir>

  exectest();
    39c6:	e8 90 cc ff ff       	call   65b <exectest>

  exit();
    39cb:	e8 64 02 00 00       	call   3c34 <exit>

000039d0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    39d0:	55                   	push   %ebp
    39d1:	89 e5                	mov    %esp,%ebp
    39d3:	57                   	push   %edi
    39d4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    39d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    39d8:	8b 55 10             	mov    0x10(%ebp),%edx
    39db:	8b 45 0c             	mov    0xc(%ebp),%eax
    39de:	89 cb                	mov    %ecx,%ebx
    39e0:	89 df                	mov    %ebx,%edi
    39e2:	89 d1                	mov    %edx,%ecx
    39e4:	fc                   	cld    
    39e5:	f3 aa                	rep stos %al,%es:(%edi)
    39e7:	89 ca                	mov    %ecx,%edx
    39e9:	89 fb                	mov    %edi,%ebx
    39eb:	89 5d 08             	mov    %ebx,0x8(%ebp)
    39ee:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    39f1:	5b                   	pop    %ebx
    39f2:	5f                   	pop    %edi
    39f3:	5d                   	pop    %ebp
    39f4:	c3                   	ret    

000039f5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    39f5:	55                   	push   %ebp
    39f6:	89 e5                	mov    %esp,%ebp
    39f8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    39fb:	8b 45 08             	mov    0x8(%ebp),%eax
    39fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3a01:	90                   	nop
    3a02:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a05:	0f b6 10             	movzbl (%eax),%edx
    3a08:	8b 45 08             	mov    0x8(%ebp),%eax
    3a0b:	88 10                	mov    %dl,(%eax)
    3a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a10:	0f b6 00             	movzbl (%eax),%eax
    3a13:	84 c0                	test   %al,%al
    3a15:	0f 95 c0             	setne  %al
    3a18:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a1c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    3a20:	84 c0                	test   %al,%al
    3a22:	75 de                	jne    3a02 <strcpy+0xd>
    ;
  return os;
    3a24:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a27:	c9                   	leave  
    3a28:	c3                   	ret    

00003a29 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a29:	55                   	push   %ebp
    3a2a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a2c:	eb 08                	jmp    3a36 <strcmp+0xd>
    p++, q++;
    3a2e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a32:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a36:	8b 45 08             	mov    0x8(%ebp),%eax
    3a39:	0f b6 00             	movzbl (%eax),%eax
    3a3c:	84 c0                	test   %al,%al
    3a3e:	74 10                	je     3a50 <strcmp+0x27>
    3a40:	8b 45 08             	mov    0x8(%ebp),%eax
    3a43:	0f b6 10             	movzbl (%eax),%edx
    3a46:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a49:	0f b6 00             	movzbl (%eax),%eax
    3a4c:	38 c2                	cmp    %al,%dl
    3a4e:	74 de                	je     3a2e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3a50:	8b 45 08             	mov    0x8(%ebp),%eax
    3a53:	0f b6 00             	movzbl (%eax),%eax
    3a56:	0f b6 d0             	movzbl %al,%edx
    3a59:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a5c:	0f b6 00             	movzbl (%eax),%eax
    3a5f:	0f b6 c0             	movzbl %al,%eax
    3a62:	89 d1                	mov    %edx,%ecx
    3a64:	29 c1                	sub    %eax,%ecx
    3a66:	89 c8                	mov    %ecx,%eax
}
    3a68:	5d                   	pop    %ebp
    3a69:	c3                   	ret    

00003a6a <strlen>:

uint
strlen(char *s)
{
    3a6a:	55                   	push   %ebp
    3a6b:	89 e5                	mov    %esp,%ebp
    3a6d:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a77:	eb 04                	jmp    3a7d <strlen+0x13>
    3a79:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3a7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3a80:	03 45 08             	add    0x8(%ebp),%eax
    3a83:	0f b6 00             	movzbl (%eax),%eax
    3a86:	84 c0                	test   %al,%al
    3a88:	75 ef                	jne    3a79 <strlen+0xf>
    ;
  return n;
    3a8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a8d:	c9                   	leave  
    3a8e:	c3                   	ret    

00003a8f <memset>:

void*
memset(void *dst, int c, uint n)
{
    3a8f:	55                   	push   %ebp
    3a90:	89 e5                	mov    %esp,%ebp
    3a92:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3a95:	8b 45 10             	mov    0x10(%ebp),%eax
    3a98:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a9f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa6:	89 04 24             	mov    %eax,(%esp)
    3aa9:	e8 22 ff ff ff       	call   39d0 <stosb>
  return dst;
    3aae:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3ab1:	c9                   	leave  
    3ab2:	c3                   	ret    

00003ab3 <strchr>:

char*
strchr(const char *s, char c)
{
    3ab3:	55                   	push   %ebp
    3ab4:	89 e5                	mov    %esp,%ebp
    3ab6:	83 ec 04             	sub    $0x4,%esp
    3ab9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3abc:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3abf:	eb 14                	jmp    3ad5 <strchr+0x22>
    if(*s == c)
    3ac1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ac4:	0f b6 00             	movzbl (%eax),%eax
    3ac7:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3aca:	75 05                	jne    3ad1 <strchr+0x1e>
      return (char*)s;
    3acc:	8b 45 08             	mov    0x8(%ebp),%eax
    3acf:	eb 13                	jmp    3ae4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3ad1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ad5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ad8:	0f b6 00             	movzbl (%eax),%eax
    3adb:	84 c0                	test   %al,%al
    3add:	75 e2                	jne    3ac1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3adf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3ae4:	c9                   	leave  
    3ae5:	c3                   	ret    

00003ae6 <gets>:

char*
gets(char *buf, int max)
{
    3ae6:	55                   	push   %ebp
    3ae7:	89 e5                	mov    %esp,%ebp
    3ae9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3aec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3af3:	eb 44                	jmp    3b39 <gets+0x53>
    cc = read(0, &c, 1);
    3af5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3afc:	00 
    3afd:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3b00:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b04:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b0b:	e8 3c 01 00 00       	call   3c4c <read>
    3b10:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3b13:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b17:	7e 2d                	jle    3b46 <gets+0x60>
      break;
    buf[i++] = c;
    3b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b1c:	03 45 08             	add    0x8(%ebp),%eax
    3b1f:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    3b23:	88 10                	mov    %dl,(%eax)
    3b25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
    3b29:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b2d:	3c 0a                	cmp    $0xa,%al
    3b2f:	74 16                	je     3b47 <gets+0x61>
    3b31:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b35:	3c 0d                	cmp    $0xd,%al
    3b37:	74 0e                	je     3b47 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b3c:	83 c0 01             	add    $0x1,%eax
    3b3f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3b42:	7c b1                	jl     3af5 <gets+0xf>
    3b44:	eb 01                	jmp    3b47 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    3b46:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b4a:	03 45 08             	add    0x8(%ebp),%eax
    3b4d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3b50:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b53:	c9                   	leave  
    3b54:	c3                   	ret    

00003b55 <stat>:

int
stat(char *n, struct stat *st)
{
    3b55:	55                   	push   %ebp
    3b56:	89 e5                	mov    %esp,%ebp
    3b58:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3b5b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3b62:	00 
    3b63:	8b 45 08             	mov    0x8(%ebp),%eax
    3b66:	89 04 24             	mov    %eax,(%esp)
    3b69:	e8 06 01 00 00       	call   3c74 <open>
    3b6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b71:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b75:	79 07                	jns    3b7e <stat+0x29>
    return -1;
    3b77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b7c:	eb 23                	jmp    3ba1 <stat+0x4c>
  r = fstat(fd, st);
    3b7e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b81:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b88:	89 04 24             	mov    %eax,(%esp)
    3b8b:	e8 fc 00 00 00       	call   3c8c <fstat>
    3b90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b96:	89 04 24             	mov    %eax,(%esp)
    3b99:	e8 be 00 00 00       	call   3c5c <close>
  return r;
    3b9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3ba1:	c9                   	leave  
    3ba2:	c3                   	ret    

00003ba3 <atoi>:

int
atoi(const char *s)
{
    3ba3:	55                   	push   %ebp
    3ba4:	89 e5                	mov    %esp,%ebp
    3ba6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3ba9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3bb0:	eb 24                	jmp    3bd6 <atoi+0x33>
    n = n*10 + *s++ - '0';
    3bb2:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3bb5:	89 d0                	mov    %edx,%eax
    3bb7:	c1 e0 02             	shl    $0x2,%eax
    3bba:	01 d0                	add    %edx,%eax
    3bbc:	01 c0                	add    %eax,%eax
    3bbe:	89 c2                	mov    %eax,%edx
    3bc0:	8b 45 08             	mov    0x8(%ebp),%eax
    3bc3:	0f b6 00             	movzbl (%eax),%eax
    3bc6:	0f be c0             	movsbl %al,%eax
    3bc9:	8d 04 02             	lea    (%edx,%eax,1),%eax
    3bcc:	83 e8 30             	sub    $0x30,%eax
    3bcf:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3bd2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    3bd9:	0f b6 00             	movzbl (%eax),%eax
    3bdc:	3c 2f                	cmp    $0x2f,%al
    3bde:	7e 0a                	jle    3bea <atoi+0x47>
    3be0:	8b 45 08             	mov    0x8(%ebp),%eax
    3be3:	0f b6 00             	movzbl (%eax),%eax
    3be6:	3c 39                	cmp    $0x39,%al
    3be8:	7e c8                	jle    3bb2 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3bea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3bed:	c9                   	leave  
    3bee:	c3                   	ret    

00003bef <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3bef:	55                   	push   %ebp
    3bf0:	89 e5                	mov    %esp,%ebp
    3bf2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3bf5:	8b 45 08             	mov    0x8(%ebp),%eax
    3bf8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bfe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3c01:	eb 13                	jmp    3c16 <memmove+0x27>
    *dst++ = *src++;
    3c03:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3c06:	0f b6 10             	movzbl (%eax),%edx
    3c09:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3c0c:	88 10                	mov    %dl,(%eax)
    3c0e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3c12:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c16:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    3c1a:	0f 9f c0             	setg   %al
    3c1d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    3c21:	84 c0                	test   %al,%al
    3c23:	75 de                	jne    3c03 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3c25:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3c28:	c9                   	leave  
    3c29:	c3                   	ret    
    3c2a:	90                   	nop
    3c2b:	90                   	nop

00003c2c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c2c:	b8 01 00 00 00       	mov    $0x1,%eax
    3c31:	cd 40                	int    $0x40
    3c33:	c3                   	ret    

00003c34 <exit>:
SYSCALL(exit)
    3c34:	b8 02 00 00 00       	mov    $0x2,%eax
    3c39:	cd 40                	int    $0x40
    3c3b:	c3                   	ret    

00003c3c <wait>:
SYSCALL(wait)
    3c3c:	b8 03 00 00 00       	mov    $0x3,%eax
    3c41:	cd 40                	int    $0x40
    3c43:	c3                   	ret    

00003c44 <pipe>:
SYSCALL(pipe)
    3c44:	b8 04 00 00 00       	mov    $0x4,%eax
    3c49:	cd 40                	int    $0x40
    3c4b:	c3                   	ret    

00003c4c <read>:
SYSCALL(read)
    3c4c:	b8 05 00 00 00       	mov    $0x5,%eax
    3c51:	cd 40                	int    $0x40
    3c53:	c3                   	ret    

00003c54 <write>:
SYSCALL(write)
    3c54:	b8 10 00 00 00       	mov    $0x10,%eax
    3c59:	cd 40                	int    $0x40
    3c5b:	c3                   	ret    

00003c5c <close>:
SYSCALL(close)
    3c5c:	b8 15 00 00 00       	mov    $0x15,%eax
    3c61:	cd 40                	int    $0x40
    3c63:	c3                   	ret    

00003c64 <kill>:
SYSCALL(kill)
    3c64:	b8 06 00 00 00       	mov    $0x6,%eax
    3c69:	cd 40                	int    $0x40
    3c6b:	c3                   	ret    

00003c6c <exec>:
SYSCALL(exec)
    3c6c:	b8 07 00 00 00       	mov    $0x7,%eax
    3c71:	cd 40                	int    $0x40
    3c73:	c3                   	ret    

00003c74 <open>:
SYSCALL(open)
    3c74:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c79:	cd 40                	int    $0x40
    3c7b:	c3                   	ret    

00003c7c <mknod>:
SYSCALL(mknod)
    3c7c:	b8 11 00 00 00       	mov    $0x11,%eax
    3c81:	cd 40                	int    $0x40
    3c83:	c3                   	ret    

00003c84 <unlink>:
SYSCALL(unlink)
    3c84:	b8 12 00 00 00       	mov    $0x12,%eax
    3c89:	cd 40                	int    $0x40
    3c8b:	c3                   	ret    

00003c8c <fstat>:
SYSCALL(fstat)
    3c8c:	b8 08 00 00 00       	mov    $0x8,%eax
    3c91:	cd 40                	int    $0x40
    3c93:	c3                   	ret    

00003c94 <link>:
SYSCALL(link)
    3c94:	b8 13 00 00 00       	mov    $0x13,%eax
    3c99:	cd 40                	int    $0x40
    3c9b:	c3                   	ret    

00003c9c <mkdir>:
SYSCALL(mkdir)
    3c9c:	b8 14 00 00 00       	mov    $0x14,%eax
    3ca1:	cd 40                	int    $0x40
    3ca3:	c3                   	ret    

00003ca4 <chdir>:
SYSCALL(chdir)
    3ca4:	b8 09 00 00 00       	mov    $0x9,%eax
    3ca9:	cd 40                	int    $0x40
    3cab:	c3                   	ret    

00003cac <dup>:
SYSCALL(dup)
    3cac:	b8 0a 00 00 00       	mov    $0xa,%eax
    3cb1:	cd 40                	int    $0x40
    3cb3:	c3                   	ret    

00003cb4 <getpid>:
SYSCALL(getpid)
    3cb4:	b8 0b 00 00 00       	mov    $0xb,%eax
    3cb9:	cd 40                	int    $0x40
    3cbb:	c3                   	ret    

00003cbc <sbrk>:
SYSCALL(sbrk)
    3cbc:	b8 0c 00 00 00       	mov    $0xc,%eax
    3cc1:	cd 40                	int    $0x40
    3cc3:	c3                   	ret    

00003cc4 <sleep>:
SYSCALL(sleep)
    3cc4:	b8 0d 00 00 00       	mov    $0xd,%eax
    3cc9:	cd 40                	int    $0x40
    3ccb:	c3                   	ret    

00003ccc <uptime>:
SYSCALL(uptime)
    3ccc:	b8 0e 00 00 00       	mov    $0xe,%eax
    3cd1:	cd 40                	int    $0x40
    3cd3:	c3                   	ret    

00003cd4 <signal>:
SYSCALL(signal)
    3cd4:	b8 16 00 00 00       	mov    $0x16,%eax
    3cd9:	cd 40                	int    $0x40
    3cdb:	c3                   	ret    

00003cdc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3cdc:	55                   	push   %ebp
    3cdd:	89 e5                	mov    %esp,%ebp
    3cdf:	83 ec 28             	sub    $0x28,%esp
    3ce2:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ce5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3ce8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3cef:	00 
    3cf0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cf7:	8b 45 08             	mov    0x8(%ebp),%eax
    3cfa:	89 04 24             	mov    %eax,(%esp)
    3cfd:	e8 52 ff ff ff       	call   3c54 <write>
}
    3d02:	c9                   	leave  
    3d03:	c3                   	ret    

00003d04 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3d04:	55                   	push   %ebp
    3d05:	89 e5                	mov    %esp,%ebp
    3d07:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3d0a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3d11:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3d15:	74 17                	je     3d2e <printint+0x2a>
    3d17:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3d1b:	79 11                	jns    3d2e <printint+0x2a>
    neg = 1;
    3d1d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3d24:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d27:	f7 d8                	neg    %eax
    3d29:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d2c:	eb 06                	jmp    3d34 <printint+0x30>
  } else {
    x = xx;
    3d2e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3d34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3d3b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3d3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d41:	ba 00 00 00 00       	mov    $0x0,%edx
    3d46:	f7 f1                	div    %ecx
    3d48:	89 d0                	mov    %edx,%eax
    3d4a:	0f b6 90 64 58 00 00 	movzbl 0x5864(%eax),%edx
    3d51:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3d54:	03 45 f4             	add    -0xc(%ebp),%eax
    3d57:	88 10                	mov    %dl,(%eax)
    3d59:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
    3d5d:	8b 45 10             	mov    0x10(%ebp),%eax
    3d60:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3d63:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d66:	ba 00 00 00 00       	mov    $0x0,%edx
    3d6b:	f7 75 d4             	divl   -0x2c(%ebp)
    3d6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d71:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d75:	75 c4                	jne    3d3b <printint+0x37>
  if(neg)
    3d77:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3d7b:	74 2a                	je     3da7 <printint+0xa3>
    buf[i++] = '-';
    3d7d:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3d80:	03 45 f4             	add    -0xc(%ebp),%eax
    3d83:	c6 00 2d             	movb   $0x2d,(%eax)
    3d86:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
    3d8a:	eb 1b                	jmp    3da7 <printint+0xa3>
    putc(fd, buf[i]);
    3d8c:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3d8f:	03 45 f4             	add    -0xc(%ebp),%eax
    3d92:	0f b6 00             	movzbl (%eax),%eax
    3d95:	0f be c0             	movsbl %al,%eax
    3d98:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d9c:	8b 45 08             	mov    0x8(%ebp),%eax
    3d9f:	89 04 24             	mov    %eax,(%esp)
    3da2:	e8 35 ff ff ff       	call   3cdc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3da7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3dab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3daf:	79 db                	jns    3d8c <printint+0x88>
    putc(fd, buf[i]);
}
    3db1:	c9                   	leave  
    3db2:	c3                   	ret    

00003db3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3db3:	55                   	push   %ebp
    3db4:	89 e5                	mov    %esp,%ebp
    3db6:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3db9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3dc0:	8d 45 0c             	lea    0xc(%ebp),%eax
    3dc3:	83 c0 04             	add    $0x4,%eax
    3dc6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3dc9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3dd0:	e9 7e 01 00 00       	jmp    3f53 <printf+0x1a0>
    c = fmt[i] & 0xff;
    3dd5:	8b 55 0c             	mov    0xc(%ebp),%edx
    3dd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ddb:	8d 04 02             	lea    (%edx,%eax,1),%eax
    3dde:	0f b6 00             	movzbl (%eax),%eax
    3de1:	0f be c0             	movsbl %al,%eax
    3de4:	25 ff 00 00 00       	and    $0xff,%eax
    3de9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3dec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3df0:	75 2c                	jne    3e1e <printf+0x6b>
      if(c == '%'){
    3df2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3df6:	75 0c                	jne    3e04 <printf+0x51>
        state = '%';
    3df8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3dff:	e9 4b 01 00 00       	jmp    3f4f <printf+0x19c>
      } else {
        putc(fd, c);
    3e04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e07:	0f be c0             	movsbl %al,%eax
    3e0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e0e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e11:	89 04 24             	mov    %eax,(%esp)
    3e14:	e8 c3 fe ff ff       	call   3cdc <putc>
    3e19:	e9 31 01 00 00       	jmp    3f4f <printf+0x19c>
      }
    } else if(state == '%'){
    3e1e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3e22:	0f 85 27 01 00 00    	jne    3f4f <printf+0x19c>
      if(c == 'd'){
    3e28:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3e2c:	75 2d                	jne    3e5b <printf+0xa8>
        printint(fd, *ap, 10, 1);
    3e2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e31:	8b 00                	mov    (%eax),%eax
    3e33:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3e3a:	00 
    3e3b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3e42:	00 
    3e43:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e47:	8b 45 08             	mov    0x8(%ebp),%eax
    3e4a:	89 04 24             	mov    %eax,(%esp)
    3e4d:	e8 b2 fe ff ff       	call   3d04 <printint>
        ap++;
    3e52:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e56:	e9 ed 00 00 00       	jmp    3f48 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    3e5b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3e5f:	74 06                	je     3e67 <printf+0xb4>
    3e61:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3e65:	75 2d                	jne    3e94 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    3e67:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e6a:	8b 00                	mov    (%eax),%eax
    3e6c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3e73:	00 
    3e74:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    3e7b:	00 
    3e7c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e80:	8b 45 08             	mov    0x8(%ebp),%eax
    3e83:	89 04 24             	mov    %eax,(%esp)
    3e86:	e8 79 fe ff ff       	call   3d04 <printint>
        ap++;
    3e8b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e8f:	e9 b4 00 00 00       	jmp    3f48 <printf+0x195>
      } else if(c == 's'){
    3e94:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3e98:	75 46                	jne    3ee0 <printf+0x12d>
        s = (char*)*ap;
    3e9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e9d:	8b 00                	mov    (%eax),%eax
    3e9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3ea2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3ea6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3eaa:	75 27                	jne    3ed3 <printf+0x120>
          s = "(null)";
    3eac:	c7 45 f4 3e 58 00 00 	movl   $0x583e,-0xc(%ebp)
        while(*s != 0){
    3eb3:	eb 1f                	jmp    3ed4 <printf+0x121>
          putc(fd, *s);
    3eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eb8:	0f b6 00             	movzbl (%eax),%eax
    3ebb:	0f be c0             	movsbl %al,%eax
    3ebe:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec5:	89 04 24             	mov    %eax,(%esp)
    3ec8:	e8 0f fe ff ff       	call   3cdc <putc>
          s++;
    3ecd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3ed1:	eb 01                	jmp    3ed4 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3ed3:	90                   	nop
    3ed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ed7:	0f b6 00             	movzbl (%eax),%eax
    3eda:	84 c0                	test   %al,%al
    3edc:	75 d7                	jne    3eb5 <printf+0x102>
    3ede:	eb 68                	jmp    3f48 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3ee0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3ee4:	75 1d                	jne    3f03 <printf+0x150>
        putc(fd, *ap);
    3ee6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ee9:	8b 00                	mov    (%eax),%eax
    3eeb:	0f be c0             	movsbl %al,%eax
    3eee:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ef2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef5:	89 04 24             	mov    %eax,(%esp)
    3ef8:	e8 df fd ff ff       	call   3cdc <putc>
        ap++;
    3efd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f01:	eb 45                	jmp    3f48 <printf+0x195>
      } else if(c == '%'){
    3f03:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3f07:	75 17                	jne    3f20 <printf+0x16d>
        putc(fd, c);
    3f09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f0c:	0f be c0             	movsbl %al,%eax
    3f0f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f13:	8b 45 08             	mov    0x8(%ebp),%eax
    3f16:	89 04 24             	mov    %eax,(%esp)
    3f19:	e8 be fd ff ff       	call   3cdc <putc>
    3f1e:	eb 28                	jmp    3f48 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3f20:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    3f27:	00 
    3f28:	8b 45 08             	mov    0x8(%ebp),%eax
    3f2b:	89 04 24             	mov    %eax,(%esp)
    3f2e:	e8 a9 fd ff ff       	call   3cdc <putc>
        putc(fd, c);
    3f33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f36:	0f be c0             	movsbl %al,%eax
    3f39:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    3f40:	89 04 24             	mov    %eax,(%esp)
    3f43:	e8 94 fd ff ff       	call   3cdc <putc>
      }
      state = 0;
    3f48:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f4f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3f53:	8b 55 0c             	mov    0xc(%ebp),%edx
    3f56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f59:	8d 04 02             	lea    (%edx,%eax,1),%eax
    3f5c:	0f b6 00             	movzbl (%eax),%eax
    3f5f:	84 c0                	test   %al,%al
    3f61:	0f 85 6e fe ff ff    	jne    3dd5 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3f67:	c9                   	leave  
    3f68:	c3                   	ret    
    3f69:	90                   	nop
    3f6a:	90                   	nop
    3f6b:	90                   	nop

00003f6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f6c:	55                   	push   %ebp
    3f6d:	89 e5                	mov    %esp,%ebp
    3f6f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3f72:	8b 45 08             	mov    0x8(%ebp),%eax
    3f75:	83 e8 08             	sub    $0x8,%eax
    3f78:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f7b:	a1 08 59 00 00       	mov    0x5908,%eax
    3f80:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f83:	eb 24                	jmp    3fa9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3f85:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f88:	8b 00                	mov    (%eax),%eax
    3f8a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f8d:	77 12                	ja     3fa1 <free+0x35>
    3f8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f92:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f95:	77 24                	ja     3fbb <free+0x4f>
    3f97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f9a:	8b 00                	mov    (%eax),%eax
    3f9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f9f:	77 1a                	ja     3fbb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3fa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fa4:	8b 00                	mov    (%eax),%eax
    3fa6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3fa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3faf:	76 d4                	jbe    3f85 <free+0x19>
    3fb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fb4:	8b 00                	mov    (%eax),%eax
    3fb6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3fb9:	76 ca                	jbe    3f85 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3fbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fbe:	8b 40 04             	mov    0x4(%eax),%eax
    3fc1:	c1 e0 03             	shl    $0x3,%eax
    3fc4:	89 c2                	mov    %eax,%edx
    3fc6:	03 55 f8             	add    -0x8(%ebp),%edx
    3fc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fcc:	8b 00                	mov    (%eax),%eax
    3fce:	39 c2                	cmp    %eax,%edx
    3fd0:	75 24                	jne    3ff6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    3fd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fd5:	8b 50 04             	mov    0x4(%eax),%edx
    3fd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fdb:	8b 00                	mov    (%eax),%eax
    3fdd:	8b 40 04             	mov    0x4(%eax),%eax
    3fe0:	01 c2                	add    %eax,%edx
    3fe2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fe5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3fe8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3feb:	8b 00                	mov    (%eax),%eax
    3fed:	8b 10                	mov    (%eax),%edx
    3fef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ff2:	89 10                	mov    %edx,(%eax)
    3ff4:	eb 0a                	jmp    4000 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    3ff6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ff9:	8b 10                	mov    (%eax),%edx
    3ffb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ffe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4000:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4003:	8b 40 04             	mov    0x4(%eax),%eax
    4006:	c1 e0 03             	shl    $0x3,%eax
    4009:	03 45 fc             	add    -0x4(%ebp),%eax
    400c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    400f:	75 20                	jne    4031 <free+0xc5>
    p->s.size += bp->s.size;
    4011:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4014:	8b 50 04             	mov    0x4(%eax),%edx
    4017:	8b 45 f8             	mov    -0x8(%ebp),%eax
    401a:	8b 40 04             	mov    0x4(%eax),%eax
    401d:	01 c2                	add    %eax,%edx
    401f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4022:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4025:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4028:	8b 10                	mov    (%eax),%edx
    402a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    402d:	89 10                	mov    %edx,(%eax)
    402f:	eb 08                	jmp    4039 <free+0xcd>
  } else
    p->s.ptr = bp;
    4031:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4034:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4037:	89 10                	mov    %edx,(%eax)
  freep = p;
    4039:	8b 45 fc             	mov    -0x4(%ebp),%eax
    403c:	a3 08 59 00 00       	mov    %eax,0x5908
}
    4041:	c9                   	leave  
    4042:	c3                   	ret    

00004043 <morecore>:

static Header*
morecore(uint nu)
{
    4043:	55                   	push   %ebp
    4044:	89 e5                	mov    %esp,%ebp
    4046:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4049:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4050:	77 07                	ja     4059 <morecore+0x16>
    nu = 4096;
    4052:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4059:	8b 45 08             	mov    0x8(%ebp),%eax
    405c:	c1 e0 03             	shl    $0x3,%eax
    405f:	89 04 24             	mov    %eax,(%esp)
    4062:	e8 55 fc ff ff       	call   3cbc <sbrk>
    4067:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    406a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    406e:	75 07                	jne    4077 <morecore+0x34>
    return 0;
    4070:	b8 00 00 00 00       	mov    $0x0,%eax
    4075:	eb 22                	jmp    4099 <morecore+0x56>
  hp = (Header*)p;
    4077:	8b 45 f4             	mov    -0xc(%ebp),%eax
    407a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    407d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4080:	8b 55 08             	mov    0x8(%ebp),%edx
    4083:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4086:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4089:	83 c0 08             	add    $0x8,%eax
    408c:	89 04 24             	mov    %eax,(%esp)
    408f:	e8 d8 fe ff ff       	call   3f6c <free>
  return freep;
    4094:	a1 08 59 00 00       	mov    0x5908,%eax
}
    4099:	c9                   	leave  
    409a:	c3                   	ret    

0000409b <malloc>:

void*
malloc(uint nbytes)
{
    409b:	55                   	push   %ebp
    409c:	89 e5                	mov    %esp,%ebp
    409e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    40a1:	8b 45 08             	mov    0x8(%ebp),%eax
    40a4:	83 c0 07             	add    $0x7,%eax
    40a7:	c1 e8 03             	shr    $0x3,%eax
    40aa:	83 c0 01             	add    $0x1,%eax
    40ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    40b0:	a1 08 59 00 00       	mov    0x5908,%eax
    40b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    40b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40bc:	75 23                	jne    40e1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    40be:	c7 45 f0 00 59 00 00 	movl   $0x5900,-0x10(%ebp)
    40c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40c8:	a3 08 59 00 00       	mov    %eax,0x5908
    40cd:	a1 08 59 00 00       	mov    0x5908,%eax
    40d2:	a3 00 59 00 00       	mov    %eax,0x5900
    base.s.size = 0;
    40d7:	c7 05 04 59 00 00 00 	movl   $0x0,0x5904
    40de:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40e4:	8b 00                	mov    (%eax),%eax
    40e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    40e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ec:	8b 40 04             	mov    0x4(%eax),%eax
    40ef:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    40f2:	72 4d                	jb     4141 <malloc+0xa6>
      if(p->s.size == nunits)
    40f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40f7:	8b 40 04             	mov    0x4(%eax),%eax
    40fa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    40fd:	75 0c                	jne    410b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    40ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4102:	8b 10                	mov    (%eax),%edx
    4104:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4107:	89 10                	mov    %edx,(%eax)
    4109:	eb 26                	jmp    4131 <malloc+0x96>
      else {
        p->s.size -= nunits;
    410b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    410e:	8b 40 04             	mov    0x4(%eax),%eax
    4111:	89 c2                	mov    %eax,%edx
    4113:	2b 55 ec             	sub    -0x14(%ebp),%edx
    4116:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4119:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    411c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    411f:	8b 40 04             	mov    0x4(%eax),%eax
    4122:	c1 e0 03             	shl    $0x3,%eax
    4125:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4128:	8b 45 f4             	mov    -0xc(%ebp),%eax
    412b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    412e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4131:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4134:	a3 08 59 00 00       	mov    %eax,0x5908
      return (void*)(p + 1);
    4139:	8b 45 f4             	mov    -0xc(%ebp),%eax
    413c:	83 c0 08             	add    $0x8,%eax
    413f:	eb 38                	jmp    4179 <malloc+0xde>
    }
    if(p == freep)
    4141:	a1 08 59 00 00       	mov    0x5908,%eax
    4146:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4149:	75 1b                	jne    4166 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    414b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    414e:	89 04 24             	mov    %eax,(%esp)
    4151:	e8 ed fe ff ff       	call   4043 <morecore>
    4156:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4159:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    415d:	75 07                	jne    4166 <malloc+0xcb>
        return 0;
    415f:	b8 00 00 00 00       	mov    $0x0,%eax
    4164:	eb 13                	jmp    4179 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4166:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4169:	89 45 f0             	mov    %eax,-0x10(%ebp)
    416c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    416f:	8b 00                	mov    (%eax),%eax
    4171:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4174:	e9 70 ff ff ff       	jmp    40e9 <malloc+0x4e>
}
    4179:	c9                   	leave  
    417a:	c3                   	ret    
