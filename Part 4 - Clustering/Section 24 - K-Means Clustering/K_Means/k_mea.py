import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Mall_Customers.csv')
X = dataset.iloc[:, [3, 4]].values

from sklearn.cluster import KMeans
wcss = []
for i in range(1,11):
    kmean = KMeans(n_clusters = i,init = 'k-means++',max_iter = 300,n_init = 10,random_state = 0)
    kmean.fit(X)
    wcss.append(kmean.inertia_)
plt.plot(range(1,11),wcss)
plt.show()

kmean = KMeans(n_clusters = 5,init = 'k-means++',max_iter = 300,n_init = 10,random_state = 0)
y_kmeans = kmean.fit_predict(X)

plt.scatter(X[y_kmeans == 0, 0],X[y_kmeans == 0,1],s= 100,c = 'red')
plt.scatter(X[y_kmeans == 1, 0],X[y_kmeans == 1,1],s= 100,c = 'blue')
plt.scatter(X[y_kmeans == 2, 0],X[y_kmeans == 2,1],s= 100,c = 'green')
plt.scatter(X[y_kmeans == 3, 0],X[y_kmeans == 3,1],s= 100,c = 'cyan')
plt.scatter(X[y_kmeans == 4, 0],X[y_kmeans == 4,1],s= 100,c = 'magenta')
plt.show()