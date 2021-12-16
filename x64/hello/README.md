
## Hello world

### Set intel disassembly in .gdbinit

```
set disassembly-flavor intel
```

### Gdb commands

Listing source and examining address

```
list 1
disassemble main
x/s &msg
x/c &msg
x/12c &msg
x/12d &msg
x/12x &msg
x/s 0x4010   ; address of msg
x/2x main
```

Breakpoints

```
break main
run
info breakpoints
info registers
info b
info r
next
step

disable breakpoint n
enable breakpoint n
delete breakpoint n
```

Printing

```
p   $rax
p/t $rax
p/x $rax

```

Numeric

```
x/dw &radius
x/xw &radius

x/fg &pi
x/fx &pi
```

