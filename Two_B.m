function solution = Two_B(cardNums, targetNum)
% Finds a solution for a single hand of the game of Primes.
%   SOLUTION = N_A(CARDNUMS, TARGETNUM) returns a string description
%   of a solution to the given Primes problem or an empty string if no
%   solution is found, where the problem is defined by a vector of six
%   card numbers CARDNUMS and a single target number TARGETNUM.
%
%   For example, N_A([4 9 13 1 4 2], 157) might return the string
%   '9 * 13 + 4 * 2 * (4+1)'.
%
%   This uses brute force, taking into account order of operations.
%
%   by Kimberly Wolford, D'Miria Collins, Prav Tadikonda
%   Last updated 07/15/2015


% ask user for a number
prompt = 'Choose a number from 100 to 200 that''s relatively prime\n';
primeNum = input(prompt);
    while (~isprime(primeNum) || primeNum < 100 || primeNum > 200)
        if (primeNum > 200)
            display('Whoops! The number is too large!')
        else if (primeNum < 100)
            display('Whoops! The number is too small!')
        else if (~isprime(primeNum))
            display('Whoops! You picked a composite number!')
            end
            end
        end
        prompt2 = 'Try again, please.\n';
        primeNum = input(prompt2);
    end

% randomly choose 6 different numbers and makes sure it works
dealAgain = true;
while(dealAgain)
    randNums = randperm(52,6);
    cards = [];
    for x = 1:numel(randNums)
        card = mod(randNums(x),13);
        if card == 0
            card = 13;
        end
        cards(x) = card;
    end

    display('These are the cards you are dealt:');
    disp(cards);

    %check if it's possible
    total = 1;
    for x = 1:numel(cards)
        total = total * cards(x);
    end
    if total < primeNum
        disp('This will not be possible. We will deal again.');
        dealAgain = true;
    else
        dealAgain = false;
    end
end

% Use brute force to check
tic;
%get all the numbers (6! ways)
allPossibleNumOrder = perms(cards);
totalNumCombos = size(allPossibleNumOrder,1);

%get all the operations (4^5 ways)
vec = [1,2,3,4];
allPossibleOperOrder = [];
for i = 5:-1:1
    tmp = repmat(vec,[power(4,(5-i)),power(4,(i-1))]);
    allPossibleOperOrder(:,i) = tmp(:);
end
totalOperCombos = size(allPossibleOperOrder,1);

%check every combination
for rowNum = 1:totalNumCombos
    numOrder = allPossibleNumOrder(rowNum,:);
    %get string of all numbers
    nums = strread(num2str(numOrder),'%s');
    
    for rowOper = 1:totalOperCombos
        operOrder = allPossibleOperOrder(rowOper,:);
        %operations = strread(num2str(operOrder),'%s');
        
        %get string of all operations
        operations = {};
        keepTrack = [];
        for x = 1:5
            replace = operOrder(x);
            switch replace
                case 1
                    operations{x} = ' + ';
                    keepTrack(x) = 0;
                case 2
                    operations{x} = ' - ';
                    keepTrack(x) = 0;
                case 3
                    operations{x} = ' * ';
                    keepTrack(x) = x;
                case 4
                    operations{x} = ' / ';
                    keepTrack(x) = x;
            end
        end
        
        
        %first do the multiplication and division
        newNums = [];
        for m = 1:numel(numOrder)
            newNums(m) = numOrder(m);
        end
        
        newOper = [];
        for x = 1:numel(keepTrack)
            if keepTrack(x) > 0
                if (operOrder(x) == 3)
                    n = newNums(x) * newNums(x+1);
                else if (operOrder(x) == 4)
                    n = newNums(x) / newNums(x+1);
                    end
                end
                newNums(x+1) = n;
                newNums(x) = 0;
                newOper(x) = 0;
            else
                newOper(x) = operOrder(x);
            end
        end
        newNums(newNums == 0) = [];
        newOper(newOper == 0) = [];
        
        %second, do the addition and subtraction
        totalSum = 0;
        if numel(newOper) > 0
            for x = 1:numel(newNums)
                if x == 1
                    totalSum = newNums(x);
                else
                    op = newOper(x - 1);
                    if op == 1
                        totalSum = totalSum + newNums(x);
                    else
                        totalSum = totalSum - newNums(x);
                    end
                end
            end
        else
            totalSum = newNums(1);
        end
        
        %check the total and print it out
        if totalSum == primeNum
            disp('Here is an answer:');
            totalStr = [strjoin(nums,operations) ' = ' num2str(primeNum)];
            disp(totalStr);
            break;
        end
    end
    if totalSum == primeNum
        break;
    end
end
if totalSum ~= primeNum   
    disp('Sorry! No answers could be found...');
end
toc;
end

