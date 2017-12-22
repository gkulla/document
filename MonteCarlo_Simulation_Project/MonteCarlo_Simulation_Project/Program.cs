using System;

namespace MonteCarlo_Simulation_Project
{
    class Program
    {
        static void Main(string[] args)
        {
            const int lower_boundry = 95;
            const int upper_boundry = 110;
            double capital_amount = 1000;
            double capital_amount2 = 1000;
            double stock_price = 100;
            double prob_stock_price = 0.05;
            double stock_value_amount = 0;
            const double interest_rate = 0.005; //0.5% interest rate
            bool buy_stocks = true;
            bool sell_stocks = true;
            bool bank_interest_lock = true;
            bool precedence = true;
            double sum = 0, sum2 = 0;
            bool bank_flag = false, stock_flag = false;
            double nr_of_stocks = 0;
            const int months = 12;
            const int years = 5;
            int count_months = 1;
            int count1 = 0, count2 = 0;
            int monte_carlo_value = 0;
            int loop_number = 16577;


            Random rand = new Random();
while(monte_carlo_value < loop_number)
{

            while(count_months <= (months*years))
            {
                int index = rand.Next(4);
                switch(index)
                {
                    case 0://stock probability price is unchaged
                        if(bank_interest_lock)//starts true until stock price < 95 and stock price > 110
                        {
                            capital_amount += capital_amount * interest_rate;
                        }
                    break;
                    case 1://stock probability is unchaged
                        if (bank_interest_lock)
                        {
                            capital_amount += capital_amount * interest_rate;
                        }
                    break;
                    case 2://stock probability is decrising
                         stock_price -= stock_price * prob_stock_price;
                    //-------------------------------------------------------------------------
                         if (bank_flag && (stock_price < lower_boundry)) //keep track of the precedence
                        {                                              //whenever the stock price is < 110
                            buy_stocks = true;                         //then the bank interest must be false
                            precedence = true;                         //
                            bank_flag = false;                         //
                            stock_flag = true;                         //
                        }
                        else if (stock_flag && (stock_price > upper_boundry))
                        {
                            sell_stocks = true;
                            precedence = false;
                            stock_flag = false;
                            bank_flag = true;
                        }
                      //-----------------------------------------------------------------------  
                         if (bank_interest_lock)
                         {
                             capital_amount += capital_amount * interest_rate;
                         }

                         if ((stock_price < lower_boundry) && buy_stocks && precedence)// check the case
                        {                                                              // when stock price is lower
                            nr_of_stocks = capital_amount / stock_price;               // then lower boundry
                            stock_value_amount = stock_price * nr_of_stocks;           
                            buy_stocks = false;
                            precedence = false;
                            bank_interest_lock = false;
                            stock_flag = true; 
                            bank_flag = false; 
                            capital_amount = 0;
                            Console.WriteLine("Buy Stocks: {0}, Stock Value: {1}", nr_of_stocks, stock_value_amount);
                        }
                    break;
                    case 3://stock price is increasing
                        stock_price += stock_price * prob_stock_price;
                        //-------------------------------------------------------------------------
                        if (bank_flag && (stock_price < lower_boundry))
                        {
                            buy_stocks = true;
                            precedence = true;
                            bank_flag = false;
                            stock_flag = true;
                        }
                        else if (stock_flag && (stock_price > upper_boundry))
                        {
                            sell_stocks = true;
                            precedence = false;
                            stock_flag = false;
                            bank_flag = true;
                        }
                        //-----------------------------------------------------------------------  
                        if (bank_interest_lock)
                        {
                            capital_amount += capital_amount * interest_rate;
                        }

                         if ((stock_price > upper_boundry) && sell_stocks && !precedence) //check the upper boundry
                        {                                                                 //when the price is higher than
                                                                                          // upper boundry limit
                                capital_amount = (stock_price * nr_of_stocks);
                                Console.WriteLine("Stock capital invest to bank: {0}", capital_amount);
                                bank_flag = true;
                            capital_amount += capital_amount * interest_rate; 
                            sell_stocks = false;
                            bank_interest_lock = true;
                        }
                    break;
                }
                Console.WriteLine("Bank cap: {0}, Stock price: {1} ,index: {2}, mounth: {3}", capital_amount, stock_price, index, count_months);
            count_months++;
           
                
            }
            if (capital_amount > 0)
                sum += capital_amount;
            else
                sum += stock_price * nr_of_stocks;
            

            int j = 1;

            while (j <= (months * years))
            {
                capital_amount2 += capital_amount2 * interest_rate;
                j++;
            }
            sum2 += capital_amount2;

            if ((capital_amount > capital_amount2) || (stock_price * nr_of_stocks) > capital_amount2)
                count1++; //count the success of the 1st strategy
            else
                count2++; //count the sucess of the bank startegy
            monte_carlo_value++;
            count_months = 1;
            j = 1;
            stock_price = 100;
            capital_amount = 1000;
            capital_amount2 = 1000;
        }
Console.WriteLine("Count1:{0},Count2:{1}",count1, count2);
double first, second;
first = (((double)count1/loop_number)* 100) ;
second = (((double)count2 /loop_number)* 100);
Console.WriteLine("Percetage 1st strategy: {0}, Bank Strategy: {1}", first, second);
Console.WriteLine("Capital Avg Strat1: {0}, Capital Avg Bank: {1}", (double)sum / loop_number, (double)sum2 / loop_number);

            Console.ReadKey();
            
        }

    }
}
