
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 63 09 00 	movl   $0x963,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 5b 05 00 00       	call   59b <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 1b 02 00 00       	call   277 <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 11                	jmp    7a <main+0x7a>
    if(fork() > 0)
  69:	e8 a6 03 00 00       	call   414 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7f 14                	jg     86 <main+0x86>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  72:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  79:	01 
  7a:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  81:	03 
  82:	7e e5                	jle    69 <main+0x69>
  84:	eb 01                	jmp    87 <main+0x87>
    if(fork() > 0)
      break;
  86:	90                   	nop

  printf(1, "write %d\n", i);
  87:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8e:	89 44 24 08          	mov    %eax,0x8(%esp)
  92:	c7 44 24 04 76 09 00 	movl   $0x976,0x4(%esp)
  99:	00 
  9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a1:	e8 f5 04 00 00       	call   59b <printf>

  path[8] += i;
  a6:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ad:	00 
  ae:	89 c2                	mov    %eax,%edx
  b0:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b7:	8d 04 02             	lea    (%edx,%eax,1),%eax
  ba:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  c1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c8:	00 
  c9:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  d0:	89 04 24             	mov    %eax,(%esp)
  d3:	e8 84 03 00 00       	call   45c <open>
  d8:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  df:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e6:	00 00 00 00 
  ea:	eb 27                	jmp    113 <main+0x113>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ec:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f3:	00 
  f4:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  fc:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 103:	89 04 24             	mov    %eax,(%esp)
 106:	e8 31 03 00 00       	call   43c <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 10b:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 112:	01 
 113:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 11a:	13 
 11b:	7e cf                	jle    ec <main+0xec>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 11d:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 124:	89 04 24             	mov    %eax,(%esp)
 127:	e8 18 03 00 00       	call   444 <close>

  printf(1, "read\n");
 12c:	c7 44 24 04 80 09 00 	movl   $0x980,0x4(%esp)
 133:	00 
 134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13b:	e8 5b 04 00 00       	call   59b <printf>

  fd = open(path, O_RDONLY);
 140:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 147:	00 
 148:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14f:	89 04 24             	mov    %eax,(%esp)
 152:	e8 05 03 00 00       	call   45c <open>
 157:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15e:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 165:	00 00 00 00 
 169:	eb 27                	jmp    192 <main+0x192>
    read(fd, data, sizeof(data));
 16b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 172:	00 
 173:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 177:	89 44 24 04          	mov    %eax,0x4(%esp)
 17b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 182:	89 04 24             	mov    %eax,(%esp)
 185:	e8 aa 02 00 00       	call   434 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 18a:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 191:	01 
 192:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 199:	13 
 19a:	7e cf                	jle    16b <main+0x16b>
    read(fd, data, sizeof(data));
  close(fd);
 19c:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a3:	89 04 24             	mov    %eax,(%esp)
 1a6:	e8 99 02 00 00       	call   444 <close>

  wait();
 1ab:	e8 74 02 00 00       	call   424 <wait>
  
  exit();
 1b0:	e8 67 02 00 00       	call   41c <exit>
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop

000001b8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	57                   	push   %edi
 1bc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c0:	8b 55 10             	mov    0x10(%ebp),%edx
 1c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c6:	89 cb                	mov    %ecx,%ebx
 1c8:	89 df                	mov    %ebx,%edi
 1ca:	89 d1                	mov    %edx,%ecx
 1cc:	fc                   	cld    
 1cd:	f3 aa                	rep stos %al,%es:(%edi)
 1cf:	89 ca                	mov    %ecx,%edx
 1d1:	89 fb                	mov    %edi,%ebx
 1d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d9:	5b                   	pop    %ebx
 1da:	5f                   	pop    %edi
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    

000001dd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e9:	90                   	nop
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	0f b6 10             	movzbl (%eax),%edx
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	88 10                	mov    %dl,(%eax)
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
 1f8:	0f b6 00             	movzbl (%eax),%eax
 1fb:	84 c0                	test   %al,%al
 1fd:	0f 95 c0             	setne  %al
 200:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 204:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 208:	84 c0                	test   %al,%al
 20a:	75 de                	jne    1ea <strcpy+0xd>
    ;
  return os;
 20c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20f:	c9                   	leave  
 210:	c3                   	ret    

00000211 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 214:	eb 08                	jmp    21e <strcmp+0xd>
    p++, q++;
 216:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	0f b6 00             	movzbl (%eax),%eax
 224:	84 c0                	test   %al,%al
 226:	74 10                	je     238 <strcmp+0x27>
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 10             	movzbl (%eax),%edx
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	38 c2                	cmp    %al,%dl
 236:	74 de                	je     216 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 238:	8b 45 08             	mov    0x8(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 d0             	movzbl %al,%edx
 241:	8b 45 0c             	mov    0xc(%ebp),%eax
 244:	0f b6 00             	movzbl (%eax),%eax
 247:	0f b6 c0             	movzbl %al,%eax
 24a:	89 d1                	mov    %edx,%ecx
 24c:	29 c1                	sub    %eax,%ecx
 24e:	89 c8                	mov    %ecx,%eax
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25f:	eb 04                	jmp    265 <strlen+0x13>
 261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 265:	8b 45 fc             	mov    -0x4(%ebp),%eax
 268:	03 45 08             	add    0x8(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	84 c0                	test   %al,%al
 270:	75 ef                	jne    261 <strlen+0xf>
    ;
  return n;
 272:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 275:	c9                   	leave  
 276:	c3                   	ret    

00000277 <memset>:

void*
memset(void *dst, int c, uint n)
{
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 27d:	8b 45 10             	mov    0x10(%ebp),%eax
 280:	89 44 24 08          	mov    %eax,0x8(%esp)
 284:	8b 45 0c             	mov    0xc(%ebp),%eax
 287:	89 44 24 04          	mov    %eax,0x4(%esp)
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	89 04 24             	mov    %eax,(%esp)
 291:	e8 22 ff ff ff       	call   1b8 <stosb>
  return dst;
 296:	8b 45 08             	mov    0x8(%ebp),%eax
}
 299:	c9                   	leave  
 29a:	c3                   	ret    

0000029b <strchr>:

char*
strchr(const char *s, char c)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	83 ec 04             	sub    $0x4,%esp
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2a7:	eb 14                	jmp    2bd <strchr+0x22>
    if(*s == c)
 2a9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ac:	0f b6 00             	movzbl (%eax),%eax
 2af:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2b2:	75 05                	jne    2b9 <strchr+0x1e>
      return (char*)s;
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	eb 13                	jmp    2cc <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	75 e2                	jne    2a9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    

000002ce <gets>:

char*
gets(char *buf, int max)
{
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2db:	eb 44                	jmp    321 <gets+0x53>
    cc = read(0, &c, 1);
 2dd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2e4:	00 
 2e5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2f3:	e8 3c 01 00 00       	call   434 <read>
 2f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ff:	7e 2d                	jle    32e <gets+0x60>
      break;
    buf[i++] = c;
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	03 45 08             	add    0x8(%ebp),%eax
 307:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 30b:	88 10                	mov    %dl,(%eax)
 30d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 311:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 315:	3c 0a                	cmp    $0xa,%al
 317:	74 16                	je     32f <gets+0x61>
 319:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 0e                	je     32f <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 321:	8b 45 f4             	mov    -0xc(%ebp),%eax
 324:	83 c0 01             	add    $0x1,%eax
 327:	3b 45 0c             	cmp    0xc(%ebp),%eax
 32a:	7c b1                	jl     2dd <gets+0xf>
 32c:	eb 01                	jmp    32f <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 32e:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 32f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 332:	03 45 08             	add    0x8(%ebp),%eax
 335:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <stat>:

int
stat(char *n, struct stat *st)
{
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 343:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 34a:	00 
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	89 04 24             	mov    %eax,(%esp)
 351:	e8 06 01 00 00       	call   45c <open>
 356:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 359:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35d:	79 07                	jns    366 <stat+0x29>
    return -1;
 35f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 364:	eb 23                	jmp    389 <stat+0x4c>
  r = fstat(fd, st);
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 44 24 04          	mov    %eax,0x4(%esp)
 36d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 370:	89 04 24             	mov    %eax,(%esp)
 373:	e8 fc 00 00 00       	call   474 <fstat>
 378:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 37b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37e:	89 04 24             	mov    %eax,(%esp)
 381:	e8 be 00 00 00       	call   444 <close>
  return r;
 386:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 389:	c9                   	leave  
 38a:	c3                   	ret    

0000038b <atoi>:

int
atoi(const char *s)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 391:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 398:	eb 24                	jmp    3be <atoi+0x33>
    n = n*10 + *s++ - '0';
 39a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39d:	89 d0                	mov    %edx,%eax
 39f:	c1 e0 02             	shl    $0x2,%eax
 3a2:	01 d0                	add    %edx,%eax
 3a4:	01 c0                	add    %eax,%eax
 3a6:	89 c2                	mov    %eax,%edx
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	0f b6 00             	movzbl (%eax),%eax
 3ae:	0f be c0             	movsbl %al,%eax
 3b1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3b4:	83 e8 30             	sub    $0x30,%eax
 3b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3be:	8b 45 08             	mov    0x8(%ebp),%eax
 3c1:	0f b6 00             	movzbl (%eax),%eax
 3c4:	3c 2f                	cmp    $0x2f,%al
 3c6:	7e 0a                	jle    3d2 <atoi+0x47>
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	0f b6 00             	movzbl (%eax),%eax
 3ce:	3c 39                	cmp    $0x39,%al
 3d0:	7e c8                	jle    39a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d5:	c9                   	leave  
 3d6:	c3                   	ret    

000003d7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e9:	eb 13                	jmp    3fe <memmove+0x27>
    *dst++ = *src++;
 3eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3ee:	0f b6 10             	movzbl (%eax),%edx
 3f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3f4:	88 10                	mov    %dl,(%eax)
 3f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3fa:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 402:	0f 9f c0             	setg   %al
 405:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 409:	84 c0                	test   %al,%al
 40b:	75 de                	jne    3eb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 410:	c9                   	leave  
 411:	c3                   	ret    
 412:	90                   	nop
 413:	90                   	nop

00000414 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 414:	b8 01 00 00 00       	mov    $0x1,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <exit>:
SYSCALL(exit)
 41c:	b8 02 00 00 00       	mov    $0x2,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <wait>:
SYSCALL(wait)
 424:	b8 03 00 00 00       	mov    $0x3,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <pipe>:
SYSCALL(pipe)
 42c:	b8 04 00 00 00       	mov    $0x4,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <read>:
SYSCALL(read)
 434:	b8 05 00 00 00       	mov    $0x5,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <write>:
SYSCALL(write)
 43c:	b8 10 00 00 00       	mov    $0x10,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <close>:
SYSCALL(close)
 444:	b8 15 00 00 00       	mov    $0x15,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <kill>:
SYSCALL(kill)
 44c:	b8 06 00 00 00       	mov    $0x6,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <exec>:
SYSCALL(exec)
 454:	b8 07 00 00 00       	mov    $0x7,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <open>:
SYSCALL(open)
 45c:	b8 0f 00 00 00       	mov    $0xf,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <mknod>:
SYSCALL(mknod)
 464:	b8 11 00 00 00       	mov    $0x11,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <unlink>:
SYSCALL(unlink)
 46c:	b8 12 00 00 00       	mov    $0x12,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <fstat>:
SYSCALL(fstat)
 474:	b8 08 00 00 00       	mov    $0x8,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <link>:
SYSCALL(link)
 47c:	b8 13 00 00 00       	mov    $0x13,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <mkdir>:
SYSCALL(mkdir)
 484:	b8 14 00 00 00       	mov    $0x14,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <chdir>:
SYSCALL(chdir)
 48c:	b8 09 00 00 00       	mov    $0x9,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <dup>:
SYSCALL(dup)
 494:	b8 0a 00 00 00       	mov    $0xa,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <getpid>:
SYSCALL(getpid)
 49c:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sbrk>:
SYSCALL(sbrk)
 4a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <sleep>:
SYSCALL(sleep)
 4ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <uptime>:
SYSCALL(uptime)
 4b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <signal>:
SYSCALL(signal)
 4bc:	b8 16 00 00 00       	mov    $0x16,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	83 ec 28             	sub    $0x28,%esp
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d7:	00 
 4d8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4db:	89 44 24 04          	mov    %eax,0x4(%esp)
 4df:	8b 45 08             	mov    0x8(%ebp),%eax
 4e2:	89 04 24             	mov    %eax,(%esp)
 4e5:	e8 52 ff ff ff       	call   43c <write>
}
 4ea:	c9                   	leave  
 4eb:	c3                   	ret    

000004ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4f9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4fd:	74 17                	je     516 <printint+0x2a>
 4ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 503:	79 11                	jns    516 <printint+0x2a>
    neg = 1;
 505:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	f7 d8                	neg    %eax
 511:	89 45 ec             	mov    %eax,-0x14(%ebp)
 514:	eb 06                	jmp    51c <printint+0x30>
  } else {
    x = xx;
 516:	8b 45 0c             	mov    0xc(%ebp),%eax
 519:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 51c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 523:	8b 4d 10             	mov    0x10(%ebp),%ecx
 526:	8b 45 ec             	mov    -0x14(%ebp),%eax
 529:	ba 00 00 00 00       	mov    $0x0,%edx
 52e:	f7 f1                	div    %ecx
 530:	89 d0                	mov    %edx,%eax
 532:	0f b6 90 90 09 00 00 	movzbl 0x990(%eax),%edx
 539:	8d 45 dc             	lea    -0x24(%ebp),%eax
 53c:	03 45 f4             	add    -0xc(%ebp),%eax
 53f:	88 10                	mov    %dl,(%eax)
 541:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 545:	8b 45 10             	mov    0x10(%ebp),%eax
 548:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 54b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 54e:	ba 00 00 00 00       	mov    $0x0,%edx
 553:	f7 75 d4             	divl   -0x2c(%ebp)
 556:	89 45 ec             	mov    %eax,-0x14(%ebp)
 559:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55d:	75 c4                	jne    523 <printint+0x37>
  if(neg)
 55f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 563:	74 2a                	je     58f <printint+0xa3>
    buf[i++] = '-';
 565:	8d 45 dc             	lea    -0x24(%ebp),%eax
 568:	03 45 f4             	add    -0xc(%ebp),%eax
 56b:	c6 00 2d             	movb   $0x2d,(%eax)
 56e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 572:	eb 1b                	jmp    58f <printint+0xa3>
    putc(fd, buf[i]);
 574:	8d 45 dc             	lea    -0x24(%ebp),%eax
 577:	03 45 f4             	add    -0xc(%ebp),%eax
 57a:	0f b6 00             	movzbl (%eax),%eax
 57d:	0f be c0             	movsbl %al,%eax
 580:	89 44 24 04          	mov    %eax,0x4(%esp)
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 04 24             	mov    %eax,(%esp)
 58a:	e8 35 ff ff ff       	call   4c4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 58f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 593:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 597:	79 db                	jns    574 <printint+0x88>
    putc(fd, buf[i]);
}
 599:	c9                   	leave  
 59a:	c3                   	ret    

0000059b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 59b:	55                   	push   %ebp
 59c:	89 e5                	mov    %esp,%ebp
 59e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5a8:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ab:	83 c0 04             	add    $0x4,%eax
 5ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5b8:	e9 7e 01 00 00       	jmp    73b <printf+0x1a0>
    c = fmt[i] & 0xff;
 5bd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	25 ff 00 00 00       	and    $0xff,%eax
 5d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d8:	75 2c                	jne    606 <printf+0x6b>
      if(c == '%'){
 5da:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5de:	75 0c                	jne    5ec <printf+0x51>
        state = '%';
 5e0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5e7:	e9 4b 01 00 00       	jmp    737 <printf+0x19c>
      } else {
        putc(fd, c);
 5ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ef:	0f be c0             	movsbl %al,%eax
 5f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	89 04 24             	mov    %eax,(%esp)
 5fc:	e8 c3 fe ff ff       	call   4c4 <putc>
 601:	e9 31 01 00 00       	jmp    737 <printf+0x19c>
      }
    } else if(state == '%'){
 606:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 60a:	0f 85 27 01 00 00    	jne    737 <printf+0x19c>
      if(c == 'd'){
 610:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 614:	75 2d                	jne    643 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 616:	8b 45 e8             	mov    -0x18(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 622:	00 
 623:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 62a:	00 
 62b:	89 44 24 04          	mov    %eax,0x4(%esp)
 62f:	8b 45 08             	mov    0x8(%ebp),%eax
 632:	89 04 24             	mov    %eax,(%esp)
 635:	e8 b2 fe ff ff       	call   4ec <printint>
        ap++;
 63a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 63e:	e9 ed 00 00 00       	jmp    730 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 643:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 647:	74 06                	je     64f <printf+0xb4>
 649:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 64d:	75 2d                	jne    67c <printf+0xe1>
        printint(fd, *ap, 16, 0);
 64f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 652:	8b 00                	mov    (%eax),%eax
 654:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 65b:	00 
 65c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 663:	00 
 664:	89 44 24 04          	mov    %eax,0x4(%esp)
 668:	8b 45 08             	mov    0x8(%ebp),%eax
 66b:	89 04 24             	mov    %eax,(%esp)
 66e:	e8 79 fe ff ff       	call   4ec <printint>
        ap++;
 673:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 677:	e9 b4 00 00 00       	jmp    730 <printf+0x195>
      } else if(c == 's'){
 67c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 680:	75 46                	jne    6c8 <printf+0x12d>
        s = (char*)*ap;
 682:	8b 45 e8             	mov    -0x18(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 68a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 68e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 692:	75 27                	jne    6bb <printf+0x120>
          s = "(null)";
 694:	c7 45 f4 86 09 00 00 	movl   $0x986,-0xc(%ebp)
        while(*s != 0){
 69b:	eb 1f                	jmp    6bc <printf+0x121>
          putc(fd, *s);
 69d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a0:	0f b6 00             	movzbl (%eax),%eax
 6a3:	0f be c0             	movsbl %al,%eax
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 0f fe ff ff       	call   4c4 <putc>
          s++;
 6b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 6b9:	eb 01                	jmp    6bc <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6bb:	90                   	nop
 6bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6bf:	0f b6 00             	movzbl (%eax),%eax
 6c2:	84 c0                	test   %al,%al
 6c4:	75 d7                	jne    69d <printf+0x102>
 6c6:	eb 68                	jmp    730 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6c8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6cc:	75 1d                	jne    6eb <printf+0x150>
        putc(fd, *ap);
 6ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d1:	8b 00                	mov    (%eax),%eax
 6d3:	0f be c0             	movsbl %al,%eax
 6d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6da:	8b 45 08             	mov    0x8(%ebp),%eax
 6dd:	89 04 24             	mov    %eax,(%esp)
 6e0:	e8 df fd ff ff       	call   4c4 <putc>
        ap++;
 6e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e9:	eb 45                	jmp    730 <printf+0x195>
      } else if(c == '%'){
 6eb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ef:	75 17                	jne    708 <printf+0x16d>
        putc(fd, c);
 6f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f4:	0f be c0             	movsbl %al,%eax
 6f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	89 04 24             	mov    %eax,(%esp)
 701:	e8 be fd ff ff       	call   4c4 <putc>
 706:	eb 28                	jmp    730 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 708:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 70f:	00 
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 a9 fd ff ff       	call   4c4 <putc>
        putc(fd, c);
 71b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71e:	0f be c0             	movsbl %al,%eax
 721:	89 44 24 04          	mov    %eax,0x4(%esp)
 725:	8b 45 08             	mov    0x8(%ebp),%eax
 728:	89 04 24             	mov    %eax,(%esp)
 72b:	e8 94 fd ff ff       	call   4c4 <putc>
      }
      state = 0;
 730:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 737:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 73b:	8b 55 0c             	mov    0xc(%ebp),%edx
 73e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 741:	8d 04 02             	lea    (%edx,%eax,1),%eax
 744:	0f b6 00             	movzbl (%eax),%eax
 747:	84 c0                	test   %al,%al
 749:	0f 85 6e fe ff ff    	jne    5bd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 74f:	c9                   	leave  
 750:	c3                   	ret    
 751:	90                   	nop
 752:	90                   	nop
 753:	90                   	nop

00000754 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 754:	55                   	push   %ebp
 755:	89 e5                	mov    %esp,%ebp
 757:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	83 e8 08             	sub    $0x8,%eax
 760:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 763:	a1 ac 09 00 00       	mov    0x9ac,%eax
 768:	89 45 fc             	mov    %eax,-0x4(%ebp)
 76b:	eb 24                	jmp    791 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 00                	mov    (%eax),%eax
 772:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 775:	77 12                	ja     789 <free+0x35>
 777:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77d:	77 24                	ja     7a3 <free+0x4f>
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	8b 00                	mov    (%eax),%eax
 784:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 787:	77 1a                	ja     7a3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 791:	8b 45 f8             	mov    -0x8(%ebp),%eax
 794:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 797:	76 d4                	jbe    76d <free+0x19>
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a1:	76 ca                	jbe    76d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a6:	8b 40 04             	mov    0x4(%eax),%eax
 7a9:	c1 e0 03             	shl    $0x3,%eax
 7ac:	89 c2                	mov    %eax,%edx
 7ae:	03 55 f8             	add    -0x8(%ebp),%edx
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	39 c2                	cmp    %eax,%edx
 7b8:	75 24                	jne    7de <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	8b 40 04             	mov    0x4(%eax),%eax
 7c8:	01 c2                	add    %eax,%edx
 7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	8b 10                	mov    (%eax),%edx
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	89 10                	mov    %edx,(%eax)
 7dc:	eb 0a                	jmp    7e8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e1:	8b 10                	mov    (%eax),%edx
 7e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	8b 40 04             	mov    0x4(%eax),%eax
 7ee:	c1 e0 03             	shl    $0x3,%eax
 7f1:	03 45 fc             	add    -0x4(%ebp),%eax
 7f4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f7:	75 20                	jne    819 <free+0xc5>
    p->s.size += bp->s.size;
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	8b 50 04             	mov    0x4(%eax),%edx
 7ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 802:	8b 40 04             	mov    0x4(%eax),%eax
 805:	01 c2                	add    %eax,%edx
 807:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 80d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 810:	8b 10                	mov    (%eax),%edx
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	89 10                	mov    %edx,(%eax)
 817:	eb 08                	jmp    821 <free+0xcd>
  } else
    p->s.ptr = bp;
 819:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 81f:	89 10                	mov    %edx,(%eax)
  freep = p;
 821:	8b 45 fc             	mov    -0x4(%ebp),%eax
 824:	a3 ac 09 00 00       	mov    %eax,0x9ac
}
 829:	c9                   	leave  
 82a:	c3                   	ret    

0000082b <morecore>:

static Header*
morecore(uint nu)
{
 82b:	55                   	push   %ebp
 82c:	89 e5                	mov    %esp,%ebp
 82e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 831:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 838:	77 07                	ja     841 <morecore+0x16>
    nu = 4096;
 83a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 841:	8b 45 08             	mov    0x8(%ebp),%eax
 844:	c1 e0 03             	shl    $0x3,%eax
 847:	89 04 24             	mov    %eax,(%esp)
 84a:	e8 55 fc ff ff       	call   4a4 <sbrk>
 84f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 852:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 856:	75 07                	jne    85f <morecore+0x34>
    return 0;
 858:	b8 00 00 00 00       	mov    $0x0,%eax
 85d:	eb 22                	jmp    881 <morecore+0x56>
  hp = (Header*)p;
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 865:	8b 45 f0             	mov    -0x10(%ebp),%eax
 868:	8b 55 08             	mov    0x8(%ebp),%edx
 86b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 86e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 871:	83 c0 08             	add    $0x8,%eax
 874:	89 04 24             	mov    %eax,(%esp)
 877:	e8 d8 fe ff ff       	call   754 <free>
  return freep;
 87c:	a1 ac 09 00 00       	mov    0x9ac,%eax
}
 881:	c9                   	leave  
 882:	c3                   	ret    

00000883 <malloc>:

void*
malloc(uint nbytes)
{
 883:	55                   	push   %ebp
 884:	89 e5                	mov    %esp,%ebp
 886:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	83 c0 07             	add    $0x7,%eax
 88f:	c1 e8 03             	shr    $0x3,%eax
 892:	83 c0 01             	add    $0x1,%eax
 895:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 898:	a1 ac 09 00 00       	mov    0x9ac,%eax
 89d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8a4:	75 23                	jne    8c9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8a6:	c7 45 f0 a4 09 00 00 	movl   $0x9a4,-0x10(%ebp)
 8ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b0:	a3 ac 09 00 00       	mov    %eax,0x9ac
 8b5:	a1 ac 09 00 00       	mov    0x9ac,%eax
 8ba:	a3 a4 09 00 00       	mov    %eax,0x9a4
    base.s.size = 0;
 8bf:	c7 05 a8 09 00 00 00 	movl   $0x0,0x9a8
 8c6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cc:	8b 00                	mov    (%eax),%eax
 8ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d4:	8b 40 04             	mov    0x4(%eax),%eax
 8d7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8da:	72 4d                	jb     929 <malloc+0xa6>
      if(p->s.size == nunits)
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8e5:	75 0c                	jne    8f3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ef:	89 10                	mov    %edx,(%eax)
 8f1:	eb 26                	jmp    919 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	8b 40 04             	mov    0x4(%eax),%eax
 8f9:	89 c2                	mov    %eax,%edx
 8fb:	2b 55 ec             	sub    -0x14(%ebp),%edx
 8fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 901:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 904:	8b 45 f4             	mov    -0xc(%ebp),%eax
 907:	8b 40 04             	mov    0x4(%eax),%eax
 90a:	c1 e0 03             	shl    $0x3,%eax
 90d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 910:	8b 45 f4             	mov    -0xc(%ebp),%eax
 913:	8b 55 ec             	mov    -0x14(%ebp),%edx
 916:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 919:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91c:	a3 ac 09 00 00       	mov    %eax,0x9ac
      return (void*)(p + 1);
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	83 c0 08             	add    $0x8,%eax
 927:	eb 38                	jmp    961 <malloc+0xde>
    }
    if(p == freep)
 929:	a1 ac 09 00 00       	mov    0x9ac,%eax
 92e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 931:	75 1b                	jne    94e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 933:	8b 45 ec             	mov    -0x14(%ebp),%eax
 936:	89 04 24             	mov    %eax,(%esp)
 939:	e8 ed fe ff ff       	call   82b <morecore>
 93e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 941:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 945:	75 07                	jne    94e <malloc+0xcb>
        return 0;
 947:	b8 00 00 00 00       	mov    $0x0,%eax
 94c:	eb 13                	jmp    961 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 951:	89 45 f0             	mov    %eax,-0x10(%ebp)
 954:	8b 45 f4             	mov    -0xc(%ebp),%eax
 957:	8b 00                	mov    (%eax),%eax
 959:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 95c:	e9 70 ff ff ff       	jmp    8d1 <malloc+0x4e>
}
 961:	c9                   	leave  
 962:	c3                   	ret    
