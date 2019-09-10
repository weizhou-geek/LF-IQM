function yhat = four_parm_logistic(bayta,X)

bayta1 = bayta(1); 
bayta2 = bayta(2); 
bayta3 = bayta(3); 
bayta4 = bayta(4);


logisticPart = (bayta1-bayta2)./(1 + exp(- (X - bayta3)/abs(bayta4)));

yhat = bayta2 + logisticPart;

return;