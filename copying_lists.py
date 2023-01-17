### Copying Lists - Shows the difference between the copy() and deepcopy() functions and builds them from scratch

import copy

# Understanding the copy() function
grid = [['.', '.', '.', '.', '.', '.']] # Grid is a list that has only one value, which is a list of 6 '.'.
grod = copy.copy(grid) # The copy() function makes a copy of the list that grid refers to, but not of the thes list inside of it.
grod[0][0] = 'X'
print(grid) # Altering on of the list items in the inside list will also change the original grid.

# Understanding the deepcopy() function
grid = [['.', '.', '.', '.', '.', '.']]
grud = copy.deepcopy(grid) # deepcopy() makes a copy of the list in the list.
grud[0][0] = 'X'
print(grid) # The original grid is not changed.

# Building the copy() function from scratch
grid = [['.', '.', '.', '.', '.', '.']]
gred = []
for i in grid:
    gred.append(i)
gred[0][0] = 'X'
print(grid)

# Building the deepcopy() function from scratch
grid = [['.', '.', '.', '.', '.', '.']]
gryd = []
for i in range(len(grid)):
    gryd.append([])
    for j in range(len(grid[i])):
        gryd[i].append(grid[i][j])
gryd[0][0] = 'X'
print(grid)