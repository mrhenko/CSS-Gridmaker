CSS Gridmaker
=========

HELP
----
CSS Gridmaker creates a CSS grid template.
	
	--grid NUMERIC VALUE
		How wide should the entire grid be?
		(DEFAULT 960)
	
	-c NUMERIC VALUE
		How many columns should the grid consist of?
		(DEFAULT 12)
	
	-a CSS SELECTOR
		What parent element should the grid have? Use CSS
		selectors (classes, ids or HTML elements).
		(DEFAULT body)
	
	--gutter NUMERIC VALUE
		The width of the gutter (DEFAULT 20)
	
	--maxwidth
		The width values will be max-width instead of width.
		(DEFAULT false)
	
	-d OR --default
		Create a grid with only default values
	
	-h OR --help
		Displays this help text.
	
	-v OR --version
		Displays the version of CSS Gridmaker

VERSION HISTORY
---------------

### 0.2.5.2
Added the CSS prefix to the name to clarify.

### 0.2.5.1
* Fixed a really bad bug with the gutters. Turns out it's a good idea to test your CSS in the 
browser. (Who knew...)

### 0.2.5
* Enabled a default mode
* Fixed a bug that meant that the gutter was always 20px, no matter what --gutter value was used.

### 0.2
* First apperance of this file.
* The gutter can now be set by the user
* Minor cleanups.

### 0.1.5
* Slightly cleaned up code with more whitespace and some help info.

### 0.1
* First git controlled version
