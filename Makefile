.PHONY: run gdb
qemu = qemu-system-x86_64 -kernel bzImage -initrd $(file)
file = out.cpio
run: $(file)
	$(qemu) -nographic -append console=ttyS0
gdb: $(file)
	$(qemu) -s -S -append nokaslr
$(file): $(shell find out)
	cd $< && find | cpio -oH newc > ../$@
