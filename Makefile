pngs:
	rm -f *.png
	for PDF in `ls *.pdf`; do convert $$PDF -density 96 -quality 85 -resize 512x512 $$PDF.png; mv $$PDF.png $${PDF%.pdf}.png; done
	for PDF in `ls *.png`; do convert $$PDF -resize 64x64 $$PDF-64.png; mv $$PDF-64.png $${PDF%.png}_thumb.png; done
