require(arules)# load the package
require (arulesViz)
library (datasets)

w1 = read.table("C:/Users/Phoenix/Desktop/Phd/ITS 530 Visual Data/WK3/Electric_Vehicle_Population_Data.csv")
trans =read.transactions("C:/Users/Phoenix/Desktop/Phd/ITS 530 Visual Data/WK3/Electric_Vehicle_Population_Data.csv", format = "basket", sep = ",");
itemFrequencyPlot(trans, topN=80,type="absolute")

rules<-apriori (data=trans, parameter=list(supp=0.001,conf = 0.08), appearance = list(default="Electric Range", rhs="MOdel"), control=list(verbose=F))

rules<-sort(rules, decreasing=TRUE, by="confidence")

inspect(rules[0:52])

plot(rules, method="graph", interactive=TRUE)





