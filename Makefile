all:
	rst2pdf exercises.rst testing-exercises-$$(git describe --always --tags --dirty).pdf
