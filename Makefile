.PHONY: all

default: scripts

scripts:
	ruby generate_scripts.rb | tee output/scripts.yml
