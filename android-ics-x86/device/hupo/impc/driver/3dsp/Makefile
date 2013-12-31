##########################################
#
# 3DSP USB card Linux driver Makefile
#
##########################################

ifneq ($(KERNELRELEASE),)

obj-y := bus/ new_bluetooth/ private/new_bluetooth_priv/ wlan/ private/wlan_priv/ 

else
	KDIR ?= /lib/modules/$(shell uname -r)/build/
	KDIR := ~/ics-x86/out/target/product/impc/obj/kernel
all:
	$(MAKE) -C $(KDIR) M=`pwd`

endif

ifeq ($(shell getconf LONG_BIT),64)
TdspUsbBtLib=3dspusbbtlib64.a
TdspUsbWlanLib=3dspusbwlanlib64.a
else
TdspUsbBtLib=3dspusbbtlib.a
TdspUsbWlanLib=3dspusbwlanlib.a
endif

clean:
	@mkdir -p private/tmp
	@cp -f -p private/new_bluetooth_priv/3dspusbbtlib.a	private/tmp/3dspusbbtlib.a.bak
	@cp -f -p private/new_bluetooth_priv/3dspusbbtlib64.a	private/tmp/3dspusbbtlib64.a.bak
	@cp -f -p private/wlan_priv/3dspusbwlanlib.a		private/tmp/3dspusbwlanlib.a.bak
	@cp -f -p private/wlan_priv/3dspusbwlanlib64.a		private/tmp/3dspusbwlanlib64.a.bak
	$(MAKE) -C $(KDIR) M=`pwd` clean
	@mv -f private/tmp/3dspusbbtlib.a.bak		private/new_bluetooth_priv/3dspusbbtlib.a
	@mv -f private/tmp/3dspusbbtlib64.a.bak		private/new_bluetooth_priv/3dspusbbtlib64.a
	@mv -f private/tmp/3dspusbwlanlib.a.bak		private/wlan_priv/3dspusbwlanlib.a
	@mv -f private/tmp/3dspusbwlanlib64.a.bak	private/wlan_priv/3dspusbwlanlib64.a
	@rmdir private/tmp

install:
	@mkdir -p /usr/local/3DSP/usb
	-cp -f 3dspcode.bin /usr/local/3DSP/usb/
	cp -f bus/3dspusbbus.ko /usr/local/3DSP/usb/
	cp -f new_bluetooth/3dspusbbt.ko /usr/local/3DSP/usb/
	cp -f wlan/3dspusbwlan.ko /usr/local/3DSP/usb/
	cp -f private/new_bluetooth_priv/3dspusbbtpriv.ko /usr/local/3DSP/usb/
	cp -f private/wlan_priv/3dspusbwlanpriv.ko /usr/local/3DSP/usb/
	cp -f tdspusbcardinit /etc/init.d/
	chmod 755 /etc/init.d/tdspusbcardinit

	@echo "Inserting modules..."
	-insmod /usr/local/3DSP/usb/3dspusbbus.ko
	-insmod /usr/local/3DSP/usb/3dspusbwlanpriv.ko
	-insmod /usr/local/3DSP/usb/3dspusbwlan.ko
	-insmod /usr/local/3DSP/usb/3dspusbbtpriv.ko
	-insmod /usr/local/3DSP/usb/3dspusbbt.ko
	sleep 0.5
	@echo "Creating devices file for 3DSP driver..."
	-mknod  /dev/tdspusbbus c `awk '$$2=="3dspusbbus" {print $$1}' /proc/devices` 0

uninstall:
	-rm -f /dev/tdspusbbus
	-rmmod 3dspusbbt
	-rmmod 3dspusbbtpriv
	-rmmod 3dspusbwlan
	-rmmod 3dspusbwlanpriv
	-rmmod 3dspusbbus
	-rm -f /etc/init.d/tdspusbcardinit
	-rm -f /usr/local/3DSP/usb/3dspusb*
	-rm -f /usr/local/3DSP/usb/3dspcode.bin
	-rmdir /usr/local/3DSP/usb/ && rmdir /usr/local/3DSP/ || echo "Remove it by yourself."
nod:
	mknod  /dev/tdspusbbus c `awk '$$2=="3dspusbbus" {print $$1}' /proc/devices` 0
