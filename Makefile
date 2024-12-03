TARGET=energytrace
SRC = $(TARGET).c
CC := gcc

# Add the path to the MSP430 headers
INCLUDES := -I/usr/local/include -IMSP430_DLL_Developer_Package_Rev_3_15_1_1/Inc

# Add the path to the MSP430 library
LIBS := -L/usr/lib -LMSP430_DLL_Developer_Package_Rev_3_15_1_1 -lmsp430_64


# CFLAGS = -IMSP430_DLL_Developer_Package_Rev_3_15_1_1/Inc -lmsp430_64 -LMSP430_DLL_Developer_Package_Rev_3_15_1_1
CFLAGS := -Wall -Wextra -pedantic -std=c11 -O2

OBJS := $(SRC:.c=.o)

all: $(TARGET)

# $(TARGET): $(SRC) 
# 	gcc $(CFLAGS) -o $@ $<

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(TARGET)

run: all
	./energytrace 5

install: all
	install -t /usr/local/bin $(TARGET)


