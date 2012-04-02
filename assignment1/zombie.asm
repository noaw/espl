
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 72 02 00 00       	call   280 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 fa 02 00 00       	call   318 <sleep>
  exit();
  1e:	e8 65 02 00 00       	call   288 <exit>
  23:	90                   	nop

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	5b                   	pop    %ebx
  46:	5f                   	pop    %edi
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    

00000049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4f:	8b 45 08             	mov    0x8(%ebp),%eax
  52:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  55:	90                   	nop
  56:	8b 45 0c             	mov    0xc(%ebp),%eax
  59:	0f b6 10             	movzbl (%eax),%edx
  5c:	8b 45 08             	mov    0x8(%ebp),%eax
  5f:	88 10                	mov    %dl,(%eax)
  61:	8b 45 08             	mov    0x8(%ebp),%eax
  64:	0f b6 00             	movzbl (%eax),%eax
  67:	84 c0                	test   %al,%al
  69:	0f 95 c0             	setne  %al
  6c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  70:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  74:	84 c0                	test   %al,%al
  76:	75 de                	jne    56 <strcpy+0xd>
    ;
  return os;
  78:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7b:	c9                   	leave  
  7c:	c3                   	ret    

0000007d <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7d:	55                   	push   %ebp
  7e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  80:	eb 08                	jmp    8a <strcmp+0xd>
    p++, q++;
  82:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  86:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8a:	8b 45 08             	mov    0x8(%ebp),%eax
  8d:	0f b6 00             	movzbl (%eax),%eax
  90:	84 c0                	test   %al,%al
  92:	74 10                	je     a4 <strcmp+0x27>
  94:	8b 45 08             	mov    0x8(%ebp),%eax
  97:	0f b6 10             	movzbl (%eax),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	0f b6 00             	movzbl (%eax),%eax
  a0:	38 c2                	cmp    %al,%dl
  a2:	74 de                	je     82 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	0f b6 d0             	movzbl %al,%edx
  ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	0f b6 c0             	movzbl %al,%eax
  b6:	89 d1                	mov    %edx,%ecx
  b8:	29 c1                	sub    %eax,%ecx
  ba:	89 c8                	mov    %ecx,%eax
}
  bc:	5d                   	pop    %ebp
  bd:	c3                   	ret    

000000be <strlen>:

uint
strlen(char *s)
{
  be:	55                   	push   %ebp
  bf:	89 e5                	mov    %esp,%ebp
  c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cb:	eb 04                	jmp    d1 <strlen+0x13>
  cd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  d4:	03 45 08             	add    0x8(%ebp),%eax
  d7:	0f b6 00             	movzbl (%eax),%eax
  da:	84 c0                	test   %al,%al
  dc:	75 ef                	jne    cd <strlen+0xf>
    ;
  return n;
  de:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e1:	c9                   	leave  
  e2:	c3                   	ret    

000000e3 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e3:	55                   	push   %ebp
  e4:	89 e5                	mov    %esp,%ebp
  e6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e9:	8b 45 10             	mov    0x10(%ebp),%eax
  ec:	89 44 24 08          	mov    %eax,0x8(%esp)
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	89 04 24             	mov    %eax,(%esp)
  fd:	e8 22 ff ff ff       	call   24 <stosb>
  return dst;
 102:	8b 45 08             	mov    0x8(%ebp),%eax
}
 105:	c9                   	leave  
 106:	c3                   	ret    

00000107 <strchr>:

char*
strchr(const char *s, char c)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 04             	sub    $0x4,%esp
 10d:	8b 45 0c             	mov    0xc(%ebp),%eax
 110:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 113:	eb 14                	jmp    129 <strchr+0x22>
    if(*s == c)
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	0f b6 00             	movzbl (%eax),%eax
 11b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11e:	75 05                	jne    125 <strchr+0x1e>
      return (char*)s;
 120:	8b 45 08             	mov    0x8(%ebp),%eax
 123:	eb 13                	jmp    138 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 125:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	0f b6 00             	movzbl (%eax),%eax
 12f:	84 c0                	test   %al,%al
 131:	75 e2                	jne    115 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 133:	b8 00 00 00 00       	mov    $0x0,%eax
}
 138:	c9                   	leave  
 139:	c3                   	ret    

0000013a <gets>:

char*
gets(char *buf, int max)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 140:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 147:	eb 44                	jmp    18d <gets+0x53>
    cc = read(0, &c, 1);
 149:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 150:	00 
 151:	8d 45 ef             	lea    -0x11(%ebp),%eax
 154:	89 44 24 04          	mov    %eax,0x4(%esp)
 158:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15f:	e8 3c 01 00 00       	call   2a0 <read>
 164:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 167:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16b:	7e 2d                	jle    19a <gets+0x60>
      break;
    buf[i++] = c;
 16d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 170:	03 45 08             	add    0x8(%ebp),%eax
 173:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 177:	88 10                	mov    %dl,(%eax)
 179:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 17d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 181:	3c 0a                	cmp    $0xa,%al
 183:	74 16                	je     19b <gets+0x61>
 185:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 189:	3c 0d                	cmp    $0xd,%al
 18b:	74 0e                	je     19b <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 190:	83 c0 01             	add    $0x1,%eax
 193:	3b 45 0c             	cmp    0xc(%ebp),%eax
 196:	7c b1                	jl     149 <gets+0xf>
 198:	eb 01                	jmp    19b <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 19a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 19b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19e:	03 45 08             	add    0x8(%ebp),%eax
 1a1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a7:	c9                   	leave  
 1a8:	c3                   	ret    

000001a9 <stat>:

int
stat(char *n, struct stat *st)
{
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b6:	00 
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 06 01 00 00       	call   2c8 <open>
 1c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c9:	79 07                	jns    1d2 <stat+0x29>
    return -1;
 1cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d0:	eb 23                	jmp    1f5 <stat+0x4c>
  r = fstat(fd, st);
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	89 04 24             	mov    %eax,(%esp)
 1df:	e8 fc 00 00 00       	call   2e0 <fstat>
 1e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ea:	89 04 24             	mov    %eax,(%esp)
 1ed:	e8 be 00 00 00       	call   2b0 <close>
  return r;
 1f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f5:	c9                   	leave  
 1f6:	c3                   	ret    

000001f7 <atoi>:

int
atoi(const char *s)
{
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 204:	eb 24                	jmp    22a <atoi+0x33>
    n = n*10 + *s++ - '0';
 206:	8b 55 fc             	mov    -0x4(%ebp),%edx
 209:	89 d0                	mov    %edx,%eax
 20b:	c1 e0 02             	shl    $0x2,%eax
 20e:	01 d0                	add    %edx,%eax
 210:	01 c0                	add    %eax,%eax
 212:	89 c2                	mov    %eax,%edx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	0f be c0             	movsbl %al,%eax
 21d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 220:	83 e8 30             	sub    $0x30,%eax
 223:	89 45 fc             	mov    %eax,-0x4(%ebp)
 226:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	3c 2f                	cmp    $0x2f,%al
 232:	7e 0a                	jle    23e <atoi+0x47>
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	3c 39                	cmp    $0x39,%al
 23c:	7e c8                	jle    206 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 23e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 241:	c9                   	leave  
 242:	c3                   	ret    

00000243 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 24f:	8b 45 0c             	mov    0xc(%ebp),%eax
 252:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 255:	eb 13                	jmp    26a <memmove+0x27>
    *dst++ = *src++;
 257:	8b 45 f8             	mov    -0x8(%ebp),%eax
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 260:	88 10                	mov    %dl,(%eax)
 262:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 266:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 26e:	0f 9f c0             	setg   %al
 271:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 275:	84 c0                	test   %al,%al
 277:	75 de                	jne    257 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 279:	8b 45 08             	mov    0x8(%ebp),%eax
}
 27c:	c9                   	leave  
 27d:	c3                   	ret    
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 280:	b8 01 00 00 00       	mov    $0x1,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <exit>:
SYSCALL(exit)
 288:	b8 02 00 00 00       	mov    $0x2,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <wait>:
SYSCALL(wait)
 290:	b8 03 00 00 00       	mov    $0x3,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <pipe>:
SYSCALL(pipe)
 298:	b8 04 00 00 00       	mov    $0x4,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <read>:
SYSCALL(read)
 2a0:	b8 05 00 00 00       	mov    $0x5,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <write>:
SYSCALL(write)
 2a8:	b8 10 00 00 00       	mov    $0x10,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <close>:
SYSCALL(close)
 2b0:	b8 15 00 00 00       	mov    $0x15,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <kill>:
SYSCALL(kill)
 2b8:	b8 06 00 00 00       	mov    $0x6,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <exec>:
SYSCALL(exec)
 2c0:	b8 07 00 00 00       	mov    $0x7,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <open>:
SYSCALL(open)
 2c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <mknod>:
SYSCALL(mknod)
 2d0:	b8 11 00 00 00       	mov    $0x11,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <unlink>:
SYSCALL(unlink)
 2d8:	b8 12 00 00 00       	mov    $0x12,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <fstat>:
SYSCALL(fstat)
 2e0:	b8 08 00 00 00       	mov    $0x8,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <link>:
SYSCALL(link)
 2e8:	b8 13 00 00 00       	mov    $0x13,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mkdir>:
SYSCALL(mkdir)
 2f0:	b8 14 00 00 00       	mov    $0x14,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <chdir>:
SYSCALL(chdir)
 2f8:	b8 09 00 00 00       	mov    $0x9,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <dup>:
SYSCALL(dup)
 300:	b8 0a 00 00 00       	mov    $0xa,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <getpid>:
SYSCALL(getpid)
 308:	b8 0b 00 00 00       	mov    $0xb,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <sbrk>:
SYSCALL(sbrk)
 310:	b8 0c 00 00 00       	mov    $0xc,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <sleep>:
SYSCALL(sleep)
 318:	b8 0d 00 00 00       	mov    $0xd,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <uptime>:
SYSCALL(uptime)
 320:	b8 0e 00 00 00       	mov    $0xe,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <signal>:
SYSCALL(signal)
 328:	b8 16 00 00 00       	mov    $0x16,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	83 ec 28             	sub    $0x28,%esp
 336:	8b 45 0c             	mov    0xc(%ebp),%eax
 339:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 33c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 343:	00 
 344:	8d 45 f4             	lea    -0xc(%ebp),%eax
 347:	89 44 24 04          	mov    %eax,0x4(%esp)
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	89 04 24             	mov    %eax,(%esp)
 351:	e8 52 ff ff ff       	call   2a8 <write>
}
 356:	c9                   	leave  
 357:	c3                   	ret    

00000358 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 35e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 365:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 369:	74 17                	je     382 <printint+0x2a>
 36b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 36f:	79 11                	jns    382 <printint+0x2a>
    neg = 1;
 371:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	f7 d8                	neg    %eax
 37d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 380:	eb 06                	jmp    388 <printint+0x30>
  } else {
    x = xx;
 382:	8b 45 0c             	mov    0xc(%ebp),%eax
 385:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 388:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 38f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 392:	8b 45 ec             	mov    -0x14(%ebp),%eax
 395:	ba 00 00 00 00       	mov    $0x0,%edx
 39a:	f7 f1                	div    %ecx
 39c:	89 d0                	mov    %edx,%eax
 39e:	0f b6 90 d8 07 00 00 	movzbl 0x7d8(%eax),%edx
 3a5:	8d 45 dc             	lea    -0x24(%ebp),%eax
 3a8:	03 45 f4             	add    -0xc(%ebp),%eax
 3ab:	88 10                	mov    %dl,(%eax)
 3ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 3b1:	8b 45 10             	mov    0x10(%ebp),%eax
 3b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ba:	ba 00 00 00 00       	mov    $0x0,%edx
 3bf:	f7 75 d4             	divl   -0x2c(%ebp)
 3c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3c9:	75 c4                	jne    38f <printint+0x37>
  if(neg)
 3cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3cf:	74 2a                	je     3fb <printint+0xa3>
    buf[i++] = '-';
 3d1:	8d 45 dc             	lea    -0x24(%ebp),%eax
 3d4:	03 45 f4             	add    -0xc(%ebp),%eax
 3d7:	c6 00 2d             	movb   $0x2d,(%eax)
 3da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 3de:	eb 1b                	jmp    3fb <printint+0xa3>
    putc(fd, buf[i]);
 3e0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 3e3:	03 45 f4             	add    -0xc(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	0f be c0             	movsbl %al,%eax
 3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	89 04 24             	mov    %eax,(%esp)
 3f6:	e8 35 ff ff ff       	call   330 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3fb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 403:	79 db                	jns    3e0 <printint+0x88>
    putc(fd, buf[i]);
}
 405:	c9                   	leave  
 406:	c3                   	ret    

00000407 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
 40a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 40d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 414:	8d 45 0c             	lea    0xc(%ebp),%eax
 417:	83 c0 04             	add    $0x4,%eax
 41a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 41d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 424:	e9 7e 01 00 00       	jmp    5a7 <printf+0x1a0>
    c = fmt[i] & 0xff;
 429:	8b 55 0c             	mov    0xc(%ebp),%edx
 42c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 42f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 432:	0f b6 00             	movzbl (%eax),%eax
 435:	0f be c0             	movsbl %al,%eax
 438:	25 ff 00 00 00       	and    $0xff,%eax
 43d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 440:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 444:	75 2c                	jne    472 <printf+0x6b>
      if(c == '%'){
 446:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 44a:	75 0c                	jne    458 <printf+0x51>
        state = '%';
 44c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 453:	e9 4b 01 00 00       	jmp    5a3 <printf+0x19c>
      } else {
        putc(fd, c);
 458:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 45b:	0f be c0             	movsbl %al,%eax
 45e:	89 44 24 04          	mov    %eax,0x4(%esp)
 462:	8b 45 08             	mov    0x8(%ebp),%eax
 465:	89 04 24             	mov    %eax,(%esp)
 468:	e8 c3 fe ff ff       	call   330 <putc>
 46d:	e9 31 01 00 00       	jmp    5a3 <printf+0x19c>
      }
    } else if(state == '%'){
 472:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 476:	0f 85 27 01 00 00    	jne    5a3 <printf+0x19c>
      if(c == 'd'){
 47c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 480:	75 2d                	jne    4af <printf+0xa8>
        printint(fd, *ap, 10, 1);
 482:	8b 45 e8             	mov    -0x18(%ebp),%eax
 485:	8b 00                	mov    (%eax),%eax
 487:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 48e:	00 
 48f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 496:	00 
 497:	89 44 24 04          	mov    %eax,0x4(%esp)
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	89 04 24             	mov    %eax,(%esp)
 4a1:	e8 b2 fe ff ff       	call   358 <printint>
        ap++;
 4a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4aa:	e9 ed 00 00 00       	jmp    59c <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4af:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4b3:	74 06                	je     4bb <printf+0xb4>
 4b5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4b9:	75 2d                	jne    4e8 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4be:	8b 00                	mov    (%eax),%eax
 4c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4c7:	00 
 4c8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4cf:	00 
 4d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	89 04 24             	mov    %eax,(%esp)
 4da:	e8 79 fe ff ff       	call   358 <printint>
        ap++;
 4df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e3:	e9 b4 00 00 00       	jmp    59c <printf+0x195>
      } else if(c == 's'){
 4e8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4ec:	75 46                	jne    534 <printf+0x12d>
        s = (char*)*ap;
 4ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f1:	8b 00                	mov    (%eax),%eax
 4f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4fe:	75 27                	jne    527 <printf+0x120>
          s = "(null)";
 500:	c7 45 f4 cf 07 00 00 	movl   $0x7cf,-0xc(%ebp)
        while(*s != 0){
 507:	eb 1f                	jmp    528 <printf+0x121>
          putc(fd, *s);
 509:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50c:	0f b6 00             	movzbl (%eax),%eax
 50f:	0f be c0             	movsbl %al,%eax
 512:	89 44 24 04          	mov    %eax,0x4(%esp)
 516:	8b 45 08             	mov    0x8(%ebp),%eax
 519:	89 04 24             	mov    %eax,(%esp)
 51c:	e8 0f fe ff ff       	call   330 <putc>
          s++;
 521:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 525:	eb 01                	jmp    528 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 527:	90                   	nop
 528:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52b:	0f b6 00             	movzbl (%eax),%eax
 52e:	84 c0                	test   %al,%al
 530:	75 d7                	jne    509 <printf+0x102>
 532:	eb 68                	jmp    59c <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 534:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 538:	75 1d                	jne    557 <printf+0x150>
        putc(fd, *ap);
 53a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53d:	8b 00                	mov    (%eax),%eax
 53f:	0f be c0             	movsbl %al,%eax
 542:	89 44 24 04          	mov    %eax,0x4(%esp)
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	89 04 24             	mov    %eax,(%esp)
 54c:	e8 df fd ff ff       	call   330 <putc>
        ap++;
 551:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 555:	eb 45                	jmp    59c <printf+0x195>
      } else if(c == '%'){
 557:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55b:	75 17                	jne    574 <printf+0x16d>
        putc(fd, c);
 55d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 560:	0f be c0             	movsbl %al,%eax
 563:	89 44 24 04          	mov    %eax,0x4(%esp)
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	89 04 24             	mov    %eax,(%esp)
 56d:	e8 be fd ff ff       	call   330 <putc>
 572:	eb 28                	jmp    59c <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 574:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 57b:	00 
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	89 04 24             	mov    %eax,(%esp)
 582:	e8 a9 fd ff ff       	call   330 <putc>
        putc(fd, c);
 587:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58a:	0f be c0             	movsbl %al,%eax
 58d:	89 44 24 04          	mov    %eax,0x4(%esp)
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	89 04 24             	mov    %eax,(%esp)
 597:	e8 94 fd ff ff       	call   330 <putc>
      }
      state = 0;
 59c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5a7:	8b 55 0c             	mov    0xc(%ebp),%edx
 5aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ad:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5b0:	0f b6 00             	movzbl (%eax),%eax
 5b3:	84 c0                	test   %al,%al
 5b5:	0f 85 6e fe ff ff    	jne    429 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    
 5bd:	90                   	nop
 5be:	90                   	nop
 5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	83 e8 08             	sub    $0x8,%eax
 5cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5cf:	a1 f4 07 00 00       	mov    0x7f4,%eax
 5d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5d7:	eb 24                	jmp    5fd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5dc:	8b 00                	mov    (%eax),%eax
 5de:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e1:	77 12                	ja     5f5 <free+0x35>
 5e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e9:	77 24                	ja     60f <free+0x4f>
 5eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ee:	8b 00                	mov    (%eax),%eax
 5f0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f3:	77 1a                	ja     60f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 600:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 603:	76 d4                	jbe    5d9 <free+0x19>
 605:	8b 45 fc             	mov    -0x4(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 60d:	76 ca                	jbe    5d9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 60f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 612:	8b 40 04             	mov    0x4(%eax),%eax
 615:	c1 e0 03             	shl    $0x3,%eax
 618:	89 c2                	mov    %eax,%edx
 61a:	03 55 f8             	add    -0x8(%ebp),%edx
 61d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 620:	8b 00                	mov    (%eax),%eax
 622:	39 c2                	cmp    %eax,%edx
 624:	75 24                	jne    64a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 626:	8b 45 f8             	mov    -0x8(%ebp),%eax
 629:	8b 50 04             	mov    0x4(%eax),%edx
 62c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	8b 40 04             	mov    0x4(%eax),%eax
 634:	01 c2                	add    %eax,%edx
 636:	8b 45 f8             	mov    -0x8(%ebp),%eax
 639:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 63c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63f:	8b 00                	mov    (%eax),%eax
 641:	8b 10                	mov    (%eax),%edx
 643:	8b 45 f8             	mov    -0x8(%ebp),%eax
 646:	89 10                	mov    %edx,(%eax)
 648:	eb 0a                	jmp    654 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 64a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64d:	8b 10                	mov    (%eax),%edx
 64f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 652:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 40 04             	mov    0x4(%eax),%eax
 65a:	c1 e0 03             	shl    $0x3,%eax
 65d:	03 45 fc             	add    -0x4(%ebp),%eax
 660:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 663:	75 20                	jne    685 <free+0xc5>
    p->s.size += bp->s.size;
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	8b 40 04             	mov    0x4(%eax),%eax
 671:	01 c2                	add    %eax,%edx
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	8b 10                	mov    (%eax),%edx
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	89 10                	mov    %edx,(%eax)
 683:	eb 08                	jmp    68d <free+0xcd>
  } else
    p->s.ptr = bp;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 55 f8             	mov    -0x8(%ebp),%edx
 68b:	89 10                	mov    %edx,(%eax)
  freep = p;
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	a3 f4 07 00 00       	mov    %eax,0x7f4
}
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <morecore>:

static Header*
morecore(uint nu)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 69d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6a4:	77 07                	ja     6ad <morecore+0x16>
    nu = 4096;
 6a6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ad:	8b 45 08             	mov    0x8(%ebp),%eax
 6b0:	c1 e0 03             	shl    $0x3,%eax
 6b3:	89 04 24             	mov    %eax,(%esp)
 6b6:	e8 55 fc ff ff       	call   310 <sbrk>
 6bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6be:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6c2:	75 07                	jne    6cb <morecore+0x34>
    return 0;
 6c4:	b8 00 00 00 00       	mov    $0x0,%eax
 6c9:	eb 22                	jmp    6ed <morecore+0x56>
  hp = (Header*)p;
 6cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d4:	8b 55 08             	mov    0x8(%ebp),%edx
 6d7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6dd:	83 c0 08             	add    $0x8,%eax
 6e0:	89 04 24             	mov    %eax,(%esp)
 6e3:	e8 d8 fe ff ff       	call   5c0 <free>
  return freep;
 6e8:	a1 f4 07 00 00       	mov    0x7f4,%eax
}
 6ed:	c9                   	leave  
 6ee:	c3                   	ret    

000006ef <malloc>:

void*
malloc(uint nbytes)
{
 6ef:	55                   	push   %ebp
 6f0:	89 e5                	mov    %esp,%ebp
 6f2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	83 c0 07             	add    $0x7,%eax
 6fb:	c1 e8 03             	shr    $0x3,%eax
 6fe:	83 c0 01             	add    $0x1,%eax
 701:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 704:	a1 f4 07 00 00       	mov    0x7f4,%eax
 709:	89 45 f0             	mov    %eax,-0x10(%ebp)
 70c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 710:	75 23                	jne    735 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 712:	c7 45 f0 ec 07 00 00 	movl   $0x7ec,-0x10(%ebp)
 719:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71c:	a3 f4 07 00 00       	mov    %eax,0x7f4
 721:	a1 f4 07 00 00       	mov    0x7f4,%eax
 726:	a3 ec 07 00 00       	mov    %eax,0x7ec
    base.s.size = 0;
 72b:	c7 05 f0 07 00 00 00 	movl   $0x0,0x7f0
 732:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 735:	8b 45 f0             	mov    -0x10(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 740:	8b 40 04             	mov    0x4(%eax),%eax
 743:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 746:	72 4d                	jb     795 <malloc+0xa6>
      if(p->s.size == nunits)
 748:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74b:	8b 40 04             	mov    0x4(%eax),%eax
 74e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 751:	75 0c                	jne    75f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 753:	8b 45 f4             	mov    -0xc(%ebp),%eax
 756:	8b 10                	mov    (%eax),%edx
 758:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75b:	89 10                	mov    %edx,(%eax)
 75d:	eb 26                	jmp    785 <malloc+0x96>
      else {
        p->s.size -= nunits;
 75f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 762:	8b 40 04             	mov    0x4(%eax),%eax
 765:	89 c2                	mov    %eax,%edx
 767:	2b 55 ec             	sub    -0x14(%ebp),%edx
 76a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 770:	8b 45 f4             	mov    -0xc(%ebp),%eax
 773:	8b 40 04             	mov    0x4(%eax),%eax
 776:	c1 e0 03             	shl    $0x3,%eax
 779:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 782:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 785:	8b 45 f0             	mov    -0x10(%ebp),%eax
 788:	a3 f4 07 00 00       	mov    %eax,0x7f4
      return (void*)(p + 1);
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	83 c0 08             	add    $0x8,%eax
 793:	eb 38                	jmp    7cd <malloc+0xde>
    }
    if(p == freep)
 795:	a1 f4 07 00 00       	mov    0x7f4,%eax
 79a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 79d:	75 1b                	jne    7ba <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 79f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a2:	89 04 24             	mov    %eax,(%esp)
 7a5:	e8 ed fe ff ff       	call   697 <morecore>
 7aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b1:	75 07                	jne    7ba <malloc+0xcb>
        return 0;
 7b3:	b8 00 00 00 00       	mov    $0x0,%eax
 7b8:	eb 13                	jmp    7cd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7c8:	e9 70 ff ff ff       	jmp    73d <malloc+0x4e>
}
 7cd:	c9                   	leave  
 7ce:	c3                   	ret    
