
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 00 0a 00 00       	add    $0xa00,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 00 0a 00 00       	add    $0xa00,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 6f 09 00 00 	movl   $0x96f,(%esp)
  5b:	e8 47 02 00 00       	call   2a7 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 00 0a 00 	movl   $0xa00,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 9b 03 00 00       	call   440 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 75 09 00 	movl   $0x975,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 db 04 00 00       	call   5a7 <printf>
    exit();
  cc:	e8 57 03 00 00       	call   428 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 85 09 00 	movl   $0x985,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 a6 04 00 00       	call   5a7 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 92 09 00 	movl   $0x992,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 fd 02 00 00       	call   428 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	eb 7d                	jmp    1b2 <main+0xaf>
    if((fd = open(argv[i], 0)) < 0){
 135:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 139:	c1 e0 02             	shl    $0x2,%eax
 13c:	03 45 0c             	add    0xc(%ebp),%eax
 13f:	8b 00                	mov    (%eax),%eax
 141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 148:	00 
 149:	89 04 24             	mov    %eax,(%esp)
 14c:	e8 17 03 00 00       	call   468 <open>
 151:	89 44 24 18          	mov    %eax,0x18(%esp)
 155:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 15a:	79 29                	jns    185 <main+0x82>
      printf(1, "cat: cannot open %s\n", argv[i]);
 15c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 160:	c1 e0 02             	shl    $0x2,%eax
 163:	03 45 0c             	add    0xc(%ebp),%eax
 166:	8b 00                	mov    (%eax),%eax
 168:	89 44 24 08          	mov    %eax,0x8(%esp)
 16c:	c7 44 24 04 93 09 00 	movl   $0x993,0x4(%esp)
 173:	00 
 174:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17b:	e8 27 04 00 00       	call   5a7 <printf>
      exit();
 180:	e8 a3 02 00 00       	call   428 <exit>
    }
    wc(fd, argv[i]);
 185:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 189:	c1 e0 02             	shl    $0x2,%eax
 18c:	03 45 0c             	add    0xc(%ebp),%eax
 18f:	8b 00                	mov    (%eax),%eax
 191:	89 44 24 04          	mov    %eax,0x4(%esp)
 195:	8b 44 24 18          	mov    0x18(%esp),%eax
 199:	89 04 24             	mov    %eax,(%esp)
 19c:	e8 5f fe ff ff       	call   0 <wc>
    close(fd);
 1a1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1a5:	89 04 24             	mov    %eax,(%esp)
 1a8:	e8 a3 02 00 00       	call   450 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1ad:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1b2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1b6:	3b 45 08             	cmp    0x8(%ebp),%eax
 1b9:	0f 8c 76 ff ff ff    	jl     135 <main+0x32>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1bf:	e8 64 02 00 00       	call   428 <exit>

000001c4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cc:	8b 55 10             	mov    0x10(%ebp),%edx
 1cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d2:	89 cb                	mov    %ecx,%ebx
 1d4:	89 df                	mov    %ebx,%edi
 1d6:	89 d1                	mov    %edx,%ecx
 1d8:	fc                   	cld    
 1d9:	f3 aa                	rep stos %al,%es:(%edi)
 1db:	89 ca                	mov    %ecx,%edx
 1dd:	89 fb                	mov    %edi,%ebx
 1df:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1e2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1e5:	5b                   	pop    %ebx
 1e6:	5f                   	pop    %edi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    

000001e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1f5:	90                   	nop
 1f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f9:	0f b6 10             	movzbl (%eax),%edx
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	88 10                	mov    %dl,(%eax)
 201:	8b 45 08             	mov    0x8(%ebp),%eax
 204:	0f b6 00             	movzbl (%eax),%eax
 207:	84 c0                	test   %al,%al
 209:	0f 95 c0             	setne  %al
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 214:	84 c0                	test   %al,%al
 216:	75 de                	jne    1f6 <strcpy+0xd>
    ;
  return os;
 218:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 220:	eb 08                	jmp    22a <strcmp+0xd>
    p++, q++;
 222:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 226:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	84 c0                	test   %al,%al
 232:	74 10                	je     244 <strcmp+0x27>
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	38 c2                	cmp    %al,%dl
 242:	74 de                	je     222 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	0f b6 00             	movzbl (%eax),%eax
 24a:	0f b6 d0             	movzbl %al,%edx
 24d:	8b 45 0c             	mov    0xc(%ebp),%eax
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	0f b6 c0             	movzbl %al,%eax
 256:	89 d1                	mov    %edx,%ecx
 258:	29 c1                	sub    %eax,%ecx
 25a:	89 c8                	mov    %ecx,%eax
}
 25c:	5d                   	pop    %ebp
 25d:	c3                   	ret    

0000025e <strlen>:

uint
strlen(char *s)
{
 25e:	55                   	push   %ebp
 25f:	89 e5                	mov    %esp,%ebp
 261:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 264:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 26b:	eb 04                	jmp    271 <strlen+0x13>
 26d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 271:	8b 45 fc             	mov    -0x4(%ebp),%eax
 274:	03 45 08             	add    0x8(%ebp),%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	84 c0                	test   %al,%al
 27c:	75 ef                	jne    26d <strlen+0xf>
    ;
  return n;
 27e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <memset>:

void*
memset(void *dst, int c, uint n)
{
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 289:	8b 45 10             	mov    0x10(%ebp),%eax
 28c:	89 44 24 08          	mov    %eax,0x8(%esp)
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	89 44 24 04          	mov    %eax,0x4(%esp)
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	89 04 24             	mov    %eax,(%esp)
 29d:	e8 22 ff ff ff       	call   1c4 <stosb>
  return dst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a5:	c9                   	leave  
 2a6:	c3                   	ret    

000002a7 <strchr>:

char*
strchr(const char *s, char c)
{
 2a7:	55                   	push   %ebp
 2a8:	89 e5                	mov    %esp,%ebp
 2aa:	83 ec 04             	sub    $0x4,%esp
 2ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2b3:	eb 14                	jmp    2c9 <strchr+0x22>
    if(*s == c)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2be:	75 05                	jne    2c5 <strchr+0x1e>
      return (char*)s;
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
 2c3:	eb 13                	jmp    2d8 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
 2cc:	0f b6 00             	movzbl (%eax),%eax
 2cf:	84 c0                	test   %al,%al
 2d1:	75 e2                	jne    2b5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2d8:	c9                   	leave  
 2d9:	c3                   	ret    

000002da <gets>:

char*
gets(char *buf, int max)
{
 2da:	55                   	push   %ebp
 2db:	89 e5                	mov    %esp,%ebp
 2dd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2e7:	eb 44                	jmp    32d <gets+0x53>
    cc = read(0, &c, 1);
 2e9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2f0:	00 
 2f1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ff:	e8 3c 01 00 00       	call   440 <read>
 304:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 307:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 30b:	7e 2d                	jle    33a <gets+0x60>
      break;
    buf[i++] = c;
 30d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 310:	03 45 08             	add    0x8(%ebp),%eax
 313:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 317:	88 10                	mov    %dl,(%eax)
 319:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 31d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 321:	3c 0a                	cmp    $0xa,%al
 323:	74 16                	je     33b <gets+0x61>
 325:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 329:	3c 0d                	cmp    $0xd,%al
 32b:	74 0e                	je     33b <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 330:	83 c0 01             	add    $0x1,%eax
 333:	3b 45 0c             	cmp    0xc(%ebp),%eax
 336:	7c b1                	jl     2e9 <gets+0xf>
 338:	eb 01                	jmp    33b <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 33a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 33b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33e:	03 45 08             	add    0x8(%ebp),%eax
 341:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 344:	8b 45 08             	mov    0x8(%ebp),%eax
}
 347:	c9                   	leave  
 348:	c3                   	ret    

00000349 <stat>:

int
stat(char *n, struct stat *st)
{
 349:	55                   	push   %ebp
 34a:	89 e5                	mov    %esp,%ebp
 34c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 34f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 356:	00 
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	89 04 24             	mov    %eax,(%esp)
 35d:	e8 06 01 00 00       	call   468 <open>
 362:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 365:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 369:	79 07                	jns    372 <stat+0x29>
    return -1;
 36b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 370:	eb 23                	jmp    395 <stat+0x4c>
  r = fstat(fd, st);
 372:	8b 45 0c             	mov    0xc(%ebp),%eax
 375:	89 44 24 04          	mov    %eax,0x4(%esp)
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 fc 00 00 00       	call   480 <fstat>
 384:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 387:	8b 45 f4             	mov    -0xc(%ebp),%eax
 38a:	89 04 24             	mov    %eax,(%esp)
 38d:	e8 be 00 00 00       	call   450 <close>
  return r;
 392:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 395:	c9                   	leave  
 396:	c3                   	ret    

00000397 <atoi>:

int
atoi(const char *s)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 39d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3a4:	eb 24                	jmp    3ca <atoi+0x33>
    n = n*10 + *s++ - '0';
 3a6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a9:	89 d0                	mov    %edx,%eax
 3ab:	c1 e0 02             	shl    $0x2,%eax
 3ae:	01 d0                	add    %edx,%eax
 3b0:	01 c0                	add    %eax,%eax
 3b2:	89 c2                	mov    %eax,%edx
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	0f b6 00             	movzbl (%eax),%eax
 3ba:	0f be c0             	movsbl %al,%eax
 3bd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3c0:	83 e8 30             	sub    $0x30,%eax
 3c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ca:	8b 45 08             	mov    0x8(%ebp),%eax
 3cd:	0f b6 00             	movzbl (%eax),%eax
 3d0:	3c 2f                	cmp    $0x2f,%al
 3d2:	7e 0a                	jle    3de <atoi+0x47>
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	0f b6 00             	movzbl (%eax),%eax
 3da:	3c 39                	cmp    $0x39,%al
 3dc:	7e c8                	jle    3a6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3de:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3e1:	c9                   	leave  
 3e2:	c3                   	ret    

000003e3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3e3:	55                   	push   %ebp
 3e4:	89 e5                	mov    %esp,%ebp
 3e6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3f5:	eb 13                	jmp    40a <memmove+0x27>
    *dst++ = *src++;
 3f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3fa:	0f b6 10             	movzbl (%eax),%edx
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 400:	88 10                	mov    %dl,(%eax)
 402:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 406:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 40e:	0f 9f c0             	setg   %al
 411:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 415:	84 c0                	test   %al,%al
 417:	75 de                	jne    3f7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 419:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41c:	c9                   	leave  
 41d:	c3                   	ret    
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 420:	b8 01 00 00 00       	mov    $0x1,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <exit>:
SYSCALL(exit)
 428:	b8 02 00 00 00       	mov    $0x2,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <wait>:
SYSCALL(wait)
 430:	b8 03 00 00 00       	mov    $0x3,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <pipe>:
SYSCALL(pipe)
 438:	b8 04 00 00 00       	mov    $0x4,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <read>:
SYSCALL(read)
 440:	b8 05 00 00 00       	mov    $0x5,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <write>:
SYSCALL(write)
 448:	b8 10 00 00 00       	mov    $0x10,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <close>:
SYSCALL(close)
 450:	b8 15 00 00 00       	mov    $0x15,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <kill>:
SYSCALL(kill)
 458:	b8 06 00 00 00       	mov    $0x6,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <exec>:
SYSCALL(exec)
 460:	b8 07 00 00 00       	mov    $0x7,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <open>:
SYSCALL(open)
 468:	b8 0f 00 00 00       	mov    $0xf,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <mknod>:
SYSCALL(mknod)
 470:	b8 11 00 00 00       	mov    $0x11,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <unlink>:
SYSCALL(unlink)
 478:	b8 12 00 00 00       	mov    $0x12,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <fstat>:
SYSCALL(fstat)
 480:	b8 08 00 00 00       	mov    $0x8,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <link>:
SYSCALL(link)
 488:	b8 13 00 00 00       	mov    $0x13,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <mkdir>:
SYSCALL(mkdir)
 490:	b8 14 00 00 00       	mov    $0x14,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <chdir>:
SYSCALL(chdir)
 498:	b8 09 00 00 00       	mov    $0x9,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <dup>:
SYSCALL(dup)
 4a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <getpid>:
SYSCALL(getpid)
 4a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <sbrk>:
SYSCALL(sbrk)
 4b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <sleep>:
SYSCALL(sleep)
 4b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <uptime>:
SYSCALL(uptime)
 4c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <signal>:
SYSCALL(signal)
 4c8:	b8 16 00 00 00       	mov    $0x16,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 28             	sub    $0x28,%esp
 4d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e3:	00 
 4e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	89 04 24             	mov    %eax,(%esp)
 4f1:	e8 52 ff ff ff       	call   448 <write>
}
 4f6:	c9                   	leave  
 4f7:	c3                   	ret    

000004f8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 505:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 509:	74 17                	je     522 <printint+0x2a>
 50b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 50f:	79 11                	jns    522 <printint+0x2a>
    neg = 1;
 511:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 518:	8b 45 0c             	mov    0xc(%ebp),%eax
 51b:	f7 d8                	neg    %eax
 51d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 520:	eb 06                	jmp    528 <printint+0x30>
  } else {
    x = xx;
 522:	8b 45 0c             	mov    0xc(%ebp),%eax
 525:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 528:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 52f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 532:	8b 45 ec             	mov    -0x14(%ebp),%eax
 535:	ba 00 00 00 00       	mov    $0x0,%edx
 53a:	f7 f1                	div    %ecx
 53c:	89 d0                	mov    %edx,%eax
 53e:	0f b6 90 b0 09 00 00 	movzbl 0x9b0(%eax),%edx
 545:	8d 45 dc             	lea    -0x24(%ebp),%eax
 548:	03 45 f4             	add    -0xc(%ebp),%eax
 54b:	88 10                	mov    %dl,(%eax)
 54d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 551:	8b 45 10             	mov    0x10(%ebp),%eax
 554:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 557:	8b 45 ec             	mov    -0x14(%ebp),%eax
 55a:	ba 00 00 00 00       	mov    $0x0,%edx
 55f:	f7 75 d4             	divl   -0x2c(%ebp)
 562:	89 45 ec             	mov    %eax,-0x14(%ebp)
 565:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 569:	75 c4                	jne    52f <printint+0x37>
  if(neg)
 56b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 56f:	74 2a                	je     59b <printint+0xa3>
    buf[i++] = '-';
 571:	8d 45 dc             	lea    -0x24(%ebp),%eax
 574:	03 45 f4             	add    -0xc(%ebp),%eax
 577:	c6 00 2d             	movb   $0x2d,(%eax)
 57a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 57e:	eb 1b                	jmp    59b <printint+0xa3>
    putc(fd, buf[i]);
 580:	8d 45 dc             	lea    -0x24(%ebp),%eax
 583:	03 45 f4             	add    -0xc(%ebp),%eax
 586:	0f b6 00             	movzbl (%eax),%eax
 589:	0f be c0             	movsbl %al,%eax
 58c:	89 44 24 04          	mov    %eax,0x4(%esp)
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	89 04 24             	mov    %eax,(%esp)
 596:	e8 35 ff ff ff       	call   4d0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 59b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 59f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a3:	79 db                	jns    580 <printint+0x88>
    putc(fd, buf[i]);
}
 5a5:	c9                   	leave  
 5a6:	c3                   	ret    

000005a7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a7:	55                   	push   %ebp
 5a8:	89 e5                	mov    %esp,%ebp
 5aa:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b4:	8d 45 0c             	lea    0xc(%ebp),%eax
 5b7:	83 c0 04             	add    $0x4,%eax
 5ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c4:	e9 7e 01 00 00       	jmp    747 <printf+0x1a0>
    c = fmt[i] & 0xff;
 5c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5cf:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5d2:	0f b6 00             	movzbl (%eax),%eax
 5d5:	0f be c0             	movsbl %al,%eax
 5d8:	25 ff 00 00 00       	and    $0xff,%eax
 5dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e4:	75 2c                	jne    612 <printf+0x6b>
      if(c == '%'){
 5e6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ea:	75 0c                	jne    5f8 <printf+0x51>
        state = '%';
 5ec:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5f3:	e9 4b 01 00 00       	jmp    743 <printf+0x19c>
      } else {
        putc(fd, c);
 5f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fb:	0f be c0             	movsbl %al,%eax
 5fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	89 04 24             	mov    %eax,(%esp)
 608:	e8 c3 fe ff ff       	call   4d0 <putc>
 60d:	e9 31 01 00 00       	jmp    743 <printf+0x19c>
      }
    } else if(state == '%'){
 612:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 616:	0f 85 27 01 00 00    	jne    743 <printf+0x19c>
      if(c == 'd'){
 61c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 620:	75 2d                	jne    64f <printf+0xa8>
        printint(fd, *ap, 10, 1);
 622:	8b 45 e8             	mov    -0x18(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 62e:	00 
 62f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 636:	00 
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 b2 fe ff ff       	call   4f8 <printint>
        ap++;
 646:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64a:	e9 ed 00 00 00       	jmp    73c <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 64f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 653:	74 06                	je     65b <printf+0xb4>
 655:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 659:	75 2d                	jne    688 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 65b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65e:	8b 00                	mov    (%eax),%eax
 660:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 667:	00 
 668:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 66f:	00 
 670:	89 44 24 04          	mov    %eax,0x4(%esp)
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	89 04 24             	mov    %eax,(%esp)
 67a:	e8 79 fe ff ff       	call   4f8 <printint>
        ap++;
 67f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 683:	e9 b4 00 00 00       	jmp    73c <printf+0x195>
      } else if(c == 's'){
 688:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 68c:	75 46                	jne    6d4 <printf+0x12d>
        s = (char*)*ap;
 68e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 691:	8b 00                	mov    (%eax),%eax
 693:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 696:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 69a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 69e:	75 27                	jne    6c7 <printf+0x120>
          s = "(null)";
 6a0:	c7 45 f4 a8 09 00 00 	movl   $0x9a8,-0xc(%ebp)
        while(*s != 0){
 6a7:	eb 1f                	jmp    6c8 <printf+0x121>
          putc(fd, *s);
 6a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ac:	0f b6 00             	movzbl (%eax),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 0f fe ff ff       	call   4d0 <putc>
          s++;
 6c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 6c5:	eb 01                	jmp    6c8 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6c7:	90                   	nop
 6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cb:	0f b6 00             	movzbl (%eax),%eax
 6ce:	84 c0                	test   %al,%al
 6d0:	75 d7                	jne    6a9 <printf+0x102>
 6d2:	eb 68                	jmp    73c <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6d4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6d8:	75 1d                	jne    6f7 <printf+0x150>
        putc(fd, *ap);
 6da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6dd:	8b 00                	mov    (%eax),%eax
 6df:	0f be c0             	movsbl %al,%eax
 6e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 df fd ff ff       	call   4d0 <putc>
        ap++;
 6f1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f5:	eb 45                	jmp    73c <printf+0x195>
      } else if(c == '%'){
 6f7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6fb:	75 17                	jne    714 <printf+0x16d>
        putc(fd, c);
 6fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 700:	0f be c0             	movsbl %al,%eax
 703:	89 44 24 04          	mov    %eax,0x4(%esp)
 707:	8b 45 08             	mov    0x8(%ebp),%eax
 70a:	89 04 24             	mov    %eax,(%esp)
 70d:	e8 be fd ff ff       	call   4d0 <putc>
 712:	eb 28                	jmp    73c <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 714:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 71b:	00 
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 a9 fd ff ff       	call   4d0 <putc>
        putc(fd, c);
 727:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72a:	0f be c0             	movsbl %al,%eax
 72d:	89 44 24 04          	mov    %eax,0x4(%esp)
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	89 04 24             	mov    %eax,(%esp)
 737:	e8 94 fd ff ff       	call   4d0 <putc>
      }
      state = 0;
 73c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 743:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 747:	8b 55 0c             	mov    0xc(%ebp),%edx
 74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 750:	0f b6 00             	movzbl (%eax),%eax
 753:	84 c0                	test   %al,%al
 755:	0f 85 6e fe ff ff    	jne    5c9 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 75b:	c9                   	leave  
 75c:	c3                   	ret    
 75d:	90                   	nop
 75e:	90                   	nop
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	83 e8 08             	sub    $0x8,%eax
 76c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76f:	a1 e8 09 00 00       	mov    0x9e8,%eax
 774:	89 45 fc             	mov    %eax,-0x4(%ebp)
 777:	eb 24                	jmp    79d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	8b 00                	mov    (%eax),%eax
 77e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 781:	77 12                	ja     795 <free+0x35>
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 789:	77 24                	ja     7af <free+0x4f>
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 793:	77 1a                	ja     7af <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 795:	8b 45 fc             	mov    -0x4(%ebp),%eax
 798:	8b 00                	mov    (%eax),%eax
 79a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 79d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a3:	76 d4                	jbe    779 <free+0x19>
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ad:	76 ca                	jbe    779 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b2:	8b 40 04             	mov    0x4(%eax),%eax
 7b5:	c1 e0 03             	shl    $0x3,%eax
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	03 55 f8             	add    -0x8(%ebp),%edx
 7bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c0:	8b 00                	mov    (%eax),%eax
 7c2:	39 c2                	cmp    %eax,%edx
 7c4:	75 24                	jne    7ea <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c9:	8b 50 04             	mov    0x4(%eax),%edx
 7cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cf:	8b 00                	mov    (%eax),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	01 c2                	add    %eax,%edx
 7d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	8b 10                	mov    (%eax),%edx
 7e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e6:	89 10                	mov    %edx,(%eax)
 7e8:	eb 0a                	jmp    7f4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	8b 40 04             	mov    0x4(%eax),%eax
 7fa:	c1 e0 03             	shl    $0x3,%eax
 7fd:	03 45 fc             	add    -0x4(%ebp),%eax
 800:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 803:	75 20                	jne    825 <free+0xc5>
    p->s.size += bp->s.size;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	8b 50 04             	mov    0x4(%eax),%edx
 80b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80e:	8b 40 04             	mov    0x4(%eax),%eax
 811:	01 c2                	add    %eax,%edx
 813:	8b 45 fc             	mov    -0x4(%ebp),%eax
 816:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 819:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81c:	8b 10                	mov    (%eax),%edx
 81e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 821:	89 10                	mov    %edx,(%eax)
 823:	eb 08                	jmp    82d <free+0xcd>
  } else
    p->s.ptr = bp;
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	8b 55 f8             	mov    -0x8(%ebp),%edx
 82b:	89 10                	mov    %edx,(%eax)
  freep = p;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	a3 e8 09 00 00       	mov    %eax,0x9e8
}
 835:	c9                   	leave  
 836:	c3                   	ret    

00000837 <morecore>:

static Header*
morecore(uint nu)
{
 837:	55                   	push   %ebp
 838:	89 e5                	mov    %esp,%ebp
 83a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 83d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 844:	77 07                	ja     84d <morecore+0x16>
    nu = 4096;
 846:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	c1 e0 03             	shl    $0x3,%eax
 853:	89 04 24             	mov    %eax,(%esp)
 856:	e8 55 fc ff ff       	call   4b0 <sbrk>
 85b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 85e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 862:	75 07                	jne    86b <morecore+0x34>
    return 0;
 864:	b8 00 00 00 00       	mov    $0x0,%eax
 869:	eb 22                	jmp    88d <morecore+0x56>
  hp = (Header*)p;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 871:	8b 45 f0             	mov    -0x10(%ebp),%eax
 874:	8b 55 08             	mov    0x8(%ebp),%edx
 877:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 87a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87d:	83 c0 08             	add    $0x8,%eax
 880:	89 04 24             	mov    %eax,(%esp)
 883:	e8 d8 fe ff ff       	call   760 <free>
  return freep;
 888:	a1 e8 09 00 00       	mov    0x9e8,%eax
}
 88d:	c9                   	leave  
 88e:	c3                   	ret    

0000088f <malloc>:

void*
malloc(uint nbytes)
{
 88f:	55                   	push   %ebp
 890:	89 e5                	mov    %esp,%ebp
 892:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	83 c0 07             	add    $0x7,%eax
 89b:	c1 e8 03             	shr    $0x3,%eax
 89e:	83 c0 01             	add    $0x1,%eax
 8a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8a4:	a1 e8 09 00 00       	mov    0x9e8,%eax
 8a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8b0:	75 23                	jne    8d5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8b2:	c7 45 f0 e0 09 00 00 	movl   $0x9e0,-0x10(%ebp)
 8b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bc:	a3 e8 09 00 00       	mov    %eax,0x9e8
 8c1:	a1 e8 09 00 00       	mov    0x9e8,%eax
 8c6:	a3 e0 09 00 00       	mov    %eax,0x9e0
    base.s.size = 0;
 8cb:	c7 05 e4 09 00 00 00 	movl   $0x0,0x9e4
 8d2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e0:	8b 40 04             	mov    0x4(%eax),%eax
 8e3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8e6:	72 4d                	jb     935 <malloc+0xa6>
      if(p->s.size == nunits)
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 40 04             	mov    0x4(%eax),%eax
 8ee:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8f1:	75 0c                	jne    8ff <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fb:	89 10                	mov    %edx,(%eax)
 8fd:	eb 26                	jmp    925 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 40 04             	mov    0x4(%eax),%eax
 905:	89 c2                	mov    %eax,%edx
 907:	2b 55 ec             	sub    -0x14(%ebp),%edx
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 910:	8b 45 f4             	mov    -0xc(%ebp),%eax
 913:	8b 40 04             	mov    0x4(%eax),%eax
 916:	c1 e0 03             	shl    $0x3,%eax
 919:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 922:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 925:	8b 45 f0             	mov    -0x10(%ebp),%eax
 928:	a3 e8 09 00 00       	mov    %eax,0x9e8
      return (void*)(p + 1);
 92d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 930:	83 c0 08             	add    $0x8,%eax
 933:	eb 38                	jmp    96d <malloc+0xde>
    }
    if(p == freep)
 935:	a1 e8 09 00 00       	mov    0x9e8,%eax
 93a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 93d:	75 1b                	jne    95a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 93f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 942:	89 04 24             	mov    %eax,(%esp)
 945:	e8 ed fe ff ff       	call   837 <morecore>
 94a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 94d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 951:	75 07                	jne    95a <malloc+0xcb>
        return 0;
 953:	b8 00 00 00 00       	mov    $0x0,%eax
 958:	eb 13                	jmp    96d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 960:	8b 45 f4             	mov    -0xc(%ebp),%eax
 963:	8b 00                	mov    (%eax),%eax
 965:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 968:	e9 70 ff ff ff       	jmp    8dd <malloc+0x4e>
}
 96d:	c9                   	leave  
 96e:	c3                   	ret    
