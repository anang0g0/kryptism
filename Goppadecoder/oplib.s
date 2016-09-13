	.file	"oplib.cpp"
	.section	.rodata
.LC0:
	.string	"11001"
.LC1:
	.string	"110111"
.LC2:
	.string	"1100001"
.LC3:
	.string	"11000001"
.LC4:
	.string	"110101001"
.LC5:
	.string	"1100110001"
.LC6:
	.string	"11000010011"
.LC7:
	.string	"110000001101"
.LC8:
	.string	"1100101000001"
.LC9:
	.string	"11011000000001"
.LC10:
	.string	"110000100010001"
.LC11:
	.string	"1100000000000001"
.LC12:
	.string	"11010000000010001"
	.data
	.align 64
	.type	_ZL6normal, @object
	.size	_ZL6normal, 104
_ZL6normal:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.globl	gf
	.bss
	.align 64
	.type	gf, @object
	.size	gf, 262144
gf:
	.zero	262144
	.globl	fg
	.align 64
	.type	fg, @object
	.size	fg, 262144
fg:
	.zero	262144
	.text
	.globl	_Z6makefgi
	.type	_Z6makefgi, @function
_Z6makefgi:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	movl	$0, -8(%rbp)
	jmp	.L3
.L5:
	movl	-4(%rbp), %eax
	cltq
	movl	gf(,%rax,4), %edx
	movl	-8(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L4
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	cltq
	movl	%edx, fg(,%rax,4)
.L4:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L5
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z6makefgi, .-_Z6makefgi
	.section	.rodata
.LC13:
	.string	"%d\n"
.LC14:
	.string	"%u %u %u\n"
.LC15:
	.string	"%u,"
.LC16:
	.string	"};"
	.text
	.globl	_Z6makegfi
	.type	_Z6makegfi, @function
_Z6makegfi:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L9
.L10:
	movl	-4(%rbp), %eax
	cltq
	movq	_ZL6normal(,%rax,8), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	addl	$1, -4(%rbp)
.L9:
	cmpl	$12, -4(%rbp)
	jle	.L10
	movl	-36(%rbp), %eax
	cmpl	$256, %eax
	je	.L12
	cmpl	$256, %eax
	jg	.L13
	cmpl	$32, %eax
	je	.L14
	cmpl	$32, %eax
	jg	.L15
	cmpl	$16, %eax
	je	.L16
	jmp	.L11
.L15:
	cmpl	$64, %eax
	je	.L17
	cmpl	$128, %eax
	je	.L18
	jmp	.L11
.L13:
	cmpl	$2048, %eax
	je	.L19
	cmpl	$2048, %eax
	jg	.L20
	cmpl	$512, %eax
	je	.L21
	cmpl	$1024, %eax
	je	.L22
	jmp	.L11
.L20:
	cmpl	$4096, %eax
	je	.L23
	cmpl	$8192, %eax
	je	.L24
	jmp	.L11
.L16:
	movq	_ZL6normal(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L14:
	movq	_ZL6normal+8(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L17:
	movq	_ZL6normal+16(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L18:
	movq	_ZL6normal+24(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L12:
	movq	_ZL6normal+32(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L21:
	movq	_ZL6normal+40(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L22:
	movq	_ZL6normal+48(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L19:
	movq	_ZL6normal+56(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L23:
	movq	_ZL6normal+64(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L24:
	movq	_ZL6normal+72(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L25
.L11:
	movq	_ZL6normal+80(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	nop
.L25:
	movl	$1, -20(%rbp)
	jmp	.L26
.L27:
	sall	-20(%rbp)
	addl	$1, -12(%rbp)
.L26:
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	ja	.L27
	shrl	-20(%rbp)
	movl	-16(%rbp), %eax
	xorl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %ecx
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	movl	$0, gf(%rip)
	movl	$1, -8(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L28
.L30:
	movl	-8(%rbp), %eax
	movl	-20(%rbp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jbe	.L29
	movl	-8(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	xorl	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
.L29:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, gf(,%rax,4)
	sall	-8(%rbp)
	addl	$1, -4(%rbp)
.L28:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L30
	movl	$0, -4(%rbp)
	jmp	.L31
.L33:
	movl	-4(%rbp), %eax
	cltq
	movl	gf(,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	jne	.L32
	cmpl	$0, -4(%rbp)
	jle	.L32
	movl	$10, %edi
	call	putchar
.L32:
	addl	$1, -4(%rbp)
.L31:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L33
	movl	$.LC16, %edi
	call	puts
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z6makegfi, .-_Z6makegfi
	.globl	r
	.data
	.align 64
	.type	r, @object
	.size	r, 64
r:
	.byte	50
	.byte	57
	.byte	14
	.byte	8
	.byte	53
	.byte	6
	.byte	19
	.byte	47
	.byte	12
	.byte	60
	.byte	7
	.byte	49
	.byte	51
	.byte	44
	.byte	4
	.byte	16
	.byte	10
	.byte	15
	.byte	28
	.byte	2
	.byte	41
	.byte	33
	.byte	35
	.byte	42
	.byte	23
	.byte	21
	.byte	38
	.byte	29
	.byte	27
	.byte	36
	.byte	63
	.byte	48
	.byte	59
	.byte	17
	.byte	3
	.byte	24
	.byte	58
	.byte	39
	.byte	18
	.byte	9
	.byte	5
	.byte	11
	.byte	22
	.byte	46
	.byte	45
	.byte	40
	.byte	1
	.byte	34
	.byte	32
	.byte	56
	.byte	43
	.byte	61
	.byte	37
	.byte	31
	.byte	30
	.byte	13
	.byte	20
	.byte	55
	.byte	0
	.byte	62
	.byte	26
	.byte	25
	.byte	52
	.byte	54
	.globl	s
	.align 64
	.type	s, @object
	.size	s, 64
s:
	.byte	58
	.byte	1
	.byte	59
	.byte	3
	.byte	36
	.byte	25
	.byte	63
	.byte	51
	.byte	50
	.byte	21
	.byte	17
	.byte	11
	.byte	53
	.byte	2
	.byte	18
	.byte	7
	.byte	6
	.byte	12
	.byte	31
	.byte	28
	.byte	20
	.byte	32
	.byte	14
	.byte	8
	.byte	22
	.byte	13
	.byte	38
	.byte	30
	.byte	26
	.byte	34
	.byte	47
	.byte	54
	.byte	46
	.byte	43
	.byte	60
	.byte	35
	.byte	55
	.byte	49
	.byte	27
	.byte	39
	.byte	40
	.byte	61
	.byte	56
	.byte	5
	.byte	37
	.byte	4
	.byte	9
	.byte	16
	.byte	52
	.byte	29
	.byte	48
	.byte	19
	.byte	0
	.byte	62
	.byte	10
	.byte	33
	.byte	41
	.byte	42
	.byte	15
	.byte	44
	.byte	57
	.byte	24
	.byte	45
	.byte	23
	.globl	ps
	.bss
	.align 64
	.type	ps, @object
	.size	ps, 64
ps:
	.zero	64
	.globl	pr
	.align 64
	.type	pr, @object
	.size	pr, 64
pr:
	.zero	64
	.globl	xx
	.data
	.align 64
	.type	xx, @object
	.size	xx, 64
xx:
	.byte	42
	.byte	33
	.byte	26
	.byte	62
	.byte	5
	.byte	32
	.byte	12
	.byte	46
	.byte	47
	.byte	3
	.byte	34
	.byte	7
	.byte	11
	.byte	0
	.byte	30
	.byte	44
	.byte	28
	.byte	58
	.byte	10
	.byte	20
	.byte	9
	.byte	50
	.byte	17
	.byte	57
	.byte	41
	.byte	6
	.byte	4
	.byte	31
	.byte	36
	.byte	16
	.byte	14
	.byte	19
	.byte	48
	.byte	29
	.byte	59
	.byte	38
	.byte	54
	.byte	53
	.byte	1
	.byte	15
	.byte	51
	.byte	21
	.byte	22
	.byte	40
	.byte	13
	.byte	49
	.byte	43
	.byte	63
	.byte	45
	.byte	39
	.byte	52
	.byte	25
	.byte	8
	.byte	35
	.byte	60
	.byte	2
	.byte	37
	.byte	23
	.byte	18
	.byte	61
	.byte	27
	.byte	56
	.byte	55
	.byte	24
	.globl	aa
	.bss
	.align 64
	.type	aa, @object
	.size	aa, 64
aa:
	.zero	64
	.globl	x
	.data
	.align 64
	.type	x, @object
	.size	x, 320
x:
	.byte	-1
	.zero	63
	.zero	256
	.globl	message
	.bss
	.type	message, @object
	.size	message, 4
message:
	.zero	4
	.globl	password
	.align 64
	.type	password, @object
	.size	password, 257
password:
	.zero	257
	.text
	.globl	_Z4seedv
	.type	_Z4seedv, @function
_Z4seedv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	call	clock
	movl	%eax, %ebx
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	time
	addl	%ebx, %eax
	movl	%eax, %edi
	call	srand
	movl	$0, -20(%rbp)
	jmp	.L35
.L36:
	addl	$1, -20(%rbp)
.L35:
	cmpl	$999, -20(%rbp)
	jle	.L36
	movl	$0, -20(%rbp)
	jmp	.L37
.L41:
	movl	$0, -24(%rbp)
	jmp	.L38
.L40:
	movl	-20(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
.L39:
	call	rand
	movl	%eax, -32(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movzbl	-192(%rbp,%rax), %eax
	movl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	cltq
	movb	%dl, password(%rax)
	movl	-28(%rbp), %eax
	cltq
	movzbl	password(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	isalnum
	testl	%eax, %eax
	je	.L39
	addl	$1, -24(%rbp)
.L38:
	cmpl	$1, -24(%rbp)
	jle	.L40
	addl	$1, -20(%rbp)
.L37:
	cmpl	$127, -20(%rbp)
	jle	.L41
	movb	$0, password+256(%rip)
	nop
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z4seedv, .-_Z4seedv
	.globl	_Z3mltii
	.type	_Z3mltii, @function
_Z3mltii:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L44
	cmpl	$0, -8(%rbp)
	jne	.L45
.L44:
	movl	$0, %eax
	jmp	.L46
.L45:
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	leal	-2(%rax), %edx
	movslq	%edx, %rax
	imulq	$-2139062143, %rax, %rax
	shrq	$32, %rax
	addl	%edx, %eax
	sarl	$7, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sall	$8, %ecx
	subl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	addl	$1, %eax
.L46:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z3mltii, .-_Z3mltii
	.globl	_Z4mltnii
	.type	_Z4mltnii, @function
_Z4mltnii:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L48
	movl	$1, %eax
	jmp	.L49
.L48:
	movl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L50
.L51:
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L50:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cmpl	-8(%rbp), %eax
	jg	.L51
	movl	-4(%rbp), %eax
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z4mltnii, .-_Z4mltnii
	.globl	_Z5chashPh
	.type	_Z5chashPh, @function
_Z5chashPh:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$832, %rsp
	movq	%rdi, -824(%rbp)
	movq	%rsi, -832(%rbp)
	movl	$0, -8(%rbp)
	movb	$-108, -784(%rbp)
	movb	$-10, -783(%rbp)
	movb	$52, -782(%rbp)
	movb	$-5, -781(%rbp)
	movb	$16, -780(%rbp)
	movb	$-62, -779(%rbp)
	movb	$72, -778(%rbp)
	movb	$-106, -777(%rbp)
	movb	$-7, -776(%rbp)
	movb	$23, -775(%rbp)
	movb	$90, -774(%rbp)
	movb	$107, -773(%rbp)
	movb	$-105, -772(%rbp)
	movb	$42, -771(%rbp)
	movb	$-102, -770(%rbp)
	movb	$124, -769(%rbp)
	movb	$48, -768(%rbp)
	movb	$58, -767(%rbp)
	movb	$30, -766(%rbp)
	movb	$24, -765(%rbp)
	movb	$42, -764(%rbp)
	movb	$33, -763(%rbp)
	movb	$38, -762(%rbp)
	movb	$10, -761(%rbp)
	movb	$115, -760(%rbp)
	movb	$41, -759(%rbp)
	movb	$-92, -758(%rbp)
	movb	$16, -757(%rbp)
	movb	$33, -756(%rbp)
	movb	$32, -755(%rbp)
	movb	$-4, -754(%rbp)
	movb	$-113, -753(%rbp)
	movb	$86, -752(%rbp)
	movb	$-81, -751(%rbp)
	movb	$8, -750(%rbp)
	movb	$-124, -749(%rbp)
	movb	$103, -748(%rbp)
	movb	$-25, -747(%rbp)
	movb	$95, -746(%rbp)
	movb	$-66, -745(%rbp)
	movb	$61, -744(%rbp)
	movb	$29, -743(%rbp)
	movb	$-41, -742(%rbp)
	movb	$75, -741(%rbp)
	movb	$-5, -740(%rbp)
	movb	$-8, -739(%rbp)
	movb	$72, -738(%rbp)
	movb	$48, -737(%rbp)
	movb	$-32, -736(%rbp)
	movb	$-56, -735(%rbp)
	movb	$-109, -734(%rbp)
	movb	$93, -733(%rbp)
	movb	$112, -732(%rbp)
	movb	$25, -731(%rbp)
	movb	$-29, -730(%rbp)
	movb	$-33, -729(%rbp)
	movb	$-50, -728(%rbp)
	movb	$-119, -727(%rbp)
	movb	$51, -726(%rbp)
	movb	$88, -725(%rbp)
	movb	$109, -724(%rbp)
	movb	$-42, -723(%rbp)
	movb	$17, -722(%rbp)
	movb	$-84, -721(%rbp)
	leaq	-656(%rbp), %rdx
	movl	$0, %eax
	movl	$8, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-272(%rbp), %rdx
	movl	$0, %eax
	movl	$32, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-592(%rbp), %rdx
	movl	$0, %eax
	movl	$8, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	$0, -816(%rbp)
	movq	$0, -808(%rbp)
	movq	$0, -800(%rbp)
	movq	$0, -792(%rbp)
	movb	$4, -400(%rbp)
	movb	$34, -399(%rbp)
	movb	$41, -398(%rbp)
	movb	$33, -397(%rbp)
	movb	$53, -396(%rbp)
	movb	$1, -395(%rbp)
	movb	$59, -394(%rbp)
	movb	$55, -393(%rbp)
	movb	$62, -392(%rbp)
	movb	$24, -391(%rbp)
	movb	$61, -390(%rbp)
	movb	$13, -389(%rbp)
	movb	$39, -388(%rbp)
	movb	$48, -387(%rbp)
	movb	$29, -386(%rbp)
	movb	$0, -385(%rbp)
	movb	$51, -384(%rbp)
	movb	$23, -383(%rbp)
	movb	$2, -382(%rbp)
	movb	$49, -381(%rbp)
	movb	$32, -380(%rbp)
	movb	$17, -379(%rbp)
	movb	$19, -378(%rbp)
	movb	$42, -377(%rbp)
	movb	$50, -376(%rbp)
	movb	$8, -375(%rbp)
	movb	$43, -374(%rbp)
	movb	$46, -373(%rbp)
	movb	$63, -372(%rbp)
	movb	$44, -371(%rbp)
	movb	$57, -370(%rbp)
	movb	$16, -369(%rbp)
	movb	$47, -368(%rbp)
	movb	$18, -367(%rbp)
	movb	$36, -366(%rbp)
	movb	$31, -365(%rbp)
	movb	$38, -364(%rbp)
	movb	$27, -363(%rbp)
	movb	$30, -362(%rbp)
	movb	$58, -361(%rbp)
	movb	$3, -360(%rbp)
	movb	$45, -359(%rbp)
	movb	$11, -358(%rbp)
	movb	$7, -357(%rbp)
	movb	$35, -356(%rbp)
	movb	$52, -355(%rbp)
	movb	$15, -354(%rbp)
	movb	$22, -353(%rbp)
	movb	$12, -352(%rbp)
	movb	$26, -351(%rbp)
	movb	$56, -350(%rbp)
	movb	$60, -349(%rbp)
	movb	$10, -348(%rbp)
	movb	$5, -347(%rbp)
	movb	$40, -346(%rbp)
	movb	$54, -345(%rbp)
	movb	$25, -344(%rbp)
	movb	$14, -343(%rbp)
	movb	$20, -342(%rbp)
	movb	$21, -341(%rbp)
	movb	$37, -340(%rbp)
	movb	$6, -339(%rbp)
	movb	$28, -338(%rbp)
	movb	$9, -337(%rbp)
	movb	$15, -336(%rbp)
	movb	$2, -335(%rbp)
	movb	$48, -334(%rbp)
	movb	$46, -333(%rbp)
	movb	$30, -332(%rbp)
	movb	$7, -331(%rbp)
	movb	$13, -330(%rbp)
	movb	$3, -329(%rbp)
	movb	$29, -328(%rbp)
	movb	$33, -327(%rbp)
	movb	$1, -326(%rbp)
	movb	$26, -325(%rbp)
	movb	$25, -324(%rbp)
	movb	$34, -323(%rbp)
	movb	$17, -322(%rbp)
	movb	$0, -321(%rbp)
	movb	$41, -320(%rbp)
	movb	$27, -319(%rbp)
	movb	$31, -318(%rbp)
	movb	$16, -317(%rbp)
	movb	$61, -316(%rbp)
	movb	$50, -315(%rbp)
	movb	$55, -314(%rbp)
	movb	$56, -313(%rbp)
	movb	$44, -312(%rbp)
	movb	$19, -311(%rbp)
	movb	$62, -310(%rbp)
	movb	$60, -309(%rbp)
	movb	$22, -308(%rbp)
	movb	$4, -307(%rbp)
	movb	$12, -306(%rbp)
	movb	$9, -305(%rbp)
	movb	$38, -304(%rbp)
	movb	$52, -303(%rbp)
	movb	$42, -302(%rbp)
	movb	$10, -301(%rbp)
	movb	$58, -300(%rbp)
	movb	$36, -299(%rbp)
	movb	$28, -298(%rbp)
	movb	$63, -297(%rbp)
	movb	$37, -296(%rbp)
	movb	$51, -295(%rbp)
	movb	$47, -294(%rbp)
	movb	$59, -293(%rbp)
	movb	$40, -292(%rbp)
	movb	$53, -291(%rbp)
	movb	$45, -290(%rbp)
	movb	$11, -289(%rbp)
	movb	$39, -288(%rbp)
	movb	$24, -287(%rbp)
	movb	$18, -286(%rbp)
	movb	$6, -285(%rbp)
	movb	$20, -284(%rbp)
	movb	$21, -283(%rbp)
	movb	$14, -282(%rbp)
	movb	$49, -281(%rbp)
	movb	$23, -280(%rbp)
	movb	$35, -279(%rbp)
	movb	$8, -278(%rbp)
	movb	$43, -277(%rbp)
	movb	$54, -276(%rbp)
	movb	$57, -275(%rbp)
	movb	$32, -274(%rbp)
	movb	$5, -273(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L53
.L54:
	movl	-4(%rbp), %eax
	cltq
	movb	$0, aa(%rax)
	addl	$1, -4(%rbp)
.L53:
	cmpl	$63, -4(%rbp)
	jle	.L54
	movl	$0, -4(%rbp)
	jmp	.L55
.L56:
	movl	-4(%rbp), %eax
	cltq
	movzbl	-400(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	-4(%rbp), %edx
	cltq
	movb	%dl, -528(%rbp,%rax)
	movl	-4(%rbp), %eax
	cltq
	movzbl	-336(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	-4(%rbp), %edx
	cltq
	movb	%dl, -464(%rbp,%rax)
	addl	$1, -4(%rbp)
.L55:
	cmpl	$63, -4(%rbp)
	jle	.L56
	movl	$0, -4(%rbp)
	jmp	.L57
.L58:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-832(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-832(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-784(%rbp,%rax), %eax
	xorl	%ecx, %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
.L57:
	cmpl	$63, -4(%rbp)
	jle	.L58
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L59
.L68:
	movl	$0, -4(%rbp)
	jmp	.L60
.L61:
	movl	-4(%rbp), %eax
	cltq
	movzbl	-528(%rbp,%rax), %eax
	movzbl	%al, %eax
	cltq
	movzbl	-336(%rbp,%rax), %eax
	movzbl	%al, %eax
	cltq
	movzbl	-400(%rbp,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movb	%dl, -720(%rbp,%rax)
	addl	$1, -4(%rbp)
.L60:
	cmpl	$63, -4(%rbp)
	jle	.L61
	movl	$0, -4(%rbp)
	jmp	.L62
.L63:
	movl	-4(%rbp), %eax
	cltq
	movzbl	-720(%rbp,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movb	%dl, -336(%rbp,%rax)
	addl	$1, -4(%rbp)
.L62:
	cmpl	$63, -4(%rbp)
	jle	.L63
	movl	$0, -4(%rbp)
	jmp	.L64
.L65:
	movl	-4(%rbp), %eax
	cltq
	movzbl	-720(%rbp,%rax), %eax
	movzbl	%al, %edx
	movq	-832(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	notl	%eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-720(%rbp,%rax), %eax
	movzbl	%al, %edx
	movq	-832(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	movl	%eax, %edx
	movl	fg+16(%rip), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %ecx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-720(%rbp,%rax), %eax
	movzbl	%al, %edx
	movq	-832(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %esi
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %edx
	andl	$63, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	movzbl	-720(%rbp,%rax), %eax
	movzbl	%al, %edx
	movq	-832(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	xorl	%esi, %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	orl	%eax, %ecx
	movl	%ecx, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-656(%rbp,%rax), %eax
	xorl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movb	%dl, -656(%rbp,%rax)
	addl	$1, -4(%rbp)
.L64:
	cmpl	$63, -4(%rbp)
	jle	.L65
	movl	$0, -4(%rbp)
	jmp	.L66
.L67:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-832(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-832(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-656(%rbp,%rax), %eax
	xorl	%ecx, %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
.L66:
	cmpl	$63, -4(%rbp)
	jle	.L67
	addl	$1, -8(%rbp)
.L59:
	cmpl	$7, -8(%rbp)
	jle	.L68
	movl	$0, -4(%rbp)
	jmp	.L69
.L70:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-832(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	movq	-824(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	movb	%cl, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L69:
	cmpl	$63, -4(%rbp)
	jle	.L70
	nop
	movq	-824(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z5chashPh, .-_Z5chashPh
	.section	.rodata
.LC17:
	.string	"rb"
.LC18:
	.string	"no file"
	.text
	.globl	_Z4hashiPPc
	.type	_Z4hashiPPc, @function
_Z4hashiPPc:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -168(%rbp)
	movl	%esi, -172(%rbp)
	movq	%rdx, -184(%rbp)
	movq	-184(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L73
	movl	$.LC18, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L73:
	movq	-168(%rbp), %rax
	movl	$64, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	jmp	.L74
.L80:
	leaq	-256(%rbp), %rax
	leaq	-160(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z5chashPh
	movq	-256(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-240(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L75
.L79:
	movl	$0, -8(%rbp)
	jmp	.L76
.L78:
	movq	-168(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movl	-4(%rbp), %eax
	leal	0(,%rax,4), %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movzbl	-96(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%edx, %ecx
	xorl	%eax, %ecx
	movq	-168(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	cmpl	$3, -8(%rbp)
	je	.L77
	movq	-168(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	sall	$8, %eax
	movl	%eax, %ecx
	movq	-168(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
.L77:
	addl	$1, -8(%rbp)
.L76:
	cmpl	$3, -8(%rbp)
	jle	.L78
	addl	$1, -4(%rbp)
.L75:
	cmpl	$15, -4(%rbp)
	jle	.L79
.L74:
	movq	-16(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rcx
	movl	$64, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	setg	%al
	testb	%al, %al
	jne	.L80
	nop
	movq	-168(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_Z4hashiPPc, .-_Z4hashiPPc
	.globl	_Z5crandPh
	.type	_Z5crandPh, @function
_Z5crandPh:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	leaq	-160(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z5chashPh
	movq	-160(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L83
.L84:
	movq	-88(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -4(%rbp)
.L83:
	movl	-4(%rbp), %eax
	cltq
	cmpq	$64, %rax
	jb	.L84
	movl	$0, -4(%rbp)
	jmp	.L85
.L86:
	movq	-88(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movl	%edx, %ecx
	xorl	%eax, %ecx
	movq	-88(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	movb	%cl, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L85:
	cmpl	$63, -4(%rbp)
	jle	.L86
	nop
	movq	-88(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_Z5crandPh, .-_Z5crandPh
	.globl	c
	.bss
	.type	c, @object
	.size	c, 1
c:
	.zero	1
	.globl	mat
	.align 64
	.type	mat, @object
	.size	mat, 32768
mat:
	.zero	32768
	.globl	g
	.data
	.align 64
	.type	g, @object
	.size	g, 129
g:
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.globl	syn
	.bss
	.align 64
	.type	syn, @object
	.size	syn, 128
syn:
	.zero	128
	.globl	ss
	.align 64
	.type	ss, @object
	.size	ss, 512
ss:
	.zero	512
	.text
	.globl	_Z4oinvh
	.type	_Z4oinvh, @function
_Z4oinvh:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L89
.L92:
	movzbl	-20(%rbp), %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %eax
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L90
	movl	-4(%rbp), %eax
	jmp	.L88
.L90:
	addl	$1, -4(%rbp)
.L89:
	cmpl	$255, -4(%rbp)
	jle	.L92
.L88:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	_Z4oinvh, .-_Z4oinvh
	.globl	_Z3equhh
	.type	_Z3equhh, @function
_Z3equhh:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L94
.L97:
	movl	-4(%rbp), %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %edx
	movzbl	-20(%rbp), %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %edx
	movzbl	-24(%rbp), %eax
	cmpl	%eax, %edx
	sete	%al
	testb	%al, %al
	je	.L95
	movl	-4(%rbp), %eax
	jmp	.L93
.L95:
	addl	$1, -4(%rbp)
.L94:
	cmpl	$255, -4(%rbp)
	jle	.L97
.L93:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_Z3equhh, .-_Z3equhh
	.globl	_Z3deg3vec
	.type	_Z3deg3vec, @function
_Z3deg3vec:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L99
.L101:
	movl	-4(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L100
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
.L100:
	addl	$1, -4(%rbp)
.L99:
	cmpl	$255, -4(%rbp)
	jle	.L101
	cmpl	$0, -8(%rbp)
	jle	.L102
	movl	-8(%rbp), %eax
	jmp	.L103
.L102:
	movl	$0, %eax
.L103:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	_Z3deg3vec, .-_Z3deg3vec
	.globl	_Z3o2v2OP
	.type	_Z3o2v2OP, @function
_Z3o2v2OP:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$1024, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L105
.L107:
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	testb	%al, %al
	je	.L106
	movl	-4(%rbp), %eax
	cltq
	movzbl	16(%rbp,%rax,2), %eax
	movzbl	%al, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	movzbl	%al, %ecx
	movq	-24(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
.L106:
	addl	$1, -4(%rbp)
.L105:
	cmpl	$255, -4(%rbp)
	jle	.L107
	nop
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_Z3o2v2OP, .-_Z3o2v2OP
	.globl	_Z3v2o3vec
	.type	_Z3v2o3vec, @function
_Z3v2o3vec:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movl	$0, -4(%rbp)
	jmp	.L110
.L112:
	movl	-4(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L111
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx,2)
	movl	-4(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, 1(%rax,%rdx,2)
.L111:
	addl	$1, -4(%rbp)
.L110:
	cmpl	$255, -4(%rbp)
	jle	.L112
	nop
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	_Z3v2o3vec, .-_Z3v2o3vec
	.globl	_Z7init_op2OP
	.type	_Z7init_op2OP, @function
_Z7init_op2OP:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048, %rsp
	movq	%rdi, -1048(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L115
.L116:
	movl	-4(%rbp), %eax
	cltq
	movb	$0, 17(%rbp,%rax,2)
	movl	-4(%rbp), %eax
	cltq
	movb	$0, 16(%rbp,%rax,2)
	addl	$1, -4(%rbp)
.L115:
	leaq	-1040(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1040(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L116
	movq	-1048(%rbp), %rax
	leaq	16(%rbp), %rdx
	movl	$512, %ecx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rdx), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rax
	subq	%rax, %rdx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %eax
	movq	%rdx, %rsi
	movq	%rax, %rcx
	rep movsq
	movq	-1048(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	_Z7init_op2OP, .-_Z7init_op2OP
	.globl	_Z8init_vec3vec
	.type	_Z8init_vec3vec, @function
_Z8init_vec3vec:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L119
.L120:
	movl	-4(%rbp), %eax
	cltq
	movl	$0, 16(%rbp,%rax,4)
	addl	$1, -4(%rbp)
.L119:
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$128, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L120
	movq	-24(%rbp), %rax
	leaq	16(%rbp), %rdx
	movl	$1024, %ecx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rdx), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rax
	subq	%rax, %rdx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %eax
	movq	%rdx, %rsi
	movq	%rax, %rcx
	rep movsq
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_Z8init_vec3vec, .-_Z8init_vec3vec
	.section	.rodata
.LC19:
	.string	"@"
.LC20:
	.string	"%d,"
	.text
	.globl	_Z6Setveci
	.type	_Z6Setveci, @function
_Z6Setveci:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movl	$1024, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movl	$.LC19, %edi
	call	puts
	movl	$0, -4(%rbp)
	jmp	.L123
.L124:
	movl	-4(%rbp), %eax
	cltq
	movzbl	c(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L123:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L124
	movl	$10, %edi
	call	putchar
	movl	$0, -4(%rbp)
	jmp	.L125
.L126:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	c(%rax), %eax
	movzbl	%al, %ecx
	movq	-24(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	movl	-28(%rbp), %eax
	subl	$1, %eax
	subl	-4(%rbp), %eax
	cltq
	movzbl	c(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L125:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L126
	movl	$10, %edi
	call	putchar
	nop
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	_Z6Setveci, .-_Z6Setveci
	.section	.rodata
.LC21:
	.string	"baka"
.LC22:
	.string	"%u"
.LC23:
	.string	"x^%d"
	.text
	.globl	_Z8printpol3vec
	.type	_Z8printpol3vec, @function
_Z8printpol3vec:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$128, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jns	.L129
	movl	$.LC21, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L129:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L130
.L133:
	movl	-4(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L131
	movl	-4(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC22, %edi
	movl	$0, %eax
	call	printf
	cmpl	$0, -4(%rbp)
	jle	.L132
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
.L132:
	cmpl	$0, -4(%rbp)
	jle	.L131
	movl	$43, %edi
	call	putchar
.L131:
	subl	$1, -4(%rbp)
.L130:
	cmpl	$0, -4(%rbp)
	jns	.L133
	movl	$10, %edi
	call	putchar
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	_Z8printpol3vec, .-_Z8printpol3vec
	.section	.rodata
.LC24:
	.string	"k=%d\n"
	.text
	.globl	_Z4oadd2OPS_
	.type	_Z4oadd2OPS_, @function
_Z4oadd2OPS_:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$4136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -3112(%rbp)
	leaq	-3104(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-2080(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-1056(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	-3112(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	leaq	-4144(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	leaq	-3104(%rbp), %rax
	leaq	-4144(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-4144(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	leaq	-2080(%rbp), %rax
	leaq	-4144(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %ebx
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	cmpl	%eax, %ebx
	setg	%al
	testb	%al, %al
	je	.L136
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.L137
.L136:
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movl	%eax, -24(%rbp)
.L137:
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -20(%rbp)
	jmp	.L138
.L139:
	movl	-20(%rbp), %eax
	cltq
	movl	-3104(%rbp,%rax,4), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	-2080(%rbp,%rax,4), %eax
	xorl	%eax, %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, -1056(%rbp,%rax,4)
	addl	$1, -20(%rbp)
.L138:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L139
	movq	-3112(%rbp), %rbx
	leaq	-4144(%rbp), %r8
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3v2o3vec
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-4144(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	nop
	movq	-3112(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	_Z4oadd2OPS_, .-_Z4oadd2OPS_
	.section	.rodata
.LC25:
	.string	"deg=%d\n"
.LC26:
	.string	"%dx%d,"
	.text
	.globl	_Z6oterml2OP5oterm
	.type	_Z6oterml2OP5oterm, @function
_Z6oterml2OP5oterm:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2080, %rsp
	movq	%rdi, -2072(%rbp)
	movw	%si, -2080(%rbp)
	movq	-2072(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	leaq	-2064(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2064(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %esi
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L142
.L143:
	movl	-4(%rbp), %eax
	cltq
	movzbl	16(%rbp,%rax,2), %edx
	movzbl	-2080(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movq	-2072(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx,2)
	movzbl	-2079(%rbp), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %eax
	movl	%eax, %ecx
	movq	-2072(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, 1(%rax,%rdx,2)
	movq	-2072(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx,2), %eax
	movzbl	%al, %edx
	movq	-2072(%rbp), %rax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	movzbl	1(%rax,%rcx,2), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L142:
	leaq	-1040(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1040(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L143
	movl	$10, %edi
	call	putchar
	nop
	movq	-2072(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	_Z6oterml2OP5oterm, .-_Z6oterml2OP5oterm
	.globl	_Z4omul2OPS_
	.type	_Z4omul2OPS_, @function
_Z4omul2OPS_:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2616, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -2104(%rbp)
	movl	$0, -24(%rbp)
	movq	-2104(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	leaq	-2096(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-1584(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	movl	$0, -20(%rbp)
	jmp	.L146
.L147:
	movl	-20(%rbp), %eax
	cltq
	movzwl	528(%rbp,%rax,2), %eax
	movw	%ax, -1072(%rbp)
	leaq	-2624(%rbp), %r8
	movzwl	-1072(%rbp), %r9d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movl	%r9d, %esi
	movq	%r8, %rdi
	call	_Z6oterml2OP5oterm
	addq	$512, %rsp
	leaq	-2096(%rbp), %rax
	leaq	-2624(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movq	-2104(%rbp), %rbx
	leaq	-2624(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2096(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	-2104(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-2624(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	addl	$1, -20(%rbp)
.L146:
	leaq	-1056(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L147
	nop
	movq	-2104(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	_Z4omul2OPS_, .-_Z4omul2OPS_
	.globl	_Z2LT2OP
	.type	_Z2LT2OP, @function
_Z2LT2OP:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movl	$0, -4(%rbp)
	jmp	.L150
.L152:
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	testb	%al, %al
	je	.L151
	movl	-4(%rbp), %eax
	cltq
	movzbl	16(%rbp,%rax,2), %eax
	movb	%al, -1056(%rbp)
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	movb	%al, -1055(%rbp)
.L151:
	addl	$1, -4(%rbp)
.L150:
	leaq	-1040(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1040(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L152
	movzwl	-1056(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	_Z2LT2OP, .-_Z2LT2OP
	.section	.rodata
.LC27:
	.string	"%u\n"
	.text
	.globl	_Z5LTdiv2OP5oterm
	.type	_Z5LTdiv2OP5oterm, @function
_Z5LTdiv2OP5oterm:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movw	%di, -48(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -16(%rbp)
	movzbl	-16(%rbp), %edx
	movzbl	-48(%rbp), %eax
	cmpb	%al, %dl
	jnb	.L155
	movb	$0, -32(%rbp)
	movb	$0, -31(%rbp)
	jmp	.L156
.L155:
	movzbl	-16(%rbp), %edx
	movzbl	-48(%rbp), %eax
	cmpb	%al, %dl
	jne	.L157
	movb	$0, -32(%rbp)
	movzbl	-15(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-47(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3equhh
	movb	%al, -31(%rbp)
	jmp	.L156
.L157:
	movzbl	-16(%rbp), %edx
	movzbl	-48(%rbp), %eax
	cmpb	%al, %dl
	jbe	.L156
	movzbl	-16(%rbp), %edx
	movzbl	-48(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, -32(%rbp)
	movzbl	-15(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-47(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3equhh
	movb	%al, -31(%rbp)
	movzbl	-31(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC27, %edi
	movl	$0, %eax
	call	printf
.L156:
	movzwl	-32(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	_Z5LTdiv2OP5oterm, .-_Z5LTdiv2OP5oterm
	.section	.rodata
.LC28:
	.string	"baka^"
.LC29:
	.string	"in omod"
.LC30:
	.string	"n=======%u\n"
.LC31:
	.string	"in omod before LTdiv"
.LC32:
	.string	"LT(g)=%dx^%d\n"
.LC33:
	.string	"%dx^%d\n"
.LC34:
	.string	"in omod after oterml"
	.text
	.globl	_Z4omod2OPS_
	.type	_Z4omod2OPS_, @function
_Z4omod2OPS_:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$13400, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -12888(%rbp)
	movl	$0, -20(%rbp)
	leaq	-12320(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12320(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-11296(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-11296(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-10272(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-10272(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	testl	%eax, %eax
	je	.L160
	leaq	-9248(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-9248(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	testl	%eax, %eax
	jne	.L161
.L160:
	movl	$1, %eax
	jmp	.L162
.L161:
	movl	$0, %eax
.L162:
	testb	%al, %al
	je	.L163
	movl	$.LC28, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L163:
	movl	$.LC29, %edi
	call	puts
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -12336(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -12352(%rbp)
	movzbl	-12336(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-12352(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -24(%rbp)
	jmp	.L164
.L165:
	leaq	-8224(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-8224(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %esi
	movl	$.LC30, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC31, %edi
	call	puts
	leaq	-7200(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-7200(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movzbl	-12352(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-12351(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC32, %edi
	movl	$0, %eax
	call	printf
	movzwl	-12352(%rbp), %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5LTdiv2OP5oterm
	addq	$512, %rsp
	movw	%ax, -12368(%rbp)
	movzbl	-12368(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-12367(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC33, %edi
	movl	$0, %eax
	call	printf
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	movzwl	-12368(%rbp), %edx
	movw	%dx, ss(%rax,%rax)
	leaq	-13408(%rbp), %r8
	movzwl	-12368(%rbp), %r9d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r9d, %esi
	movq	%r8, %rdi
	call	_Z6oterml2OP5oterm
	addq	$512, %rsp
	leaq	-12880(%rbp), %rax
	leaq	-13408(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	$.LC34, %edi
	call	puts
	leaq	-6176(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12880(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6176(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-5152(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5152(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-4128(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4128(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-13408(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12880(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	leaq	16(%rbp), %rdi
	leaq	-13408(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	leaq	-3104(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -12336(%rbp)
.L164:
	leaq	-2080(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %ebx
	leaq	-1056(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	cmpl	%eax, %ebx
	setge	%al
	testb	%al, %al
	jne	.L165
	movq	-12888(%rbp), %rax
	leaq	16(%rbp), %rdx
	movl	$512, %ecx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rdx), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rax
	subq	%rax, %rdx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %eax
	movq	%rdx, %rsi
	movq	%rax, %rcx
	rep movsq
	movq	-12888(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	_Z4omod2OPS_, .-_Z4omod2OPS_
	.globl	_Z4opow2OPi
	.type	_Z4opow2OPi, @function
_Z4opow2OPi:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$552, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	-40(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movq	-40(%rbp), %rax
	leaq	16(%rbp), %rdx
	movl	$512, %ecx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rdx), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rax
	subq	%rax, %rdx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %eax
	movq	%rdx, %rsi
	movq	%rax, %rcx
	rep movsq
	movl	$1, -20(%rbp)
	jmp	.L168
.L169:
	movq	-40(%rbp), %rbx
	leaq	-560(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	-40(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omul2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-560(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	addl	$1, -20(%rbp)
.L168:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L169
	nop
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	_Z4opow2OPi, .-_Z4opow2OPi
	.globl	_Z7opowmod2OPS_i
	.type	_Z7opowmod2OPS_i, @function
_Z7opowmod2OPS_i:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1048, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -536(%rbp)
	movl	%esi, -540(%rbp)
	leaq	-528(%rbp), %r8
	movl	-540(%rbp), %r9d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movl	%r9d, %esi
	movq	%r8, %rdi
	call	_Z4opow2OPi
	addq	$512, %rsp
	movq	-536(%rbp), %rbx
	leaq	-1056(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-1056(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	nop
	movq	-536(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	_Z7opowmod2OPS_i, .-_Z7opowmod2OPS_i
	.globl	_Z5trace2OPh
	.type	_Z5trace2OPh, @function
_Z5trace2OPh:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048, %rsp
	movl	%edi, %eax
	movb	%al, -1044(%rbp)
	movb	$0, -5(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L174
.L175:
	movzbl	-1044(%rbp), %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	16(%rbp,%rax,2), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4mltnii
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %eax
	xorb	%al, -5(%rbp)
	addl	$1, -4(%rbp)
.L174:
	leaq	-1040(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1040(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L175
	movzbl	-5(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	_Z5trace2OPh, .-_Z5trace2OPh
	.globl	_Z3inv2OPS_
	.type	_Z3inv2OPS_, @function
_Z3inv2OPS_:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$13328, %rsp
	movq	%rdi, -12808(%rbp)
	leaq	-12288(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-11776(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-11264(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-10752(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-10240(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-9728(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-9728(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	528(%rbp), %rcx
	leaq	-12800(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movb	$1, -11775(%rbp)
	jmp	.L178
.L179:
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	leaq	-13328(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12800(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	leaq	-10752(%rbp), %rax
	leaq	-13328(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-8704(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-8704(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-7680(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-7680(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	-11264(%rbp), %rax
	movl	$ss, %esi
	movq	%rax, %rdi
	call	memcpy
	leaq	-6656(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6656(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	-12800(%rbp), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	call	memcpy
	leaq	-5632(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-10752(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5632(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	-10752(%rbp), %rax
	movq	%rax, %rsi
	leaq	16(%rbp), %rdi
	call	memcpy
	leaq	-4608(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-11776(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-11264(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omul2OPS_
	addq	$1024, %rsp
	leaq	-13328(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4608(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12288(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	leaq	-10240(%rbp), %rax
	leaq	-13328(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-4096(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-11776(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4096(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	-11776(%rbp), %rcx
	leaq	-12288(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	leaq	-3072(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-10240(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3072(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movslq	%eax, %rdx
	leaq	-10240(%rbp), %rcx
	leaq	-11776(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
.L178:
	leaq	-2048(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-10752(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2048(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	testl	%eax, %eax
	setg	%al
	testb	%al, %al
	jne	.L179
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	leaq	-1024(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12800(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	leaq	-512(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-12288(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	movq	-12808(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-512(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	movq	-12808(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	_Z3inv2OPS_, .-_Z3inv2OPS_
	.globl	_Z8ToHorner2OP
	.type	_Z8ToHorner2OP, @function
_Z8ToHorner2OP:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2064, %rsp
	movq	%rdi, -1032(%rbp)
	leaq	-2064(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	leaq	-1024(%rbp), %rax
	leaq	-2064(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	nop
	movq	-1032(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	_Z8ToHorner2OP, .-_Z8ToHorner2OP
	.section	.rodata
.LC35:
	.string	"in vx"
.LC36:
	.string	"in vx befoe omod"
.LC37:
	.string	"ss="
.LC38:
	.string	"h="
.LC39:
	.string	"-------"
	.text
	.globl	_Z2vx2OPS_
	.type	_Z2vx2OPS_, @function
_Z2vx2OPS_:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$74312, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -73800(%rbp)
	leaq	-73792(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-73280(%rbp), %rax
	movl	$65536, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-73800(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movb	$0, -73279(%rbp)
	movb	$0, -73278(%rbp)
	movb	$1, -72767(%rbp)
	movb	$0, -72766(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -7728(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -7744(%rbp)
	movl	$.LC35, %edi
	call	puts
	movl	$2, -20(%rbp)
	jmp	.L184
.L187:
	movl	$.LC36, %edi
	call	puts
	leaq	-7712(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-7712(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-6688(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6688(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	leaq	-74320(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	leaq	-73792(%rbp), %rax
	leaq	-74320(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	leaq	-5664(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5664(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	$.LC38, %edi
	movl	$0, %eax
	call	printf
	leaq	-4640(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-73792(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4640(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	-20(%rbp), %eax
	subl	$1, %eax
	leaq	-3616(%rbp), %r8
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$73264, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omul2OPS_
	addq	$1024, %rsp
	movl	-20(%rbp), %eax
	leal	-2(%rax), %r9d
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	leaq	-73264(%rax), %rbx
	leaq	-74320(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3616(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movslq	%r9d, %rax
	salq	$9, %rax
	leaq	-16(%rbp), %rcx
	addq	%rcx, %rax
	subq	$73264, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdi
	leaq	-74320(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	leaq	-3104(%rbp), %r8
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$73264, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	$512, %edx
	movl	$0, %esi
	leaq	16(%rbp), %rdi
	call	memset
	leaq	16(%rbp), %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	leaq	528(%rbp), %rax
	movl	$512, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	528(%rbp), %rax
	leaq	-73792(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-2080(%rbp), %r8
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$73264, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	cmpl	$64, %eax
	sete	%al
	testb	%al, %al
	je	.L185
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	jmp	.L186
.L185:
	addl	$1, -20(%rbp)
.L184:
	cmpl	$65, -20(%rbp)
	jle	.L187
.L186:
	leaq	-73280(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rax, %rdx
	movq	-73800(%rbp), %rax
	movl	$512, %ecx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rdx), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rax
	subq	%rax, %rdx
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %eax
	movq	%rdx, %rsi
	movq	%rax, %rcx
	rep movsq
	leaq	-1056(%rbp), %r8
	movq	-73800(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	nop
	movq	-73800(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	_Z2vx2OPS_, .-_Z2vx2OPS_
	.section	.rodata
.LC40:
	.string	"\n%d\n"
	.text
	.globl	_Z12genrandompoli
	.type	_Z12genrandompoli, @function
_Z12genrandompoli:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	movq	-88(%rbp), %rax
	movl	$1024, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movl	$0, -4(%rbp)
	movl	-92(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L190
.L193:
	call	_Z4seedv
	leaq	-160(%rbp), %rax
	movl	$password, %esi
	movq	%rax, %rdi
	call	_Z5crandPh
	movq	-160(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L191
.L192:
	movl	-4(%rbp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%eax, %edx
	movl	-8(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movzbl	%al, %ecx
	movq	-88(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	movl	-8(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -8(%rbp)
.L191:
	movl	-92(%rbp), %eax
	addl	$1, %eax
	cmpl	-8(%rbp), %eax
	jg	.L192
	addl	$1, -4(%rbp)
.L190:
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L193
	movq	-88(%rbp), %rax
	subq	$1024, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$128, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, %esi
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE31:
	.size	_Z12genrandompoli, .-_Z12genrandompoli
	.section	.rodata
.LC41:
	.string	"%dx%d\n"
	.text
	.globl	_Z4ogcd2OPS_
	.type	_Z4ogcd2OPS_, @function
_Z4ogcd2OPS_:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$5704, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -5192(%rbp)
	movl	$0, -20(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -5168(%rbp)
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -5184(%rbp)
	leaq	-5152(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5152(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-4128(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4128(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	jmp	.L195
.L200:
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	movq	-5192(%rbp), %rbx
	leaq	-5712(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-5712(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	leaq	-3104(%rbp), %r8
	movq	-5192(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	16(%rbp), %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	-5192(%rbp), %rdx
	leaq	528(%rbp), %rax
	movq	%rdx, %rsi
	movl	$64, %edx
	movq	%rax, %rdi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -5168(%rbp)
	movzbl	-5168(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-5167(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -5184(%rbp)
	movzbl	-5184(%rbp), %eax
	movzbl	%al, %edx
	movzbl	-5183(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -20(%rbp)
	leaq	-2080(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	testl	%eax, %eax
	je	.L196
	leaq	-1056(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	testl	%eax, %eax
	jne	.L197
.L196:
	movl	$1, %eax
	jmp	.L198
.L197:
	movl	$0, %eax
.L198:
	testb	%al, %al
	je	.L195
	jmp	.L199
.L195:
	cmpl	$63, -20(%rbp)
	jle	.L200
.L199:
	nop
	movq	-5192(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	_Z4ogcd2OPS_, .-_Z4ogcd2OPS_
	.section	.rodata
.LC42:
	.string	"l="
	.text
	.globl	_Z5bibun3vec
	.type	_Z5bibun3vec, @function
_Z5bibun3vec:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$137256, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136744(%rbp)
	leaq	-135200(%rbp), %rax
	movl	$131072, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-136744(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	leaq	-136736(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-136224(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$128, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, -28(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L203
.L204:
	movl	-20(%rbp), %eax
	cltq
	movl	16(%rbp,%rax,4), %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135184, %rax
	movb	%dl, 1(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135184, %rax
	movb	$0, (%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135182, %rax
	movb	$1, 1(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135182, %rax
	movb	$1, (%rax)
	leaq	-4128(%rbp), %r8
	movl	-20(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135184, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4128(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	addl	$1, -20(%rbp)
.L203:
	cmpl	$63, -20(%rbp)
	jle	.L204
	movl	$0, -20(%rbp)
	jmp	.L205
.L209:
	movl	$1, -136224(%rbp)
	leaq	-137264(%rbp), %r8
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-136224(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3v2o3vec
	addq	$1024, %rsp
	leaq	-136736(%rbp), %rax
	leaq	-137264(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	$0, -24(%rbp)
	jmp	.L206
.L208:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	.L207
	leaq	-137264(%rbp), %r8
	movl	-24(%rbp), %eax
	cltq
	salq	$9, %rax
	leaq	-16(%rbp), %rbx
	addq	%rbx, %rax
	subq	$135184, %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-136736(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omul2OPS_
	addq	$1024, %rsp
	leaq	-136736(%rbp), %rax
	leaq	-137264(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
.L207:
	addl	$1, -24(%rbp)
.L206:
	cmpl	$63, -24(%rbp)
	jle	.L208
	leaq	-3104(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-136736(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movq	-136744(%rbp), %rbx
	leaq	-137264(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-136736(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	-136744(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4oadd2OPS_
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-137264(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	leaq	-2080(%rbp), %r8
	movq	-136744(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	addl	$1, -20(%rbp)
.L205:
	cmpl	$63, -20(%rbp)
	jle	.L209
	movl	$.LC42, %edi
	movl	$0, %eax
	call	printf
	leaq	-1056(%rbp), %r8
	movq	-136744(%rbp), %rax
	subq	$512, %rsp
	movq	%rsp, %rdx
	movq	%rax, %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	nop
	movq	-136744(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	_Z5bibun3vec, .-_Z5bibun3vec
	.globl	_Z4chen2OP
	.type	_Z4chen2OP, @function
_Z4chen2OP:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1320, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1328(%rbp)
	movq	-1328(%rbp), %rax
	movl	$1024, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	leaq	-1320(%rbp), %rdx
	movl	$0, %eax
	movl	$32, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-1064(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1064(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	movl	%eax, -28(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L212
.L216:
	movb	$0, -21(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L213
.L214:
	movl	-12(%rbp), %eax
	cltq
	movzbl	17(%rbp,%rax,2), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %ebx
	movl	-20(%rbp), %eax
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	cltq
	movzbl	16(%rbp,%rax,2), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4mltnii
	movl	%ebx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %eax
	xorb	%al, -21(%rbp)
	addl	$1, -12(%rbp)
.L213:
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cmpl	-12(%rbp), %eax
	jg	.L214
	cmpb	$0, -21(%rbp)
	jne	.L215
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	-20(%rbp), %edx
	movzbl	%dl, %ecx
	movq	-1328(%rbp), %rdx
	cltq
	movl	%ecx, (%rdx,%rax,4)
.L215:
	addl	$1, -20(%rbp)
.L212:
	cmpl	$255, -20(%rbp)
	jle	.L216
	nop
	movq	-1328(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	_Z4chen2OP, .-_Z4chen2OP
	.section	.rodata
.LC43:
	.string	"in decode"
.LC44:
	.string	"x=%d "
.LC45:
	.string	"@@@@@@@@@"
.LC46:
	.string	"%d "
	.text
	.globl	_Z6decode2OPS_
	.type	_Z6decode2OPS_, @function
_Z6decode2OPS_:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8264, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -6728(%rbp)
	leaq	-6720(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-6208(%rbp), %rdx
	movl	$0, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	-6728(%rbp), %rax
	movl	$512, %ecx
	movl	$0, %esi
	movq	%rsi, (%rax)
	leaq	8(%rax), %rdx
	movl	%ecx, %edi
	addq	%rdi, %rdx
	movq	%rsi, -16(%rdx)
	leaq	8(%rax), %rdx
	andq	$-8, %rdx
	subq	%rdx, %rax
	addl	%eax, %ecx
	andl	$-8, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	movq	%rdx, %rdi
	movq	%rsi, %rax
	rep stosq
	leaq	-5184(%rbp), %rdx
	movl	$0, %eax
	movl	$128, %ecx
	movq	%rdx, %rdi
	rep stosq
	movl	$.LC43, %edi
	call	puts
	leaq	-7248(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z2vx2OPS_
	addq	$1024, %rsp
	leaq	-6720(%rbp), %rax
	leaq	-7248(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-4128(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6720(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-4128(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-8272(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6720(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4chen2OP
	addq	$512, %rsp
	leaq	-5184(%rbp), %rax
	leaq	-8272(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	$0, -20(%rbp)
	jmp	.L219
.L220:
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -20(%rbp)
.L219:
	cmpl	$63, -20(%rbp)
	jle	.L220
	movl	$10, %edi
	call	putchar
	leaq	-8272(%rbp), %r8
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5184(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z5bibun3vec
	addq	$1024, %rsp
	leaq	-5696(%rbp), %rax
	leaq	-8272(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-3104(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5696(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-3104(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	$.LC45, %edi
	call	puts
	leaq	-8272(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	528(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	leaq	16(%rbp), %rsi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4ogcd2OPS_
	addq	$1024, %rsp
	leaq	-6208(%rbp), %rax
	leaq	-8272(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6720(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z2LT2OP
	addq	$512, %rsp
	movw	%ax, -4144(%rbp)
	movzbl	-4143(%rbp), %eax
	movb	%al, -4159(%rbp)
	movb	$0, -4160(%rbp)
	leaq	-8272(%rbp), %r8
	movzwl	-4160(%rbp), %r9d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5696(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r9d, %esi
	movq	%r8, %rdi
	call	_Z6oterml2OP5oterm
	addq	$512, %rsp
	leaq	-5696(%rbp), %rax
	leaq	-8272(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-2080(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5696(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-2080(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	leaq	-1056(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6208(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1056(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5184(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -20(%rbp)
	jmp	.L221
.L222:
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movzbl	%al, %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5696(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5trace2OPh
	addq	$512, %rsp
	movzbl	%al, %eax
	movl	%eax, %edi
	call	_Z4oinvh
	movzbl	%al, %ebx
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movzbl	%al, %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6208(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5trace2OPh
	addq	$512, %rsp
	movzbl	%al, %eax
	cltq
	movl	fg(,%rax,4), %eax
	movl	%ebx, %esi
	movl	%eax, %edi
	call	_Z3mltii
	cltq
	movl	gf(,%rax,4), %eax
	movl	%eax, %ecx
	movq	-6728(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, 1(%rax,%rdx,2)
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movl	%eax, %ecx
	movq	-6728(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx,2)
	addl	$1, -20(%rbp)
.L221:
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5184(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z3deg3vec
	addq	$1024, %rsp
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	setg	%al
	testb	%al, %al
	jne	.L222
	movl	$0, -20(%rbp)
	jmp	.L223
.L224:
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movzbl	%al, %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-6208(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5trace2OPh
	addq	$512, %rsp
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -20(%rbp)
.L223:
	cmpl	$63, -20(%rbp)
	jle	.L224
	movl	$10, %edi
	call	putchar
	movl	$0, -20(%rbp)
	jmp	.L225
.L226:
	movl	-20(%rbp), %eax
	cltq
	movl	-5184(%rbp,%rax,4), %eax
	movzbl	%al, %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-5696(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5trace2OPh
	addq	$512, %rsp
	movzbl	%al, %eax
	movl	%eax, %edi
	call	_Z4oinvh
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -20(%rbp)
.L225:
	cmpl	$63, -20(%rbp)
	jle	.L226
	movl	$10, %edi
	call	putchar
	nop
	movq	-6728(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	_Z6decode2OPS_, .-_Z6decode2OPS_
	.globl	_Z6setpolPhi
	.type	_Z6setpolPhi, @function
_Z6setpolPhi:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2088, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1048(%rbp)
	movq	%rsi, -1056(%rbp)
	movl	%edx, -1060(%rbp)
	movl	$256, %edx
	movl	$0, %esi
	movl	$c, %edi
	call	memset
	movl	-1060(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1056(%rbp), %rax
	movq	%rax, %rsi
	movl	$c, %edi
	call	memcpy
	leaq	-2096(%rbp), %rax
	movl	-1060(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_Z6Setveci
	leaq	-1040(%rbp), %rax
	leaq	-2096(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movq	-1048(%rbp), %rbx
	leaq	-2096(%rbp), %r8
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1040(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3v2o3vec
	addq	$1024, %rsp
	movq	%rbx, %rdx
	leaq	-2096(%rbp), %rax
	movl	$512, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	nop
	movq	-1048(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	_Z6setpolPhi, .-_Z6setpolPhi
	.section	.rodata
.LC47:
	.string	"a="
	.text
	.globl	_Z3detPh
	.type	_Z3detPh, @function
_Z3detPh:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$38608, %rsp
	movq	%rdi, -37064(%rbp)
	leaq	-37056(%rbp), %rdx
	movl	$0, %eax
	movl	$16, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movb	%al, (%rdx)
	addq	$1, %rdx
	movw	$0, -1568(%rbp)
	leaq	-34352(%rbp), %rax
	movl	$32768, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movw	$0, -1584(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L231
.L232:
	movl	-4(%rbp), %eax
	cltq
	movzbl	-37056(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L231:
	cmpl	$128, -4(%rbp)
	jle	.L232
	movl	$10, %edi
	call	putchar
	movl	$0, -4(%rbp)
	jmp	.L233
.L240:
	movq	-37064(%rbp), %rdx
	leaq	-37056(%rbp), %rax
	movl	$16, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movq	%rsi, %rdx
	movq	%rdi, %rax
	movzbl	(%rdx), %ecx
	movb	%cl, (%rax)
	leaq	1(%rax), %rax
	leaq	1(%rdx), %rdx
	leaq	-37584(%rbp), %rax
	movq	-37064(%rbp), %rcx
	movl	$129, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z6setpolPhi
	leaq	-35888(%rbp), %rax
	leaq	-37584(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	-4(%rbp), %eax
	movzbl	%al, %r8d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-35888(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movl	%r8d, %edi
	call	_Z5trace2OPh
	addq	$512, %rsp
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	movl	$.LC47, %edi
	movl	$0, %eax
	call	printf
	movl	-12(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	_Z4oinvh
	movzbl	%al, %eax
	cltq
	movl	gf(,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$0, -8(%rbp)
	jmp	.L234
.L235:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-37056(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -8(%rbp)
.L234:
	cmpl	$128, -8(%rbp)
	jle	.L235
	movl	$10, %edi
	call	putchar
	movzbl	-36928(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	xorl	%edx, %eax
	movb	%al, -36928(%rbp)
	leaq	-37584(%rbp), %rax
	leaq	-37056(%rbp), %rcx
	movl	$129, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z6setpolPhi
	leaq	-36912(%rbp), %rax
	leaq	-37584(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-1552(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-36912(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	subq	$1024, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-1552(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	call	_Z8printpol3vec
	addq	$1024, %rsp
	movl	$0, -8(%rbp)
	jmp	.L236
.L237:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-37056(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -8(%rbp)
.L236:
	cmpl	$128, -8(%rbp)
	jle	.L237
	movl	$10, %edi
	call	putchar
	movl	-4(%rbp), %eax
	movb	%al, -36399(%rbp)
	movb	$0, -36400(%rbp)
	movb	$1, -36397(%rbp)
	movb	$1, -36398(%rbp)
	movl	$256, %edx
	movl	$0, %esi
	movl	$ss, %edi
	call	memset
	leaq	-528(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-36400(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-36912(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z4omod2OPS_
	addq	$1024, %rsp
	movl	-12(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	_Z4oinvh
	movzbl	%al, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movl	gf(,%rax,4), %eax
	movb	%al, -1583(%rbp)
	movb	$0, -1584(%rbp)
	leaq	-37584(%rbp), %r8
	movzwl	-1584(%rbp), %r9d
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdx
	movl	$ss, %esi
	movl	$64, %eax
	movq	%rdx, %rdi
	movq	%rax, %rcx
	rep movsq
	movl	%r9d, %esi
	movq	%r8, %rdi
	call	_Z6oterml2OP5oterm
	addq	$512, %rsp
	leaq	-35888(%rbp), %rax
	leaq	-37584(%rbp), %rdx
	movl	$64, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	leaq	-38608(%rbp), %r8
	subq	$512, %rsp
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	-35888(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	movq	%r8, %rdi
	call	_Z3o2v2OP
	addq	$512, %rsp
	leaq	-35376(%rbp), %rax
	leaq	-38608(%rbp), %rdx
	movl	$128, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movl	$0, -8(%rbp)
	jmp	.L238
.L239:
	movl	$127, %eax
	subl	-8(%rbp), %eax
	cltq
	movl	-35376(%rbp,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	movl	$127, %eax
	subl	-8(%rbp), %eax
	cltq
	movl	-35376(%rbp,%rax,4), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$8, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$34352, %rax
	movb	%cl, (%rax)
	addl	$1, -8(%rbp)
.L238:
	cmpl	$127, -8(%rbp)
	jle	.L239
	movl	$10, %edi
	call	putchar
	addl	$1, -4(%rbp)
.L233:
	cmpl	$255, -4(%rbp)
	jle	.L240
	movl	$0, -4(%rbp)
	jmp	.L241
.L244:
	movl	$0, -8(%rbp)
	jmp	.L242
.L243:
	movl	-8(%rbp), %eax
	cltq
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$8, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$34352, %rax
	movzbl	(%rax), %eax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$8, %rcx
	addq	%rcx, %rdx
	addq	$mat, %rdx
	movb	%al, (%rdx)
	addl	$1, -8(%rbp)
.L242:
	cmpl	$255, -8(%rbp)
	jle	.L243
	movl	$10, %edi
	call	putchar
	addl	$1, -4(%rbp)
.L241:
	cmpl	$127, -4(%rbp)
	jle	.L244
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	_Z3detPh, .-_Z3detPh
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
