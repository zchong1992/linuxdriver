obj-m += hello.o
    CURRENT_PATH:=$(shell pwd)
    LINUX_KERNEL_PATH:=/lib/modules/$(shell uname -r)/build
TARGET=hello.ko
all:$(TAGET)
	$(MAKE) -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) modules
	cp *.ko /lib/modules/`uname -r`/kernel/
	depmod -a
TARGET:
clean:
	rm -rf .*.cmd *.o *.mod.c *.ko .tmp_versions
