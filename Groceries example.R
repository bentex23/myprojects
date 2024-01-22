require(arules)# load the package
data(package = "arules") #examine all the data in the package
data ("Groceries")# load the Groceries data
summary(Groceries) # shows the structure of groceries
inspect(Groceries[1:10])#shows transactions 1 to 10
itemFrequencyPlot(Groceries, supp =.15)# check all items with a support 15% or higher       
itemFrequencyPlot(Groceries, topN=10)        
ModelResults<-apriori(Groceries)#creating model based on default =10% & confidence = 80%
ModelResults <-apriori(Groceries, parameter= list(support = 0.03, confidence = .25))
inspect(ModelResults) # shows all the results
