
CC = arm-none-eabi-gcc
CFLAGS ?= \
    -mcpu=cortex-m4 \
    -mfpu=fpv4-sp-d16 \
    -mfloat-abi=hard \
    -lrdimon_nano \
    --specs=rdimon.specs \
    -specs=nano.specs \
    -specs=nosys.specs \


AR=$(shell $(CC) --print-prog-name=ar)

CFLAGS += -ggdb

app: app.c foo.a
	$(CC) $(CFLAGS) -o $@ app.c -L. -l:foo.a -Wl,-Map=app.map

foo.a: foo.o
	$(AR) rcs $@ $^
