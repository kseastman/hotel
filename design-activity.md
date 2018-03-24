> What classes does each implementation include? Are the lists the same?

CartEntry, ShoppingCart &  Order - yes, the lists are the same.

> Write down a sentence to describe each class.

* CartEntry stores information about individual items, like price and quantity.

* ShoppingCart holds a list of CartEntries.

* Order applies sales tax to the subtotal derived from ShoppingCart.

> How do the classes relate to each other? *It might be helpful to draw a diagram on a whiteboard or piece of paper*.

CartEntry is an element in ShoppingCart (though that logic is invisible) - and Order takes information from ShoppingCart and adds the sales tax.

> What data does each class store? How (if at all) does this differ between the two implementations?

* In the first implementation CartEntry exists to hold the instance variables for @unit_price and @quanitity, in the second implementation it has a method for price that returns the @unit_price multiplied by the @quantity.

* In the first implementation ShoppingCart holds the instance variable @entries which is assigned to an empty array, in the second implementation ShoppingCart has a method for price that returns the sum of elements in the @entries array.

* In implementation A, Order holds a constant for SALES_TAX, an instance of ShoppingCart and a method for total price that adds the unit_price * quantity for each entry in the ShoppingCart @entries array, but in the second implementation the logic is much simpler for the total price method.

> What methods does each class have? How (if at all) does this differ between the two implementations?

See previous answer.

> Consider the Order#total_price method. In each implementation:

>Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

In Implementation A, it is retained in Order in Implementation B it is delegated to "lower level" classes.

> Does total_price directly manipulate the instance variables of other classes?

It doesn't change the values of other variables, but it uses them to calculate a new value.

> If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

It would probably affect the price for CartEntry.  The change for Implementation B requires less complicated logic because it's not as far removed from the source of the change.

> Which implementation better adheres to the single responsibility principle?

Implementation B seems to adhere to this better.

> **Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?**

Implementation B is more loosely coupled, because it knows less information about other classes. In B, total_price only knows its own variable @cart has a price, in A, total_price knows that each entry has a unit_price and a quantity, if those values are changed, then it will no longer work. Whereas with A, if they were changed, as long as price remained as method that could be called there would be no difference for the program as a whole.

## Activity
> Based on the answers to the above questions, identify one place in your Hotel project where a class takes on multiple roles, or directly modifies the attributes of another class.

> Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.

My BookingManager class takes on multiple responsibilities when it should delegate them.  I need to change all of the places where I chain to an instance method so that those classes handle the logic themselves.
