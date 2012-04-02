
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 27 08 00 	movl   $0x827,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 3c 04 00 00       	call   45f <printf>
    exit();
  23:	e8 b8 02 00 00       	call   2e0 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 fc 02 00 00       	call   340 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 3a 08 00 	movl   $0x83a,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 eb 03 00 00       	call   45f <printf>
  exit();
  74:	e8 67 02 00 00       	call   2e0 <exit>
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop

0000007c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	57                   	push   %edi
  80:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  81:	8b 4d 08             	mov    0x8(%ebp),%ecx
  84:	8b 55 10             	mov    0x10(%ebp),%edx
  87:	8b 45 0c             	mov    0xc(%ebp),%eax
  8a:	89 cb                	mov    %ecx,%ebx
  8c:	89 df                	mov    %ebx,%edi
  8e:	89 d1                	mov    %edx,%ecx
  90:	fc                   	cld    
  91:	f3 aa                	rep stos %al,%es:(%edi)
  93:	89 ca                	mov    %ecx,%edx
  95:	89 fb                	mov    %edi,%ebx
  97:	89 5d 08             	mov    %ebx,0x8(%ebp)
  9a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9d:	5b                   	pop    %ebx
  9e:	5f                   	pop    %edi
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    

000000a1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a1:	55                   	push   %ebp
  a2:	89 e5                	mov    %esp,%ebp
  a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  ad:	90                   	nop
  ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  b1:	0f b6 10             	movzbl (%eax),%edx
  b4:	8b 45 08             	mov    0x8(%ebp),%eax
  b7:	88 10                	mov    %dl,(%eax)
  b9:	8b 45 08             	mov    0x8(%ebp),%eax
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	84 c0                	test   %al,%al
  c1:	0f 95 c0             	setne  %al
  c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  cc:	84 c0                	test   %al,%al
  ce:	75 de                	jne    ae <strcpy+0xd>
    ;
  return os;
  d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  d3:	c9                   	leave  
  d4:	c3                   	ret    

000000d5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d5:	55                   	push   %ebp
  d6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d8:	eb 08                	jmp    e2 <strcmp+0xd>
    p++, q++;
  da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  de:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	0f b6 00             	movzbl (%eax),%eax
  e8:	84 c0                	test   %al,%al
  ea:	74 10                	je     fc <strcmp+0x27>
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	0f b6 10             	movzbl (%eax),%edx
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	0f b6 00             	movzbl (%eax),%eax
  f8:	38 c2                	cmp    %al,%dl
  fa:	74 de                	je     da <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  fc:	8b 45 08             	mov    0x8(%ebp),%eax
  ff:	0f b6 00             	movzbl (%eax),%eax
 102:	0f b6 d0             	movzbl %al,%edx
 105:	8b 45 0c             	mov    0xc(%ebp),%eax
 108:	0f b6 00             	movzbl (%eax),%eax
 10b:	0f b6 c0             	movzbl %al,%eax
 10e:	89 d1                	mov    %edx,%ecx
 110:	29 c1                	sub    %eax,%ecx
 112:	89 c8                	mov    %ecx,%eax
}
 114:	5d                   	pop    %ebp
 115:	c3                   	ret    

00000116 <strlen>:

uint
strlen(char *s)
{
 116:	55                   	push   %ebp
 117:	89 e5                	mov    %esp,%ebp
 119:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 11c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 123:	eb 04                	jmp    129 <strlen+0x13>
 125:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
 12c:	03 45 08             	add    0x8(%ebp),%eax
 12f:	0f b6 00             	movzbl (%eax),%eax
 132:	84 c0                	test   %al,%al
 134:	75 ef                	jne    125 <strlen+0xf>
    ;
  return n;
 136:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 139:	c9                   	leave  
 13a:	c3                   	ret    

0000013b <memset>:

void*
memset(void *dst, int c, uint n)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 141:	8b 45 10             	mov    0x10(%ebp),%eax
 144:	89 44 24 08          	mov    %eax,0x8(%esp)
 148:	8b 45 0c             	mov    0xc(%ebp),%eax
 14b:	89 44 24 04          	mov    %eax,0x4(%esp)
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 22 ff ff ff       	call   7c <stosb>
  return dst;
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 15d:	c9                   	leave  
 15e:	c3                   	ret    

0000015f <strchr>:

char*
strchr(const char *s, char c)
{
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	83 ec 04             	sub    $0x4,%esp
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 16b:	eb 14                	jmp    181 <strchr+0x22>
    if(*s == c)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	3a 45 fc             	cmp    -0x4(%ebp),%al
 176:	75 05                	jne    17d <strchr+0x1e>
      return (char*)s;
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	eb 13                	jmp    190 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 17d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 18b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 190:	c9                   	leave  
 191:	c3                   	ret    

00000192 <gets>:

char*
gets(char *buf, int max)
{
 192:	55                   	push   %ebp
 193:	89 e5                	mov    %esp,%ebp
 195:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 19f:	eb 44                	jmp    1e5 <gets+0x53>
    cc = read(0, &c, 1);
 1a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a8:	00 
 1a9:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b7:	e8 3c 01 00 00       	call   2f8 <read>
 1bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c3:	7e 2d                	jle    1f2 <gets+0x60>
      break;
    buf[i++] = c;
 1c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c8:	03 45 08             	add    0x8(%ebp),%eax
 1cb:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1cf:	88 10                	mov    %dl,(%eax)
 1d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 1d5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d9:	3c 0a                	cmp    $0xa,%al
 1db:	74 16                	je     1f3 <gets+0x61>
 1dd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e1:	3c 0d                	cmp    $0xd,%al
 1e3:	74 0e                	je     1f3 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ee:	7c b1                	jl     1a1 <gets+0xf>
 1f0:	eb 01                	jmp    1f3 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f2:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f6:	03 45 08             	add    0x8(%ebp),%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 06 01 00 00       	call   320 <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 fc 00 00 00       	call   338 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 be 00 00 00       	call   308 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 24                	jmp    282 <atoi+0x33>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c2                	mov    %eax,%edx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	0f b6 00             	movzbl (%eax),%eax
 272:	0f be c0             	movsbl %al,%eax
 275:	8d 04 02             	lea    (%edx,%eax,1),%eax
 278:	83 e8 30             	sub    $0x30,%eax
 27b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 27e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	0f b6 00             	movzbl (%eax),%eax
 288:	3c 2f                	cmp    $0x2f,%al
 28a:	7e 0a                	jle    296 <atoi+0x47>
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	0f b6 00             	movzbl (%eax),%eax
 292:	3c 39                	cmp    $0x39,%al
 294:	7e c8                	jle    25e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 296:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 299:	c9                   	leave  
 29a:	c3                   	ret    

0000029b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2aa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ad:	eb 13                	jmp    2c2 <memmove+0x27>
    *dst++ = *src++;
 2af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2b2:	0f b6 10             	movzbl (%eax),%edx
 2b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b8:	88 10                	mov    %dl,(%eax)
 2ba:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2be:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2c6:	0f 9f c0             	setg   %al
 2c9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2cd:	84 c0                	test   %al,%al
 2cf:	75 de                	jne    2af <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d4:	c9                   	leave  
 2d5:	c3                   	ret    
 2d6:	90                   	nop
 2d7:	90                   	nop

000002d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d8:	b8 01 00 00 00       	mov    $0x1,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <exit>:
SYSCALL(exit)
 2e0:	b8 02 00 00 00       	mov    $0x2,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <wait>:
SYSCALL(wait)
 2e8:	b8 03 00 00 00       	mov    $0x3,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <pipe>:
SYSCALL(pipe)
 2f0:	b8 04 00 00 00       	mov    $0x4,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <read>:
SYSCALL(read)
 2f8:	b8 05 00 00 00       	mov    $0x5,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <write>:
SYSCALL(write)
 300:	b8 10 00 00 00       	mov    $0x10,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <close>:
SYSCALL(close)
 308:	b8 15 00 00 00       	mov    $0x15,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <kill>:
SYSCALL(kill)
 310:	b8 06 00 00 00       	mov    $0x6,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <exec>:
SYSCALL(exec)
 318:	b8 07 00 00 00       	mov    $0x7,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <open>:
SYSCALL(open)
 320:	b8 0f 00 00 00       	mov    $0xf,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mknod>:
SYSCALL(mknod)
 328:	b8 11 00 00 00       	mov    $0x11,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <unlink>:
SYSCALL(unlink)
 330:	b8 12 00 00 00       	mov    $0x12,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <fstat>:
SYSCALL(fstat)
 338:	b8 08 00 00 00       	mov    $0x8,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <link>:
SYSCALL(link)
 340:	b8 13 00 00 00       	mov    $0x13,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <mkdir>:
SYSCALL(mkdir)
 348:	b8 14 00 00 00       	mov    $0x14,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <chdir>:
SYSCALL(chdir)
 350:	b8 09 00 00 00       	mov    $0x9,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <dup>:
SYSCALL(dup)
 358:	b8 0a 00 00 00       	mov    $0xa,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <getpid>:
SYSCALL(getpid)
 360:	b8 0b 00 00 00       	mov    $0xb,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <sbrk>:
SYSCALL(sbrk)
 368:	b8 0c 00 00 00       	mov    $0xc,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <sleep>:
SYSCALL(sleep)
 370:	b8 0d 00 00 00       	mov    $0xd,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <uptime>:
SYSCALL(uptime)
 378:	b8 0e 00 00 00       	mov    $0xe,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <signal>:
SYSCALL(signal)
 380:	b8 16 00 00 00       	mov    $0x16,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	83 ec 28             	sub    $0x28,%esp
 38e:	8b 45 0c             	mov    0xc(%ebp),%eax
 391:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 394:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39b:	00 
 39c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39f:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	89 04 24             	mov    %eax,(%esp)
 3a9:	e8 52 ff ff ff       	call   300 <write>
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3bd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c1:	74 17                	je     3da <printint+0x2a>
 3c3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3c7:	79 11                	jns    3da <printint+0x2a>
    neg = 1;
 3c9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d3:	f7 d8                	neg    %eax
 3d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d8:	eb 06                	jmp    3e0 <printint+0x30>
  } else {
    x = xx;
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
 3f2:	f7 f1                	div    %ecx
 3f4:	89 d0                	mov    %edx,%eax
 3f6:	0f b6 90 58 08 00 00 	movzbl 0x858(%eax),%edx
 3fd:	8d 45 dc             	lea    -0x24(%ebp),%eax
 400:	03 45 f4             	add    -0xc(%ebp),%eax
 403:	88 10                	mov    %dl,(%eax)
 405:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 409:	8b 45 10             	mov    0x10(%ebp),%eax
 40c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 40f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 412:	ba 00 00 00 00       	mov    $0x0,%edx
 417:	f7 75 d4             	divl   -0x2c(%ebp)
 41a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 41d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 421:	75 c4                	jne    3e7 <printint+0x37>
  if(neg)
 423:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 427:	74 2a                	je     453 <printint+0xa3>
    buf[i++] = '-';
 429:	8d 45 dc             	lea    -0x24(%ebp),%eax
 42c:	03 45 f4             	add    -0xc(%ebp),%eax
 42f:	c6 00 2d             	movb   $0x2d,(%eax)
 432:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 436:	eb 1b                	jmp    453 <printint+0xa3>
    putc(fd, buf[i]);
 438:	8d 45 dc             	lea    -0x24(%ebp),%eax
 43b:	03 45 f4             	add    -0xc(%ebp),%eax
 43e:	0f b6 00             	movzbl (%eax),%eax
 441:	0f be c0             	movsbl %al,%eax
 444:	89 44 24 04          	mov    %eax,0x4(%esp)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 35 ff ff ff       	call   388 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 453:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 457:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 45b:	79 db                	jns    438 <printint+0x88>
    putc(fd, buf[i]);
}
 45d:	c9                   	leave  
 45e:	c3                   	ret    

0000045f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 465:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 46c:	8d 45 0c             	lea    0xc(%ebp),%eax
 46f:	83 c0 04             	add    $0x4,%eax
 472:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 475:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 47c:	e9 7e 01 00 00       	jmp    5ff <printf+0x1a0>
    c = fmt[i] & 0xff;
 481:	8b 55 0c             	mov    0xc(%ebp),%edx
 484:	8b 45 f0             	mov    -0x10(%ebp),%eax
 487:	8d 04 02             	lea    (%edx,%eax,1),%eax
 48a:	0f b6 00             	movzbl (%eax),%eax
 48d:	0f be c0             	movsbl %al,%eax
 490:	25 ff 00 00 00       	and    $0xff,%eax
 495:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 498:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49c:	75 2c                	jne    4ca <printf+0x6b>
      if(c == '%'){
 49e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4a2:	75 0c                	jne    4b0 <printf+0x51>
        state = '%';
 4a4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4ab:	e9 4b 01 00 00       	jmp    5fb <printf+0x19c>
      } else {
        putc(fd, c);
 4b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b3:	0f be c0             	movsbl %al,%eax
 4b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ba:	8b 45 08             	mov    0x8(%ebp),%eax
 4bd:	89 04 24             	mov    %eax,(%esp)
 4c0:	e8 c3 fe ff ff       	call   388 <putc>
 4c5:	e9 31 01 00 00       	jmp    5fb <printf+0x19c>
      }
    } else if(state == '%'){
 4ca:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4ce:	0f 85 27 01 00 00    	jne    5fb <printf+0x19c>
      if(c == 'd'){
 4d4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4d8:	75 2d                	jne    507 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4dd:	8b 00                	mov    (%eax),%eax
 4df:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4e6:	00 
 4e7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4ee:	00 
 4ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	89 04 24             	mov    %eax,(%esp)
 4f9:	e8 b2 fe ff ff       	call   3b0 <printint>
        ap++;
 4fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 502:	e9 ed 00 00 00       	jmp    5f4 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 507:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 50b:	74 06                	je     513 <printf+0xb4>
 50d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 511:	75 2d                	jne    540 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 513:	8b 45 e8             	mov    -0x18(%ebp),%eax
 516:	8b 00                	mov    (%eax),%eax
 518:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 51f:	00 
 520:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 527:	00 
 528:	89 44 24 04          	mov    %eax,0x4(%esp)
 52c:	8b 45 08             	mov    0x8(%ebp),%eax
 52f:	89 04 24             	mov    %eax,(%esp)
 532:	e8 79 fe ff ff       	call   3b0 <printint>
        ap++;
 537:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 53b:	e9 b4 00 00 00       	jmp    5f4 <printf+0x195>
      } else if(c == 's'){
 540:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 544:	75 46                	jne    58c <printf+0x12d>
        s = (char*)*ap;
 546:	8b 45 e8             	mov    -0x18(%ebp),%eax
 549:	8b 00                	mov    (%eax),%eax
 54b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 54e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 552:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 556:	75 27                	jne    57f <printf+0x120>
          s = "(null)";
 558:	c7 45 f4 4e 08 00 00 	movl   $0x84e,-0xc(%ebp)
        while(*s != 0){
 55f:	eb 1f                	jmp    580 <printf+0x121>
          putc(fd, *s);
 561:	8b 45 f4             	mov    -0xc(%ebp),%eax
 564:	0f b6 00             	movzbl (%eax),%eax
 567:	0f be c0             	movsbl %al,%eax
 56a:	89 44 24 04          	mov    %eax,0x4(%esp)
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
 571:	89 04 24             	mov    %eax,(%esp)
 574:	e8 0f fe ff ff       	call   388 <putc>
          s++;
 579:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 57d:	eb 01                	jmp    580 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 57f:	90                   	nop
 580:	8b 45 f4             	mov    -0xc(%ebp),%eax
 583:	0f b6 00             	movzbl (%eax),%eax
 586:	84 c0                	test   %al,%al
 588:	75 d7                	jne    561 <printf+0x102>
 58a:	eb 68                	jmp    5f4 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 590:	75 1d                	jne    5af <printf+0x150>
        putc(fd, *ap);
 592:	8b 45 e8             	mov    -0x18(%ebp),%eax
 595:	8b 00                	mov    (%eax),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	89 44 24 04          	mov    %eax,0x4(%esp)
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 df fd ff ff       	call   388 <putc>
        ap++;
 5a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ad:	eb 45                	jmp    5f4 <printf+0x195>
      } else if(c == '%'){
 5af:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b3:	75 17                	jne    5cc <printf+0x16d>
        putc(fd, c);
 5b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b8:	0f be c0             	movsbl %al,%eax
 5bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	89 04 24             	mov    %eax,(%esp)
 5c5:	e8 be fd ff ff       	call   388 <putc>
 5ca:	eb 28                	jmp    5f4 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5cc:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5d3:	00 
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	89 04 24             	mov    %eax,(%esp)
 5da:	e8 a9 fd ff ff       	call   388 <putc>
        putc(fd, c);
 5df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e2:	0f be c0             	movsbl %al,%eax
 5e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	89 04 24             	mov    %eax,(%esp)
 5ef:	e8 94 fd ff ff       	call   388 <putc>
      }
      state = 0;
 5f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 602:	8b 45 f0             	mov    -0x10(%ebp),%eax
 605:	8d 04 02             	lea    (%edx,%eax,1),%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	84 c0                	test   %al,%al
 60d:	0f 85 6e fe ff ff    	jne    481 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 613:	c9                   	leave  
 614:	c3                   	ret    
 615:	90                   	nop
 616:	90                   	nop
 617:	90                   	nop

00000618 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
 61b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 61e:	8b 45 08             	mov    0x8(%ebp),%eax
 621:	83 e8 08             	sub    $0x8,%eax
 624:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 627:	a1 74 08 00 00       	mov    0x874,%eax
 62c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 62f:	eb 24                	jmp    655 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 631:	8b 45 fc             	mov    -0x4(%ebp),%eax
 634:	8b 00                	mov    (%eax),%eax
 636:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 639:	77 12                	ja     64d <free+0x35>
 63b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 641:	77 24                	ja     667 <free+0x4f>
 643:	8b 45 fc             	mov    -0x4(%ebp),%eax
 646:	8b 00                	mov    (%eax),%eax
 648:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64b:	77 1a                	ja     667 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	89 45 fc             	mov    %eax,-0x4(%ebp)
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65b:	76 d4                	jbe    631 <free+0x19>
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 665:	76 ca                	jbe    631 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	8b 40 04             	mov    0x4(%eax),%eax
 66d:	c1 e0 03             	shl    $0x3,%eax
 670:	89 c2                	mov    %eax,%edx
 672:	03 55 f8             	add    -0x8(%ebp),%edx
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	39 c2                	cmp    %eax,%edx
 67c:	75 24                	jne    6a2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	8b 50 04             	mov    0x4(%eax),%edx
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	8b 40 04             	mov    0x4(%eax),%eax
 68c:	01 c2                	add    %eax,%edx
 68e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 691:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	8b 10                	mov    (%eax),%edx
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	89 10                	mov    %edx,(%eax)
 6a0:	eb 0a                	jmp    6ac <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	8b 10                	mov    (%eax),%edx
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 40 04             	mov    0x4(%eax),%eax
 6b2:	c1 e0 03             	shl    $0x3,%eax
 6b5:	03 45 fc             	add    -0x4(%ebp),%eax
 6b8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6bb:	75 20                	jne    6dd <free+0xc5>
    p->s.size += bp->s.size;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 50 04             	mov    0x4(%eax),%edx
 6c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c6:	8b 40 04             	mov    0x4(%eax),%eax
 6c9:	01 c2                	add    %eax,%edx
 6cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ce:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d4:	8b 10                	mov    (%eax),%edx
 6d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d9:	89 10                	mov    %edx,(%eax)
 6db:	eb 08                	jmp    6e5 <free+0xcd>
  } else
    p->s.ptr = bp;
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6e3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	a3 74 08 00 00       	mov    %eax,0x874
}
 6ed:	c9                   	leave  
 6ee:	c3                   	ret    

000006ef <morecore>:

static Header*
morecore(uint nu)
{
 6ef:	55                   	push   %ebp
 6f0:	89 e5                	mov    %esp,%ebp
 6f2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6f5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6fc:	77 07                	ja     705 <morecore+0x16>
    nu = 4096;
 6fe:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	c1 e0 03             	shl    $0x3,%eax
 70b:	89 04 24             	mov    %eax,(%esp)
 70e:	e8 55 fc ff ff       	call   368 <sbrk>
 713:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 716:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 71a:	75 07                	jne    723 <morecore+0x34>
    return 0;
 71c:	b8 00 00 00 00       	mov    $0x0,%eax
 721:	eb 22                	jmp    745 <morecore+0x56>
  hp = (Header*)p;
 723:	8b 45 f4             	mov    -0xc(%ebp),%eax
 726:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	8b 55 08             	mov    0x8(%ebp),%edx
 72f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 732:	8b 45 f0             	mov    -0x10(%ebp),%eax
 735:	83 c0 08             	add    $0x8,%eax
 738:	89 04 24             	mov    %eax,(%esp)
 73b:	e8 d8 fe ff ff       	call   618 <free>
  return freep;
 740:	a1 74 08 00 00       	mov    0x874,%eax
}
 745:	c9                   	leave  
 746:	c3                   	ret    

00000747 <malloc>:

void*
malloc(uint nbytes)
{
 747:	55                   	push   %ebp
 748:	89 e5                	mov    %esp,%ebp
 74a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	83 c0 07             	add    $0x7,%eax
 753:	c1 e8 03             	shr    $0x3,%eax
 756:	83 c0 01             	add    $0x1,%eax
 759:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 75c:	a1 74 08 00 00       	mov    0x874,%eax
 761:	89 45 f0             	mov    %eax,-0x10(%ebp)
 764:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 768:	75 23                	jne    78d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 76a:	c7 45 f0 6c 08 00 00 	movl   $0x86c,-0x10(%ebp)
 771:	8b 45 f0             	mov    -0x10(%ebp),%eax
 774:	a3 74 08 00 00       	mov    %eax,0x874
 779:	a1 74 08 00 00       	mov    0x874,%eax
 77e:	a3 6c 08 00 00       	mov    %eax,0x86c
    base.s.size = 0;
 783:	c7 05 70 08 00 00 00 	movl   $0x0,0x870
 78a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 795:	8b 45 f4             	mov    -0xc(%ebp),%eax
 798:	8b 40 04             	mov    0x4(%eax),%eax
 79b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 79e:	72 4d                	jb     7ed <malloc+0xa6>
      if(p->s.size == nunits)
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a9:	75 0c                	jne    7b7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ae:	8b 10                	mov    (%eax),%edx
 7b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b3:	89 10                	mov    %edx,(%eax)
 7b5:	eb 26                	jmp    7dd <malloc+0x96>
      else {
        p->s.size -= nunits;
 7b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ba:	8b 40 04             	mov    0x4(%eax),%eax
 7bd:	89 c2                	mov    %eax,%edx
 7bf:	2b 55 ec             	sub    -0x14(%ebp),%edx
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cb:	8b 40 04             	mov    0x4(%eax),%eax
 7ce:	c1 e0 03             	shl    $0x3,%eax
 7d1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7da:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e0:	a3 74 08 00 00       	mov    %eax,0x874
      return (void*)(p + 1);
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	83 c0 08             	add    $0x8,%eax
 7eb:	eb 38                	jmp    825 <malloc+0xde>
    }
    if(p == freep)
 7ed:	a1 74 08 00 00       	mov    0x874,%eax
 7f2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7f5:	75 1b                	jne    812 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7fa:	89 04 24             	mov    %eax,(%esp)
 7fd:	e8 ed fe ff ff       	call   6ef <morecore>
 802:	89 45 f4             	mov    %eax,-0xc(%ebp)
 805:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 809:	75 07                	jne    812 <malloc+0xcb>
        return 0;
 80b:	b8 00 00 00 00       	mov    $0x0,%eax
 810:	eb 13                	jmp    825 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 812:	8b 45 f4             	mov    -0xc(%ebp),%eax
 815:	89 45 f0             	mov    %eax,-0x10(%ebp)
 818:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81b:	8b 00                	mov    (%eax),%eax
 81d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 820:	e9 70 ff ff ff       	jmp    795 <malloc+0x4e>
}
 825:	c9                   	leave  
 826:	c3                   	ret    
