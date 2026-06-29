.PHONY: build clean proofer qa serve structure_check

build:
	bundle exec jekyll build --quiet

clean:
	rm -rf _site .jekyll-cache .sass-cache

proofer:
	bundle exec htmlproofer ./_site --root-dir ./_site --check-html --allow-missing-href --disable-external

structure_check:
	ruby tests/check_brain_bugs_structure.rb

qa: build structure_check proofer

serve:
	bundle exec jekyll serve