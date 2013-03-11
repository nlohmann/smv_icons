thumbnails:
	rm *-64.png
	for PNG in `ls *.png`; do convert $$PNG -resize 64x64 $$PNG-64.png; done
