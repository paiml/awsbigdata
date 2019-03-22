setup:
	python3 -m venv ~/.awsbigdata
	source ~/.awsbigdata/bin/activate

makesite:
	jupyter-book create ../TEMPLATE/awsbigdata

buildsite:
	jupyter-book build ../TEMPLATE/awsbigdata
	cp -R ../TEMPLATE/awsbigdata/* ../
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
