A2O_TARGET = debug
HTML = build/$(A2O_TARGET)/BundleSample.html

.PHONY: all xcodebuild clean clean_html run runff

all: xcodebuild

$(HTML): xcodebuild

xcodebuild:
	bash -c "set -o pipefail && a2obrew xcodebuild -t ${A2O_TARGET} 2>&1 | tee err && { grep unresolved err | sort > unresolved || true; }"

clean:
	a2obrew xcodebuild -c -t ${A2O_TARGET}

clean_html:
	rm -f $(HTML)

run:
	emrun --browser chrome_canary $(HTML)

runff:
	emrun --kill_start --browser firefox_nightly --profile=emscripten_user $(HTML)
