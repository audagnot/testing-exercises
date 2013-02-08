all:
	rst2pdf exercises.rst
	cp exercises.pdf testing-exercises-$$(git describe --always --tags --dirty).pdf
