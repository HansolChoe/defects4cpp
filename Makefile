.PHONY: all install format lint test test-coverage test-taxonomy

default: test

install:
	@pip install --upgrade pip
	@pip install -r requirements.txt

dev:
	@pip install --upgrade pip
	@pip install -r requirements.txt
	@pip install -r requirements_dev.txt

format:
	black .
	isort .

lint:
	flake8 . --config setup.cfg

test:
ifeq ($(OS), Windows_NT)
	@set PYTHONPATH=defects4cpp/
	python -m pytest tests/ --ignore tests/taxonomy
else
	PYTHONPATH=defects4cpp/ python -m pytest tests/ --ignore tests/taxonomy
endif


coverage:
ifeq ($(OS), Windows_NT)
	@set PYTHONPATH=defects4cpp/
	python -m pytest tests/ \
		--cov-report=xml:reports/coverage/coverage.xml \
		--cov-report=html:reports/coverage \
		--cov=defects4cpp \
		--ignore tests/taxonomy
else
	PYTHONPATH=defects4cpp/ python -m pytest tests/ \
		--cov-report=xml:reports/coverage/coverage.xml \
		--cov-report=html:reports/coverage \
		--cov=defects4cpp \
		--ignore tests/taxonomy
endif

test-taxonomy:
ifeq ($(OS), Windows_NT)
	@set PYTHONPATH=defects4cpp/
	python -m pytest tests/taxonomy
else
	@PYTHONPATH=defects4cpp/ python -m pytest tests/taxonomy
endif

all: install test
