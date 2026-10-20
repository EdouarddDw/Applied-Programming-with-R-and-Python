
import pandas as pd
data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'PurchAmount':[18,17,12,16,19,15,17,15,16,11,17,11,15,16,15],
        'Cost':[2,5,7,6,1,9,6,4,9,1,2,3,2,2,1]
        }
myData = pd.DataFrame(data, columns=["Customer", "PurchAmount", "Cost"])

print(myData.describe())


import pandas as pd
data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'PurchAmount':[13,19,16,15,11,17,13,16,17,17,17,14,17,14,13],
        'Cost':[3,9,1,9,9,7,5,3,4,1,1,5,9,8,7]
        }
myData = pd.DataFrame(data, columns=["Customer", "PurchAmount", "Cost"])

select = myData.iloc[5:13]
sum = sum(select["Cost"])
print(sum)


import pandas as pd
data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'TransDate':['18.03.2011','05.06.2011','05.03.2011','21.06.2011','03.05.2011','08.11.2011','08.01.2011','05.03.2011','12.12.2011','07.10.2011','28.06.2011','07.10.2011','15.11.2011','10.07.2011','06.04.2011'],
        'PurchAmount':[17,13,18,11,16,19,17,11,13,12,15,16,19,15,13],
        'Cost':[2,1,9,4,5,1,7,7,9,9,3,9,2,2,3]
        }
myData = pd.DataFrame(data, columns=["Customer", "TransDate", "PurchAmount", "Cost"])

data["TransDate"] = pd.to_datetime(data["TransDate"], format = '%d.%m.%Y')


selected = myData[
    myData["TransDate"].isin(["05.03.2011", "07.10.2011"])
]

print(round(selected["PurchAmount"].mean(), 2))


import pandas as pd
data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'PurchAmount':[17,16,19,15,15,11,14,13,15,15,19,15,16,13,17],
        'Cost':[4,1,8,7,6,9,3,9,1,3,6,9,3,3,1]
        }
myData = pd.DataFrame(data, columns=["Customer", "PurchAmount", "Cost"])


myData["profit"] = myData["PurchAmount"] - myData["Cost"]

myData_toppurchases = myData[myData["PurchAmount"] > 15]

print(round(myData_toppurchases["profit"].mean(), 2))



data = {'Customer':[149332,172951,120621,149236,119236,119237,119286,119299,119300,119301,119402,119405,119406,119510,119511],
        'Quantity':[1,4,5,5,5,1,2,1,2,2,1,4,1,4,4],
        'PurchAmount':[14,13,12,16,18,12,12,17,15,15,12,16,18,18,12],
        'Cost':[9,9,4,6,8,6,2,2,2,8,5,5,4,3,6]
        }
myData = pd.DataFrame(data, columns=["Customer", "Quantity", "PurchAmount", "Cost"])

select = myData.loc[(myData["Quantity"] >= 2) & (myData["Quantity"] <= 4), ['Customer', 'Cost']]

print(select["Cost"].sum())


