icons = $(wildcard pdf/*.pdf)

all: pngs thumbs

pngs: $(patsubst pdf/%.pdf,png/%.png,$(icons))
thumbs: $(patsubst pdf/%.pdf,thumbs/%_thumb.png,$(icons))

thumbs/%_thumb.png: pdf/%.pdf
	convert -resize 64x64 $< $@

png/%.png: pdf/%.pdf
	convert -density 96 -quality 85 -resize 512x512 $< $@

clean:
	rm -fr png thumbs
