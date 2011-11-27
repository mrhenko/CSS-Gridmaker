#!/usr/bin/perl
use constant VERSION => '0.2';

# Check if we got any command line arguments
if (@ARGV) {
	# Count the number of command line arguments
	$args = @ARGV;
	
	# Default values
	$g_width = 960;
	$c_count = 12;
	$ancestor = 'body';
	$gutter = 20;
	
	# Loop through the command line arguments
	$i = 0;
	# Check what the argument is
	while ($i <= $args) {
	
		# If it is a flag, set the next argument's value in a variable	
		if ($ARGV[$i] eq "--grid") {
			# The -g flag is to define the width of the entire grid
			$g_width = $ARGV[$i + 1];
			
		} elsif ($ARGV[$i] eq "-c") {
			# The -c flag is to set how many columns should be created
			$c_count = $ARGV[$i + 1];
			
		} elsif ($ARGV[$i] eq "-a") {
			# The -a flag is to define the ancestoral element
			$ancestor = $ARGV[$i + 1];
			
		} elsif ($ARGV[$i] eq "--maxwidth") {
			# Use max-width instead of width, and width: 100%
			$maxwidth = "true";
			
		} elsif ($ARGV[$i] eq "--gutter") {
			# Gutter
			$gutter = $ARGV[$i + 1];
			
		} elsif (($ARGV[$i] eq "-h") || ($ARGV[$i] eq "--help")) {
			# Display the help
			helpMe();
			exit;
			
		} elsif (($ARGV[$i] eq "-v") || ($ARGV[$i] eq "--version")) {
			# Print version info
			printVersion();
			exit;
		
		} else {
			# Some sort of nothing
		}
		
		$i++;
	}
	
	# print the CSS for the ancestor
	print $ancestor . ' {
		';
		
		# If max-width should be used
		if ($maxwidth eq "true") {
			print 'width: 100%
		max-';
		}
		
		print 'width: ' . $g_width . 'px;
		padding: 0;
		margin: 0 auto;
		position: relative;
	}
	
	';
	
	# Loop through the number of columns that should be used and
	# print the CSS for it.
	$i = 1;
	while ($i <= $c_count) {
	print $ancestor . ' .cols-' . $i. ' {
		';
		
		# If max-width should be used
		if ($maxwidth eq "true") {
			print 'width: 100%
		max-';
		}
		
		# Calculate and print the (max-)width of the columns.
		print 'width: ' . (($g_width / $c_count - $gutter) * $i + (($i - 1) * $gutter)) . 'px;
		margin: 0 20px;
	}
	
	';
		$i++;
	}
	print "\n";
	
} else {
	# No arguments
	helpMe();
}

# The help dialog.
# Displayed if the script is being run without command line
# arguments or if the argument i -h or --help
sub helpMe() {
	print 'Gridmaker creates a CSS grid template.
	
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
	
	-h OR --help
		Displays this help text.
	
	-v OR --version
		Displays the version of Gridmaker';
	
	print "\n\n";
}

# Print version info
sub printVersion() {
	print "Gridmaker version " . (VERSION) . "\n\n";
}