# Useful Functions for MATLAB

Collection of useful functions for MATLAB.


## Visualization
   - `circle`: Returns the coordinates for plotting a circle.
   - `interprgb`: Interpolate a new color between two colors (in RGB color space).
   - `interpshape:` Increases the number of points defining a shape by placing n uniformly spaced points along each line segment connecting existing points.
   - `shade_tint_rgb`: Shade and tint RGB colors.
   - `stanford_S`: Returns coordinates for drawing the Stanford S with (approximately) the specified number of points

## Rounding
   - `ceiln`: Round up (toward positive infinity) to n digits.
   - `floorn`: Round down (toward negative infinity) to n digits.

## Integration of Data
   - `cumulative_integral`: Cumulative integration of data (i.e. arrays) over the domain of the data.
   - `definite_integral`: Definite integration of data (i.e. arrays) over the domain of the data.

## Basic Data Manipulation
   - `delete_data_points`: Deletes data points based on a specified condition.
   - `reduce_data_points`: Reduces the number of data points in a data set to a specified number.
   - `scale_data`: Linearly scales data to start and end between specified points.
   - `space_data_equally`: Interpolates unequally spaced data to make it equally spaced in the independent variable.

## Waitbars
   - `[wb,prop] = initialize_waitbar(msg)`: Initializes a waitbar.
   - `[wb,prop] = prop = update_waitbar(k,N,wb,prop)`: Updates a waitbar.

## Miscellaneous
   - `interval_search`: Finds the interval containing a query point.
   - `load_numeric_data`: Loads numeric data from a `.mat` file.
   - `order_of_magnitude`: Determines the order(s) of magnitude of a (set of) number(s) for a specific base.
   - `rmse`: Calculates the root-mean-square error between a set of values and a set of estimates of those values.
   - `same_denominator`: Scales a set of fractions so they each have the same denominator.
   - `scientific_notation_string`: Returns a string of a number written using scientific notation.