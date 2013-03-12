icons = $(wildcard pdf/*.pdf)

all: prepare pngs thumbs svgs

pngs: $(patsubst pdf/%.pdf,png/%.png,$(icons))
svgs: $(patsubst pdf/%.pdf,svg/%.svg,$(icons))
thumbs: $(patsubst pdf/%.pdf,thumbs/%_thumb.png,$(icons))

prepare:
	mkdir -p thumbs png svg
	rm -f .DS_Store */.DS_Store

thumbs/%_thumb.png: pdf/%.pdf
	convert -resize 64x64 $< $@

png/%.png: pdf/%.pdf
	convert -density 96 -quality 85 -resize 512x512 $< $@

svg/%.svg: pdf/%.pdf
	pdf2svg $< $@

clean:
	rm -fr png thumbs
