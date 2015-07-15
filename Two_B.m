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
%   <ANY ADDITIONAL DOCUMENTATION>
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
%without parenthesis
keepChecking = true;
startingInd = 1;
totalNum = 0;
strAns = '';
allPossibleNumOrder = perms(cards);
% disp(allPossible(1,:));
% b = strread(num2str(allPossible(1:1,1:3)),'%s');
totalNumCombos = size(allPossibleNumOrder,1);

vec = [1,2,3,4];
allPossibleOperOrder = [];
for i = 5:-1:1
    tmp = repmat(vec,[power(4,(5-i)),power(4,(i-1))]);
    allPossibleOperOrder(:,i) = tmp(:);
end
% disp(allPossibleOperOrder);
totalOperCombos = size(allPossibleOperOrder,1);

for rowNum = 1:totalNumCombos
    numOrder = allPossibleNumOrder(rowNum,:);
    nums = strread(num2str(numOrder),'%s'); %CHANGE TO STRREAD
    for rowOper = 1:totalOperCombos
        operOrder = allPossibleOperOrder(rowOper,:);
        %operations = strread(num2str(operOrder),'%s');
        operations = {};
        for x = 1:5
            replace = operOrder(x);
            switch replace
                case 1
                    operations{x} = ' + ';
                case 2
                    operations{x} = ' - ';
                case 3
                    operations{x} = ' * ';
                case 4
                    operations{x} = ' / ';
            end
        end
        
        % Do the actual math & check
            % if works, leave this loop by break
        
        if (~keepChecking)
            rowOper = totalOperCombos + 1;
        end
        str = [strjoin(nums,operations) ' = ' num2str(primeNum)];
        disp(str);
    end
    
    %go through all perms of operations
        %combine them for string
        %str = strjoin(nums,operations);
        %do the math   
    %check the answer
        
    
    
%     iterateInd = startingInd;
%     nums = ;
%     operations = {};
%     
%     disp('-------------------------------');
%     for x = 0:10
%         %tempNum = 0;
%         %only 1-6 (number of cards)
% %         if (iterateInd > 6)
% %             iterateInd = 1;
% %         end
%         %numbers
%         if (mod(x,2) == 0)
%             
%             %disp('HERE');
% %             nums{1,(x./2 + 1)} = cards(iterateInd);
% %             disp(nums);
%             
%             %disp(cards)
%            % tempNum = cards(iterateInd);
%             iterateInd = iterateInd + 1;
%         
%         %operations    
%         else
%             %C = {'one','two','three'};
%             %str = strjoin(cards,{' + ',' = '})
%             %display(str)
%         end
%         %ans = strjoin(numbers, operations);
%         
%         
% %         myDict = cell(stringThing);
% % %         myDict{1,2} = '3';
% % %         myDict{1,3} = '9';
% %         C = {'one','two','three'};
% %         str = strjoin(myDict,{' + ',' = '});
% %         disp(myDict);
% %         disp(str);
%     end
  
    
    %check if combination is correct
%     if (totalNum == primeNum)
%         break;
%     else  
%         totalNum = 0;
%         strAns = '';  
%         startingInd = startingInd + 1;
%         if (startingInd > 6)
%             startingInd = 1;
%         end
%     end
end

%disp(['The answer is:'strAns);

end

