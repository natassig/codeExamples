# Fantasy Game Inventory

def displayInventory(stuff):
    print('Inventory:')
    counter = 0
    for key in sorted(stuff):
        print(stuff[key], key)
        counter += stuff[key]
    print('Total number of items:', counter)

def addToInventory(inventory, addedItems):
    for i in addedItems:
        inventory.setdefault(i, 0)
        inventory[i] += 1

gameStuff = {'rope': 1, 'torch': 6, 'gold coin': 42, 'dagger': 1, 'arrow': 12}
displayInventory(gameStuff)

dragonLoot = ['gold coin', 'dagger', 'gold coin', 'gold coin', 'ruby']
addToInventory(gameStuff, dragonLoot)
displayInventory(gameStuff)