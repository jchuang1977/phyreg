
#CROSS_COMPILER=/opt/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-
#CC=$(CROSS_COMPILER)gcc
#STRIP=$(CROSS_COMPILER)strip

#LDFLAGS=-L../libmgos -lmgos -lpthread -L../frozen -lfrozen -L../libutils -lherzutils
#INC = -I ../libmgos/ -I ../libutils/ -I ../frozen

#LDFLAGS=-lpthread -L../libutils -lutils -L../fossa -lfossa
#INC = -I ../libutils/ -I ../fossa

INC = -I./libutils/
INC += -I./glueos/

PROG = wssc
#SOURCES = $(PROG).c $(PROG)_flash.c $(PROG)_test.c $(PROG)_gpio.c $(PROG)_pcie.c $(PROG)_usb.c $(PROG)_uart.c
SOURCES = $(PROG).c $(PROG)_util.c $(PROG)_flash.c $(PROG)_test.c $(PROG)_gpio.c $(PROG)_pcie.c $(PROG)_uart.c $(PROG)_csi.c
SOURCES += libutils/log.c libutils/sysinfo.c libutils/str.c
SOURCES += glueos/gosCmdLib.c

#CFLAGS += -W -Wall  $(CFLAGS_EXTRA)
#CFLAGS += -DNS_ENABLE_SSL
#CFLAGS += -DDEBUG_LOG
CFLAGS += -DDEBUG_STD

CFLAGS += -DNS_ENABLE_DEBUG
#ifeq ($(SSL), openssl)
#	CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lcrypto
#else ifeq ($(SSL), krypton)
#	CFLAGS += -DNS_ENABLE_SSL ../../../krypton/krypton.c
#endif


all: $(PROG)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

#$(PROG): $(SOURCES:.c=.o)
#	$(CC) -o $@ $^ $(LDFLAGS)
$(PROG): $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $@ -I$(INC) -L$(LDFLAGS) ${LIBFOSSSA} ${LIBWNCUTILS}
	#$(STRIP) $(PROG)

clean:
	rm -rf  *.o  $(PROG)
