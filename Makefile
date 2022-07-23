
CC = arm-none-eabi-gcc
CFLAGS ?= \
    -mcpu=cortex-m4 \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -mlittle-endian \
    -mthumb \
    -Os \
    -ggdb3 \
    -std=c11 \
    -ffunction-sections \
    -fdata-sections \
    -Werror \
    -Wall \
    -Wextra \
    -Wundef \-lc_nano \
    -nostdlib \
    --specs=rdimon.specs \
    -lrdimon_nano \
    -lg_nano \
    -lnosys \
    -Wl,-e,main \
    -Wl,-Map,app.map \

# AR=$(shell $(CC) --print-prog-name=ar)

app.elf: app.c
	$(CC) -Wl,--gc-sections -o $@ app.c $(CFLAGS)
