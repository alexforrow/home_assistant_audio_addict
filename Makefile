.PHONY: default macros scripts dashboard

default: macros scripts dashboard

macros:
	ruby generate_macro.rb | tee output/music_expand.jinja

scripts:
	ruby generate_scripts.rb | tee output/scripts.yml

dashboard:
	ruby generate_dashboard.rb | tee output/dashboard.yml
