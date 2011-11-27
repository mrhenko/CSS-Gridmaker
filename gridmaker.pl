#!/usr/bin/perl

# Count the number of command line arguments
$args = @ARGV;

# Loop through the command line arguments
$i = 0;

# Check what the argument is
while ($i <= $args) {

	# If it is a flag, set the next argument's value in a variable	
	if ($ARGV[$i] eq "-g") {
		# The -g flag is to define the width of the entire grid
		$g_width = $ARGV[$i + 1];
		print "Grid is " . $g_width . "px\n";
		
	} elsif ($ARGV[$i] eq "-c") {
		# The -c flag is to set how many columns should be created
		$c_count = $ARGV[$i + 1];
		print "Column count is ". $c_count . "\n";
		
	} elsif ($ARGV[$i] eq "-a") {
		# The -a flag is to define the ancestoral element
		$ancestor = $ARGV[$i + 1];
		print "Ancestor: " . $ancestor . "\n";
		
	} elsif ($ARGV[$i] eq "--maxwidth") {
		# Use max-width instead of width, and width: 100%
		$maxwidth = "true";
	
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
	print 'width: ' . (($g_width / $c_count - 20) * $i + (($i - 1) * 20)) . 'px;
	margin: 0 20px;
}

';
	$i++;
}