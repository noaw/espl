
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dc 03 00 00       	call   3ee <strlen>
  12:	03 45 08             	add    0x8(%ebp),%eax
  15:	89 45 f4             	mov    %eax,-0xc(%ebp)
  18:	eb 04                	jmp    1e <fmtname+0x1e>
  1a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  21:	3b 45 08             	cmp    0x8(%ebp),%eax
  24:	72 0a                	jb     30 <fmtname+0x30>
  26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  29:	0f b6 00             	movzbl (%eax),%eax
  2c:	3c 2f                	cmp    $0x2f,%al
  2e:	75 ea                	jne    1a <fmtname+0x1a>
    ;
  p++;
  30:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  34:	8b 45 f4             	mov    -0xc(%ebp),%eax
  37:	89 04 24             	mov    %eax,(%esp)
  3a:	e8 af 03 00 00       	call   3ee <strlen>
  3f:	83 f8 0d             	cmp    $0xd,%eax
  42:	76 05                	jbe    49 <fmtname+0x49>
    return p;
  44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  47:	eb 5f                	jmp    a8 <fmtname+0xa8>
  memmove(buf, p, strlen(p));
  49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 9a 03 00 00       	call   3ee <strlen>
  54:	89 44 24 08          	mov    %eax,0x8(%esp)
  58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  5f:	c7 04 24 64 0b 00 00 	movl   $0xb64,(%esp)
  66:	e8 08 05 00 00       	call   573 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	89 04 24             	mov    %eax,(%esp)
  71:	e8 78 03 00 00       	call   3ee <strlen>
  76:	ba 0e 00 00 00       	mov    $0xe,%edx
  7b:	89 d3                	mov    %edx,%ebx
  7d:	29 c3                	sub    %eax,%ebx
  7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  82:	89 04 24             	mov    %eax,(%esp)
  85:	e8 64 03 00 00       	call   3ee <strlen>
  8a:	05 64 0b 00 00       	add    $0xb64,%eax
  8f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  93:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9a:	00 
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 70 03 00 00       	call   413 <memset>
  return buf;
  a3:	b8 64 0b 00 00       	mov    $0xb64,%eax
}
  a8:	83 c4 24             	add    $0x24,%esp
  ab:	5b                   	pop    %ebx
  ac:	5d                   	pop    %ebp
  ad:	c3                   	ret    

000000ae <ls>:

void
ls(char *path)
{
  ae:	55                   	push   %ebp
  af:	89 e5                	mov    %esp,%ebp
  b1:	57                   	push   %edi
  b2:	56                   	push   %esi
  b3:	53                   	push   %ebx
  b4:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c1:	00 
  c2:	8b 45 08             	mov    0x8(%ebp),%eax
  c5:	89 04 24             	mov    %eax,(%esp)
  c8:	e8 2b 05 00 00       	call   5f8 <open>
  cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d4:	79 20                	jns    f6 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d6:	8b 45 08             	mov    0x8(%ebp),%eax
  d9:	89 44 24 08          	mov    %eax,0x8(%esp)
  dd:	c7 44 24 04 ff 0a 00 	movl   $0xaff,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ec:	e8 46 06 00 00       	call   737 <printf>
    return;
  f1:	e9 02 02 00 00       	jmp    2f8 <ls+0x24a>
  }
  
  if(fstat(fd, &st) < 0){
  f6:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 100:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 103:	89 04 24             	mov    %eax,(%esp)
 106:	e8 05 05 00 00       	call   610 <fstat>
 10b:	85 c0                	test   %eax,%eax
 10d:	79 2b                	jns    13a <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	89 44 24 08          	mov    %eax,0x8(%esp)
 116:	c7 44 24 04 13 0b 00 	movl   $0xb13,0x4(%esp)
 11d:	00 
 11e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 125:	e8 0d 06 00 00       	call   737 <printf>
    close(fd);
 12a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12d:	89 04 24             	mov    %eax,(%esp)
 130:	e8 ab 04 00 00       	call   5e0 <close>
    return;
 135:	e9 be 01 00 00       	jmp    2f8 <ls+0x24a>
  }
  
  switch(st.type){
 13a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 141:	98                   	cwtl   
 142:	83 f8 01             	cmp    $0x1,%eax
 145:	74 53                	je     19a <ls+0xec>
 147:	83 f8 02             	cmp    $0x2,%eax
 14a:	0f 85 9d 01 00 00    	jne    2ed <ls+0x23f>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 150:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 156:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 163:	0f bf d8             	movswl %ax,%ebx
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 04 24             	mov    %eax,(%esp)
 16c:	e8 8f fe ff ff       	call   0 <fmtname>
 171:	89 7c 24 14          	mov    %edi,0x14(%esp)
 175:	89 74 24 10          	mov    %esi,0x10(%esp)
 179:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17d:	89 44 24 08          	mov    %eax,0x8(%esp)
 181:	c7 44 24 04 27 0b 00 	movl   $0xb27,0x4(%esp)
 188:	00 
 189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 190:	e8 a2 05 00 00       	call   737 <printf>
    break;
 195:	e9 53 01 00 00       	jmp    2ed <ls+0x23f>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	89 04 24             	mov    %eax,(%esp)
 1a0:	e8 49 02 00 00       	call   3ee <strlen>
 1a5:	83 c0 10             	add    $0x10,%eax
 1a8:	3d 00 02 00 00       	cmp    $0x200,%eax
 1ad:	76 19                	jbe    1c8 <ls+0x11a>
      printf(1, "ls: path too long\n");
 1af:	c7 44 24 04 34 0b 00 	movl   $0xb34,0x4(%esp)
 1b6:	00 
 1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1be:	e8 74 05 00 00       	call   737 <printf>
      break;
 1c3:	e9 25 01 00 00       	jmp    2ed <ls+0x23f>
    }
    strcpy(buf, path);
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cf:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 9c 01 00 00       	call   379 <strcpy>
    p = buf+strlen(buf);
 1dd:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 03 02 00 00       	call   3ee <strlen>
 1eb:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 1f4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fa:	c6 00 2f             	movb   $0x2f,(%eax)
 1fd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 201:	e9 c0 00 00 00       	jmp    2c6 <ls+0x218>
      if(de.inum == 0)
 206:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 20d:	66 85 c0             	test   %ax,%ax
 210:	0f 84 af 00 00 00    	je     2c5 <ls+0x217>
        continue;
      memmove(p, de.name, DIRSIZ);
 216:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 21d:	00 
 21e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 224:	83 c0 02             	add    $0x2,%eax
 227:	89 44 24 04          	mov    %eax,0x4(%esp)
 22b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22e:	89 04 24             	mov    %eax,(%esp)
 231:	e8 3d 03 00 00       	call   573 <memmove>
      p[DIRSIZ] = 0;
 236:	8b 45 e0             	mov    -0x20(%ebp),%eax
 239:	83 c0 0e             	add    $0xe,%eax
 23c:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 23f:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 245:	89 44 24 04          	mov    %eax,0x4(%esp)
 249:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 24f:	89 04 24             	mov    %eax,(%esp)
 252:	e8 82 02 00 00       	call   4d9 <stat>
 257:	85 c0                	test   %eax,%eax
 259:	79 20                	jns    27b <ls+0x1cd>
        printf(1, "ls: cannot stat %s\n", buf);
 25b:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 261:	89 44 24 08          	mov    %eax,0x8(%esp)
 265:	c7 44 24 04 13 0b 00 	movl   $0xb13,0x4(%esp)
 26c:	00 
 26d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 274:	e8 be 04 00 00       	call   737 <printf>
        continue;
 279:	eb 4b                	jmp    2c6 <ls+0x218>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27b:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 281:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 287:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 28e:	0f bf d8             	movswl %ax,%ebx
 291:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 297:	89 04 24             	mov    %eax,(%esp)
 29a:	e8 61 fd ff ff       	call   0 <fmtname>
 29f:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a3:	89 74 24 10          	mov    %esi,0x10(%esp)
 2a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 2af:	c7 44 24 04 27 0b 00 	movl   $0xb27,0x4(%esp)
 2b6:	00 
 2b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2be:	e8 74 04 00 00       	call   737 <printf>
 2c3:	eb 01                	jmp    2c6 <ls+0x218>
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
 2c5:	90                   	nop
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2cd:	00 
 2ce:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2db:	89 04 24             	mov    %eax,(%esp)
 2de:	e8 ed 02 00 00       	call   5d0 <read>
 2e3:	83 f8 10             	cmp    $0x10,%eax
 2e6:	0f 84 1a ff ff ff    	je     206 <ls+0x158>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2ec:	90                   	nop
  }
  close(fd);
 2ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f0:	89 04 24             	mov    %eax,(%esp)
 2f3:	e8 e8 02 00 00       	call   5e0 <close>
}
 2f8:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2fe:	5b                   	pop    %ebx
 2ff:	5e                   	pop    %esi
 300:	5f                   	pop    %edi
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <main>:

int
main(int argc, char *argv[])
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	83 e4 f0             	and    $0xfffffff0,%esp
 309:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 310:	7f 11                	jg     323 <main+0x20>
    ls(".");
 312:	c7 04 24 47 0b 00 00 	movl   $0xb47,(%esp)
 319:	e8 90 fd ff ff       	call   ae <ls>
    exit();
 31e:	e8 95 02 00 00       	call   5b8 <exit>
  }
  for(i=1; i<argc; i++)
 323:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32a:	00 
 32b:	eb 19                	jmp    346 <main+0x43>
    ls(argv[i]);
 32d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 331:	c1 e0 02             	shl    $0x2,%eax
 334:	03 45 0c             	add    0xc(%ebp),%eax
 337:	8b 00                	mov    (%eax),%eax
 339:	89 04 24             	mov    %eax,(%esp)
 33c:	e8 6d fd ff ff       	call   ae <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 341:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 346:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 34a:	3b 45 08             	cmp    0x8(%ebp),%eax
 34d:	7c de                	jl     32d <main+0x2a>
    ls(argv[i]);
  exit();
 34f:	e8 64 02 00 00       	call   5b8 <exit>

00000354 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 359:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35c:	8b 55 10             	mov    0x10(%ebp),%edx
 35f:	8b 45 0c             	mov    0xc(%ebp),%eax
 362:	89 cb                	mov    %ecx,%ebx
 364:	89 df                	mov    %ebx,%edi
 366:	89 d1                	mov    %edx,%ecx
 368:	fc                   	cld    
 369:	f3 aa                	rep stos %al,%es:(%edi)
 36b:	89 ca                	mov    %ecx,%edx
 36d:	89 fb                	mov    %edi,%ebx
 36f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 372:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 375:	5b                   	pop    %ebx
 376:	5f                   	pop    %edi
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    

00000379 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 385:	90                   	nop
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	0f b6 10             	movzbl (%eax),%edx
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	88 10                	mov    %dl,(%eax)
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	0f b6 00             	movzbl (%eax),%eax
 397:	84 c0                	test   %al,%al
 399:	0f 95 c0             	setne  %al
 39c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 3a4:	84 c0                	test   %al,%al
 3a6:	75 de                	jne    386 <strcpy+0xd>
    ;
  return os;
 3a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ab:	c9                   	leave  
 3ac:	c3                   	ret    

000003ad <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ad:	55                   	push   %ebp
 3ae:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b0:	eb 08                	jmp    3ba <strcmp+0xd>
    p++, q++;
 3b2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	0f b6 00             	movzbl (%eax),%eax
 3c0:	84 c0                	test   %al,%al
 3c2:	74 10                	je     3d4 <strcmp+0x27>
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	0f b6 10             	movzbl (%eax),%edx
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	0f b6 00             	movzbl (%eax),%eax
 3d0:	38 c2                	cmp    %al,%dl
 3d2:	74 de                	je     3b2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	0f b6 00             	movzbl (%eax),%eax
 3da:	0f b6 d0             	movzbl %al,%edx
 3dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e0:	0f b6 00             	movzbl (%eax),%eax
 3e3:	0f b6 c0             	movzbl %al,%eax
 3e6:	89 d1                	mov    %edx,%ecx
 3e8:	29 c1                	sub    %eax,%ecx
 3ea:	89 c8                	mov    %ecx,%eax
}
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    

000003ee <strlen>:

uint
strlen(char *s)
{
 3ee:	55                   	push   %ebp
 3ef:	89 e5                	mov    %esp,%ebp
 3f1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fb:	eb 04                	jmp    401 <strlen+0x13>
 3fd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 401:	8b 45 fc             	mov    -0x4(%ebp),%eax
 404:	03 45 08             	add    0x8(%ebp),%eax
 407:	0f b6 00             	movzbl (%eax),%eax
 40a:	84 c0                	test   %al,%al
 40c:	75 ef                	jne    3fd <strlen+0xf>
    ;
  return n;
 40e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <memset>:

void*
memset(void *dst, int c, uint n)
{
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 419:	8b 45 10             	mov    0x10(%ebp),%eax
 41c:	89 44 24 08          	mov    %eax,0x8(%esp)
 420:	8b 45 0c             	mov    0xc(%ebp),%eax
 423:	89 44 24 04          	mov    %eax,0x4(%esp)
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	89 04 24             	mov    %eax,(%esp)
 42d:	e8 22 ff ff ff       	call   354 <stosb>
  return dst;
 432:	8b 45 08             	mov    0x8(%ebp),%eax
}
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <strchr>:

char*
strchr(const char *s, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	83 ec 04             	sub    $0x4,%esp
 43d:	8b 45 0c             	mov    0xc(%ebp),%eax
 440:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 443:	eb 14                	jmp    459 <strchr+0x22>
    if(*s == c)
 445:	8b 45 08             	mov    0x8(%ebp),%eax
 448:	0f b6 00             	movzbl (%eax),%eax
 44b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 44e:	75 05                	jne    455 <strchr+0x1e>
      return (char*)s;
 450:	8b 45 08             	mov    0x8(%ebp),%eax
 453:	eb 13                	jmp    468 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 455:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 459:	8b 45 08             	mov    0x8(%ebp),%eax
 45c:	0f b6 00             	movzbl (%eax),%eax
 45f:	84 c0                	test   %al,%al
 461:	75 e2                	jne    445 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 463:	b8 00 00 00 00       	mov    $0x0,%eax
}
 468:	c9                   	leave  
 469:	c3                   	ret    

0000046a <gets>:

char*
gets(char *buf, int max)
{
 46a:	55                   	push   %ebp
 46b:	89 e5                	mov    %esp,%ebp
 46d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 470:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 477:	eb 44                	jmp    4bd <gets+0x53>
    cc = read(0, &c, 1);
 479:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 480:	00 
 481:	8d 45 ef             	lea    -0x11(%ebp),%eax
 484:	89 44 24 04          	mov    %eax,0x4(%esp)
 488:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 48f:	e8 3c 01 00 00       	call   5d0 <read>
 494:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 497:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49b:	7e 2d                	jle    4ca <gets+0x60>
      break;
    buf[i++] = c;
 49d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a0:	03 45 08             	add    0x8(%ebp),%eax
 4a3:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4a7:	88 10                	mov    %dl,(%eax)
 4a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
 4ad:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b1:	3c 0a                	cmp    $0xa,%al
 4b3:	74 16                	je     4cb <gets+0x61>
 4b5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b9:	3c 0d                	cmp    $0xd,%al
 4bb:	74 0e                	je     4cb <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c0:	83 c0 01             	add    $0x1,%eax
 4c3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4c6:	7c b1                	jl     479 <gets+0xf>
 4c8:	eb 01                	jmp    4cb <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ca:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ce:	03 45 08             	add    0x8(%ebp),%eax
 4d1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    

000004d9 <stat>:

int
stat(char *n, struct stat *st)
{
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
 4dc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4df:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4e6:	00 
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	89 04 24             	mov    %eax,(%esp)
 4ed:	e8 06 01 00 00       	call   5f8 <open>
 4f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f9:	79 07                	jns    502 <stat+0x29>
    return -1;
 4fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 500:	eb 23                	jmp    525 <stat+0x4c>
  r = fstat(fd, st);
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	89 44 24 04          	mov    %eax,0x4(%esp)
 509:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50c:	89 04 24             	mov    %eax,(%esp)
 50f:	e8 fc 00 00 00       	call   610 <fstat>
 514:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 517:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51a:	89 04 24             	mov    %eax,(%esp)
 51d:	e8 be 00 00 00       	call   5e0 <close>
  return r;
 522:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 525:	c9                   	leave  
 526:	c3                   	ret    

00000527 <atoi>:

int
atoi(const char *s)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 52d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 534:	eb 24                	jmp    55a <atoi+0x33>
    n = n*10 + *s++ - '0';
 536:	8b 55 fc             	mov    -0x4(%ebp),%edx
 539:	89 d0                	mov    %edx,%eax
 53b:	c1 e0 02             	shl    $0x2,%eax
 53e:	01 d0                	add    %edx,%eax
 540:	01 c0                	add    %eax,%eax
 542:	89 c2                	mov    %eax,%edx
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	0f b6 00             	movzbl (%eax),%eax
 54a:	0f be c0             	movsbl %al,%eax
 54d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 550:	83 e8 30             	sub    $0x30,%eax
 553:	89 45 fc             	mov    %eax,-0x4(%ebp)
 556:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 55a:	8b 45 08             	mov    0x8(%ebp),%eax
 55d:	0f b6 00             	movzbl (%eax),%eax
 560:	3c 2f                	cmp    $0x2f,%al
 562:	7e 0a                	jle    56e <atoi+0x47>
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	0f b6 00             	movzbl (%eax),%eax
 56a:	3c 39                	cmp    $0x39,%al
 56c:	7e c8                	jle    536 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 56e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 571:	c9                   	leave  
 572:	c3                   	ret    

00000573 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 57f:	8b 45 0c             	mov    0xc(%ebp),%eax
 582:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 585:	eb 13                	jmp    59a <memmove+0x27>
    *dst++ = *src++;
 587:	8b 45 f8             	mov    -0x8(%ebp),%eax
 58a:	0f b6 10             	movzbl (%eax),%edx
 58d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 590:	88 10                	mov    %dl,(%eax)
 592:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 596:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 59a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 59e:	0f 9f c0             	setg   %al
 5a1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5a5:	84 c0                	test   %al,%al
 5a7:	75 de                	jne    587 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5ac:	c9                   	leave  
 5ad:	c3                   	ret    
 5ae:	90                   	nop
 5af:	90                   	nop

000005b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b0:	b8 01 00 00 00       	mov    $0x1,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <exit>:
SYSCALL(exit)
 5b8:	b8 02 00 00 00       	mov    $0x2,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <wait>:
SYSCALL(wait)
 5c0:	b8 03 00 00 00       	mov    $0x3,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <pipe>:
SYSCALL(pipe)
 5c8:	b8 04 00 00 00       	mov    $0x4,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <read>:
SYSCALL(read)
 5d0:	b8 05 00 00 00       	mov    $0x5,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <write>:
SYSCALL(write)
 5d8:	b8 10 00 00 00       	mov    $0x10,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <close>:
SYSCALL(close)
 5e0:	b8 15 00 00 00       	mov    $0x15,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <kill>:
SYSCALL(kill)
 5e8:	b8 06 00 00 00       	mov    $0x6,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <exec>:
SYSCALL(exec)
 5f0:	b8 07 00 00 00       	mov    $0x7,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <open>:
SYSCALL(open)
 5f8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <mknod>:
SYSCALL(mknod)
 600:	b8 11 00 00 00       	mov    $0x11,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <unlink>:
SYSCALL(unlink)
 608:	b8 12 00 00 00       	mov    $0x12,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <fstat>:
SYSCALL(fstat)
 610:	b8 08 00 00 00       	mov    $0x8,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <link>:
SYSCALL(link)
 618:	b8 13 00 00 00       	mov    $0x13,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <mkdir>:
SYSCALL(mkdir)
 620:	b8 14 00 00 00       	mov    $0x14,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <chdir>:
SYSCALL(chdir)
 628:	b8 09 00 00 00       	mov    $0x9,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <dup>:
SYSCALL(dup)
 630:	b8 0a 00 00 00       	mov    $0xa,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <getpid>:
SYSCALL(getpid)
 638:	b8 0b 00 00 00       	mov    $0xb,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <sbrk>:
SYSCALL(sbrk)
 640:	b8 0c 00 00 00       	mov    $0xc,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <sleep>:
SYSCALL(sleep)
 648:	b8 0d 00 00 00       	mov    $0xd,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <uptime>:
SYSCALL(uptime)
 650:	b8 0e 00 00 00       	mov    $0xe,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <signal>:
SYSCALL(signal)
 658:	b8 16 00 00 00       	mov    $0x16,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	83 ec 28             	sub    $0x28,%esp
 666:	8b 45 0c             	mov    0xc(%ebp),%eax
 669:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 66c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 673:	00 
 674:	8d 45 f4             	lea    -0xc(%ebp),%eax
 677:	89 44 24 04          	mov    %eax,0x4(%esp)
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	89 04 24             	mov    %eax,(%esp)
 681:	e8 52 ff ff ff       	call   5d8 <write>
}
 686:	c9                   	leave  
 687:	c3                   	ret    

00000688 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 688:	55                   	push   %ebp
 689:	89 e5                	mov    %esp,%ebp
 68b:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 68e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 695:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 699:	74 17                	je     6b2 <printint+0x2a>
 69b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 69f:	79 11                	jns    6b2 <printint+0x2a>
    neg = 1;
 6a1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ab:	f7 d8                	neg    %eax
 6ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6b0:	eb 06                	jmp    6b8 <printint+0x30>
  } else {
    x = xx;
 6b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c5:	ba 00 00 00 00       	mov    $0x0,%edx
 6ca:	f7 f1                	div    %ecx
 6cc:	89 d0                	mov    %edx,%eax
 6ce:	0f b6 90 50 0b 00 00 	movzbl 0xb50(%eax),%edx
 6d5:	8d 45 dc             	lea    -0x24(%ebp),%eax
 6d8:	03 45 f4             	add    -0xc(%ebp),%eax
 6db:	88 10                	mov    %dl,(%eax)
 6dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
 6e1:	8b 45 10             	mov    0x10(%ebp),%eax
 6e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ea:	ba 00 00 00 00       	mov    $0x0,%edx
 6ef:	f7 75 d4             	divl   -0x2c(%ebp)
 6f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6f9:	75 c4                	jne    6bf <printint+0x37>
  if(neg)
 6fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6ff:	74 2a                	je     72b <printint+0xa3>
    buf[i++] = '-';
 701:	8d 45 dc             	lea    -0x24(%ebp),%eax
 704:	03 45 f4             	add    -0xc(%ebp),%eax
 707:	c6 00 2d             	movb   $0x2d,(%eax)
 70a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
 70e:	eb 1b                	jmp    72b <printint+0xa3>
    putc(fd, buf[i]);
 710:	8d 45 dc             	lea    -0x24(%ebp),%eax
 713:	03 45 f4             	add    -0xc(%ebp),%eax
 716:	0f b6 00             	movzbl (%eax),%eax
 719:	0f be c0             	movsbl %al,%eax
 71c:	89 44 24 04          	mov    %eax,0x4(%esp)
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	89 04 24             	mov    %eax,(%esp)
 726:	e8 35 ff ff ff       	call   660 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 72b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 72f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 733:	79 db                	jns    710 <printint+0x88>
    putc(fd, buf[i]);
}
 735:	c9                   	leave  
 736:	c3                   	ret    

00000737 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 737:	55                   	push   %ebp
 738:	89 e5                	mov    %esp,%ebp
 73a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 73d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 744:	8d 45 0c             	lea    0xc(%ebp),%eax
 747:	83 c0 04             	add    $0x4,%eax
 74a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 74d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 754:	e9 7e 01 00 00       	jmp    8d7 <printf+0x1a0>
    c = fmt[i] & 0xff;
 759:	8b 55 0c             	mov    0xc(%ebp),%edx
 75c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 762:	0f b6 00             	movzbl (%eax),%eax
 765:	0f be c0             	movsbl %al,%eax
 768:	25 ff 00 00 00       	and    $0xff,%eax
 76d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 770:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 774:	75 2c                	jne    7a2 <printf+0x6b>
      if(c == '%'){
 776:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 77a:	75 0c                	jne    788 <printf+0x51>
        state = '%';
 77c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 783:	e9 4b 01 00 00       	jmp    8d3 <printf+0x19c>
      } else {
        putc(fd, c);
 788:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78b:	0f be c0             	movsbl %al,%eax
 78e:	89 44 24 04          	mov    %eax,0x4(%esp)
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	89 04 24             	mov    %eax,(%esp)
 798:	e8 c3 fe ff ff       	call   660 <putc>
 79d:	e9 31 01 00 00       	jmp    8d3 <printf+0x19c>
      }
    } else if(state == '%'){
 7a2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7a6:	0f 85 27 01 00 00    	jne    8d3 <printf+0x19c>
      if(c == 'd'){
 7ac:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7b0:	75 2d                	jne    7df <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b5:	8b 00                	mov    (%eax),%eax
 7b7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7be:	00 
 7bf:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7c6:	00 
 7c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7cb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ce:	89 04 24             	mov    %eax,(%esp)
 7d1:	e8 b2 fe ff ff       	call   688 <printint>
        ap++;
 7d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7da:	e9 ed 00 00 00       	jmp    8cc <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 7df:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7e3:	74 06                	je     7eb <printf+0xb4>
 7e5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7e9:	75 2d                	jne    818 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 7eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ee:	8b 00                	mov    (%eax),%eax
 7f0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7f7:	00 
 7f8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7ff:	00 
 800:	89 44 24 04          	mov    %eax,0x4(%esp)
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 79 fe ff ff       	call   688 <printint>
        ap++;
 80f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 813:	e9 b4 00 00 00       	jmp    8cc <printf+0x195>
      } else if(c == 's'){
 818:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 81c:	75 46                	jne    864 <printf+0x12d>
        s = (char*)*ap;
 81e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 821:	8b 00                	mov    (%eax),%eax
 823:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 826:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 82a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82e:	75 27                	jne    857 <printf+0x120>
          s = "(null)";
 830:	c7 45 f4 49 0b 00 00 	movl   $0xb49,-0xc(%ebp)
        while(*s != 0){
 837:	eb 1f                	jmp    858 <printf+0x121>
          putc(fd, *s);
 839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83c:	0f b6 00             	movzbl (%eax),%eax
 83f:	0f be c0             	movsbl %al,%eax
 842:	89 44 24 04          	mov    %eax,0x4(%esp)
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	89 04 24             	mov    %eax,(%esp)
 84c:	e8 0f fe ff ff       	call   660 <putc>
          s++;
 851:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 855:	eb 01                	jmp    858 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 857:	90                   	nop
 858:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85b:	0f b6 00             	movzbl (%eax),%eax
 85e:	84 c0                	test   %al,%al
 860:	75 d7                	jne    839 <printf+0x102>
 862:	eb 68                	jmp    8cc <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 864:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 868:	75 1d                	jne    887 <printf+0x150>
        putc(fd, *ap);
 86a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 86d:	8b 00                	mov    (%eax),%eax
 86f:	0f be c0             	movsbl %al,%eax
 872:	89 44 24 04          	mov    %eax,0x4(%esp)
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	89 04 24             	mov    %eax,(%esp)
 87c:	e8 df fd ff ff       	call   660 <putc>
        ap++;
 881:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 885:	eb 45                	jmp    8cc <printf+0x195>
      } else if(c == '%'){
 887:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 88b:	75 17                	jne    8a4 <printf+0x16d>
        putc(fd, c);
 88d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 890:	0f be c0             	movsbl %al,%eax
 893:	89 44 24 04          	mov    %eax,0x4(%esp)
 897:	8b 45 08             	mov    0x8(%ebp),%eax
 89a:	89 04 24             	mov    %eax,(%esp)
 89d:	e8 be fd ff ff       	call   660 <putc>
 8a2:	eb 28                	jmp    8cc <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8a4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8ab:	00 
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	89 04 24             	mov    %eax,(%esp)
 8b2:	e8 a9 fd ff ff       	call   660 <putc>
        putc(fd, c);
 8b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ba:	0f be c0             	movsbl %al,%eax
 8bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c1:	8b 45 08             	mov    0x8(%ebp),%eax
 8c4:	89 04 24             	mov    %eax,(%esp)
 8c7:	e8 94 fd ff ff       	call   660 <putc>
      }
      state = 0;
 8cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8d7:	8b 55 0c             	mov    0xc(%ebp),%edx
 8da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8e0:	0f b6 00             	movzbl (%eax),%eax
 8e3:	84 c0                	test   %al,%al
 8e5:	0f 85 6e fe ff ff    	jne    759 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8eb:	c9                   	leave  
 8ec:	c3                   	ret    
 8ed:	90                   	nop
 8ee:	90                   	nop
 8ef:	90                   	nop

000008f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	83 e8 08             	sub    $0x8,%eax
 8fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ff:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 904:	89 45 fc             	mov    %eax,-0x4(%ebp)
 907:	eb 24                	jmp    92d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 911:	77 12                	ja     925 <free+0x35>
 913:	8b 45 f8             	mov    -0x8(%ebp),%eax
 916:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 919:	77 24                	ja     93f <free+0x4f>
 91b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91e:	8b 00                	mov    (%eax),%eax
 920:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 923:	77 1a                	ja     93f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	8b 00                	mov    (%eax),%eax
 92a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 92d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 930:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 933:	76 d4                	jbe    909 <free+0x19>
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 93d:	76 ca                	jbe    909 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 93f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 942:	8b 40 04             	mov    0x4(%eax),%eax
 945:	c1 e0 03             	shl    $0x3,%eax
 948:	89 c2                	mov    %eax,%edx
 94a:	03 55 f8             	add    -0x8(%ebp),%edx
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	8b 00                	mov    (%eax),%eax
 952:	39 c2                	cmp    %eax,%edx
 954:	75 24                	jne    97a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 956:	8b 45 f8             	mov    -0x8(%ebp),%eax
 959:	8b 50 04             	mov    0x4(%eax),%edx
 95c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95f:	8b 00                	mov    (%eax),%eax
 961:	8b 40 04             	mov    0x4(%eax),%eax
 964:	01 c2                	add    %eax,%edx
 966:	8b 45 f8             	mov    -0x8(%ebp),%eax
 969:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 96c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96f:	8b 00                	mov    (%eax),%eax
 971:	8b 10                	mov    (%eax),%edx
 973:	8b 45 f8             	mov    -0x8(%ebp),%eax
 976:	89 10                	mov    %edx,(%eax)
 978:	eb 0a                	jmp    984 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 97a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97d:	8b 10                	mov    (%eax),%edx
 97f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 982:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	8b 40 04             	mov    0x4(%eax),%eax
 98a:	c1 e0 03             	shl    $0x3,%eax
 98d:	03 45 fc             	add    -0x4(%ebp),%eax
 990:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 993:	75 20                	jne    9b5 <free+0xc5>
    p->s.size += bp->s.size;
 995:	8b 45 fc             	mov    -0x4(%ebp),%eax
 998:	8b 50 04             	mov    0x4(%eax),%edx
 99b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99e:	8b 40 04             	mov    0x4(%eax),%eax
 9a1:	01 c2                	add    %eax,%edx
 9a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ac:	8b 10                	mov    (%eax),%edx
 9ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b1:	89 10                	mov    %edx,(%eax)
 9b3:	eb 08                	jmp    9bd <free+0xcd>
  } else
    p->s.ptr = bp;
 9b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9bb:	89 10                	mov    %edx,(%eax)
  freep = p;
 9bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c0:	a3 7c 0b 00 00       	mov    %eax,0xb7c
}
 9c5:	c9                   	leave  
 9c6:	c3                   	ret    

000009c7 <morecore>:

static Header*
morecore(uint nu)
{
 9c7:	55                   	push   %ebp
 9c8:	89 e5                	mov    %esp,%ebp
 9ca:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9cd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9d4:	77 07                	ja     9dd <morecore+0x16>
    nu = 4096;
 9d6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
 9e0:	c1 e0 03             	shl    $0x3,%eax
 9e3:	89 04 24             	mov    %eax,(%esp)
 9e6:	e8 55 fc ff ff       	call   640 <sbrk>
 9eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9ee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9f2:	75 07                	jne    9fb <morecore+0x34>
    return 0;
 9f4:	b8 00 00 00 00       	mov    $0x0,%eax
 9f9:	eb 22                	jmp    a1d <morecore+0x56>
  hp = (Header*)p;
 9fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a01:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a04:	8b 55 08             	mov    0x8(%ebp),%edx
 a07:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0d:	83 c0 08             	add    $0x8,%eax
 a10:	89 04 24             	mov    %eax,(%esp)
 a13:	e8 d8 fe ff ff       	call   8f0 <free>
  return freep;
 a18:	a1 7c 0b 00 00       	mov    0xb7c,%eax
}
 a1d:	c9                   	leave  
 a1e:	c3                   	ret    

00000a1f <malloc>:

void*
malloc(uint nbytes)
{
 a1f:	55                   	push   %ebp
 a20:	89 e5                	mov    %esp,%ebp
 a22:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a25:	8b 45 08             	mov    0x8(%ebp),%eax
 a28:	83 c0 07             	add    $0x7,%eax
 a2b:	c1 e8 03             	shr    $0x3,%eax
 a2e:	83 c0 01             	add    $0x1,%eax
 a31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a34:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 a39:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a3c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a40:	75 23                	jne    a65 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a42:	c7 45 f0 74 0b 00 00 	movl   $0xb74,-0x10(%ebp)
 a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4c:	a3 7c 0b 00 00       	mov    %eax,0xb7c
 a51:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 a56:	a3 74 0b 00 00       	mov    %eax,0xb74
    base.s.size = 0;
 a5b:	c7 05 78 0b 00 00 00 	movl   $0x0,0xb78
 a62:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a65:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a68:	8b 00                	mov    (%eax),%eax
 a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a70:	8b 40 04             	mov    0x4(%eax),%eax
 a73:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a76:	72 4d                	jb     ac5 <malloc+0xa6>
      if(p->s.size == nunits)
 a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7b:	8b 40 04             	mov    0x4(%eax),%eax
 a7e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a81:	75 0c                	jne    a8f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a86:	8b 10                	mov    (%eax),%edx
 a88:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8b:	89 10                	mov    %edx,(%eax)
 a8d:	eb 26                	jmp    ab5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a92:	8b 40 04             	mov    0x4(%eax),%eax
 a95:	89 c2                	mov    %eax,%edx
 a97:	2b 55 ec             	sub    -0x14(%ebp),%edx
 a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa3:	8b 40 04             	mov    0x4(%eax),%eax
 aa6:	c1 e0 03             	shl    $0x3,%eax
 aa9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ab2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab8:	a3 7c 0b 00 00       	mov    %eax,0xb7c
      return (void*)(p + 1);
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	83 c0 08             	add    $0x8,%eax
 ac3:	eb 38                	jmp    afd <malloc+0xde>
    }
    if(p == freep)
 ac5:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 aca:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 acd:	75 1b                	jne    aea <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 acf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ad2:	89 04 24             	mov    %eax,(%esp)
 ad5:	e8 ed fe ff ff       	call   9c7 <morecore>
 ada:	89 45 f4             	mov    %eax,-0xc(%ebp)
 add:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ae1:	75 07                	jne    aea <malloc+0xcb>
        return 0;
 ae3:	b8 00 00 00 00       	mov    $0x0,%eax
 ae8:	eb 13                	jmp    afd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af3:	8b 00                	mov    (%eax),%eax
 af5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 af8:	e9 70 ff ff ff       	jmp    a6d <malloc+0x4e>
}
 afd:	c9                   	leave  
 afe:	c3                   	ret    
