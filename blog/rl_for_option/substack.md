
## Introduction to Option Pricing

American options are a type of financial derivative that give the holder the right, but not the obligation, to buy or sell an underlying asset at a specified price on or before a certain date. Two main types of American options are:

- **Call Option**: Gives the holder the right to buy the underlying asset at the strike price.
- **Put Option**: Gives the holder the right to sell the underlying asset at the strike price.

An example of how American option work would be useful. 

### Example: American Put Option

Imagine you have a put option on a stock with the following details:

- **Option Type**: American Put Option
- **Strike Price (K)**: $100
- **Underlying Asset Price (x)**: $95 initially - Day 0
- **Expiration Date**: 3 days from now
- **Premium (Initial Price of Option)**: $5

The above info is all the information you have about the option. However, you do not know how the price of underlying asset (can be simple Apple stock) will change over the next 3 days. 

To make example workable, let's assume the price of the underlying asset will change as follows:

- **Price of Underlying Asset over the next 3 days**:

   | Day | Asset Price (x) |
   |-----|-----------------|
   |  0  |      $95        |
   |  1  |      $92        |
   |  2  |      $90        |
   |  3  |      $97        |
 

The holder can choose to exercise the option at any time before or on the expiration date.

For example, lets assume the holder of the option exercises the option on day 2. This means the holder can sell the underlying asset for \$100 (Strike Price, look up the put option definition) and buy back the stock at \$92 (price of the underlying asset on day 2):

The profit of the holder is then:

$$
Profit = (K - x_t) - Premium
$$

$$
Profit = (100 - 92) - 5 = 3
$$


The holder can choose to exercise the option at any time before or on the expiration date. However, the question is **when is the optimal time to exercise the option?** (day 1, or day 2, or day 3?), and of course, you can not know the price of the underlying asset in the future, at day 0.


I think one visualization that can help to understand the option price is the following:


As you can see from the chart below, on the right side of the chart (Put Option) the "Buyer" has profit if the price of the underlying asset is below the strike price (10 \$). However, if the price of underlying asset is above the strike price, the "Buyer" will lose money (equal to the premium paid (1\$))

 <div align="center">
 
 > **💡**  
 > The <b>Option Price</b> (or premium) is the maximum amount a holder is willing to pay to obtain the right to sell the underlying asset at the strike price, at any time before or on the expiration date.
 
 </div>

As you can see from the chart below, on the right side of the chart (Put Option) the "Buyer" has profit if the price of the underlying asset is below the strike price (10 \$). However, if the price of underlying asset is above the strike price, the "Buyer" will lose money (equal to the premium paid (1\$))

 <div align="center">
 
 > **💡**  
 > The <b>Option Price</b> (or premium) is the maximum amount a holder is willing to pay to obtain the right to sell the underlying asset at the strike price, at any time before or on the expiration date.
 
 </div>


## American Option Pricing As Sequential Decision Making

American Option can be viewed as a sequential decision making problem. The holder of the option can choose to exercise the option at any time before the expiration date. The holder can also choose to hold the option until the expiration date.

Let's say you have American Option that expires in 10 days. At each from day 1 to day 10, you need to decide whether to sell (exercise) the option or hold (continue to hold). I tried to visualize this in the following figure:

Now, we can think about what is the "profit" we get for each alternative we have:

- Alternative I: If we exercise the (put)option, the profit is known. It is $max(0, K-x_t)$, where $x_t$ is the stock price at time $t$ and $K$ is the strike price.
- Alternative II: If we hold the option, the profit is unknown. Therefore, we need to find an estimate of what will be the **Expected Value** of holding the option at the time.
If we know the Expected Value of holding the option at the time, we can just simply compare the two alternatives and choose the one higher. Simply:

- If $C(x_t, t) > max(0, K-x_t  )$, we should exercise the option.

- If $C(x_t, t) < max(0, K-x_t)$, we should hold the option.

Here, the $C(x_t, t)$ is the function that gives the idea about the Expected Value of holding the option at the time. It is a function of the stock price and the time.

In summary, the option price of the American Option can be divided into three steps:

1. Find the function $C(x_t, t)$
2. Compare $C(x_t, t)$ with $max(0, K-x_t)$ to decide when to stop and exercise the option.
3. Repeat the process for different paths (to account for underlying uncertainty) and find the average profit.

In the below schematic, I tried to visualize the process: