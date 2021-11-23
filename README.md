# Go group status checker by Emil Hultcrantz

A recursive function for finding if a group of stones are dead or alive in the game of Go.

The algorithm takes a position (node) and looks at an adjacent node. This happens recursively until either a node doesn't exist or has another type then the original node. It then checks another direction for the last valid node. And so on until all nodes of the same type that are connected have been checked or a node of the type empty have been found.

The function is called with: alive(Row, Column, BoardFileName) .

It returns true for a group which is alive and false fot a dead group.

### Function parameters:

* Row =  A row on the board
* Column = A coulumn on the board
* BoardFileName = Path to .txt file containing a 2d array representation of the board

### Node types:

* e = empty
* b = black
* w = white

### [Go Rules](https://en.wikipedia.org/wiki/Rules_of_Go)
