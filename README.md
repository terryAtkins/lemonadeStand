# lemonadeStand

Recommended Steps and Hints:

Setting and connecting the storyboard elements, which includes:
Labels
Buttons
IBOutlets
IBActions
Any other UI elements you want to add…
Then, make it so that we are able to purchase, and un-purchase, lemons for $2 and ice cubes at $1. When the user presses the corresponding "+" and "-" buttons.
Add mix/un-mix buttons for your lemonade that day that will be added into your lemonade for the day, they should only be mixed when the day officially starts. Very similar to step #2.
Remember to subtract the added lemons and ice from your inventory amount when adding them to your mix.
When we hit “Start Day” Button, it should create a lemonade ratio that will affect sales, (lemons over ice cubes), i.e. more acidic, equal parts, or less acidic lemonade.
For example, if you add 1 lemon and 3 ice cubes the ratio will be .333.
Still under the start day button, create a random number of customers (between 1 and 10) that will visit your stand for the day.
Then, create a random taste preference(between 0 and 1) for each customer (hint, this should be a constant and you may want to use a type of loop to generate each preference).
For example, you might generate 5 customers for the day with preferences as such: 0.5, 0.7, 0.3, 0.4, 0.1
Then, you should compare your preferences to a range of values, as well as the current lemonade ratio to a separate range of values. Then see if they match. We are not comparing the ratios directly to each other! Ranges are shown in the steps below. So, what do we mean!? Here's a breakdown:
You should compare your randomly-generated customer's preferences to 3 different ranges from 0 to 1.
The three ranges are:
0 to 0.4 – favors acidic lemonade
0.4 to 0.6 – favors equal parts lemonade
0.6 to 1 – favors diluted lemonade
At the same time, you should be comparing your lemonade ratio to a different set of ranges.
Greater than 1 (Acidic Lemonade)
Equal to 1 (Equal Portioned Lemonade)
Less than 1 (Diluted Lemonade)
Here's where it will come together. I will spell out the first set of logic and hopefully you'll be able to do the rest.
For example, If customerPreference is Less than 0.4 AND lemonadeRatio is Greater than 1... Get paid a $1 and print out "Paid!"
This should read, If the customer likes acidic lemonade (between 0 – 0.4) and the lemonade is acidic (greater than 1) Get paid a dollar!
Follow this example for the next 2 comparison sets...
At the end, you'll want an else statement where they didn't want to buy your lemonade, so you will not be paid.
**You'll want to run through this logic for each customer you randomly generate.**
While you are comparing the preferences to these ranges, we want to see which customers are buying and which are not. So, write a println that will show
each customer’s generated preference value, and
whether or not they matched to the lemonade.
If they matched, print “Paid!”
If not, print “No match, No Revenue.”
Bonus Challenge:

Now, not everyone will every stop for lemonade. Especially if it’s raining. So, Display a random Weather status using image assets that will affect how many customers show up (Colder weather = less customers, Warmer weather = more customers).
For example, cold weather means the random amountOfCustomers – 3
Fair weather means no change,
and then maybe warmer weather = amountOfCustomers + 4.
Feel free to play around with these numbers.
