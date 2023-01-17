make.power.func<- function(n){  ## Creates a function object, where the passed argument n determines to which power the function object will raise its input
    function(x) {               ## The created function will take as input a number x that will be raised by n.
        x^n
    }
}
## Again, the output of make.power.func is not a numeric result, but a function:
make.power.func(2)
## If you want you can assign a name to this newly created function:
square <- make.power.func(2)
## Test to see if it works:
square(3)
## But you can also call your newly created function like this:
make.power.func(2)(3)


## Introducing closures and the <<- operator:
#### A closure is a function written by another function. A closure can access its own arguments, and variables defined in its parent, using the <<- operator.
new_counter <- function() { ## parent function
    i <- 0
    function() {            ## child function
        # here it could do something useful, then ...
        i <<- i + 1         ## assigns a value to a variable in the parent function
        i
    }
}
counter_one <- new_counter()
counter_two <- new_counter()
counter_one()
counter_two()
