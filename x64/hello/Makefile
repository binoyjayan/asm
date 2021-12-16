all: hello1 hello2 hello3 hello4

hello1: hello1.o
	gcc -o hello1 hello1.o -no-pie
hello1.o: hello1.asm
	nasm -f elf64 -g -F dwarf hello1.asm -l hello1.lst

hello2: hello2.o
	gcc -o hello2 hello2.o -no-pie
hello2.o: hello2.asm
	nasm -f elf64 -g -F dwarf hello2.asm -l hello2.lst

hello3: hello3.o
	gcc -o hello3 hello3.o -no-pie
hello3.o: hello3.asm
	nasm -f elf64 -g -F dwarf hello3.asm -l hello3.lst

hello4: hello4.o
	gcc -o hello4 hello4.o -no-pie
hello4.o: hello4.asm
	nasm -f elf64 -g -F dwarf hello4.asm -l hello4.lst

clean:
	rm -f hello1 hello1.o hello1.lst
	rm -f hello2 hello2.o hello2.lst
	rm -f hello3 hello3.o hello3.lst
	rm -f hello4 hello4.o hello4.lst
