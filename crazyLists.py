# Lists are crazy!
'''
This is to demonstrate how mutable datatypes behave: 
By appending newData with the lists from tableData, 
tableData and newData are now pointing to the same lists.
If these lists are appended, this will be true for both
newData and tableData.
'''

tableData = [['apples', 'oranges', 'cherries', 'banana'],
             ['Alice', 'Bob', 'Carol', 'David'],
             ['dogs', 'cats', 'moose', 'goose']]

newData = []
for i in range(len(tableData)):
	newData.append(tableData[i])
	newData[i].append('extra')

print(tableData)