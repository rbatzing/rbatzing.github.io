     riddle.rb - A Ruby program to solve Einstein's Riddle

(c) Copyright 2021, Robert Batzinger. All rights reserved.

Please send inquiries to mailto:robert_b@payap.ac.th

<p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Einstein1921_by_F_Schmutzer_3.jpg/256px-Einstein1921_by_F_Schmutzer_3.jpg" align="right></p>

= Background

According to popular press, Albert Einstein made up a really
difficult riddle when he was just a young child. Later as an university
professor, he would give this riddle to his students and found that
over 98% of them failed to find the solution. While the background to
this story may not be true, this popular logic puzzle is very
difficult and has earned its name as "Einstein's Riddle." Several
versions of this riddle exist because some of the cigarette brands
have gone out of business.

# The Clues

In this riddle, each of the five houses is painted a different color,
and their inhabitants are of different national extractions, own
different pets, drink different beverages and smoke different
brands of American cigarettes. The objective is to determine the
details associated with each house.

* There are five houses.
* The Englishman lives in the red house.
* The Spaniard owns the dog.
* Coffee is drunk in the green house.
* The Ukrainian drinks tea.
* The green house is immediately to the right of the ivory house.
* The Old Gold smoker owns snails.
* Kools are smoked in the yellow house.
* Milk is drunk in the middle house.
* The Norwegian lives in the first house.
* The man who smokes Chesterfields lives in the house next to the
  man with the fox.
* Kools are smoked in the house next to the house where the horse
  is kept.
* The Lucky Strike smoker drinks orange juice.
* The Japanese smokes Parliaments.
* The Norwegian lives next to the blue house.


# The Riddle

Using the clues given in the last section, determine the answer to these questions.

* Who drinks water? 
* Who owns the zebra?


# The Search Algorithm

Finding the solution requires both a means for organizing the data
(data structure) and a method of finding the correct solution (algorithm).
In this riddle there are 600 ways to arrange the details.
The method used in this class is a recursive search for the
placement of details that satisfies all clues. The nature of this
approach is a brute force depth-first search that applies each
rule to a possible position and attempting to add the next rule
to the solution board. A failed attempt will terminate future the search
for a solution and the next possible position will used to initiate
the search down a new branch of combination. This branch pruning reduced
greatly increased the efficient of the search by reducing the number of
the attempt tested from 600 to 40.

The assumption is that a successful search exists that satisfies
the clues exists. All combinations that fail will terminate the
search branch through subsets that use those combination.
This approach used here is similar to that described in the
TED-Ed Riddles YouTube Video by Dan Van der Vieren entitled
"Can you solve 'Einstein’s Riddle'? - https://youtu.be/1rDVz_Fb6HQ 

# The Solution

The program was using this command line:

     ruby riddle.rb

The resulting output is shown below:

     House 1: yellow,fox,kool,water,norway,
     House 2: blue,horse,chester,tea,ukraine,
     House 3: red,snail,oldgold,milk,english,
     House 4: green,zebra,parlment,coffee,japan,
     House 5: ivory,dog,lucky,orange,spain,