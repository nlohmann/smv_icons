icons = $(wildcard *.pdf)

all: pngs thumbs

pngs: $(patsubst %.pdf,%.png,$(icons))
thumbs: $(patsubst %.pdf,%_thumb.png,$(icons))

%_thumb.png: %.pdf
	convert -resize 64x64 $< $@

%.png: %.pdf
	convert -density 96 -quality 85 -resize 512x512 $< $@

clean:
	rm -f *.png
