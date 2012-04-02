
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 c2 08 00 00 	movl   $0x8c2,(%esp)
  18:	e8 9b 03 00 00       	call   3b8 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 c2 08 00 00 	movl   $0x8c2,(%esp)
  38:	e8 83 03 00 00       	call   3c0 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 c2 08 00 00 	movl   $0x8c2,(%esp)
  4c:	e8 67 03 00 00       	call   3b8 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 93 03 00 00       	call   3f0 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 87 03 00 00       	call   3f0 <dup>
  69:	eb 01                	jmp    6c <main+0x6c>
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
  6b:	90                   	nop
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
  6c:	c7 44 24 04 ca 08 00 	movl   $0x8ca,0x4(%esp)
  73:	00 
  74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7b:	e8 77 04 00 00       	call   4f7 <printf>
    pid = fork();
  80:	e8 eb 02 00 00       	call   370 <fork>
  85:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  89:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8e:	79 19                	jns    a9 <main+0xa9>
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 dd 08 00 	movl   $0x8dd,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 53 04 00 00       	call   4f7 <printf>
      exit();
  a4:	e8 cf 02 00 00       	call   378 <exit>
    }
    if(pid == 0){
  a9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ae:	75 41                	jne    f1 <main+0xf1>
      exec("sh", argv);
  b0:	c7 44 24 04 18 09 00 	movl   $0x918,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 bf 08 00 00 	movl   $0x8bf,(%esp)
  bf:	e8 ec 02 00 00       	call   3b0 <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 f0 08 00 	movl   $0x8f0,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 1f 04 00 00       	call   4f7 <printf>
      exit();
  d8:	e8 9b 02 00 00       	call   378 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  dd:	c7 44 24 04 06 09 00 	movl   $0x906,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 06 04 00 00       	call   4f7 <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f1:	e8 8a 02 00 00       	call   380 <wait>
  f6:	89 44 24 18          	mov    %eax,0x18(%esp)
  fa:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  ff:	0f 88 66 ff ff ff    	js     6b <main+0x6b>
 105:	8b 44 24 18          	mov    0x18(%esp),%eax
 109:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 10d:	75 ce                	jne    dd <main+0xdd>
      printf(1, "zombie!\n");
  }
 10f:	e9 58 ff ff ff       	jmp    6c <main+0x6c>

00000114 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 119:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11c:	8b 55 10             	mov    0x10(%ebp),%edx
 11f:	8b 45 0c             	mov    0xc(%ebp),%eax
 122:	89 cb                	mov    %ecx,%ebx
 124:	89 df                	mov    %ebx,%edi
 126:	89 d1                	mov    %edx,%ecx
 128:	fc                   	cld    
 129:	f3 aa                	rep stos %al,%es:(%edi)
 12b:	89 ca                	mov    %ecx,%edx
 12d:	89 fb                	mov    %edi,%ebx
 12f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 132:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 135:	5b                   	pop    %ebx
 136:	5f                   	pop    %edi
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    

00000139 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 145:	90                   	nop
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	0f b6 10             	movzbl (%eax),%edx
 14c:	8b 45 08             	mov    0x8(%ebp),%eax
 14f:	88 10                	mov    %dl,(%eax)
 151:	8b 45 08             	mov    0x8(%ebp),%eax
 154:	0f b6 00             	movzbl (%eax),%eax
 157:	84 c0                	test   %al,%al
 159:	0f 95 c0             	setne  %al
 15c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 160:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 164:	84 c0                	test   %al,%al
 166:	75 de                	jne    146 <strcpy+0xd>
    ;
  return os;
 168:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 16b:	c9                   	leave  
 16c:	c3                   	ret    

0000016d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 16d:	55                   	push   %ebp
 16e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 170:	eb 08                	jmp    17a <strcmp+0xd>
    p++, q++;
 172:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 176:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	74 10                	je     194 <strcmp+0x27>
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	0f b6 10             	movzbl (%eax),%edx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	0f b6 00             	movzbl (%eax),%eax
 190:	38 c2                	cmp    %al,%dl
 192:	74 de                	je     172 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 d0             	movzbl %al,%edx
 19d:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	0f b6 c0             	movzbl %al,%eax
 1a6:	89 d1                	mov    %edx,%ecx
 1a8:	29 c1                	sub    %eax,%ecx
 1aa:	89 c8                	mov    %ecx,%eax
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strlen>:

uint
strlen(char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1bb:	eb 04                	jmp    1c1 <strlen+0x13>
 1bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1c4:	03 45 08             	add    0x8(%ebp),%eax
 1c7:	0f b6 00             	movzbl (%eax),%eax
 1ca:	84 c0                	test   %al,%al
 1cc:	75 ef                	jne    1bd <strlen+0xf>
    ;
  return n;
 1ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d1:	c9                   	leave  
 1d2:	c3                   	ret    

000001d3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d9:	8b 45 10             	mov    0x10(%ebp),%eax
 1dc:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	89 04 24             	mov    %eax,(%esp)
 1ed:	e8 22 ff ff ff       	call   114 <stosb>
  return dst;
 1f2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f5:	c9                   	leave  
 1f6:	c3                   	ret    

000001f7 <strchr>:

char*
strchr(const char *s, char c)
{
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	83 ec 04             	sub    $0x4,%esp
 1fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 200:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 203:	eb 14                	jmp    219 <strchr+0x22>
    if(*s == c)
 205:	8b 45 08             	mov    0x8(%ebp),%eax
 208:	0f b6 00             	movzbl (%eax),%eax
 20b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20e:	75 05                	jne    215 <strchr+0x1e>
      return (char*)s;
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	eb 13                	jmp    228 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 215:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 219:	8b 45 08             	mov    0x8(%ebp),%eax
 21c:	0f b6 00             	movzbl (%eax),%eax
 21f:	84 c0                	test   %al,%al
 221:	75 e2                	jne    205 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 223:	b8 00 00 00 00       	mov    $0x0,%eax
}
 228:	c9                   	leave  
 229:	c3                   	ret    

0000022a <gets>:

char*
gets(char *buf, int max)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 230:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 237:	eb 44                	jmp    27d <gets+0x53>
    cc = read(0, &c, 1);
 239:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 240:	00 
 241:	8d 45 ef             	lea    -0x11(%ebp),%eax
 244:	89 44 24 04          	mov    %eax,0x4(%esp)
 248:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24f:	e8 3c 01 00 00       	call   390 <read>
 254:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 257:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 25b:	7e 2d                	jle    28a <gets+0x60>
      break;
    buf[i++] = c;
 25d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 260:	03 45 08             	add    0x8(%ebp),%eax
 263:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 267:	88 10                	mov    %dl,(%eax)
 269:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 26d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 16                	je     28b <gets+0x61>
 275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 279:	3c 0d                	cmp    $0xd,%al
 27b:	74 0e                	je     28b <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 27d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 280:	83 c0 01             	add    $0x1,%eax
 283:	3b 45 0c             	cmp    0xc(%ebp),%eax
 286:	7c b1                	jl     239 <gets+0xf>
 288:	eb 01                	jmp    28b <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 28a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 28b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28e:	03 45 08             	add    0x8(%ebp),%eax
 291:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 294:	8b 45 08             	mov    0x8(%ebp),%eax
}
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <stat>:

int
stat(char *n, struct stat *st)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a6:	00 
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	89 04 24             	mov    %eax,(%esp)
 2ad:	e8 06 01 00 00       	call   3b8 <open>
 2b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b9:	79 07                	jns    2c2 <stat+0x29>
    return -1;
 2bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c0:	eb 23                	jmp    2e5 <stat+0x4c>
  r = fstat(fd, st);
 2c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2cc:	89 04 24             	mov    %eax,(%esp)
 2cf:	e8 fc 00 00 00       	call   3d0 <fstat>
 2d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2da:	89 04 24             	mov    %eax,(%esp)
 2dd:	e8 be 00 00 00       	call   3a0 <close>
  return r;
 2e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <atoi>:

int
atoi(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f4:	eb 24                	jmp    31a <atoi+0x33>
    n = n*10 + *s++ - '0';
 2f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f9:	89 d0                	mov    %edx,%eax
 2fb:	c1 e0 02             	shl    $0x2,%eax
 2fe:	01 d0                	add    %edx,%eax
 300:	01 c0                	add    %eax,%eax
 302:	89 c2                	mov    %eax,%edx
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	0f b6 00             	movzbl (%eax),%eax
 30a:	0f be c0             	movsbl %al,%eax
 30d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 310:	83 e8 30             	sub    $0x30,%eax
 313:	89 45 fc             	mov    %eax,-0x4(%ebp)
 316:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31a:	8b 45 08             	mov    0x8(%ebp),%eax
 31d:	0f b6 00             	movzbl (%eax),%eax
 320:	3c 2f                	cmp    $0x2f,%al
 322:	7e 0a                	jle    32e <atoi+0x47>
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	0f b6 00             	movzbl (%eax),%eax
 32a:	3c 39                	cmp    $0x39,%al
 32c:	7e c8                	jle    2f6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 32e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 339:	8b 45 08             	mov    0x8(%ebp),%eax
 33c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33f:	8b 45 0c             	mov    0xc(%ebp),%eax
 342:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 345:	eb 13                	jmp    35a <memmove+0x27>
    *dst++ = *src++;
 347:	8b 45 f8             	mov    -0x8(%ebp),%eax
 34a:	0f b6 10             	movzbl (%eax),%edx
 34d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 350:	88 10                	mov    %dl,(%eax)
 352:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 356:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 35e:	0f 9f c0             	setg   %al
 361:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 365:	84 c0                	test   %al,%al
 367:	75 de                	jne    347 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 369:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36c:	c9                   	leave  
 36d:	c3                   	ret    
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 370:	b8 01 00 00 00       	mov    $0x1,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <exit>:
SYSCALL(exit)
 378:	b8 02 00 00 00       	mov    $0x2,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <wait>:
SYSCALL(wait)
 380:	b8 03 00 00 00       	mov    $0x3,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <pipe>:
SYSCALL(pipe)
 388:	b8 04 00 00 00       	mov    $0x4,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <read>:
SYSCALL(read)
 390:	b8 05 00 00 00       	mov    $0x5,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <write>:
SYSCALL(write)
 398:	b8 10 00 00 00       	mov    $0x10,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <close>:
SYSCALL(close)
 3a0:	b8 15 00 00 00       	mov    $0x15,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <kill>:
SYSCALL(kill)
 3a8:	b8 06 00 00 00       	mov    $0x6,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <exec>:
SYSCALL(exec)
 3b0:	b8 07 00 00 00       	mov    $0x7,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <open>:
SYSCALL(open)
 3b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mknod>:
SYSCALL(mknod)
 3c0:	b8 11 00 00 00       	mov    $0x11,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <unlink>:
SYSCALL(unlink)
 3c8:	b8 12 00 00 00       	mov    $0x12,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <fstat>:
SYSCALL(fstat)
 3d0:	b8 08 00 00 00       	mov    $0x8,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <link>:
SYSCALL(link)
 3d8:	b8 13 00 00 00       	mov    $0x13,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <mkdir>:
SYSCALL(mkdir)
 3e0:	b8 14 00 00 00       	mov    $0x14,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <chdir>:
SYSCALL(chdir)
 3e8:	b8 09 00 00 00       	mov    $0x9,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <dup>:
SYSCALL(dup)
 3f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <getpid>:
SYSCALL(getpid)
 3f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <sbrk>:
SYSCALL(sbrk)
 400:	b8 0c 00 00 00       	mov    $0xc,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <sleep>:
SYSCALL(sleep)
 408:	b8 0d 00 00 00       	mov    $0xd,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <uptime>:
SYSCALL(uptime)
 410:	b8 0e 00 00 00       	mov    $0xe,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <signal>:
SYSCALL(signal)
 418:	b8 16 00 00 00       	mov    $0x16,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	83 ec 28             	sub    $0x28,%esp
 426:	8b 45 0c             	mov    0xc(%ebp),%eax
 429:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 42c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 433:	00 
 434:	8d 45 f4             	lea    -0xc(%ebp),%eax
 437:	89 44 24 04          	mov    %eax,0x4(%esp)
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	89 04 24             	mov    %eax,(%esp)
 441:	e8 52 ff ff ff       	call   398 <write>
}
 446:	c9                   	leave  
 447:	c3                   	ret    

00000448 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 44e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 455:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 459:	74 17                	je     472 <printint+0x2a>
 45b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 45f:	79 11                	jns    472 <printint+0x2a>
    neg = 1;
 461:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 468:	8b 45 0c             	mov    0xc(%ebp),%eax
 46b:	f7 d8                	neg    %eax
 46d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 470:	eb 06                	jmp    478 <printint+0x30>
  } else {
    x = xx;
 472:	8b 45 0c             	mov    0xc(%ebp),%eax
 475:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 47f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 482:	8b 45 ec             	mov    -0x14(%ebp),%eax
 485:	ba 00 00 00 00       	mov    $0x0,%edx
 48a:	f7 f1                	div    %ecx
 48c:	89 d0                	mov    %edx,%eax
 48e:	0f b6 90 20 09 00 00 	movzbl 0x920(%eax),%edx
 495:	8d 45 dc             	lea    -0x24(%ebp),%eax
 498:	03 45 f4             	add    -0xc(%ebp),%eax
 49b:	88 10                	mov    %dl,(%eax)
 49d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 4a1:	8b 45 10             	mov    0x10(%ebp),%eax
 4a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4aa:	ba 00 00 00 00       	mov    $0x0,%edx
 4af:	f7 75 d4             	divl   -0x2c(%ebp)
 4b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b9:	75 c4                	jne    47f <printint+0x37>
  if(neg)
 4bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4bf:	74 2a                	je     4eb <printint+0xa3>
    buf[i++] = '-';
 4c1:	8d 45 dc             	lea    -0x24(%ebp),%eax
 4c4:	03 45 f4             	add    -0xc(%ebp),%eax
 4c7:	c6 00 2d             	movb   $0x2d,(%eax)
 4ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 4ce:	eb 1b                	jmp    4eb <printint+0xa3>
    putc(fd, buf[i]);
 4d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 4d3:	03 45 f4             	add    -0xc(%ebp),%eax
 4d6:	0f b6 00             	movzbl (%eax),%eax
 4d9:	0f be c0             	movsbl %al,%eax
 4dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	89 04 24             	mov    %eax,(%esp)
 4e6:	e8 35 ff ff ff       	call   420 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4eb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f3:	79 db                	jns    4d0 <printint+0x88>
    putc(fd, buf[i]);
}
 4f5:	c9                   	leave  
 4f6:	c3                   	ret    

000004f7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4f7:	55                   	push   %ebp
 4f8:	89 e5                	mov    %esp,%ebp
 4fa:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 504:	8d 45 0c             	lea    0xc(%ebp),%eax
 507:	83 c0 04             	add    $0x4,%eax
 50a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 50d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 514:	e9 7e 01 00 00       	jmp    697 <printf+0x1a0>
    c = fmt[i] & 0xff;
 519:	8b 55 0c             	mov    0xc(%ebp),%edx
 51c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 51f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 522:	0f b6 00             	movzbl (%eax),%eax
 525:	0f be c0             	movsbl %al,%eax
 528:	25 ff 00 00 00       	and    $0xff,%eax
 52d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 530:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 534:	75 2c                	jne    562 <printf+0x6b>
      if(c == '%'){
 536:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 53a:	75 0c                	jne    548 <printf+0x51>
        state = '%';
 53c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 543:	e9 4b 01 00 00       	jmp    693 <printf+0x19c>
      } else {
        putc(fd, c);
 548:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54b:	0f be c0             	movsbl %al,%eax
 54e:	89 44 24 04          	mov    %eax,0x4(%esp)
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	89 04 24             	mov    %eax,(%esp)
 558:	e8 c3 fe ff ff       	call   420 <putc>
 55d:	e9 31 01 00 00       	jmp    693 <printf+0x19c>
      }
    } else if(state == '%'){
 562:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 566:	0f 85 27 01 00 00    	jne    693 <printf+0x19c>
      if(c == 'd'){
 56c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 570:	75 2d                	jne    59f <printf+0xa8>
        printint(fd, *ap, 10, 1);
 572:	8b 45 e8             	mov    -0x18(%ebp),%eax
 575:	8b 00                	mov    (%eax),%eax
 577:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 57e:	00 
 57f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 586:	00 
 587:	89 44 24 04          	mov    %eax,0x4(%esp)
 58b:	8b 45 08             	mov    0x8(%ebp),%eax
 58e:	89 04 24             	mov    %eax,(%esp)
 591:	e8 b2 fe ff ff       	call   448 <printint>
        ap++;
 596:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 59a:	e9 ed 00 00 00       	jmp    68c <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 59f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5a3:	74 06                	je     5ab <printf+0xb4>
 5a5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5a9:	75 2d                	jne    5d8 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ae:	8b 00                	mov    (%eax),%eax
 5b0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5b7:	00 
 5b8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5bf:	00 
 5c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
 5c7:	89 04 24             	mov    %eax,(%esp)
 5ca:	e8 79 fe ff ff       	call   448 <printint>
        ap++;
 5cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d3:	e9 b4 00 00 00       	jmp    68c <printf+0x195>
      } else if(c == 's'){
 5d8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5dc:	75 46                	jne    624 <printf+0x12d>
        s = (char*)*ap;
 5de:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5e6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ee:	75 27                	jne    617 <printf+0x120>
          s = "(null)";
 5f0:	c7 45 f4 0f 09 00 00 	movl   $0x90f,-0xc(%ebp)
        while(*s != 0){
 5f7:	eb 1f                	jmp    618 <printf+0x121>
          putc(fd, *s);
 5f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5fc:	0f b6 00             	movzbl (%eax),%eax
 5ff:	0f be c0             	movsbl %al,%eax
 602:	89 44 24 04          	mov    %eax,0x4(%esp)
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	89 04 24             	mov    %eax,(%esp)
 60c:	e8 0f fe ff ff       	call   420 <putc>
          s++;
 611:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 615:	eb 01                	jmp    618 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 617:	90                   	nop
 618:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61b:	0f b6 00             	movzbl (%eax),%eax
 61e:	84 c0                	test   %al,%al
 620:	75 d7                	jne    5f9 <printf+0x102>
 622:	eb 68                	jmp    68c <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 624:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 628:	75 1d                	jne    647 <printf+0x150>
        putc(fd, *ap);
 62a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62d:	8b 00                	mov    (%eax),%eax
 62f:	0f be c0             	movsbl %al,%eax
 632:	89 44 24 04          	mov    %eax,0x4(%esp)
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	89 04 24             	mov    %eax,(%esp)
 63c:	e8 df fd ff ff       	call   420 <putc>
        ap++;
 641:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 645:	eb 45                	jmp    68c <printf+0x195>
      } else if(c == '%'){
 647:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 64b:	75 17                	jne    664 <printf+0x16d>
        putc(fd, c);
 64d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 650:	0f be c0             	movsbl %al,%eax
 653:	89 44 24 04          	mov    %eax,0x4(%esp)
 657:	8b 45 08             	mov    0x8(%ebp),%eax
 65a:	89 04 24             	mov    %eax,(%esp)
 65d:	e8 be fd ff ff       	call   420 <putc>
 662:	eb 28                	jmp    68c <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 664:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 66b:	00 
 66c:	8b 45 08             	mov    0x8(%ebp),%eax
 66f:	89 04 24             	mov    %eax,(%esp)
 672:	e8 a9 fd ff ff       	call   420 <putc>
        putc(fd, c);
 677:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67a:	0f be c0             	movsbl %al,%eax
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 94 fd ff ff       	call   420 <putc>
      }
      state = 0;
 68c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 693:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 697:	8b 55 0c             	mov    0xc(%ebp),%edx
 69a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 69d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6a0:	0f b6 00             	movzbl (%eax),%eax
 6a3:	84 c0                	test   %al,%al
 6a5:	0f 85 6e fe ff ff    	jne    519 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6ab:	c9                   	leave  
 6ac:	c3                   	ret    
 6ad:	90                   	nop
 6ae:	90                   	nop
 6af:	90                   	nop

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	83 e8 08             	sub    $0x8,%eax
 6bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6bf:	a1 3c 09 00 00       	mov    0x93c,%eax
 6c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6c7:	eb 24                	jmp    6ed <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cc:	8b 00                	mov    (%eax),%eax
 6ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d1:	77 12                	ja     6e5 <free+0x35>
 6d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d9:	77 24                	ja     6ff <free+0x4f>
 6db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6de:	8b 00                	mov    (%eax),%eax
 6e0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e3:	77 1a                	ja     6ff <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 00                	mov    (%eax),%eax
 6ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f3:	76 d4                	jbe    6c9 <free+0x19>
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	8b 00                	mov    (%eax),%eax
 6fa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fd:	76 ca                	jbe    6c9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 702:	8b 40 04             	mov    0x4(%eax),%eax
 705:	c1 e0 03             	shl    $0x3,%eax
 708:	89 c2                	mov    %eax,%edx
 70a:	03 55 f8             	add    -0x8(%ebp),%edx
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	39 c2                	cmp    %eax,%edx
 714:	75 24                	jne    73a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 716:	8b 45 f8             	mov    -0x8(%ebp),%eax
 719:	8b 50 04             	mov    0x4(%eax),%edx
 71c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71f:	8b 00                	mov    (%eax),%eax
 721:	8b 40 04             	mov    0x4(%eax),%eax
 724:	01 c2                	add    %eax,%edx
 726:	8b 45 f8             	mov    -0x8(%ebp),%eax
 729:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 72c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	8b 10                	mov    (%eax),%edx
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	89 10                	mov    %edx,(%eax)
 738:	eb 0a                	jmp    744 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 73a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73d:	8b 10                	mov    (%eax),%edx
 73f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 742:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 40 04             	mov    0x4(%eax),%eax
 74a:	c1 e0 03             	shl    $0x3,%eax
 74d:	03 45 fc             	add    -0x4(%ebp),%eax
 750:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 753:	75 20                	jne    775 <free+0xc5>
    p->s.size += bp->s.size;
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 50 04             	mov    0x4(%eax),%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	8b 40 04             	mov    0x4(%eax),%eax
 761:	01 c2                	add    %eax,%edx
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	8b 10                	mov    (%eax),%edx
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	89 10                	mov    %edx,(%eax)
 773:	eb 08                	jmp    77d <free+0xcd>
  } else
    p->s.ptr = bp;
 775:	8b 45 fc             	mov    -0x4(%ebp),%eax
 778:	8b 55 f8             	mov    -0x8(%ebp),%edx
 77b:	89 10                	mov    %edx,(%eax)
  freep = p;
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	a3 3c 09 00 00       	mov    %eax,0x93c
}
 785:	c9                   	leave  
 786:	c3                   	ret    

00000787 <morecore>:

static Header*
morecore(uint nu)
{
 787:	55                   	push   %ebp
 788:	89 e5                	mov    %esp,%ebp
 78a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 78d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 794:	77 07                	ja     79d <morecore+0x16>
    nu = 4096;
 796:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	c1 e0 03             	shl    $0x3,%eax
 7a3:	89 04 24             	mov    %eax,(%esp)
 7a6:	e8 55 fc ff ff       	call   400 <sbrk>
 7ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7ae:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7b2:	75 07                	jne    7bb <morecore+0x34>
    return 0;
 7b4:	b8 00 00 00 00       	mov    $0x0,%eax
 7b9:	eb 22                	jmp    7dd <morecore+0x56>
  hp = (Header*)p;
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c4:	8b 55 08             	mov    0x8(%ebp),%edx
 7c7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cd:	83 c0 08             	add    $0x8,%eax
 7d0:	89 04 24             	mov    %eax,(%esp)
 7d3:	e8 d8 fe ff ff       	call   6b0 <free>
  return freep;
 7d8:	a1 3c 09 00 00       	mov    0x93c,%eax
}
 7dd:	c9                   	leave  
 7de:	c3                   	ret    

000007df <malloc>:

void*
malloc(uint nbytes)
{
 7df:	55                   	push   %ebp
 7e0:	89 e5                	mov    %esp,%ebp
 7e2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e5:	8b 45 08             	mov    0x8(%ebp),%eax
 7e8:	83 c0 07             	add    $0x7,%eax
 7eb:	c1 e8 03             	shr    $0x3,%eax
 7ee:	83 c0 01             	add    $0x1,%eax
 7f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7f4:	a1 3c 09 00 00       	mov    0x93c,%eax
 7f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7fc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 800:	75 23                	jne    825 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 802:	c7 45 f0 34 09 00 00 	movl   $0x934,-0x10(%ebp)
 809:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80c:	a3 3c 09 00 00       	mov    %eax,0x93c
 811:	a1 3c 09 00 00       	mov    0x93c,%eax
 816:	a3 34 09 00 00       	mov    %eax,0x934
    base.s.size = 0;
 81b:	c7 05 38 09 00 00 00 	movl   $0x0,0x938
 822:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 825:	8b 45 f0             	mov    -0x10(%ebp),%eax
 828:	8b 00                	mov    (%eax),%eax
 82a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 82d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 830:	8b 40 04             	mov    0x4(%eax),%eax
 833:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 836:	72 4d                	jb     885 <malloc+0xa6>
      if(p->s.size == nunits)
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	8b 40 04             	mov    0x4(%eax),%eax
 83e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 841:	75 0c                	jne    84f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 843:	8b 45 f4             	mov    -0xc(%ebp),%eax
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84b:	89 10                	mov    %edx,(%eax)
 84d:	eb 26                	jmp    875 <malloc+0x96>
      else {
        p->s.size -= nunits;
 84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 852:	8b 40 04             	mov    0x4(%eax),%eax
 855:	89 c2                	mov    %eax,%edx
 857:	2b 55 ec             	sub    -0x14(%ebp),%edx
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 860:	8b 45 f4             	mov    -0xc(%ebp),%eax
 863:	8b 40 04             	mov    0x4(%eax),%eax
 866:	c1 e0 03             	shl    $0x3,%eax
 869:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 86c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 872:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 875:	8b 45 f0             	mov    -0x10(%ebp),%eax
 878:	a3 3c 09 00 00       	mov    %eax,0x93c
      return (void*)(p + 1);
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	83 c0 08             	add    $0x8,%eax
 883:	eb 38                	jmp    8bd <malloc+0xde>
    }
    if(p == freep)
 885:	a1 3c 09 00 00       	mov    0x93c,%eax
 88a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 88d:	75 1b                	jne    8aa <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 88f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 892:	89 04 24             	mov    %eax,(%esp)
 895:	e8 ed fe ff ff       	call   787 <morecore>
 89a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 89d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a1:	75 07                	jne    8aa <malloc+0xcb>
        return 0;
 8a3:	b8 00 00 00 00       	mov    $0x0,%eax
 8a8:	eb 13                	jmp    8bd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b3:	8b 00                	mov    (%eax),%eax
 8b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8b8:	e9 70 ff ff ff       	jmp    82d <malloc+0x4e>
}
 8bd:	c9                   	leave  
 8be:	c3                   	ret    
