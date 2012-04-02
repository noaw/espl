
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 db 10 00 00       	call   10ec <exit>
  
  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 60 16 00 00 	mov    0x1660(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 34 16 00 00 	movl   $0x1634,(%esp)
      2b:	e8 b1 04 00 00       	call   4e1 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 f4             	mov    -0xc(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 a7 10 00 00       	call   10ec <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 f4             	mov    -0xc(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 c7 10 00 00       	call   1124 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 3b 16 00 	movl   $0x163b,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 f0 11 00 00       	call   126b <printf>
    break;
      7b:	e9 86 01 00 00       	jmp    206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 80 10 00 00       	call   1114 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 80 10 00 00       	call   112c <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 4b 16 00 	movl   $0x164b,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 9d 11 00 00       	call   126b <printf>
      exit();
      ce:	e8 19 10 00 00       	call   10ec <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 20 01 00 00       	jmp    206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 16 04 00 00       	call   507 <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 ec 0f 00 00       	call   10f4 <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 eb 00 00 00       	jmp    206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 d0 0f 00 00       	call   10fc <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 5b 16 00 00 	movl   $0x165b,(%esp)
     137:	e8 a5 03 00 00       	call   4e1 <panic>
    if(fork1() == 0){
     13c:	e8 c6 03 00 00       	call   507 <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 c3 0f 00 00       	call   1114 <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 08 10 00 00       	call   1164 <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 ad 0f 00 00       	call   1114 <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 a2 0f 00 00       	call   1114 <close>
      runcmd(pcmd->left);
     172:	8b 45 e8             	mov    -0x18(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 82 03 00 00       	call   507 <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 7f 0f 00 00       	call   1114 <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 c4 0f 00 00       	call   1164 <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 69 0f 00 00       	call   1114 <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 5e 0f 00 00       	call   1114 <close>
      runcmd(pcmd->right);
     1b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 45 0f 00 00       	call   1114 <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 3a 0f 00 00       	call   1114 <close>
    wait();
     1da:	e8 15 0f 00 00       	call   10f4 <wait>
    wait();
     1df:	e8 10 0f 00 00       	call   10f4 <wait>
    break;
     1e4:	eb 20                	jmp    206 <runcmd+0x206>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 16 03 00 00       	call   507 <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 10                	jne    205 <runcmd+0x205>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
     203:	eb 01                	jmp    206 <runcmd+0x206>
     205:	90                   	nop
  }
  exit();
     206:	e8 e1 0e 00 00       	call   10ec <exit>

0000020b <strcat>:
}


char *strcat(char *dest, const char *src)

    {
     20b:	55                   	push   %ebp
     20c:	89 e5                	mov    %esp,%ebp
     20e:	83 ec 10             	sub    $0x10,%esp

    int i,j;

    for (i = 0; dest[i] != '\0'; i++)
     211:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     218:	eb 04                	jmp    21e <strcat+0x13>
     21a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     21e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     221:	03 45 08             	add    0x8(%ebp),%eax
     224:	0f b6 00             	movzbl (%eax),%eax
     227:	84 c0                	test   %al,%al
     229:	75 ef                	jne    21a <strcat+0xf>

        ;

    for (j = 0; src[j] != '\0'; j++)
     22b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
     232:	eb 1b                	jmp    24f <strcat+0x44>

        dest[i+j] = src[j];
     234:	8b 45 f8             	mov    -0x8(%ebp),%eax
     237:	8b 55 fc             	mov    -0x4(%ebp),%edx
     23a:	8d 04 02             	lea    (%edx,%eax,1),%eax
     23d:	03 45 08             	add    0x8(%ebp),%eax
     240:	8b 55 f8             	mov    -0x8(%ebp),%edx
     243:	03 55 0c             	add    0xc(%ebp),%edx
     246:	0f b6 12             	movzbl (%edx),%edx
     249:	88 10                	mov    %dl,(%eax)

    for (i = 0; dest[i] != '\0'; i++)

        ;

    for (j = 0; src[j] != '\0'; j++)
     24b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     24f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     252:	03 45 0c             	add    0xc(%ebp),%eax
     255:	0f b6 00             	movzbl (%eax),%eax
     258:	84 c0                	test   %al,%al
     25a:	75 d8                	jne    234 <strcat+0x29>

        dest[i+j] = src[j];

    dest[i+j] = '\0';
     25c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     25f:	8b 55 fc             	mov    -0x4(%ebp),%edx
     262:	8d 04 02             	lea    (%edx,%eax,1),%eax
     265:	03 45 08             	add    0x8(%ebp),%eax
     268:	c6 00 00             	movb   $0x0,(%eax)

    return dest;
     26b:	8b 45 08             	mov    0x8(%ebp),%eax

}
     26e:	c9                   	leave  
     26f:	c3                   	ret    

00000270 <strsplitSlesh>:

char *strsplitSlesh(char *dest)
{
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	83 ec 28             	sub    $0x28,%esp
     
    int size = strlen(dest);
     276:	8b 45 08             	mov    0x8(%ebp),%eax
     279:	89 04 24             	mov    %eax,(%esp)
     27c:	e8 a1 0c 00 00       	call   f22 <strlen>
     281:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;

    for (i = size-1; i>0 ; i--){
     284:	8b 45 f0             	mov    -0x10(%ebp),%eax
     287:	83 e8 01             	sub    $0x1,%eax
     28a:	89 45 f4             	mov    %eax,-0xc(%ebp)
     28d:	eb 11                	jmp    2a0 <strsplitSlesh+0x30>
      if(dest[i] == '/')
     28f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     292:	03 45 08             	add    0x8(%ebp),%eax
     295:	0f b6 00             	movzbl (%eax),%eax
     298:	3c 2f                	cmp    $0x2f,%al
     29a:	74 0c                	je     2a8 <strsplitSlesh+0x38>
{
     
    int size = strlen(dest);
    int i;

    for (i = size-1; i>0 ; i--){
     29c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     2a4:	7f e9                	jg     28f <strsplitSlesh+0x1f>
     2a6:	eb 01                	jmp    2a9 <strsplitSlesh+0x39>
      if(dest[i] == '/')
	break;
     2a8:	90                   	nop
    }

    dest[i] = '\0';
     2a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2ac:	03 45 08             	add    0x8(%ebp),%eax
     2af:	c6 00 00             	movb   $0x0,(%eax)

    return dest;
     2b2:	8b 45 08             	mov    0x8(%ebp),%eax
    
}
     2b5:	c9                   	leave  
     2b6:	c3                   	ret    

000002b7 <getcmd>:

int
getcmd(char *buf, int nbuf, char* str1)
{
     2b7:	55                   	push   %ebp
     2b8:	89 e5                	mov    %esp,%ebp
     2ba:	83 ec 18             	sub    $0x18,%esp
  //char *str1 = "tzip&noa present: ";
  //char* print1 = 
  printf(2, str1);
     2bd:	8b 45 10             	mov    0x10(%ebp),%eax
     2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
     2c4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2cb:	e8 9b 0f 00 00       	call   126b <printf>
  memset(buf, 0, nbuf);
     2d0:	8b 45 0c             	mov    0xc(%ebp),%eax
     2d3:	89 44 24 08          	mov    %eax,0x8(%esp)
     2d7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2de:	00 
     2df:	8b 45 08             	mov    0x8(%ebp),%eax
     2e2:	89 04 24             	mov    %eax,(%esp)
     2e5:	e8 5d 0c 00 00       	call   f47 <memset>
  gets(buf, nbuf);
     2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
     2ed:	89 44 24 04          	mov    %eax,0x4(%esp)
     2f1:	8b 45 08             	mov    0x8(%ebp),%eax
     2f4:	89 04 24             	mov    %eax,(%esp)
     2f7:	e8 a2 0c 00 00       	call   f9e <gets>
  if(buf[0] == 0) // EOF
     2fc:	8b 45 08             	mov    0x8(%ebp),%eax
     2ff:	0f b6 00             	movzbl (%eax),%eax
     302:	84 c0                	test   %al,%al
     304:	75 07                	jne    30d <getcmd+0x56>
    return -1;
     306:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     30b:	eb 05                	jmp    312 <getcmd+0x5b>
  return 0;
     30d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     312:	c9                   	leave  
     313:	c3                   	ret    

00000314 <main>:

int
main(void)
{
     314:	55                   	push   %ebp
     315:	89 e5                	mov    %esp,%ebp
     317:	83 e4 f0             	and    $0xfffffff0,%esp
     31a:	57                   	push   %edi
     31b:	53                   	push   %ebx
     31c:	81 ec 28 01 00 00    	sub    $0x128,%esp
  static char buf[100];
  int fd;
  char dirname[256] = {"/>"};
     322:	c7 44 24 1c 2f 3e 00 	movl   $0x3e2f,0x1c(%esp)
     329:	00 
     32a:	8d 5c 24 20          	lea    0x20(%esp),%ebx
     32e:	b8 00 00 00 00       	mov    $0x0,%eax
     333:	ba 3f 00 00 00       	mov    $0x3f,%edx
     338:	89 df                	mov    %ebx,%edi
     33a:	89 d1                	mov    %edx,%ecx
     33c:	f3 ab                	rep stos %eax,%es:(%edi)
  
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     33e:	eb 1f                	jmp    35f <main+0x4b>
    if(fd >= 3){
     340:	83 bc 24 1c 01 00 00 	cmpl   $0x2,0x11c(%esp)
     347:	02 
     348:	7e 15                	jle    35f <main+0x4b>
      close(fd);
     34a:	8b 84 24 1c 01 00 00 	mov    0x11c(%esp),%eax
     351:	89 04 24             	mov    %eax,(%esp)
     354:	e8 bb 0d 00 00       	call   1114 <close>
      break;
     359:	90                   	nop
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf),dirname) >= 0){
     35a:	e9 59 01 00 00       	jmp    4b8 <main+0x1a4>
  int fd;
  char dirname[256] = {"/>"};
  
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     35f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     366:	00 
     367:	c7 04 24 78 16 00 00 	movl   $0x1678,(%esp)
     36e:	e8 b9 0d 00 00       	call   112c <open>
     373:	89 84 24 1c 01 00 00 	mov    %eax,0x11c(%esp)
     37a:	83 bc 24 1c 01 00 00 	cmpl   $0x0,0x11c(%esp)
     381:	00 
     382:	79 bc                	jns    340 <main+0x2c>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf),dirname) >= 0){
     384:	e9 2f 01 00 00       	jmp    4b8 <main+0x1a4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     389:	0f b6 05 60 17 00 00 	movzbl 0x1760,%eax
     390:	3c 63                	cmp    $0x63,%al
     392:	0f 85 fe 00 00 00    	jne    496 <main+0x182>
     398:	0f b6 05 61 17 00 00 	movzbl 0x1761,%eax
     39f:	3c 64                	cmp    $0x64,%al
     3a1:	0f 85 ef 00 00 00    	jne    496 <main+0x182>
     3a7:	0f b6 05 62 17 00 00 	movzbl 0x1762,%eax
     3ae:	3c 20                	cmp    $0x20,%al
     3b0:	0f 85 e0 00 00 00    	jne    496 <main+0x182>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     3b6:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     3bd:	e8 60 0b 00 00       	call   f22 <strlen>
     3c2:	83 e8 01             	sub    $0x1,%eax
     3c5:	c6 80 60 17 00 00 00 	movb   $0x0,0x1760(%eax)
      if(chdir(buf+3) < 0)
     3cc:	c7 04 24 63 17 00 00 	movl   $0x1763,(%esp)
     3d3:	e8 84 0d 00 00       	call   115c <chdir>
     3d8:	85 c0                	test   %eax,%eax
     3da:	79 21                	jns    3fd <main+0xe9>
        printf(2, "cannot cd %s\n", buf+3);
     3dc:	c7 44 24 08 63 17 00 	movl   $0x1763,0x8(%esp)
     3e3:	00 
     3e4:	c7 44 24 04 80 16 00 	movl   $0x1680,0x4(%esp)
     3eb:	00 
     3ec:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     3f3:	e8 73 0e 00 00       	call   126b <printf>
	strsplitSlesh(dirname);
	strcat(dirname,"/");
	strcat(dirname,buf+3);
	strcat(dirname,"/>");
	}
      continue;
     3f8:	e9 bb 00 00 00       	jmp    4b8 <main+0x1a4>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      else if (buf[3]=='.' && buf[4]=='.' && buf[5]=='\0'){
     3fd:	0f b6 05 63 17 00 00 	movzbl 0x1763,%eax
     404:	3c 2e                	cmp    $0x2e,%al
     406:	75 44                	jne    44c <main+0x138>
     408:	0f b6 05 64 17 00 00 	movzbl 0x1764,%eax
     40f:	3c 2e                	cmp    $0x2e,%al
     411:	75 39                	jne    44c <main+0x138>
     413:	0f b6 05 65 17 00 00 	movzbl 0x1765,%eax
     41a:	84 c0                	test   %al,%al
     41c:	75 2e                	jne    44c <main+0x138>
	strsplitSlesh(dirname);
     41e:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     422:	89 04 24             	mov    %eax,(%esp)
     425:	e8 46 fe ff ff       	call   270 <strsplitSlesh>
	strsplitSlesh(dirname);
     42a:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     42e:	89 04 24             	mov    %eax,(%esp)
     431:	e8 3a fe ff ff       	call   270 <strsplitSlesh>
	strcat(dirname,"/>");
     436:	c7 44 24 04 8e 16 00 	movl   $0x168e,0x4(%esp)
     43d:	00 
     43e:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     442:	89 04 24             	mov    %eax,(%esp)
     445:	e8 c1 fd ff ff       	call   20b <strcat>
	strsplitSlesh(dirname);
	strcat(dirname,"/");
	strcat(dirname,buf+3);
	strcat(dirname,"/>");
	}
      continue;
     44a:	eb 6c                	jmp    4b8 <main+0x1a4>
	strsplitSlesh(dirname);
	strsplitSlesh(dirname);
	strcat(dirname,"/>");
      }
      else {
	strsplitSlesh(dirname);
     44c:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     450:	89 04 24             	mov    %eax,(%esp)
     453:	e8 18 fe ff ff       	call   270 <strsplitSlesh>
	strcat(dirname,"/");
     458:	c7 44 24 04 91 16 00 	movl   $0x1691,0x4(%esp)
     45f:	00 
     460:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     464:	89 04 24             	mov    %eax,(%esp)
     467:	e8 9f fd ff ff       	call   20b <strcat>
	strcat(dirname,buf+3);
     46c:	c7 44 24 04 63 17 00 	movl   $0x1763,0x4(%esp)
     473:	00 
     474:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     478:	89 04 24             	mov    %eax,(%esp)
     47b:	e8 8b fd ff ff       	call   20b <strcat>
	strcat(dirname,"/>");
     480:	c7 44 24 04 8e 16 00 	movl   $0x168e,0x4(%esp)
     487:	00 
     488:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     48c:	89 04 24             	mov    %eax,(%esp)
     48f:	e8 77 fd ff ff       	call   20b <strcat>
	}
      continue;
     494:	eb 22                	jmp    4b8 <main+0x1a4>
    }
    if(fork1() == 0)
     496:	e8 6c 00 00 00       	call   507 <fork1>
     49b:	85 c0                	test   %eax,%eax
     49d:	75 14                	jne    4b3 <main+0x19f>
      runcmd(parsecmd(buf));
     49f:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     4a6:	e8 d1 03 00 00       	call   87c <parsecmd>
     4ab:	89 04 24             	mov    %eax,(%esp)
     4ae:	e8 4d fb ff ff       	call   0 <runcmd>
    wait();
     4b3:	e8 3c 0c 00 00       	call   10f4 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf),dirname) >= 0){
     4b8:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     4bc:	89 44 24 08          	mov    %eax,0x8(%esp)
     4c0:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     4c7:	00 
     4c8:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     4cf:	e8 e3 fd ff ff       	call   2b7 <getcmd>
     4d4:	85 c0                	test   %eax,%eax
     4d6:	0f 89 ad fe ff ff    	jns    389 <main+0x75>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     4dc:	e8 0b 0c 00 00       	call   10ec <exit>

000004e1 <panic>:
}

void
panic(char *s)
{
     4e1:	55                   	push   %ebp
     4e2:	89 e5                	mov    %esp,%ebp
     4e4:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     4e7:	8b 45 08             	mov    0x8(%ebp),%eax
     4ea:	89 44 24 08          	mov    %eax,0x8(%esp)
     4ee:	c7 44 24 04 93 16 00 	movl   $0x1693,0x4(%esp)
     4f5:	00 
     4f6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     4fd:	e8 69 0d 00 00       	call   126b <printf>
  exit();
     502:	e8 e5 0b 00 00       	call   10ec <exit>

00000507 <fork1>:
}

int
fork1(void)
{
     507:	55                   	push   %ebp
     508:	89 e5                	mov    %esp,%ebp
     50a:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
     50d:	e8 d2 0b 00 00       	call   10e4 <fork>
     512:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     515:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     519:	75 0c                	jne    527 <fork1+0x20>
    panic("fork");
     51b:	c7 04 24 97 16 00 00 	movl   $0x1697,(%esp)
     522:	e8 ba ff ff ff       	call   4e1 <panic>
  return pid;
     527:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     52a:	c9                   	leave  
     52b:	c3                   	ret    

0000052c <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     52c:	55                   	push   %ebp
     52d:	89 e5                	mov    %esp,%ebp
     52f:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     532:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     539:	e8 15 10 00 00       	call   1553 <malloc>
     53e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     541:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     548:	00 
     549:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     550:	00 
     551:	8b 45 f4             	mov    -0xc(%ebp),%eax
     554:	89 04 24             	mov    %eax,(%esp)
     557:	e8 eb 09 00 00       	call   f47 <memset>
  cmd->type = EXEC;
     55c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     55f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     565:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     568:	c9                   	leave  
     569:	c3                   	ret    

0000056a <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     56a:	55                   	push   %ebp
     56b:	89 e5                	mov    %esp,%ebp
     56d:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     570:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     577:	e8 d7 0f 00 00       	call   1553 <malloc>
     57c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     57f:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     586:	00 
     587:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     58e:	00 
     58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     592:	89 04 24             	mov    %eax,(%esp)
     595:	e8 ad 09 00 00       	call   f47 <memset>
  cmd->type = REDIR;
     59a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     59d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     5a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5a6:	8b 55 08             	mov    0x8(%ebp),%edx
     5a9:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5af:	8b 55 0c             	mov    0xc(%ebp),%edx
     5b2:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     5b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5b8:	8b 55 10             	mov    0x10(%ebp),%edx
     5bb:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     5be:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5c1:	8b 55 14             	mov    0x14(%ebp),%edx
     5c4:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     5c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5ca:	8b 55 18             	mov    0x18(%ebp),%edx
     5cd:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     5d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     5d3:	c9                   	leave  
     5d4:	c3                   	ret    

000005d5 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     5d5:	55                   	push   %ebp
     5d6:	89 e5                	mov    %esp,%ebp
     5d8:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5db:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     5e2:	e8 6c 0f 00 00       	call   1553 <malloc>
     5e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     5ea:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     5f1:	00 
     5f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     5f9:	00 
     5fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fd:	89 04 24             	mov    %eax,(%esp)
     600:	e8 42 09 00 00       	call   f47 <memset>
  cmd->type = PIPE;
     605:	8b 45 f4             	mov    -0xc(%ebp),%eax
     608:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     60e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     611:	8b 55 08             	mov    0x8(%ebp),%edx
     614:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     617:	8b 45 f4             	mov    -0xc(%ebp),%eax
     61a:	8b 55 0c             	mov    0xc(%ebp),%edx
     61d:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     620:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     623:	c9                   	leave  
     624:	c3                   	ret    

00000625 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     625:	55                   	push   %ebp
     626:	89 e5                	mov    %esp,%ebp
     628:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     62b:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     632:	e8 1c 0f 00 00       	call   1553 <malloc>
     637:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     63a:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     641:	00 
     642:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     649:	00 
     64a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     64d:	89 04 24             	mov    %eax,(%esp)
     650:	e8 f2 08 00 00       	call   f47 <memset>
  cmd->type = LIST;
     655:	8b 45 f4             	mov    -0xc(%ebp),%eax
     658:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     65e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     661:	8b 55 08             	mov    0x8(%ebp),%edx
     664:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     667:	8b 45 f4             	mov    -0xc(%ebp),%eax
     66a:	8b 55 0c             	mov    0xc(%ebp),%edx
     66d:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     670:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     673:	c9                   	leave  
     674:	c3                   	ret    

00000675 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     675:	55                   	push   %ebp
     676:	89 e5                	mov    %esp,%ebp
     678:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     67b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     682:	e8 cc 0e 00 00       	call   1553 <malloc>
     687:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     68a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     691:	00 
     692:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     699:	00 
     69a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     69d:	89 04 24             	mov    %eax,(%esp)
     6a0:	e8 a2 08 00 00       	call   f47 <memset>
  cmd->type = BACK;
     6a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6a8:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     6ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6b1:	8b 55 08             	mov    0x8(%ebp),%edx
     6b4:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     6b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     6ba:	c9                   	leave  
     6bb:	c3                   	ret    

000006bc <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     6bc:	55                   	push   %ebp
     6bd:	89 e5                	mov    %esp,%ebp
     6bf:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     6c2:	8b 45 08             	mov    0x8(%ebp),%eax
     6c5:	8b 00                	mov    (%eax),%eax
     6c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     6ca:	eb 04                	jmp    6d0 <gettoken+0x14>
    s++;
     6cc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     6d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6d6:	73 1d                	jae    6f5 <gettoken+0x39>
     6d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6db:	0f b6 00             	movzbl (%eax),%eax
     6de:	0f be c0             	movsbl %al,%eax
     6e1:	89 44 24 04          	mov    %eax,0x4(%esp)
     6e5:	c7 04 24 30 17 00 00 	movl   $0x1730,(%esp)
     6ec:	e8 7a 08 00 00       	call   f6b <strchr>
     6f1:	85 c0                	test   %eax,%eax
     6f3:	75 d7                	jne    6cc <gettoken+0x10>
    s++;
  if(q)
     6f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     6f9:	74 08                	je     703 <gettoken+0x47>
    *q = s;
     6fb:	8b 45 10             	mov    0x10(%ebp),%eax
     6fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
     701:	89 10                	mov    %edx,(%eax)
  ret = *s;
     703:	8b 45 f4             	mov    -0xc(%ebp),%eax
     706:	0f b6 00             	movzbl (%eax),%eax
     709:	0f be c0             	movsbl %al,%eax
     70c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     70f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     712:	0f b6 00             	movzbl (%eax),%eax
     715:	0f be c0             	movsbl %al,%eax
     718:	83 f8 3c             	cmp    $0x3c,%eax
     71b:	7f 1e                	jg     73b <gettoken+0x7f>
     71d:	83 f8 3b             	cmp    $0x3b,%eax
     720:	7d 23                	jge    745 <gettoken+0x89>
     722:	83 f8 29             	cmp    $0x29,%eax
     725:	7f 3f                	jg     766 <gettoken+0xaa>
     727:	83 f8 28             	cmp    $0x28,%eax
     72a:	7d 19                	jge    745 <gettoken+0x89>
     72c:	85 c0                	test   %eax,%eax
     72e:	0f 84 83 00 00 00    	je     7b7 <gettoken+0xfb>
     734:	83 f8 26             	cmp    $0x26,%eax
     737:	74 0c                	je     745 <gettoken+0x89>
     739:	eb 2b                	jmp    766 <gettoken+0xaa>
     73b:	83 f8 3e             	cmp    $0x3e,%eax
     73e:	74 0b                	je     74b <gettoken+0x8f>
     740:	83 f8 7c             	cmp    $0x7c,%eax
     743:	75 21                	jne    766 <gettoken+0xaa>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     745:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     749:	eb 76                	jmp    7c1 <gettoken+0x105>
  case '>':
    s++;
     74b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     74f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     752:	0f b6 00             	movzbl (%eax),%eax
     755:	3c 3e                	cmp    $0x3e,%al
     757:	75 61                	jne    7ba <gettoken+0xfe>
      ret = '+';
     759:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     760:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     764:	eb 5b                	jmp    7c1 <gettoken+0x105>
  default:
    ret = 'a';
     766:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     76d:	eb 04                	jmp    773 <gettoken+0xb7>
      s++;
     76f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     773:	8b 45 f4             	mov    -0xc(%ebp),%eax
     776:	3b 45 0c             	cmp    0xc(%ebp),%eax
     779:	73 42                	jae    7bd <gettoken+0x101>
     77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     77e:	0f b6 00             	movzbl (%eax),%eax
     781:	0f be c0             	movsbl %al,%eax
     784:	89 44 24 04          	mov    %eax,0x4(%esp)
     788:	c7 04 24 30 17 00 00 	movl   $0x1730,(%esp)
     78f:	e8 d7 07 00 00       	call   f6b <strchr>
     794:	85 c0                	test   %eax,%eax
     796:	75 28                	jne    7c0 <gettoken+0x104>
     798:	8b 45 f4             	mov    -0xc(%ebp),%eax
     79b:	0f b6 00             	movzbl (%eax),%eax
     79e:	0f be c0             	movsbl %al,%eax
     7a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     7a5:	c7 04 24 36 17 00 00 	movl   $0x1736,(%esp)
     7ac:	e8 ba 07 00 00       	call   f6b <strchr>
     7b1:	85 c0                	test   %eax,%eax
     7b3:	74 ba                	je     76f <gettoken+0xb3>
      s++;
    break;
     7b5:	eb 0a                	jmp    7c1 <gettoken+0x105>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     7b7:	90                   	nop
     7b8:	eb 07                	jmp    7c1 <gettoken+0x105>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
     7ba:	90                   	nop
     7bb:	eb 04                	jmp    7c1 <gettoken+0x105>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
     7bd:	90                   	nop
     7be:	eb 01                	jmp    7c1 <gettoken+0x105>
     7c0:	90                   	nop
  }
  if(eq)
     7c1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     7c5:	74 0e                	je     7d5 <gettoken+0x119>
    *eq = s;
     7c7:	8b 45 14             	mov    0x14(%ebp),%eax
     7ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7cd:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     7cf:	eb 04                	jmp    7d5 <gettoken+0x119>
    s++;
     7d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7d8:	3b 45 0c             	cmp    0xc(%ebp),%eax
     7db:	73 1d                	jae    7fa <gettoken+0x13e>
     7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e0:	0f b6 00             	movzbl (%eax),%eax
     7e3:	0f be c0             	movsbl %al,%eax
     7e6:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ea:	c7 04 24 30 17 00 00 	movl   $0x1730,(%esp)
     7f1:	e8 75 07 00 00       	call   f6b <strchr>
     7f6:	85 c0                	test   %eax,%eax
     7f8:	75 d7                	jne    7d1 <gettoken+0x115>
    s++;
  *ps = s;
     7fa:	8b 45 08             	mov    0x8(%ebp),%eax
     7fd:	8b 55 f4             	mov    -0xc(%ebp),%edx
     800:	89 10                	mov    %edx,(%eax)
  return ret;
     802:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     805:	c9                   	leave  
     806:	c3                   	ret    

00000807 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     807:	55                   	push   %ebp
     808:	89 e5                	mov    %esp,%ebp
     80a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     80d:	8b 45 08             	mov    0x8(%ebp),%eax
     810:	8b 00                	mov    (%eax),%eax
     812:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     815:	eb 04                	jmp    81b <peek+0x14>
    s++;
     817:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     81e:	3b 45 0c             	cmp    0xc(%ebp),%eax
     821:	73 1d                	jae    840 <peek+0x39>
     823:	8b 45 f4             	mov    -0xc(%ebp),%eax
     826:	0f b6 00             	movzbl (%eax),%eax
     829:	0f be c0             	movsbl %al,%eax
     82c:	89 44 24 04          	mov    %eax,0x4(%esp)
     830:	c7 04 24 30 17 00 00 	movl   $0x1730,(%esp)
     837:	e8 2f 07 00 00       	call   f6b <strchr>
     83c:	85 c0                	test   %eax,%eax
     83e:	75 d7                	jne    817 <peek+0x10>
    s++;
  *ps = s;
     840:	8b 45 08             	mov    0x8(%ebp),%eax
     843:	8b 55 f4             	mov    -0xc(%ebp),%edx
     846:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     848:	8b 45 f4             	mov    -0xc(%ebp),%eax
     84b:	0f b6 00             	movzbl (%eax),%eax
     84e:	84 c0                	test   %al,%al
     850:	74 23                	je     875 <peek+0x6e>
     852:	8b 45 f4             	mov    -0xc(%ebp),%eax
     855:	0f b6 00             	movzbl (%eax),%eax
     858:	0f be c0             	movsbl %al,%eax
     85b:	89 44 24 04          	mov    %eax,0x4(%esp)
     85f:	8b 45 10             	mov    0x10(%ebp),%eax
     862:	89 04 24             	mov    %eax,(%esp)
     865:	e8 01 07 00 00       	call   f6b <strchr>
     86a:	85 c0                	test   %eax,%eax
     86c:	74 07                	je     875 <peek+0x6e>
     86e:	b8 01 00 00 00       	mov    $0x1,%eax
     873:	eb 05                	jmp    87a <peek+0x73>
     875:	b8 00 00 00 00       	mov    $0x0,%eax
}
     87a:	c9                   	leave  
     87b:	c3                   	ret    

0000087c <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     87c:	55                   	push   %ebp
     87d:	89 e5                	mov    %esp,%ebp
     87f:	53                   	push   %ebx
     880:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     883:	8b 5d 08             	mov    0x8(%ebp),%ebx
     886:	8b 45 08             	mov    0x8(%ebp),%eax
     889:	89 04 24             	mov    %eax,(%esp)
     88c:	e8 91 06 00 00       	call   f22 <strlen>
     891:	8d 04 03             	lea    (%ebx,%eax,1),%eax
     894:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     897:	8b 45 f4             	mov    -0xc(%ebp),%eax
     89a:	89 44 24 04          	mov    %eax,0x4(%esp)
     89e:	8d 45 08             	lea    0x8(%ebp),%eax
     8a1:	89 04 24             	mov    %eax,(%esp)
     8a4:	e8 60 00 00 00       	call   909 <parseline>
     8a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     8ac:	c7 44 24 08 9c 16 00 	movl   $0x169c,0x8(%esp)
     8b3:	00 
     8b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8b7:	89 44 24 04          	mov    %eax,0x4(%esp)
     8bb:	8d 45 08             	lea    0x8(%ebp),%eax
     8be:	89 04 24             	mov    %eax,(%esp)
     8c1:	e8 41 ff ff ff       	call   807 <peek>
  if(s != es){
     8c6:	8b 45 08             	mov    0x8(%ebp),%eax
     8c9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     8cc:	74 27                	je     8f5 <parsecmd+0x79>
    printf(2, "leftovers: %s\n", s);
     8ce:	8b 45 08             	mov    0x8(%ebp),%eax
     8d1:	89 44 24 08          	mov    %eax,0x8(%esp)
     8d5:	c7 44 24 04 9d 16 00 	movl   $0x169d,0x4(%esp)
     8dc:	00 
     8dd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     8e4:	e8 82 09 00 00       	call   126b <printf>
    panic("syntax");
     8e9:	c7 04 24 ac 16 00 00 	movl   $0x16ac,(%esp)
     8f0:	e8 ec fb ff ff       	call   4e1 <panic>
  }
  nulterminate(cmd);
     8f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8f8:	89 04 24             	mov    %eax,(%esp)
     8fb:	e8 a5 04 00 00       	call   da5 <nulterminate>
  return cmd;
     900:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     903:	83 c4 24             	add    $0x24,%esp
     906:	5b                   	pop    %ebx
     907:	5d                   	pop    %ebp
     908:	c3                   	ret    

00000909 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     909:	55                   	push   %ebp
     90a:	89 e5                	mov    %esp,%ebp
     90c:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     90f:	8b 45 0c             	mov    0xc(%ebp),%eax
     912:	89 44 24 04          	mov    %eax,0x4(%esp)
     916:	8b 45 08             	mov    0x8(%ebp),%eax
     919:	89 04 24             	mov    %eax,(%esp)
     91c:	e8 bc 00 00 00       	call   9dd <parsepipe>
     921:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     924:	eb 30                	jmp    956 <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     926:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     92d:	00 
     92e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     935:	00 
     936:	8b 45 0c             	mov    0xc(%ebp),%eax
     939:	89 44 24 04          	mov    %eax,0x4(%esp)
     93d:	8b 45 08             	mov    0x8(%ebp),%eax
     940:	89 04 24             	mov    %eax,(%esp)
     943:	e8 74 fd ff ff       	call   6bc <gettoken>
    cmd = backcmd(cmd);
     948:	8b 45 f4             	mov    -0xc(%ebp),%eax
     94b:	89 04 24             	mov    %eax,(%esp)
     94e:	e8 22 fd ff ff       	call   675 <backcmd>
     953:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     956:	c7 44 24 08 b3 16 00 	movl   $0x16b3,0x8(%esp)
     95d:	00 
     95e:	8b 45 0c             	mov    0xc(%ebp),%eax
     961:	89 44 24 04          	mov    %eax,0x4(%esp)
     965:	8b 45 08             	mov    0x8(%ebp),%eax
     968:	89 04 24             	mov    %eax,(%esp)
     96b:	e8 97 fe ff ff       	call   807 <peek>
     970:	85 c0                	test   %eax,%eax
     972:	75 b2                	jne    926 <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     974:	c7 44 24 08 b5 16 00 	movl   $0x16b5,0x8(%esp)
     97b:	00 
     97c:	8b 45 0c             	mov    0xc(%ebp),%eax
     97f:	89 44 24 04          	mov    %eax,0x4(%esp)
     983:	8b 45 08             	mov    0x8(%ebp),%eax
     986:	89 04 24             	mov    %eax,(%esp)
     989:	e8 79 fe ff ff       	call   807 <peek>
     98e:	85 c0                	test   %eax,%eax
     990:	74 46                	je     9d8 <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     992:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     999:	00 
     99a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     9a1:	00 
     9a2:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a5:	89 44 24 04          	mov    %eax,0x4(%esp)
     9a9:	8b 45 08             	mov    0x8(%ebp),%eax
     9ac:	89 04 24             	mov    %eax,(%esp)
     9af:	e8 08 fd ff ff       	call   6bc <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9b4:	8b 45 0c             	mov    0xc(%ebp),%eax
     9b7:	89 44 24 04          	mov    %eax,0x4(%esp)
     9bb:	8b 45 08             	mov    0x8(%ebp),%eax
     9be:	89 04 24             	mov    %eax,(%esp)
     9c1:	e8 43 ff ff ff       	call   909 <parseline>
     9c6:	89 44 24 04          	mov    %eax,0x4(%esp)
     9ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     9cd:	89 04 24             	mov    %eax,(%esp)
     9d0:	e8 50 fc ff ff       	call   625 <listcmd>
     9d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     9d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     9db:	c9                   	leave  
     9dc:	c3                   	ret    

000009dd <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     9dd:	55                   	push   %ebp
     9de:	89 e5                	mov    %esp,%ebp
     9e0:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     9e3:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e6:	89 44 24 04          	mov    %eax,0x4(%esp)
     9ea:	8b 45 08             	mov    0x8(%ebp),%eax
     9ed:	89 04 24             	mov    %eax,(%esp)
     9f0:	e8 68 02 00 00       	call   c5d <parseexec>
     9f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     9f8:	c7 44 24 08 b7 16 00 	movl   $0x16b7,0x8(%esp)
     9ff:	00 
     a00:	8b 45 0c             	mov    0xc(%ebp),%eax
     a03:	89 44 24 04          	mov    %eax,0x4(%esp)
     a07:	8b 45 08             	mov    0x8(%ebp),%eax
     a0a:	89 04 24             	mov    %eax,(%esp)
     a0d:	e8 f5 fd ff ff       	call   807 <peek>
     a12:	85 c0                	test   %eax,%eax
     a14:	74 46                	je     a5c <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     a16:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a1d:	00 
     a1e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a25:	00 
     a26:	8b 45 0c             	mov    0xc(%ebp),%eax
     a29:	89 44 24 04          	mov    %eax,0x4(%esp)
     a2d:	8b 45 08             	mov    0x8(%ebp),%eax
     a30:	89 04 24             	mov    %eax,(%esp)
     a33:	e8 84 fc ff ff       	call   6bc <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a38:	8b 45 0c             	mov    0xc(%ebp),%eax
     a3b:	89 44 24 04          	mov    %eax,0x4(%esp)
     a3f:	8b 45 08             	mov    0x8(%ebp),%eax
     a42:	89 04 24             	mov    %eax,(%esp)
     a45:	e8 93 ff ff ff       	call   9dd <parsepipe>
     a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
     a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a51:	89 04 24             	mov    %eax,(%esp)
     a54:	e8 7c fb ff ff       	call   5d5 <pipecmd>
     a59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     a5f:	c9                   	leave  
     a60:	c3                   	ret    

00000a61 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     a61:	55                   	push   %ebp
     a62:	89 e5                	mov    %esp,%ebp
     a64:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     a67:	e9 f6 00 00 00       	jmp    b62 <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     a6c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a73:	00 
     a74:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a7b:	00 
     a7c:	8b 45 10             	mov    0x10(%ebp),%eax
     a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a83:	8b 45 0c             	mov    0xc(%ebp),%eax
     a86:	89 04 24             	mov    %eax,(%esp)
     a89:	e8 2e fc ff ff       	call   6bc <gettoken>
     a8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     a91:	8d 45 ec             	lea    -0x14(%ebp),%eax
     a94:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a98:	8d 45 f0             	lea    -0x10(%ebp),%eax
     a9b:	89 44 24 08          	mov    %eax,0x8(%esp)
     a9f:	8b 45 10             	mov    0x10(%ebp),%eax
     aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa9:	89 04 24             	mov    %eax,(%esp)
     aac:	e8 0b fc ff ff       	call   6bc <gettoken>
     ab1:	83 f8 61             	cmp    $0x61,%eax
     ab4:	74 0c                	je     ac2 <parseredirs+0x61>
      panic("missing file for redirection");
     ab6:	c7 04 24 b9 16 00 00 	movl   $0x16b9,(%esp)
     abd:	e8 1f fa ff ff       	call   4e1 <panic>
    switch(tok){
     ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac5:	83 f8 3c             	cmp    $0x3c,%eax
     ac8:	74 0f                	je     ad9 <parseredirs+0x78>
     aca:	83 f8 3e             	cmp    $0x3e,%eax
     acd:	74 38                	je     b07 <parseredirs+0xa6>
     acf:	83 f8 2b             	cmp    $0x2b,%eax
     ad2:	74 61                	je     b35 <parseredirs+0xd4>
     ad4:	e9 89 00 00 00       	jmp    b62 <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     ad9:	8b 55 ec             	mov    -0x14(%ebp),%edx
     adc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     adf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     ae6:	00 
     ae7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     aee:	00 
     aef:	89 54 24 08          	mov    %edx,0x8(%esp)
     af3:	89 44 24 04          	mov    %eax,0x4(%esp)
     af7:	8b 45 08             	mov    0x8(%ebp),%eax
     afa:	89 04 24             	mov    %eax,(%esp)
     afd:	e8 68 fa ff ff       	call   56a <redircmd>
     b02:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     b05:	eb 5b                	jmp    b62 <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b07:	8b 55 ec             	mov    -0x14(%ebp),%edx
     b0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b0d:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     b14:	00 
     b15:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     b1c:	00 
     b1d:	89 54 24 08          	mov    %edx,0x8(%esp)
     b21:	89 44 24 04          	mov    %eax,0x4(%esp)
     b25:	8b 45 08             	mov    0x8(%ebp),%eax
     b28:	89 04 24             	mov    %eax,(%esp)
     b2b:	e8 3a fa ff ff       	call   56a <redircmd>
     b30:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     b33:	eb 2d                	jmp    b62 <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     b35:	8b 55 ec             	mov    -0x14(%ebp),%edx
     b38:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b3b:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     b42:	00 
     b43:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     b4a:	00 
     b4b:	89 54 24 08          	mov    %edx,0x8(%esp)
     b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
     b53:	8b 45 08             	mov    0x8(%ebp),%eax
     b56:	89 04 24             	mov    %eax,(%esp)
     b59:	e8 0c fa ff ff       	call   56a <redircmd>
     b5e:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     b61:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     b62:	c7 44 24 08 d6 16 00 	movl   $0x16d6,0x8(%esp)
     b69:	00 
     b6a:	8b 45 10             	mov    0x10(%ebp),%eax
     b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
     b71:	8b 45 0c             	mov    0xc(%ebp),%eax
     b74:	89 04 24             	mov    %eax,(%esp)
     b77:	e8 8b fc ff ff       	call   807 <peek>
     b7c:	85 c0                	test   %eax,%eax
     b7e:	0f 85 e8 fe ff ff    	jne    a6c <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     b84:	8b 45 08             	mov    0x8(%ebp),%eax
}
     b87:	c9                   	leave  
     b88:	c3                   	ret    

00000b89 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     b89:	55                   	push   %ebp
     b8a:	89 e5                	mov    %esp,%ebp
     b8c:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     b8f:	c7 44 24 08 d9 16 00 	movl   $0x16d9,0x8(%esp)
     b96:	00 
     b97:	8b 45 0c             	mov    0xc(%ebp),%eax
     b9a:	89 44 24 04          	mov    %eax,0x4(%esp)
     b9e:	8b 45 08             	mov    0x8(%ebp),%eax
     ba1:	89 04 24             	mov    %eax,(%esp)
     ba4:	e8 5e fc ff ff       	call   807 <peek>
     ba9:	85 c0                	test   %eax,%eax
     bab:	75 0c                	jne    bb9 <parseblock+0x30>
    panic("parseblock");
     bad:	c7 04 24 db 16 00 00 	movl   $0x16db,(%esp)
     bb4:	e8 28 f9 ff ff       	call   4e1 <panic>
  gettoken(ps, es, 0, 0);
     bb9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     bc0:	00 
     bc1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     bc8:	00 
     bc9:	8b 45 0c             	mov    0xc(%ebp),%eax
     bcc:	89 44 24 04          	mov    %eax,0x4(%esp)
     bd0:	8b 45 08             	mov    0x8(%ebp),%eax
     bd3:	89 04 24             	mov    %eax,(%esp)
     bd6:	e8 e1 fa ff ff       	call   6bc <gettoken>
  cmd = parseline(ps, es);
     bdb:	8b 45 0c             	mov    0xc(%ebp),%eax
     bde:	89 44 24 04          	mov    %eax,0x4(%esp)
     be2:	8b 45 08             	mov    0x8(%ebp),%eax
     be5:	89 04 24             	mov    %eax,(%esp)
     be8:	e8 1c fd ff ff       	call   909 <parseline>
     bed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     bf0:	c7 44 24 08 e6 16 00 	movl   $0x16e6,0x8(%esp)
     bf7:	00 
     bf8:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfb:	89 44 24 04          	mov    %eax,0x4(%esp)
     bff:	8b 45 08             	mov    0x8(%ebp),%eax
     c02:	89 04 24             	mov    %eax,(%esp)
     c05:	e8 fd fb ff ff       	call   807 <peek>
     c0a:	85 c0                	test   %eax,%eax
     c0c:	75 0c                	jne    c1a <parseblock+0x91>
    panic("syntax - missing )");
     c0e:	c7 04 24 e8 16 00 00 	movl   $0x16e8,(%esp)
     c15:	e8 c7 f8 ff ff       	call   4e1 <panic>
  gettoken(ps, es, 0, 0);
     c1a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     c21:	00 
     c22:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     c29:	00 
     c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2d:	89 44 24 04          	mov    %eax,0x4(%esp)
     c31:	8b 45 08             	mov    0x8(%ebp),%eax
     c34:	89 04 24             	mov    %eax,(%esp)
     c37:	e8 80 fa ff ff       	call   6bc <gettoken>
  cmd = parseredirs(cmd, ps, es);
     c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3f:	89 44 24 08          	mov    %eax,0x8(%esp)
     c43:	8b 45 08             	mov    0x8(%ebp),%eax
     c46:	89 44 24 04          	mov    %eax,0x4(%esp)
     c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c4d:	89 04 24             	mov    %eax,(%esp)
     c50:	e8 0c fe ff ff       	call   a61 <parseredirs>
     c55:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     c5b:	c9                   	leave  
     c5c:	c3                   	ret    

00000c5d <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     c5d:	55                   	push   %ebp
     c5e:	89 e5                	mov    %esp,%ebp
     c60:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     c63:	c7 44 24 08 d9 16 00 	movl   $0x16d9,0x8(%esp)
     c6a:	00 
     c6b:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6e:	89 44 24 04          	mov    %eax,0x4(%esp)
     c72:	8b 45 08             	mov    0x8(%ebp),%eax
     c75:	89 04 24             	mov    %eax,(%esp)
     c78:	e8 8a fb ff ff       	call   807 <peek>
     c7d:	85 c0                	test   %eax,%eax
     c7f:	74 17                	je     c98 <parseexec+0x3b>
    return parseblock(ps, es);
     c81:	8b 45 0c             	mov    0xc(%ebp),%eax
     c84:	89 44 24 04          	mov    %eax,0x4(%esp)
     c88:	8b 45 08             	mov    0x8(%ebp),%eax
     c8b:	89 04 24             	mov    %eax,(%esp)
     c8e:	e8 f6 fe ff ff       	call   b89 <parseblock>
     c93:	e9 0b 01 00 00       	jmp    da3 <parseexec+0x146>

  ret = execcmd();
     c98:	e8 8f f8 ff ff       	call   52c <execcmd>
     c9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     ca0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ca3:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     ca6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     cad:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb0:	89 44 24 08          	mov    %eax,0x8(%esp)
     cb4:	8b 45 08             	mov    0x8(%ebp),%eax
     cb7:	89 44 24 04          	mov    %eax,0x4(%esp)
     cbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cbe:	89 04 24             	mov    %eax,(%esp)
     cc1:	e8 9b fd ff ff       	call   a61 <parseredirs>
     cc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     cc9:	e9 8e 00 00 00       	jmp    d5c <parseexec+0xff>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     cce:	8d 45 e0             	lea    -0x20(%ebp),%eax
     cd1:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cd5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     cd8:	89 44 24 08          	mov    %eax,0x8(%esp)
     cdc:	8b 45 0c             	mov    0xc(%ebp),%eax
     cdf:	89 44 24 04          	mov    %eax,0x4(%esp)
     ce3:	8b 45 08             	mov    0x8(%ebp),%eax
     ce6:	89 04 24             	mov    %eax,(%esp)
     ce9:	e8 ce f9 ff ff       	call   6bc <gettoken>
     cee:	89 45 e8             	mov    %eax,-0x18(%ebp)
     cf1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     cf5:	0f 84 85 00 00 00    	je     d80 <parseexec+0x123>
      break;
    if(tok != 'a')
     cfb:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     cff:	74 0c                	je     d0d <parseexec+0xb0>
      panic("syntax");
     d01:	c7 04 24 ac 16 00 00 	movl   $0x16ac,(%esp)
     d08:	e8 d4 f7 ff ff       	call   4e1 <panic>
    cmd->argv[argc] = q;
     d0d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     d10:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d13:	8b 55 f4             	mov    -0xc(%ebp),%edx
     d16:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     d1a:	8b 55 e0             	mov    -0x20(%ebp),%edx
     d1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d20:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     d23:	83 c1 08             	add    $0x8,%ecx
     d26:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     d2a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     d2e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     d32:	7e 0c                	jle    d40 <parseexec+0xe3>
      panic("too many args");
     d34:	c7 04 24 fb 16 00 00 	movl   $0x16fb,(%esp)
     d3b:	e8 a1 f7 ff ff       	call   4e1 <panic>
    ret = parseredirs(ret, ps, es);
     d40:	8b 45 0c             	mov    0xc(%ebp),%eax
     d43:	89 44 24 08          	mov    %eax,0x8(%esp)
     d47:	8b 45 08             	mov    0x8(%ebp),%eax
     d4a:	89 44 24 04          	mov    %eax,0x4(%esp)
     d4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d51:	89 04 24             	mov    %eax,(%esp)
     d54:	e8 08 fd ff ff       	call   a61 <parseredirs>
     d59:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     d5c:	c7 44 24 08 09 17 00 	movl   $0x1709,0x8(%esp)
     d63:	00 
     d64:	8b 45 0c             	mov    0xc(%ebp),%eax
     d67:	89 44 24 04          	mov    %eax,0x4(%esp)
     d6b:	8b 45 08             	mov    0x8(%ebp),%eax
     d6e:	89 04 24             	mov    %eax,(%esp)
     d71:	e8 91 fa ff ff       	call   807 <peek>
     d76:	85 c0                	test   %eax,%eax
     d78:	0f 84 50 ff ff ff    	je     cce <parseexec+0x71>
     d7e:	eb 01                	jmp    d81 <parseexec+0x124>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
     d80:	90                   	nop
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     d81:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d84:	8b 55 f4             	mov    -0xc(%ebp),%edx
     d87:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     d8e:	00 
  cmd->eargv[argc] = 0;
     d8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d92:	8b 55 f4             	mov    -0xc(%ebp),%edx
     d95:	83 c2 08             	add    $0x8,%edx
     d98:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     d9f:	00 
  return ret;
     da0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     da3:	c9                   	leave  
     da4:	c3                   	ret    

00000da5 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     da5:	55                   	push   %ebp
     da6:	89 e5                	mov    %esp,%ebp
     da8:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     dab:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     daf:	75 0a                	jne    dbb <nulterminate+0x16>
    return 0;
     db1:	b8 00 00 00 00       	mov    $0x0,%eax
     db6:	e9 c9 00 00 00       	jmp    e84 <nulterminate+0xdf>
  
  switch(cmd->type){
     dbb:	8b 45 08             	mov    0x8(%ebp),%eax
     dbe:	8b 00                	mov    (%eax),%eax
     dc0:	83 f8 05             	cmp    $0x5,%eax
     dc3:	0f 87 b8 00 00 00    	ja     e81 <nulterminate+0xdc>
     dc9:	8b 04 85 10 17 00 00 	mov    0x1710(,%eax,4),%eax
     dd0:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     dd2:	8b 45 08             	mov    0x8(%ebp),%eax
     dd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     dd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ddf:	eb 14                	jmp    df5 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     de4:	8b 55 f4             	mov    -0xc(%ebp),%edx
     de7:	83 c2 08             	add    $0x8,%edx
     dea:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     dee:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     df1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     df5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     df8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     dfb:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     dff:	85 c0                	test   %eax,%eax
     e01:	75 de                	jne    de1 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     e03:	eb 7c                	jmp    e81 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     e05:	8b 45 08             	mov    0x8(%ebp),%eax
     e08:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     e0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e0e:	8b 40 04             	mov    0x4(%eax),%eax
     e11:	89 04 24             	mov    %eax,(%esp)
     e14:	e8 8c ff ff ff       	call   da5 <nulterminate>
    *rcmd->efile = 0;
     e19:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e1c:	8b 40 0c             	mov    0xc(%eax),%eax
     e1f:	c6 00 00             	movb   $0x0,(%eax)
    break;
     e22:	eb 5d                	jmp    e81 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     e24:	8b 45 08             	mov    0x8(%ebp),%eax
     e27:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     e2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e2d:	8b 40 04             	mov    0x4(%eax),%eax
     e30:	89 04 24             	mov    %eax,(%esp)
     e33:	e8 6d ff ff ff       	call   da5 <nulterminate>
    nulterminate(pcmd->right);
     e38:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e3b:	8b 40 08             	mov    0x8(%eax),%eax
     e3e:	89 04 24             	mov    %eax,(%esp)
     e41:	e8 5f ff ff ff       	call   da5 <nulterminate>
    break;
     e46:	eb 39                	jmp    e81 <nulterminate+0xdc>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     e48:	8b 45 08             	mov    0x8(%ebp),%eax
     e4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     e4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e51:	8b 40 04             	mov    0x4(%eax),%eax
     e54:	89 04 24             	mov    %eax,(%esp)
     e57:	e8 49 ff ff ff       	call   da5 <nulterminate>
    nulterminate(lcmd->right);
     e5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e5f:	8b 40 08             	mov    0x8(%eax),%eax
     e62:	89 04 24             	mov    %eax,(%esp)
     e65:	e8 3b ff ff ff       	call   da5 <nulterminate>
    break;
     e6a:	eb 15                	jmp    e81 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     e6c:	8b 45 08             	mov    0x8(%ebp),%eax
     e6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     e72:	8b 45 e0             	mov    -0x20(%ebp),%eax
     e75:	8b 40 04             	mov    0x4(%eax),%eax
     e78:	89 04 24             	mov    %eax,(%esp)
     e7b:	e8 25 ff ff ff       	call   da5 <nulterminate>
    break;
     e80:	90                   	nop
  }
  return cmd;
     e81:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e84:	c9                   	leave  
     e85:	c3                   	ret    
     e86:	90                   	nop
     e87:	90                   	nop

00000e88 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     e88:	55                   	push   %ebp
     e89:	89 e5                	mov    %esp,%ebp
     e8b:	57                   	push   %edi
     e8c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     e8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e90:	8b 55 10             	mov    0x10(%ebp),%edx
     e93:	8b 45 0c             	mov    0xc(%ebp),%eax
     e96:	89 cb                	mov    %ecx,%ebx
     e98:	89 df                	mov    %ebx,%edi
     e9a:	89 d1                	mov    %edx,%ecx
     e9c:	fc                   	cld    
     e9d:	f3 aa                	rep stos %al,%es:(%edi)
     e9f:	89 ca                	mov    %ecx,%edx
     ea1:	89 fb                	mov    %edi,%ebx
     ea3:	89 5d 08             	mov    %ebx,0x8(%ebp)
     ea6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     ea9:	5b                   	pop    %ebx
     eaa:	5f                   	pop    %edi
     eab:	5d                   	pop    %ebp
     eac:	c3                   	ret    

00000ead <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     ead:	55                   	push   %ebp
     eae:	89 e5                	mov    %esp,%ebp
     eb0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     eb3:	8b 45 08             	mov    0x8(%ebp),%eax
     eb6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     eb9:	90                   	nop
     eba:	8b 45 0c             	mov    0xc(%ebp),%eax
     ebd:	0f b6 10             	movzbl (%eax),%edx
     ec0:	8b 45 08             	mov    0x8(%ebp),%eax
     ec3:	88 10                	mov    %dl,(%eax)
     ec5:	8b 45 08             	mov    0x8(%ebp),%eax
     ec8:	0f b6 00             	movzbl (%eax),%eax
     ecb:	84 c0                	test   %al,%al
     ecd:	0f 95 c0             	setne  %al
     ed0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     ed4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
     ed8:	84 c0                	test   %al,%al
     eda:	75 de                	jne    eba <strcpy+0xd>
    ;
  return os;
     edc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     edf:	c9                   	leave  
     ee0:	c3                   	ret    

00000ee1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ee1:	55                   	push   %ebp
     ee2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     ee4:	eb 08                	jmp    eee <strcmp+0xd>
    p++, q++;
     ee6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     eea:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     eee:	8b 45 08             	mov    0x8(%ebp),%eax
     ef1:	0f b6 00             	movzbl (%eax),%eax
     ef4:	84 c0                	test   %al,%al
     ef6:	74 10                	je     f08 <strcmp+0x27>
     ef8:	8b 45 08             	mov    0x8(%ebp),%eax
     efb:	0f b6 10             	movzbl (%eax),%edx
     efe:	8b 45 0c             	mov    0xc(%ebp),%eax
     f01:	0f b6 00             	movzbl (%eax),%eax
     f04:	38 c2                	cmp    %al,%dl
     f06:	74 de                	je     ee6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     f08:	8b 45 08             	mov    0x8(%ebp),%eax
     f0b:	0f b6 00             	movzbl (%eax),%eax
     f0e:	0f b6 d0             	movzbl %al,%edx
     f11:	8b 45 0c             	mov    0xc(%ebp),%eax
     f14:	0f b6 00             	movzbl (%eax),%eax
     f17:	0f b6 c0             	movzbl %al,%eax
     f1a:	89 d1                	mov    %edx,%ecx
     f1c:	29 c1                	sub    %eax,%ecx
     f1e:	89 c8                	mov    %ecx,%eax
}
     f20:	5d                   	pop    %ebp
     f21:	c3                   	ret    

00000f22 <strlen>:

uint
strlen(char *s)
{
     f22:	55                   	push   %ebp
     f23:	89 e5                	mov    %esp,%ebp
     f25:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     f28:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f2f:	eb 04                	jmp    f35 <strlen+0x13>
     f31:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f35:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f38:	03 45 08             	add    0x8(%ebp),%eax
     f3b:	0f b6 00             	movzbl (%eax),%eax
     f3e:	84 c0                	test   %al,%al
     f40:	75 ef                	jne    f31 <strlen+0xf>
    ;
  return n;
     f42:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f45:	c9                   	leave  
     f46:	c3                   	ret    

00000f47 <memset>:

void*
memset(void *dst, int c, uint n)
{
     f47:	55                   	push   %ebp
     f48:	89 e5                	mov    %esp,%ebp
     f4a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     f4d:	8b 45 10             	mov    0x10(%ebp),%eax
     f50:	89 44 24 08          	mov    %eax,0x8(%esp)
     f54:	8b 45 0c             	mov    0xc(%ebp),%eax
     f57:	89 44 24 04          	mov    %eax,0x4(%esp)
     f5b:	8b 45 08             	mov    0x8(%ebp),%eax
     f5e:	89 04 24             	mov    %eax,(%esp)
     f61:	e8 22 ff ff ff       	call   e88 <stosb>
  return dst;
     f66:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f69:	c9                   	leave  
     f6a:	c3                   	ret    

00000f6b <strchr>:

char*
strchr(const char *s, char c)
{
     f6b:	55                   	push   %ebp
     f6c:	89 e5                	mov    %esp,%ebp
     f6e:	83 ec 04             	sub    $0x4,%esp
     f71:	8b 45 0c             	mov    0xc(%ebp),%eax
     f74:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     f77:	eb 14                	jmp    f8d <strchr+0x22>
    if(*s == c)
     f79:	8b 45 08             	mov    0x8(%ebp),%eax
     f7c:	0f b6 00             	movzbl (%eax),%eax
     f7f:	3a 45 fc             	cmp    -0x4(%ebp),%al
     f82:	75 05                	jne    f89 <strchr+0x1e>
      return (char*)s;
     f84:	8b 45 08             	mov    0x8(%ebp),%eax
     f87:	eb 13                	jmp    f9c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     f89:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f8d:	8b 45 08             	mov    0x8(%ebp),%eax
     f90:	0f b6 00             	movzbl (%eax),%eax
     f93:	84 c0                	test   %al,%al
     f95:	75 e2                	jne    f79 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     f97:	b8 00 00 00 00       	mov    $0x0,%eax
}
     f9c:	c9                   	leave  
     f9d:	c3                   	ret    

00000f9e <gets>:

char*
gets(char *buf, int max)
{
     f9e:	55                   	push   %ebp
     f9f:	89 e5                	mov    %esp,%ebp
     fa1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     fa4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fab:	eb 44                	jmp    ff1 <gets+0x53>
    cc = read(0, &c, 1);
     fad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     fb4:	00 
     fb5:	8d 45 ef             	lea    -0x11(%ebp),%eax
     fb8:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fc3:	e8 3c 01 00 00       	call   1104 <read>
     fc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     fcb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fcf:	7e 2d                	jle    ffe <gets+0x60>
      break;
    buf[i++] = c;
     fd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd4:	03 45 08             	add    0x8(%ebp),%eax
     fd7:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
     fdb:	88 10                	mov    %dl,(%eax)
     fdd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
     fe1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fe5:	3c 0a                	cmp    $0xa,%al
     fe7:	74 16                	je     fff <gets+0x61>
     fe9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fed:	3c 0d                	cmp    $0xd,%al
     fef:	74 0e                	je     fff <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ff1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff4:	83 c0 01             	add    $0x1,%eax
     ff7:	3b 45 0c             	cmp    0xc(%ebp),%eax
     ffa:	7c b1                	jl     fad <gets+0xf>
     ffc:	eb 01                	jmp    fff <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     ffe:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1002:	03 45 08             	add    0x8(%ebp),%eax
    1005:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1008:	8b 45 08             	mov    0x8(%ebp),%eax
}
    100b:	c9                   	leave  
    100c:	c3                   	ret    

0000100d <stat>:

int
stat(char *n, struct stat *st)
{
    100d:	55                   	push   %ebp
    100e:	89 e5                	mov    %esp,%ebp
    1010:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1013:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    101a:	00 
    101b:	8b 45 08             	mov    0x8(%ebp),%eax
    101e:	89 04 24             	mov    %eax,(%esp)
    1021:	e8 06 01 00 00       	call   112c <open>
    1026:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1029:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    102d:	79 07                	jns    1036 <stat+0x29>
    return -1;
    102f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1034:	eb 23                	jmp    1059 <stat+0x4c>
  r = fstat(fd, st);
    1036:	8b 45 0c             	mov    0xc(%ebp),%eax
    1039:	89 44 24 04          	mov    %eax,0x4(%esp)
    103d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1040:	89 04 24             	mov    %eax,(%esp)
    1043:	e8 fc 00 00 00       	call   1144 <fstat>
    1048:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    104b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    104e:	89 04 24             	mov    %eax,(%esp)
    1051:	e8 be 00 00 00       	call   1114 <close>
  return r;
    1056:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1059:	c9                   	leave  
    105a:	c3                   	ret    

0000105b <atoi>:

int
atoi(const char *s)
{
    105b:	55                   	push   %ebp
    105c:	89 e5                	mov    %esp,%ebp
    105e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1061:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1068:	eb 24                	jmp    108e <atoi+0x33>
    n = n*10 + *s++ - '0';
    106a:	8b 55 fc             	mov    -0x4(%ebp),%edx
    106d:	89 d0                	mov    %edx,%eax
    106f:	c1 e0 02             	shl    $0x2,%eax
    1072:	01 d0                	add    %edx,%eax
    1074:	01 c0                	add    %eax,%eax
    1076:	89 c2                	mov    %eax,%edx
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	0f b6 00             	movzbl (%eax),%eax
    107e:	0f be c0             	movsbl %al,%eax
    1081:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1084:	83 e8 30             	sub    $0x30,%eax
    1087:	89 45 fc             	mov    %eax,-0x4(%ebp)
    108a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    108e:	8b 45 08             	mov    0x8(%ebp),%eax
    1091:	0f b6 00             	movzbl (%eax),%eax
    1094:	3c 2f                	cmp    $0x2f,%al
    1096:	7e 0a                	jle    10a2 <atoi+0x47>
    1098:	8b 45 08             	mov    0x8(%ebp),%eax
    109b:	0f b6 00             	movzbl (%eax),%eax
    109e:	3c 39                	cmp    $0x39,%al
    10a0:	7e c8                	jle    106a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    10a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10a5:	c9                   	leave  
    10a6:	c3                   	ret    

000010a7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    10a7:	55                   	push   %ebp
    10a8:	89 e5                	mov    %esp,%ebp
    10aa:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    10ad:	8b 45 08             	mov    0x8(%ebp),%eax
    10b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    10b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    10b9:	eb 13                	jmp    10ce <memmove+0x27>
    *dst++ = *src++;
    10bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10be:	0f b6 10             	movzbl (%eax),%edx
    10c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10c4:	88 10                	mov    %dl,(%eax)
    10c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10ca:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    10ce:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    10d2:	0f 9f c0             	setg   %al
    10d5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    10d9:	84 c0                	test   %al,%al
    10db:	75 de                	jne    10bb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    10dd:	8b 45 08             	mov    0x8(%ebp),%eax
}
    10e0:	c9                   	leave  
    10e1:	c3                   	ret    
    10e2:	90                   	nop
    10e3:	90                   	nop

000010e4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    10e4:	b8 01 00 00 00       	mov    $0x1,%eax
    10e9:	cd 40                	int    $0x40
    10eb:	c3                   	ret    

000010ec <exit>:
SYSCALL(exit)
    10ec:	b8 02 00 00 00       	mov    $0x2,%eax
    10f1:	cd 40                	int    $0x40
    10f3:	c3                   	ret    

000010f4 <wait>:
SYSCALL(wait)
    10f4:	b8 03 00 00 00       	mov    $0x3,%eax
    10f9:	cd 40                	int    $0x40
    10fb:	c3                   	ret    

000010fc <pipe>:
SYSCALL(pipe)
    10fc:	b8 04 00 00 00       	mov    $0x4,%eax
    1101:	cd 40                	int    $0x40
    1103:	c3                   	ret    

00001104 <read>:
SYSCALL(read)
    1104:	b8 05 00 00 00       	mov    $0x5,%eax
    1109:	cd 40                	int    $0x40
    110b:	c3                   	ret    

0000110c <write>:
SYSCALL(write)
    110c:	b8 10 00 00 00       	mov    $0x10,%eax
    1111:	cd 40                	int    $0x40
    1113:	c3                   	ret    

00001114 <close>:
SYSCALL(close)
    1114:	b8 15 00 00 00       	mov    $0x15,%eax
    1119:	cd 40                	int    $0x40
    111b:	c3                   	ret    

0000111c <kill>:
SYSCALL(kill)
    111c:	b8 06 00 00 00       	mov    $0x6,%eax
    1121:	cd 40                	int    $0x40
    1123:	c3                   	ret    

00001124 <exec>:
SYSCALL(exec)
    1124:	b8 07 00 00 00       	mov    $0x7,%eax
    1129:	cd 40                	int    $0x40
    112b:	c3                   	ret    

0000112c <open>:
SYSCALL(open)
    112c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1131:	cd 40                	int    $0x40
    1133:	c3                   	ret    

00001134 <mknod>:
SYSCALL(mknod)
    1134:	b8 11 00 00 00       	mov    $0x11,%eax
    1139:	cd 40                	int    $0x40
    113b:	c3                   	ret    

0000113c <unlink>:
SYSCALL(unlink)
    113c:	b8 12 00 00 00       	mov    $0x12,%eax
    1141:	cd 40                	int    $0x40
    1143:	c3                   	ret    

00001144 <fstat>:
SYSCALL(fstat)
    1144:	b8 08 00 00 00       	mov    $0x8,%eax
    1149:	cd 40                	int    $0x40
    114b:	c3                   	ret    

0000114c <link>:
SYSCALL(link)
    114c:	b8 13 00 00 00       	mov    $0x13,%eax
    1151:	cd 40                	int    $0x40
    1153:	c3                   	ret    

00001154 <mkdir>:
SYSCALL(mkdir)
    1154:	b8 14 00 00 00       	mov    $0x14,%eax
    1159:	cd 40                	int    $0x40
    115b:	c3                   	ret    

0000115c <chdir>:
SYSCALL(chdir)
    115c:	b8 09 00 00 00       	mov    $0x9,%eax
    1161:	cd 40                	int    $0x40
    1163:	c3                   	ret    

00001164 <dup>:
SYSCALL(dup)
    1164:	b8 0a 00 00 00       	mov    $0xa,%eax
    1169:	cd 40                	int    $0x40
    116b:	c3                   	ret    

0000116c <getpid>:
SYSCALL(getpid)
    116c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1171:	cd 40                	int    $0x40
    1173:	c3                   	ret    

00001174 <sbrk>:
SYSCALL(sbrk)
    1174:	b8 0c 00 00 00       	mov    $0xc,%eax
    1179:	cd 40                	int    $0x40
    117b:	c3                   	ret    

0000117c <sleep>:
SYSCALL(sleep)
    117c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1181:	cd 40                	int    $0x40
    1183:	c3                   	ret    

00001184 <uptime>:
SYSCALL(uptime)
    1184:	b8 0e 00 00 00       	mov    $0xe,%eax
    1189:	cd 40                	int    $0x40
    118b:	c3                   	ret    

0000118c <signal>:
SYSCALL(signal)
    118c:	b8 16 00 00 00       	mov    $0x16,%eax
    1191:	cd 40                	int    $0x40
    1193:	c3                   	ret    

00001194 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1194:	55                   	push   %ebp
    1195:	89 e5                	mov    %esp,%ebp
    1197:	83 ec 28             	sub    $0x28,%esp
    119a:	8b 45 0c             	mov    0xc(%ebp),%eax
    119d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    11a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a7:	00 
    11a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
    11ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    11af:	8b 45 08             	mov    0x8(%ebp),%eax
    11b2:	89 04 24             	mov    %eax,(%esp)
    11b5:	e8 52 ff ff ff       	call   110c <write>
}
    11ba:	c9                   	leave  
    11bb:	c3                   	ret    

000011bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    11bc:	55                   	push   %ebp
    11bd:	89 e5                	mov    %esp,%ebp
    11bf:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    11c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    11c9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    11cd:	74 17                	je     11e6 <printint+0x2a>
    11cf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    11d3:	79 11                	jns    11e6 <printint+0x2a>
    neg = 1;
    11d5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    11dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    11df:	f7 d8                	neg    %eax
    11e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    11e4:	eb 06                	jmp    11ec <printint+0x30>
  } else {
    x = xx;
    11e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    11ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    11f3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    11f9:	ba 00 00 00 00       	mov    $0x0,%edx
    11fe:	f7 f1                	div    %ecx
    1200:	89 d0                	mov    %edx,%eax
    1202:	0f b6 90 40 17 00 00 	movzbl 0x1740(%eax),%edx
    1209:	8d 45 dc             	lea    -0x24(%ebp),%eax
    120c:	03 45 f4             	add    -0xc(%ebp),%eax
    120f:	88 10                	mov    %dl,(%eax)
    1211:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
    1215:	8b 45 10             	mov    0x10(%ebp),%eax
    1218:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    121b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    121e:	ba 00 00 00 00       	mov    $0x0,%edx
    1223:	f7 75 d4             	divl   -0x2c(%ebp)
    1226:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1229:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    122d:	75 c4                	jne    11f3 <printint+0x37>
  if(neg)
    122f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1233:	74 2a                	je     125f <printint+0xa3>
    buf[i++] = '-';
    1235:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1238:	03 45 f4             	add    -0xc(%ebp),%eax
    123b:	c6 00 2d             	movb   $0x2d,(%eax)
    123e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
    1242:	eb 1b                	jmp    125f <printint+0xa3>
    putc(fd, buf[i]);
    1244:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1247:	03 45 f4             	add    -0xc(%ebp),%eax
    124a:	0f b6 00             	movzbl (%eax),%eax
    124d:	0f be c0             	movsbl %al,%eax
    1250:	89 44 24 04          	mov    %eax,0x4(%esp)
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	89 04 24             	mov    %eax,(%esp)
    125a:	e8 35 ff ff ff       	call   1194 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    125f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1263:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1267:	79 db                	jns    1244 <printint+0x88>
    putc(fd, buf[i]);
}
    1269:	c9                   	leave  
    126a:	c3                   	ret    

0000126b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    126b:	55                   	push   %ebp
    126c:	89 e5                	mov    %esp,%ebp
    126e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1271:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1278:	8d 45 0c             	lea    0xc(%ebp),%eax
    127b:	83 c0 04             	add    $0x4,%eax
    127e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1281:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1288:	e9 7e 01 00 00       	jmp    140b <printf+0x1a0>
    c = fmt[i] & 0xff;
    128d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1290:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1293:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	0f be c0             	movsbl %al,%eax
    129c:	25 ff 00 00 00       	and    $0xff,%eax
    12a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    12a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    12a8:	75 2c                	jne    12d6 <printf+0x6b>
      if(c == '%'){
    12aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    12ae:	75 0c                	jne    12bc <printf+0x51>
        state = '%';
    12b0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    12b7:	e9 4b 01 00 00       	jmp    1407 <printf+0x19c>
      } else {
        putc(fd, c);
    12bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12bf:	0f be c0             	movsbl %al,%eax
    12c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    12c6:	8b 45 08             	mov    0x8(%ebp),%eax
    12c9:	89 04 24             	mov    %eax,(%esp)
    12cc:	e8 c3 fe ff ff       	call   1194 <putc>
    12d1:	e9 31 01 00 00       	jmp    1407 <printf+0x19c>
      }
    } else if(state == '%'){
    12d6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    12da:	0f 85 27 01 00 00    	jne    1407 <printf+0x19c>
      if(c == 'd'){
    12e0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    12e4:	75 2d                	jne    1313 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    12e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12e9:	8b 00                	mov    (%eax),%eax
    12eb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    12f2:	00 
    12f3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    12fa:	00 
    12fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	89 04 24             	mov    %eax,(%esp)
    1305:	e8 b2 fe ff ff       	call   11bc <printint>
        ap++;
    130a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    130e:	e9 ed 00 00 00       	jmp    1400 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1313:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1317:	74 06                	je     131f <printf+0xb4>
    1319:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    131d:	75 2d                	jne    134c <printf+0xe1>
        printint(fd, *ap, 16, 0);
    131f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1322:	8b 00                	mov    (%eax),%eax
    1324:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    132b:	00 
    132c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1333:	00 
    1334:	89 44 24 04          	mov    %eax,0x4(%esp)
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	89 04 24             	mov    %eax,(%esp)
    133e:	e8 79 fe ff ff       	call   11bc <printint>
        ap++;
    1343:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1347:	e9 b4 00 00 00       	jmp    1400 <printf+0x195>
      } else if(c == 's'){
    134c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1350:	75 46                	jne    1398 <printf+0x12d>
        s = (char*)*ap;
    1352:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1355:	8b 00                	mov    (%eax),%eax
    1357:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    135a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    135e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1362:	75 27                	jne    138b <printf+0x120>
          s = "(null)";
    1364:	c7 45 f4 28 17 00 00 	movl   $0x1728,-0xc(%ebp)
        while(*s != 0){
    136b:	eb 1f                	jmp    138c <printf+0x121>
          putc(fd, *s);
    136d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1370:	0f b6 00             	movzbl (%eax),%eax
    1373:	0f be c0             	movsbl %al,%eax
    1376:	89 44 24 04          	mov    %eax,0x4(%esp)
    137a:	8b 45 08             	mov    0x8(%ebp),%eax
    137d:	89 04 24             	mov    %eax,(%esp)
    1380:	e8 0f fe ff ff       	call   1194 <putc>
          s++;
    1385:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1389:	eb 01                	jmp    138c <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    138b:	90                   	nop
    138c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    138f:	0f b6 00             	movzbl (%eax),%eax
    1392:	84 c0                	test   %al,%al
    1394:	75 d7                	jne    136d <printf+0x102>
    1396:	eb 68                	jmp    1400 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1398:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    139c:	75 1d                	jne    13bb <printf+0x150>
        putc(fd, *ap);
    139e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13a1:	8b 00                	mov    (%eax),%eax
    13a3:	0f be c0             	movsbl %al,%eax
    13a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    13aa:	8b 45 08             	mov    0x8(%ebp),%eax
    13ad:	89 04 24             	mov    %eax,(%esp)
    13b0:	e8 df fd ff ff       	call   1194 <putc>
        ap++;
    13b5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    13b9:	eb 45                	jmp    1400 <printf+0x195>
      } else if(c == '%'){
    13bb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    13bf:	75 17                	jne    13d8 <printf+0x16d>
        putc(fd, c);
    13c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13c4:	0f be c0             	movsbl %al,%eax
    13c7:	89 44 24 04          	mov    %eax,0x4(%esp)
    13cb:	8b 45 08             	mov    0x8(%ebp),%eax
    13ce:	89 04 24             	mov    %eax,(%esp)
    13d1:	e8 be fd ff ff       	call   1194 <putc>
    13d6:	eb 28                	jmp    1400 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    13d8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    13df:	00 
    13e0:	8b 45 08             	mov    0x8(%ebp),%eax
    13e3:	89 04 24             	mov    %eax,(%esp)
    13e6:	e8 a9 fd ff ff       	call   1194 <putc>
        putc(fd, c);
    13eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13ee:	0f be c0             	movsbl %al,%eax
    13f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    13f5:	8b 45 08             	mov    0x8(%ebp),%eax
    13f8:	89 04 24             	mov    %eax,(%esp)
    13fb:	e8 94 fd ff ff       	call   1194 <putc>
      }
      state = 0;
    1400:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1407:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    140b:	8b 55 0c             	mov    0xc(%ebp),%edx
    140e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1411:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1414:	0f b6 00             	movzbl (%eax),%eax
    1417:	84 c0                	test   %al,%al
    1419:	0f 85 6e fe ff ff    	jne    128d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    141f:	c9                   	leave  
    1420:	c3                   	ret    
    1421:	90                   	nop
    1422:	90                   	nop
    1423:	90                   	nop

00001424 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1424:	55                   	push   %ebp
    1425:	89 e5                	mov    %esp,%ebp
    1427:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    142a:	8b 45 08             	mov    0x8(%ebp),%eax
    142d:	83 e8 08             	sub    $0x8,%eax
    1430:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1433:	a1 cc 17 00 00       	mov    0x17cc,%eax
    1438:	89 45 fc             	mov    %eax,-0x4(%ebp)
    143b:	eb 24                	jmp    1461 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    143d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1440:	8b 00                	mov    (%eax),%eax
    1442:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1445:	77 12                	ja     1459 <free+0x35>
    1447:	8b 45 f8             	mov    -0x8(%ebp),%eax
    144a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    144d:	77 24                	ja     1473 <free+0x4f>
    144f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1452:	8b 00                	mov    (%eax),%eax
    1454:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1457:	77 1a                	ja     1473 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1459:	8b 45 fc             	mov    -0x4(%ebp),%eax
    145c:	8b 00                	mov    (%eax),%eax
    145e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1461:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1464:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1467:	76 d4                	jbe    143d <free+0x19>
    1469:	8b 45 fc             	mov    -0x4(%ebp),%eax
    146c:	8b 00                	mov    (%eax),%eax
    146e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1471:	76 ca                	jbe    143d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1473:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1476:	8b 40 04             	mov    0x4(%eax),%eax
    1479:	c1 e0 03             	shl    $0x3,%eax
    147c:	89 c2                	mov    %eax,%edx
    147e:	03 55 f8             	add    -0x8(%ebp),%edx
    1481:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1484:	8b 00                	mov    (%eax),%eax
    1486:	39 c2                	cmp    %eax,%edx
    1488:	75 24                	jne    14ae <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    148a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    148d:	8b 50 04             	mov    0x4(%eax),%edx
    1490:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1493:	8b 00                	mov    (%eax),%eax
    1495:	8b 40 04             	mov    0x4(%eax),%eax
    1498:	01 c2                	add    %eax,%edx
    149a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    149d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    14a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14a3:	8b 00                	mov    (%eax),%eax
    14a5:	8b 10                	mov    (%eax),%edx
    14a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14aa:	89 10                	mov    %edx,(%eax)
    14ac:	eb 0a                	jmp    14b8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    14ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14b1:	8b 10                	mov    (%eax),%edx
    14b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14b6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    14b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14bb:	8b 40 04             	mov    0x4(%eax),%eax
    14be:	c1 e0 03             	shl    $0x3,%eax
    14c1:	03 45 fc             	add    -0x4(%ebp),%eax
    14c4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    14c7:	75 20                	jne    14e9 <free+0xc5>
    p->s.size += bp->s.size;
    14c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14cc:	8b 50 04             	mov    0x4(%eax),%edx
    14cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14d2:	8b 40 04             	mov    0x4(%eax),%eax
    14d5:	01 c2                	add    %eax,%edx
    14d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    14dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14e0:	8b 10                	mov    (%eax),%edx
    14e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14e5:	89 10                	mov    %edx,(%eax)
    14e7:	eb 08                	jmp    14f1 <free+0xcd>
  } else
    p->s.ptr = bp;
    14e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
    14ef:	89 10                	mov    %edx,(%eax)
  freep = p;
    14f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14f4:	a3 cc 17 00 00       	mov    %eax,0x17cc
}
    14f9:	c9                   	leave  
    14fa:	c3                   	ret    

000014fb <morecore>:

static Header*
morecore(uint nu)
{
    14fb:	55                   	push   %ebp
    14fc:	89 e5                	mov    %esp,%ebp
    14fe:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1501:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1508:	77 07                	ja     1511 <morecore+0x16>
    nu = 4096;
    150a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1511:	8b 45 08             	mov    0x8(%ebp),%eax
    1514:	c1 e0 03             	shl    $0x3,%eax
    1517:	89 04 24             	mov    %eax,(%esp)
    151a:	e8 55 fc ff ff       	call   1174 <sbrk>
    151f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1522:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1526:	75 07                	jne    152f <morecore+0x34>
    return 0;
    1528:	b8 00 00 00 00       	mov    $0x0,%eax
    152d:	eb 22                	jmp    1551 <morecore+0x56>
  hp = (Header*)p;
    152f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1532:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1535:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1538:	8b 55 08             	mov    0x8(%ebp),%edx
    153b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    153e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1541:	83 c0 08             	add    $0x8,%eax
    1544:	89 04 24             	mov    %eax,(%esp)
    1547:	e8 d8 fe ff ff       	call   1424 <free>
  return freep;
    154c:	a1 cc 17 00 00       	mov    0x17cc,%eax
}
    1551:	c9                   	leave  
    1552:	c3                   	ret    

00001553 <malloc>:

void*
malloc(uint nbytes)
{
    1553:	55                   	push   %ebp
    1554:	89 e5                	mov    %esp,%ebp
    1556:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1559:	8b 45 08             	mov    0x8(%ebp),%eax
    155c:	83 c0 07             	add    $0x7,%eax
    155f:	c1 e8 03             	shr    $0x3,%eax
    1562:	83 c0 01             	add    $0x1,%eax
    1565:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1568:	a1 cc 17 00 00       	mov    0x17cc,%eax
    156d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1570:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1574:	75 23                	jne    1599 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1576:	c7 45 f0 c4 17 00 00 	movl   $0x17c4,-0x10(%ebp)
    157d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1580:	a3 cc 17 00 00       	mov    %eax,0x17cc
    1585:	a1 cc 17 00 00       	mov    0x17cc,%eax
    158a:	a3 c4 17 00 00       	mov    %eax,0x17c4
    base.s.size = 0;
    158f:	c7 05 c8 17 00 00 00 	movl   $0x0,0x17c8
    1596:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1599:	8b 45 f0             	mov    -0x10(%ebp),%eax
    159c:	8b 00                	mov    (%eax),%eax
    159e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    15a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a4:	8b 40 04             	mov    0x4(%eax),%eax
    15a7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15aa:	72 4d                	jb     15f9 <malloc+0xa6>
      if(p->s.size == nunits)
    15ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15af:	8b 40 04             	mov    0x4(%eax),%eax
    15b2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15b5:	75 0c                	jne    15c3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    15b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ba:	8b 10                	mov    (%eax),%edx
    15bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15bf:	89 10                	mov    %edx,(%eax)
    15c1:	eb 26                	jmp    15e9 <malloc+0x96>
      else {
        p->s.size -= nunits;
    15c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c6:	8b 40 04             	mov    0x4(%eax),%eax
    15c9:	89 c2                	mov    %eax,%edx
    15cb:	2b 55 ec             	sub    -0x14(%ebp),%edx
    15ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    15d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15d7:	8b 40 04             	mov    0x4(%eax),%eax
    15da:	c1 e0 03             	shl    $0x3,%eax
    15dd:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    15e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15e6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    15e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15ec:	a3 cc 17 00 00       	mov    %eax,0x17cc
      return (void*)(p + 1);
    15f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f4:	83 c0 08             	add    $0x8,%eax
    15f7:	eb 38                	jmp    1631 <malloc+0xde>
    }
    if(p == freep)
    15f9:	a1 cc 17 00 00       	mov    0x17cc,%eax
    15fe:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1601:	75 1b                	jne    161e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1603:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1606:	89 04 24             	mov    %eax,(%esp)
    1609:	e8 ed fe ff ff       	call   14fb <morecore>
    160e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1611:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1615:	75 07                	jne    161e <malloc+0xcb>
        return 0;
    1617:	b8 00 00 00 00       	mov    $0x0,%eax
    161c:	eb 13                	jmp    1631 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    161e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1621:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1624:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1627:	8b 00                	mov    (%eax),%eax
    1629:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    162c:	e9 70 ff ff ff       	jmp    15a1 <malloc+0x4e>
}
    1631:	c9                   	leave  
    1632:	c3                   	ret    
