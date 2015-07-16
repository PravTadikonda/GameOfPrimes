function solution = Two_A(cardNums, targetNum)
    % N_A  Finds a solution for a single hand of the game of Primes.
    %   SOLUTION = N_A(CARDNUMS, TARGETNUM) returns a string description
    %   of a solution to the given Primes problem or an empty string if no
    %   solution is found, where the problem is defined by a vector of six
    %   card numbers CARDNUMS and a single target number TARGETNUM.
    %
    %   For example, N_A([4 9 13 1 4 2], 157) might return the string
    %   '9 * 13 + 4 * 2 * (4+1)'.
    %
    %   This agent solves the problem by using a randomized trial and error
    %   style method. 
    %   The cards that are randomly selected in the SetUp() funtion are    
    %   randomized in each of the 3000 trials. Each operator is selected 
    %   using a random number generator. Parentheses are placed around each
    %   set of numbers so that the order of operations are from left to
    %   right. If a solution is found, it is displayed in the return.
    %   Otherwise, 'I could not find a solution.' is displayed.
    %
    %   by Kimberly Wolford, D'Miria Collins, Prav Tadikonda
    %   Last updated 7/14/15
    %
tic;
solution = '';
x=0;
%Gets the parameters from Set_Up()
[cardNums, targetNum] = Set_Up();
deck = ['Your cards are: ', num2str(cardNums)];
disp(deck);
%Goes through 3000 possible solutions until a solution is found or it
%reaches the end
while x<3000
    y=1;
    %The array of cards is shuffled randomly
    cardShuffle = cardNums(randperm(length(cardNums)));
    %check is the total based on the operations done so far
    %check is compared against targetNum to see if solution has been found 
    check = cardShuffle(y);
    %test holds the temporary string of operations used to get check
    test = ['(((((', num2str(check)];
    %Perform random operations on the array until all cards are used
    while y<6
        nextNum = cardShuffle(y+1);
        %chooses a random number 1-4 (1 = +, 2 = -, 3 = *, 4 = /)
        op = randi([1 4],1,1);
        %addition: concatonates '+', nextNum, and ')' to the test string
        if op==1
            check = check + nextNum;
            addNums = [' + ', num2str(nextNum), ') '];
            test = [test, addNums];
        %subtraction: concatonates '-', nextNum, and ')' to the test string
        elseif op==2
            check = check - nextNum;
            subNums = [' - ', num2str(nextNum), ') '];
            test = [test, subNums];
        %multiplication: concatonates '*', nextNum, ')' to the test string
        elseif op==3
            check = check * nextNum;
            multiNums = [' * ', num2str(nextNum), ') '];
            test = [test, multiNums];
        %division: concatonates '/', nextNum, and ')' to the test string
        elseif op==4
            check = check / nextNum;
            divideNums = [' / ', num2str(nextNum), ') '];
            test = [test, divideNums];
        end
        y = y+1;
    end
    %there is a solution found within the 3000 trials
    if check == targetNum
        disp('I have found a solution.');
        %set solution string to the solution found
        solution = test;
        break;
    else
        x=x+1;
    end
end
%there was no solution found in the 3000 trials
if check ~= targetNum
    disp('I cannot find a solution.');
end
toc;
end  % end of function

function [cardsDealt, primeNum] = Set_Up()
%This function takes in user input of a prime number between 100 and 200.
%It also selects six random cards from a standard 52 card deck. 
%

%user input prompt
prompt = 'Enter a prime number between 100 and 200.   ';
n = input(prompt);
%If the number is not prime or not between 100 and 200, the user is
%prompted to try again until they enter a prime number between 100 and 200.
while ~isprime(n) || n<100 || n>200;
    prompt = 'Try again.   ';
    n = input(prompt);
end
arr = [];
while length(arr)<6;
    %random number num between 1 and 13 (cards)
    num = randi([1 13],1,1);
    if length(arr)<= 0;
        arr =[arr num];
    else
        %make sure no num used more than 4 times
        i=1;
        count=0;
        while i<=length(arr);
            if arr(i)==num;
                count = count+1;
            end
            i = i + 1;
        end
        %if the number is not already in the array 4 times
        if count<4;
            arr = [arr num];
        end
    end
end
cardsDealt = arr;
primeNum=n;
end
