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
    %   <ANY ADDITIONAL DOCUMENTATION>
    %
    %   by Kimberly Wolford, D'Miria Collins, Prav Tadikonda
    %   Last updated <DATE>
    %
    tic;
solution = '';

x=0;
[cardNums, targetNum] = Set_Up();    %Gets the parameters from Set_Up()
deck = ['Your cards are: ', num2str(cardNums)];
disp(deck);
while x<3000
    y=1;
    cardShuffle = cardNums(randperm(length(cardNums)));
    check = cardShuffle(y);
    test = ['(((((', num2str(check)];
while y<6
    nextNum = cardShuffle(y+1);
    op = randi([1 4],1,1);
    if op==1
        check = check + nextNum;
        addNums = [' + ', num2str(nextNum), ') '];
        test = [test, addNums];
    elseif op==2
        check = check - nextNum;
        subNums = [' - ', num2str(nextNum), ') '];
        test = [test, subNums];
    elseif op==3
        check = check * nextNum;
        multiNums = [' * ', num2str(nextNum), ') '];
        test = [test, multiNums];
    elseif op==4
        check = check / nextNum;
        divideNums = [' / ', num2str(nextNum), ') '];
        test = [test, divideNums];
    end
    y = y+1;
end
if check == targetNum
    disp('I have found a solution.');
    %set solution string to the solution found
    solution = test;
    break;
else
    x=x+1;
end
end
if check ~= targetNum
    disp('I cannot find a solution.');
end

toc;
end  % end of function

function [cardsDealt, primeNum] = Set_Up()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

prompt = 'Enter a prime number between 100 and 200.   ';
n = input(prompt);
while ~isprime(n) || n<100 || n>200;
    prompt = 'Try again.   ';
    n = input(prompt);
end
arr = [];
while length(arr)<6;
    %random number num
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
        if count<4;
            arr = [arr num];
        end
    end
end
cardsDealt = arr;
primeNum=n;
end
