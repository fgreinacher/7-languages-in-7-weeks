-module(shopping_list).
-export([sum/1]).

sum(ShoppingList) -> [{Item, Quantity*Price} || {Item, Quantity, Price} <- ShoppingList].
