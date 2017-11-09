dataset = read.csv('Salary_Data.csv')



set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3 )
training_Set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)

#training_Set[, 1:2] = scale(training_Set[, 1:2])
#test_set[, 1:2] = scale(test_set[, 1:2])

regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_Set)

y_pred = predict(regressor,newdata = test_set)

ggplot() +
  geom_point(aes(x = training_Set$YearsExperience, y = training_Set$Salary),colour = 'red') +
  geom_line(aes(x = training_Set$YearsExperience,y =  predict(regressor,newdata = training_Set)),
            colour = 'blue')+
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')


