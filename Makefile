obj-m += hello.o
    CURRENT_PATH:=$(shell pwd)
    LINUX_KERNEL_PATH:=/lib/modules/$(shell uname -r)/build
all:$(TAGET)
	cp *.ko /lib/modules/`uname -r`/kernel/
	depmod -a
TARGET:
	$(MAKE) -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) modules
clean:
	rm -rf .*.cmd *.o *.mod.c *.ko .tmp_versions
