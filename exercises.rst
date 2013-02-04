Exercises: Testing with Python
==============================

:author: Valentin Haenel using previous material by Pietro Berkes

Exercise 1 – Writing a test suite
---------------------------------

:Level: [basic]
:Goals: Write a test suite using the ``unittest`` module.

Write a test suite, ``test_center.py``, that tests the function center in the
module string (http://docs.python.org/library/string.html#string.center). At
each step, run the tests and make sure they pass.

In the suite write three test cases:

#. The first case checks the functionality of the function, with the argument
   ``fillchar`` set to its default value.  Control that the function works as
   advertised for:

   #. Odd and even widths
   #. A width smaller than the length of the string
   #. An empty input string
   #. a string containing spaces to either extremity

Test that the length of the returned string is correct and that it looks like
you expect it to. *Hint:* when the number of spaces to be added is odd, there are
two possible ways to center a string.  The docstring does not specify which one
is correct, so you should test that the returned string is one or the other.

#. The second case checks the functionality of ``string.center``, with
   ``fillchar`` set to specific values.  Test using a letter, a numerical
   value, and the default value

#. Finally, test that ``string.center`` raises a ``TypeError`` when
   ``fillchar`` is set to an empty string or to a string longer than one
   character.

Exercise 2
----------

:Level: [basic]
:Goal: learn to use the ``nosetests`` runner

#. Experiment with the ``nosetests`` runner by using it to run the test cases
   for the previous exercise.

#. Try using the ``[-v, --verbose]`` option to print which tests are run.

#. Use the syntax ``<FILE>:<CLASS>.<METHOD>`` or similar to run individual test
   cases.

#. Insert some debugging ``print`` statements and run the tests with nosetests.
   Observe that, if the test passes, the debugging lines are not printed.

Exercise 3 – Deceivingly simple function
----------------------------------------

:Level: [intermediate]
:Goal: General practice of debugging and unit testing using agile development techniques.

Enter the directory deceivingly_simple. The file ``maxima.py`` contains a
function, ``find_maxima``, that finds local maxima in a list and returns their
indices.

#. Run the example code in the docstring of the function using doctest, and
   make sure they pass.

#. Using IPython, test the function with these input arguments and others of
   your own invention until you are satisfied that it does the right thing for
   typical cases (remember that the function returns the indices of the maxima):

   .. code-block:: python

       x = [0, 1, 2, 1, 2, 1, 0]
       x = [i**2 for i in range(-3, 4)]

#. Now try with the following inputs:

   .. code-block:: python

       x = [4, 2, 1, 3, 1, 2]
       x = [4, 2, 1, 3, 1, 5]
       x = [4, 2, 1, 3, 1]

   For each bug you find, solve it using the agile programming strategy:

   #. Isolate the bug (use either print statements or a debugger)
   #. Write a new test case that reproduces the bug. Try to make the test case
      as simple as possible; here, this means using the simplest input data that
      still triggers the bug

   #. Correct the code
   #. Make sure that all the tests pass

#. Install the coverage module, using e.g. ``pip install coverage```. Run a
   coverage analysis on the tests:

   There should be at least one statement that is
   not covered. Write a test that covers it and debug the code.

#. You may think that the code is now clean and robust… Look at the output of
   the function for the input list ``x = [1, 2, 2, 1]`` Does the output correspond to
   your intuition? Think about a *reasonable default behavior* in this situation,
   and meditate about how such a simple function can hide so many complications.

#. Implement the *reasonable behavior* you conceived, and document it in
   the docstring, adding a new doctest.  Make sure that your function handles
   these inputs correctly (include them in the tests):

   .. code-block:: python

       x = [1, 2, 2, 3, 1]
       x = [1, 3, 2, 2, 1]
       x = [3, 2, 2, 3]
