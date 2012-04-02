
_rm:     file format elf32-i386


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
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 2f 08 00 	movl   $0x82f,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 44 04 00 00       	call   467 <printf>
    exit();
  23:	e8 c0 02 00 00       	call   2e8 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 43                	jmp    75 <main+0x75>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	c1 e0 02             	shl    $0x2,%eax
  39:	03 45 0c             	add    0xc(%ebp),%eax
  3c:	8b 00                	mov    (%eax),%eax
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	e8 f2 02 00 00       	call   338 <unlink>
  46:	85 c0                	test   %eax,%eax
  48:	79 26                	jns    70 <main+0x70>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  4a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4e:	c1 e0 02             	shl    $0x2,%eax
  51:	03 45 0c             	add    0xc(%ebp),%eax
  54:	8b 00                	mov    (%eax),%eax
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	c7 44 24 04 43 08 00 	movl   $0x843,0x4(%esp)
  61:	00 
  62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  69:	e8 f9 03 00 00       	call   467 <printf>
      break;
  6e:	eb 0e                	jmp    7e <main+0x7e>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  70:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  75:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  79:	3b 45 08             	cmp    0x8(%ebp),%eax
  7c:	7c b4                	jl     32 <main+0x32>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  7e:	e8 65 02 00 00       	call   2e8 <exit>
  83:	90                   	nop

00000084 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	57                   	push   %edi
  88:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  89:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8c:	8b 55 10             	mov    0x10(%ebp),%edx
  8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  92:	89 cb                	mov    %ecx,%ebx
  94:	89 df                	mov    %ebx,%edi
  96:	89 d1                	mov    %edx,%ecx
  98:	fc                   	cld    
  99:	f3 aa                	rep stos %al,%es:(%edi)
  9b:	89 ca                	mov    %ecx,%edx
  9d:	89 fb                	mov    %edi,%ebx
  9f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  a5:	5b                   	pop    %ebx
  a6:	5f                   	pop    %edi
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a9:	55                   	push   %ebp
  aa:	89 e5                	mov    %esp,%ebp
  ac:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  af:	8b 45 08             	mov    0x8(%ebp),%eax
  b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b5:	90                   	nop
  b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  b9:	0f b6 10             	movzbl (%eax),%edx
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	88 10                	mov    %dl,(%eax)
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	0f b6 00             	movzbl (%eax),%eax
  c7:	84 c0                	test   %al,%al
  c9:	0f 95 c0             	setne  %al
  cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  d4:	84 c0                	test   %al,%al
  d6:	75 de                	jne    b6 <strcpy+0xd>
    ;
  return os;
  d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  db:	c9                   	leave  
  dc:	c3                   	ret    

000000dd <strcmp>:

int
strcmp(const char *p, const char *q)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e0:	eb 08                	jmp    ea <strcmp+0xd>
    p++, q++;
  e2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
  ed:	0f b6 00             	movzbl (%eax),%eax
  f0:	84 c0                	test   %al,%al
  f2:	74 10                	je     104 <strcmp+0x27>
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	0f b6 10             	movzbl (%eax),%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	38 c2                	cmp    %al,%dl
 102:	74 de                	je     e2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	0f b6 00             	movzbl (%eax),%eax
 10a:	0f b6 d0             	movzbl %al,%edx
 10d:	8b 45 0c             	mov    0xc(%ebp),%eax
 110:	0f b6 00             	movzbl (%eax),%eax
 113:	0f b6 c0             	movzbl %al,%eax
 116:	89 d1                	mov    %edx,%ecx
 118:	29 c1                	sub    %eax,%ecx
 11a:	89 c8                	mov    %ecx,%eax
}
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strlen>:

uint
strlen(char *s)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 124:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12b:	eb 04                	jmp    131 <strlen+0x13>
 12d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 131:	8b 45 fc             	mov    -0x4(%ebp),%eax
 134:	03 45 08             	add    0x8(%ebp),%eax
 137:	0f b6 00             	movzbl (%eax),%eax
 13a:	84 c0                	test   %al,%al
 13c:	75 ef                	jne    12d <strlen+0xf>
    ;
  return n;
 13e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 141:	c9                   	leave  
 142:	c3                   	ret    

00000143 <memset>:

void*
memset(void *dst, int c, uint n)
{
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 149:	8b 45 10             	mov    0x10(%ebp),%eax
 14c:	89 44 24 08          	mov    %eax,0x8(%esp)
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	89 44 24 04          	mov    %eax,0x4(%esp)
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	89 04 24             	mov    %eax,(%esp)
 15d:	e8 22 ff ff ff       	call   84 <stosb>
  return dst;
 162:	8b 45 08             	mov    0x8(%ebp),%eax
}
 165:	c9                   	leave  
 166:	c3                   	ret    

00000167 <strchr>:

char*
strchr(const char *s, char c)
{
 167:	55                   	push   %ebp
 168:	89 e5                	mov    %esp,%ebp
 16a:	83 ec 04             	sub    $0x4,%esp
 16d:	8b 45 0c             	mov    0xc(%ebp),%eax
 170:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 173:	eb 14                	jmp    189 <strchr+0x22>
    if(*s == c)
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	0f b6 00             	movzbl (%eax),%eax
 17b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17e:	75 05                	jne    185 <strchr+0x1e>
      return (char*)s;
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	eb 13                	jmp    198 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 185:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	0f b6 00             	movzbl (%eax),%eax
 18f:	84 c0                	test   %al,%al
 191:	75 e2                	jne    175 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 193:	b8 00 00 00 00       	mov    $0x0,%eax
}
 198:	c9                   	leave  
 199:	c3                   	ret    

0000019a <gets>:

char*
gets(char *buf, int max)
{
 19a:	55                   	push   %ebp
 19b:	89 e5                	mov    %esp,%ebp
 19d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a7:	eb 44                	jmp    1ed <gets+0x53>
    cc = read(0, &c, 1);
 1a9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b0:	00 
 1b1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1bf:	e8 3c 01 00 00       	call   300 <read>
 1c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1cb:	7e 2d                	jle    1fa <gets+0x60>
      break;
    buf[i++] = c;
 1cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d0:	03 45 08             	add    0x8(%ebp),%eax
 1d3:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1d7:	88 10                	mov    %dl,(%eax)
 1d9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 1dd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e1:	3c 0a                	cmp    $0xa,%al
 1e3:	74 16                	je     1fb <gets+0x61>
 1e5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e9:	3c 0d                	cmp    $0xd,%al
 1eb:	74 0e                	je     1fb <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f6:	7c b1                	jl     1a9 <gets+0xf>
 1f8:	eb 01                	jmp    1fb <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1fa:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fe:	03 45 08             	add    0x8(%ebp),%eax
 201:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
}
 207:	c9                   	leave  
 208:	c3                   	ret    

00000209 <stat>:

int
stat(char *n, struct stat *st)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 216:	00 
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	89 04 24             	mov    %eax,(%esp)
 21d:	e8 06 01 00 00       	call   328 <open>
 222:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 225:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 229:	79 07                	jns    232 <stat+0x29>
    return -1;
 22b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 230:	eb 23                	jmp    255 <stat+0x4c>
  r = fstat(fd, st);
 232:	8b 45 0c             	mov    0xc(%ebp),%eax
 235:	89 44 24 04          	mov    %eax,0x4(%esp)
 239:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23c:	89 04 24             	mov    %eax,(%esp)
 23f:	e8 fc 00 00 00       	call   340 <fstat>
 244:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 be 00 00 00       	call   310 <close>
  return r;
 252:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 255:	c9                   	leave  
 256:	c3                   	ret    

00000257 <atoi>:

int
atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 264:	eb 24                	jmp    28a <atoi+0x33>
    n = n*10 + *s++ - '0';
 266:	8b 55 fc             	mov    -0x4(%ebp),%edx
 269:	89 d0                	mov    %edx,%eax
 26b:	c1 e0 02             	shl    $0x2,%eax
 26e:	01 d0                	add    %edx,%eax
 270:	01 c0                	add    %eax,%eax
 272:	89 c2                	mov    %eax,%edx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	0f be c0             	movsbl %al,%eax
 27d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 280:	83 e8 30             	sub    $0x30,%eax
 283:	89 45 fc             	mov    %eax,-0x4(%ebp)
 286:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	0f b6 00             	movzbl (%eax),%eax
 290:	3c 2f                	cmp    $0x2f,%al
 292:	7e 0a                	jle    29e <atoi+0x47>
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	0f b6 00             	movzbl (%eax),%eax
 29a:	3c 39                	cmp    $0x39,%al
 29c:	7e c8                	jle    266 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2b5:	eb 13                	jmp    2ca <memmove+0x27>
    *dst++ = *src++;
 2b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c0:	88 10                	mov    %dl,(%eax)
 2c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2c6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ca:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2ce:	0f 9f c0             	setg   %al
 2d1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2d5:	84 c0                	test   %al,%al
 2d7:	75 de                	jne    2b7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2dc:	c9                   	leave  
 2dd:	c3                   	ret    
 2de:	90                   	nop
 2df:	90                   	nop

000002e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e0:	b8 01 00 00 00       	mov    $0x1,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <exit>:
SYSCALL(exit)
 2e8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <wait>:
SYSCALL(wait)
 2f0:	b8 03 00 00 00       	mov    $0x3,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <pipe>:
SYSCALL(pipe)
 2f8:	b8 04 00 00 00       	mov    $0x4,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <read>:
SYSCALL(read)
 300:	b8 05 00 00 00       	mov    $0x5,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <write>:
SYSCALL(write)
 308:	b8 10 00 00 00       	mov    $0x10,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <close>:
SYSCALL(close)
 310:	b8 15 00 00 00       	mov    $0x15,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <kill>:
SYSCALL(kill)
 318:	b8 06 00 00 00       	mov    $0x6,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <exec>:
SYSCALL(exec)
 320:	b8 07 00 00 00       	mov    $0x7,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <open>:
SYSCALL(open)
 328:	b8 0f 00 00 00       	mov    $0xf,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <mknod>:
SYSCALL(mknod)
 330:	b8 11 00 00 00       	mov    $0x11,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <unlink>:
SYSCALL(unlink)
 338:	b8 12 00 00 00       	mov    $0x12,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <fstat>:
SYSCALL(fstat)
 340:	b8 08 00 00 00       	mov    $0x8,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <link>:
SYSCALL(link)
 348:	b8 13 00 00 00       	mov    $0x13,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <mkdir>:
SYSCALL(mkdir)
 350:	b8 14 00 00 00       	mov    $0x14,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <chdir>:
SYSCALL(chdir)
 358:	b8 09 00 00 00       	mov    $0x9,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <dup>:
SYSCALL(dup)
 360:	b8 0a 00 00 00       	mov    $0xa,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <getpid>:
SYSCALL(getpid)
 368:	b8 0b 00 00 00       	mov    $0xb,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <sbrk>:
SYSCALL(sbrk)
 370:	b8 0c 00 00 00       	mov    $0xc,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sleep>:
SYSCALL(sleep)
 378:	b8 0d 00 00 00       	mov    $0xd,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <uptime>:
SYSCALL(uptime)
 380:	b8 0e 00 00 00       	mov    $0xe,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <signal>:
SYSCALL(signal)
 388:	b8 16 00 00 00       	mov    $0x16,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	83 ec 28             	sub    $0x28,%esp
 396:	8b 45 0c             	mov    0xc(%ebp),%eax
 399:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 39c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3a3:	00 
 3a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	89 04 24             	mov    %eax,(%esp)
 3b1:	e8 52 ff ff ff       	call   308 <write>
}
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c9:	74 17                	je     3e2 <printint+0x2a>
 3cb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3cf:	79 11                	jns    3e2 <printint+0x2a>
    neg = 1;
 3d1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3db:	f7 d8                	neg    %eax
 3dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e0:	eb 06                	jmp    3e8 <printint+0x30>
  } else {
    x = xx;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f5:	ba 00 00 00 00       	mov    $0x0,%edx
 3fa:	f7 f1                	div    %ecx
 3fc:	89 d0                	mov    %edx,%eax
 3fe:	0f b6 90 64 08 00 00 	movzbl 0x864(%eax),%edx
 405:	8d 45 dc             	lea    -0x24(%ebp),%eax
 408:	03 45 f4             	add    -0xc(%ebp),%eax
 40b:	88 10                	mov    %dl,(%eax)
 40d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 411:	8b 45 10             	mov    0x10(%ebp),%eax
 414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 417:	8b 45 ec             	mov    -0x14(%ebp),%eax
 41a:	ba 00 00 00 00       	mov    $0x0,%edx
 41f:	f7 75 d4             	divl   -0x2c(%ebp)
 422:	89 45 ec             	mov    %eax,-0x14(%ebp)
 425:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 429:	75 c4                	jne    3ef <printint+0x37>
  if(neg)
 42b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42f:	74 2a                	je     45b <printint+0xa3>
    buf[i++] = '-';
 431:	8d 45 dc             	lea    -0x24(%ebp),%eax
 434:	03 45 f4             	add    -0xc(%ebp),%eax
 437:	c6 00 2d             	movb   $0x2d,(%eax)
 43a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 43e:	eb 1b                	jmp    45b <printint+0xa3>
    putc(fd, buf[i]);
 440:	8d 45 dc             	lea    -0x24(%ebp),%eax
 443:	03 45 f4             	add    -0xc(%ebp),%eax
 446:	0f b6 00             	movzbl (%eax),%eax
 449:	0f be c0             	movsbl %al,%eax
 44c:	89 44 24 04          	mov    %eax,0x4(%esp)
 450:	8b 45 08             	mov    0x8(%ebp),%eax
 453:	89 04 24             	mov    %eax,(%esp)
 456:	e8 35 ff ff ff       	call   390 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 45f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 463:	79 db                	jns    440 <printint+0x88>
    putc(fd, buf[i]);
}
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 46d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 474:	8d 45 0c             	lea    0xc(%ebp),%eax
 477:	83 c0 04             	add    $0x4,%eax
 47a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 47d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 484:	e9 7e 01 00 00       	jmp    607 <printf+0x1a0>
    c = fmt[i] & 0xff;
 489:	8b 55 0c             	mov    0xc(%ebp),%edx
 48c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 48f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 492:	0f b6 00             	movzbl (%eax),%eax
 495:	0f be c0             	movsbl %al,%eax
 498:	25 ff 00 00 00       	and    $0xff,%eax
 49d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a4:	75 2c                	jne    4d2 <printf+0x6b>
      if(c == '%'){
 4a6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4aa:	75 0c                	jne    4b8 <printf+0x51>
        state = '%';
 4ac:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4b3:	e9 4b 01 00 00       	jmp    603 <printf+0x19c>
      } else {
        putc(fd, c);
 4b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4bb:	0f be c0             	movsbl %al,%eax
 4be:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c2:	8b 45 08             	mov    0x8(%ebp),%eax
 4c5:	89 04 24             	mov    %eax,(%esp)
 4c8:	e8 c3 fe ff ff       	call   390 <putc>
 4cd:	e9 31 01 00 00       	jmp    603 <printf+0x19c>
      }
    } else if(state == '%'){
 4d2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4d6:	0f 85 27 01 00 00    	jne    603 <printf+0x19c>
      if(c == 'd'){
 4dc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4e0:	75 2d                	jne    50f <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e5:	8b 00                	mov    (%eax),%eax
 4e7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4ee:	00 
 4ef:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4f6:	00 
 4f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	89 04 24             	mov    %eax,(%esp)
 501:	e8 b2 fe ff ff       	call   3b8 <printint>
        ap++;
 506:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50a:	e9 ed 00 00 00       	jmp    5fc <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 50f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 513:	74 06                	je     51b <printf+0xb4>
 515:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 519:	75 2d                	jne    548 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 51b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51e:	8b 00                	mov    (%eax),%eax
 520:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 527:	00 
 528:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 52f:	00 
 530:	89 44 24 04          	mov    %eax,0x4(%esp)
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	89 04 24             	mov    %eax,(%esp)
 53a:	e8 79 fe ff ff       	call   3b8 <printint>
        ap++;
 53f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 543:	e9 b4 00 00 00       	jmp    5fc <printf+0x195>
      } else if(c == 's'){
 548:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 54c:	75 46                	jne    594 <printf+0x12d>
        s = (char*)*ap;
 54e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 551:	8b 00                	mov    (%eax),%eax
 553:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 556:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 55a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 55e:	75 27                	jne    587 <printf+0x120>
          s = "(null)";
 560:	c7 45 f4 5c 08 00 00 	movl   $0x85c,-0xc(%ebp)
        while(*s != 0){
 567:	eb 1f                	jmp    588 <printf+0x121>
          putc(fd, *s);
 569:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56c:	0f b6 00             	movzbl (%eax),%eax
 56f:	0f be c0             	movsbl %al,%eax
 572:	89 44 24 04          	mov    %eax,0x4(%esp)
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	89 04 24             	mov    %eax,(%esp)
 57c:	e8 0f fe ff ff       	call   390 <putc>
          s++;
 581:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 585:	eb 01                	jmp    588 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 587:	90                   	nop
 588:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58b:	0f b6 00             	movzbl (%eax),%eax
 58e:	84 c0                	test   %al,%al
 590:	75 d7                	jne    569 <printf+0x102>
 592:	eb 68                	jmp    5fc <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 594:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 598:	75 1d                	jne    5b7 <printf+0x150>
        putc(fd, *ap);
 59a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59d:	8b 00                	mov    (%eax),%eax
 59f:	0f be c0             	movsbl %al,%eax
 5a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	89 04 24             	mov    %eax,(%esp)
 5ac:	e8 df fd ff ff       	call   390 <putc>
        ap++;
 5b1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b5:	eb 45                	jmp    5fc <printf+0x195>
      } else if(c == '%'){
 5b7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bb:	75 17                	jne    5d4 <printf+0x16d>
        putc(fd, c);
 5bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ca:	89 04 24             	mov    %eax,(%esp)
 5cd:	e8 be fd ff ff       	call   390 <putc>
 5d2:	eb 28                	jmp    5fc <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5db:	00 
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	89 04 24             	mov    %eax,(%esp)
 5e2:	e8 a9 fd ff ff       	call   390 <putc>
        putc(fd, c);
 5e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ea:	0f be c0             	movsbl %al,%eax
 5ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	89 04 24             	mov    %eax,(%esp)
 5f7:	e8 94 fd ff ff       	call   390 <putc>
      }
      state = 0;
 5fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 603:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 607:	8b 55 0c             	mov    0xc(%ebp),%edx
 60a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 60d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 610:	0f b6 00             	movzbl (%eax),%eax
 613:	84 c0                	test   %al,%al
 615:	0f 85 6e fe ff ff    	jne    489 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 61b:	c9                   	leave  
 61c:	c3                   	ret    
 61d:	90                   	nop
 61e:	90                   	nop
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	83 e8 08             	sub    $0x8,%eax
 62c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62f:	a1 80 08 00 00       	mov    0x880,%eax
 634:	89 45 fc             	mov    %eax,-0x4(%ebp)
 637:	eb 24                	jmp    65d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 639:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63c:	8b 00                	mov    (%eax),%eax
 63e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 641:	77 12                	ja     655 <free+0x35>
 643:	8b 45 f8             	mov    -0x8(%ebp),%eax
 646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 649:	77 24                	ja     66f <free+0x4f>
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 653:	77 1a                	ja     66f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 663:	76 d4                	jbe    639 <free+0x19>
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66d:	76 ca                	jbe    639 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	8b 40 04             	mov    0x4(%eax),%eax
 675:	c1 e0 03             	shl    $0x3,%eax
 678:	89 c2                	mov    %eax,%edx
 67a:	03 55 f8             	add    -0x8(%ebp),%edx
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	39 c2                	cmp    %eax,%edx
 684:	75 24                	jne    6aa <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	8b 50 04             	mov    0x4(%eax),%edx
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 00                	mov    (%eax),%eax
 691:	8b 40 04             	mov    0x4(%eax),%eax
 694:	01 c2                	add    %eax,%edx
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	8b 00                	mov    (%eax),%eax
 6a1:	8b 10                	mov    (%eax),%edx
 6a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a6:	89 10                	mov    %edx,(%eax)
 6a8:	eb 0a                	jmp    6b4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 40 04             	mov    0x4(%eax),%eax
 6ba:	c1 e0 03             	shl    $0x3,%eax
 6bd:	03 45 fc             	add    -0x4(%ebp),%eax
 6c0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c3:	75 20                	jne    6e5 <free+0xc5>
    p->s.size += bp->s.size;
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	8b 50 04             	mov    0x4(%eax),%edx
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	8b 40 04             	mov    0x4(%eax),%eax
 6d1:	01 c2                	add    %eax,%edx
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dc:	8b 10                	mov    (%eax),%edx
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	89 10                	mov    %edx,(%eax)
 6e3:	eb 08                	jmp    6ed <free+0xcd>
  } else
    p->s.ptr = bp;
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6eb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	a3 80 08 00 00       	mov    %eax,0x880
}
 6f5:	c9                   	leave  
 6f6:	c3                   	ret    

000006f7 <morecore>:

static Header*
morecore(uint nu)
{
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6fd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 704:	77 07                	ja     70d <morecore+0x16>
    nu = 4096;
 706:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	c1 e0 03             	shl    $0x3,%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 55 fc ff ff       	call   370 <sbrk>
 71b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 71e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 722:	75 07                	jne    72b <morecore+0x34>
    return 0;
 724:	b8 00 00 00 00       	mov    $0x0,%eax
 729:	eb 22                	jmp    74d <morecore+0x56>
  hp = (Header*)p;
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 731:	8b 45 f0             	mov    -0x10(%ebp),%eax
 734:	8b 55 08             	mov    0x8(%ebp),%edx
 737:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 73a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73d:	83 c0 08             	add    $0x8,%eax
 740:	89 04 24             	mov    %eax,(%esp)
 743:	e8 d8 fe ff ff       	call   620 <free>
  return freep;
 748:	a1 80 08 00 00       	mov    0x880,%eax
}
 74d:	c9                   	leave  
 74e:	c3                   	ret    

0000074f <malloc>:

void*
malloc(uint nbytes)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	83 c0 07             	add    $0x7,%eax
 75b:	c1 e8 03             	shr    $0x3,%eax
 75e:	83 c0 01             	add    $0x1,%eax
 761:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 764:	a1 80 08 00 00       	mov    0x880,%eax
 769:	89 45 f0             	mov    %eax,-0x10(%ebp)
 76c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 770:	75 23                	jne    795 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 772:	c7 45 f0 78 08 00 00 	movl   $0x878,-0x10(%ebp)
 779:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77c:	a3 80 08 00 00       	mov    %eax,0x880
 781:	a1 80 08 00 00       	mov    0x880,%eax
 786:	a3 78 08 00 00       	mov    %eax,0x878
    base.s.size = 0;
 78b:	c7 05 7c 08 00 00 00 	movl   $0x0,0x87c
 792:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	8b 00                	mov    (%eax),%eax
 79a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 79d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a6:	72 4d                	jb     7f5 <malloc+0xa6>
      if(p->s.size == nunits)
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7b1:	75 0c                	jne    7bf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bb:	89 10                	mov    %edx,(%eax)
 7bd:	eb 26                	jmp    7e5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	89 c2                	mov    %eax,%edx
 7c7:	2b 55 ec             	sub    -0x14(%ebp),%edx
 7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	c1 e0 03             	shl    $0x3,%eax
 7d9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7df:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e8:	a3 80 08 00 00       	mov    %eax,0x880
      return (void*)(p + 1);
 7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f0:	83 c0 08             	add    $0x8,%eax
 7f3:	eb 38                	jmp    82d <malloc+0xde>
    }
    if(p == freep)
 7f5:	a1 80 08 00 00       	mov    0x880,%eax
 7fa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7fd:	75 1b                	jne    81a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
 802:	89 04 24             	mov    %eax,(%esp)
 805:	e8 ed fe ff ff       	call   6f7 <morecore>
 80a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 811:	75 07                	jne    81a <malloc+0xcb>
        return 0;
 813:	b8 00 00 00 00       	mov    $0x0,%eax
 818:	eb 13                	jmp    82d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 820:	8b 45 f4             	mov    -0xc(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 828:	e9 70 ff ff ff       	jmp    79d <malloc+0x4e>
}
 82d:	c9                   	leave  
 82e:	c3                   	ret    
