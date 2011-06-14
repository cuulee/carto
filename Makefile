#
# Run all tests
#

expresso = ./node_modules/.bin/expresso
docco = ./node_modules/.bin/docco
uglify = ./node_modules/.bin/uglify

lint:
	./node_modules/.bin/jshint lib/carto/*.js lib/carto/tree/*.js

ifndef only
test:
	$(expresso) -I lib test/*.test.js
else
test:
	$(expresso) -I lib test/${only}.test.js
endif

doc:
	$(docco) lib/carto/*.js lib/carto/tree/*.js

dist/carto.js:
	cat browser/*.js lib/carto/parser.js lib/carto/tree.js lib/carto/tree/*.js > dist/carto.js

dist: dist/carto.js

.PHONY: test
