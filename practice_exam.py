import numpy

import pandas as pd
data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'PurchAmount':[19,19,17,11,11,19,17,16,13,14,17,14,14,17,11],
        'Cost':[7,2,8,5,1,3,7,1,7,8,2,6,9,7,1]
         }
myData = pd.DataFrame(data, columns=["Customer", "PurchAmount", "Cost"])
print(myData['Cost'].mean())

print(myData.describe())
