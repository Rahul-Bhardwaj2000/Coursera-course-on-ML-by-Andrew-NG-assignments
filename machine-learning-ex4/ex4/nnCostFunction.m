function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
X=[ones(size(X,1),1),X];       
% You need to return the following variables correctly 
J = 0;
a2=X*((Theta1)');
z2=sigmoid(X*Theta1');
z2=[ones(size(z2,1),1),z2];
a3=z2*(Theta2)';
z3=sigmoid(z2*Theta2');
new_y=zeros(m,num_labels);
for i=1:size(z3,1)
  new_y(i,y(i))=1;
end;
j1=sum((log(z3).*new_y)(:));
j2=sum((log(1-z3).*(1-new_y))(:));
%J=-(1/m)*(sum((log(z3).*new_y)(:))+sum((log(1-z3).*(1-new_y))(:)));
J=(-1/m)*(j1+j2);
%J=sum(-log(z3)*(new_y)-(log(1-z3))*((1-new_y)));

a_theta1=(Theta1(1:size(Theta1,1),2:size(Theta1,2)))(:);
a_theta2=(Theta2(1:size(Theta2,1),2:size(Theta2,2)))(:);

J=J+lambda*(sum(a_theta1.^2))/(2*m)+(sum(a_theta2.^2))/(2*m);




  
Theta1_grad=Theta1;
Theta2_grad=Theta2;

del3=z3-new_y;
del2=(((del3*Theta2).*(z2)).*(1-z2))(:,2:end);
%del1=((del2*Theta1).*(z1)).*(1-z1);

Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

for i=1:size(z3,1),
  Theta2_grad=Theta2_grad+(del3(i,:)')*z2(i,:);
end;
for i=1:size(del2,1)
  Theta1_grad=Theta1_grad+(del2(i,:)')*X(i,:);
end;

Theta1_grad=(Theta1_grad)/m+(lambda*Theta1)/m;
Theta2_grad=(Theta2_grad)/m+(lambda*Theta2)/m;
%Theta2_grad=del3*(del2)'+(lambda*Theta2)/(2*m);
%grad=[Theta1(:);Theta2(:)];
% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
