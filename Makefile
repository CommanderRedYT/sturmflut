CC=gcc
CCFLAGS=-Ofast -Wall -march=native
RM=rm -f

MAGICK_VERSION=$(shell pkg-config --modversion ImageMagick | grep -E -o '^[0-9]+')
DATE=$(shell date)

all: clean sturmflut

sturmflut:
	$(CC) $(CCFLAGS) -DIMAGICK=$(MAGICK_VERSION) -DCOMPILE_TIME="\"$(DATE)\"" image.c network.c main.c progress.c -lpthread `pkg-config --cflags --libs MagickWand` -o sturmflut && sha256sum sturmflut

clean:
	$(RM) sturmflut
