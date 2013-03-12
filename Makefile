pngs: clean
	for PDF in `ls *.pdf`; do convert $$PDF -density 96 -quality 85 -resize 512x512 $$PDF.png; mv $$PDF.png $${PDF%.pdf}.png; done
	for PDF in `ls *.pdf`; do convert $$PDF -resize 64x64 $$PDF-64.png; mv $$PDF-64.png $${PDF%.pdf}_thumb.png; done

clean:
	rm -f *.png
