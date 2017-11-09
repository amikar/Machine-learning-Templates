dataset = read.csv('50_Startups.csv')

dataset$State = factor(dataset$State,
                         levels = c('California', 'Florida', 'New York'),
                         labels = c(1, 2, 3))



set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8 )
training_Set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)

#training_Set[, 1:2] = scale(training_Set[, 1:2])
#test_set[, 1:2] = scale(test_set[, 1:2])

regressor = lm(formula = Profit ~ ., 
               data = training_Set)

y_pred = predict(regressor,newdata = test_set)


