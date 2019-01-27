# Filter By Category v1.4 (https://github.com/underr-ua/ocmod3-filter-by-category)
# Copyright 2018 Burkatskyi Andrii aka underr
# Licensed under MIT - https://raw.githubusercontent.com/underr-ua/ocmod3-filter-by-category/master/LICENSE.txt

zip=$(shell basename `pwd`).ocmod.zip

license=LICENSE.txt
readme=README.md
datetime=201801010000.00
src=src
bin=bin


all: clean makedir timestamp makezip

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
