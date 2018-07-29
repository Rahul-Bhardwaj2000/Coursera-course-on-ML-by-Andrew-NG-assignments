function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
  J_history(iter)=computeCost(X,y,theta);
  %temp=(X*theta-y).*X(:,2);
  %theta(2)=theta(2)-(sum(temp)/m)*alpha;
  %temp1=((X*theta)-y);
  %theta(1)=theta(1)-(sum(temp1)/m)*alpha;
  update=((X*theta-y)'*X)';
  theta=theta-(update/m)*alpha;
end;


    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %







    % ============================================================

    % Save the cost J in every iteration    
    %J_history(iter) = computeCost(X, y, theta);

end


