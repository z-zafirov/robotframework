import pandas as pd

def read_excel_data():
    pd_data_frame = pd.read_excel('data/data.xlsx', sheet_name='data')
    data = {"fname": pd_data_frame['fname'].tolist(),
            "lname": pd_data_frame['lname'].tolist(),
            "target": pd_data_frame['target'].tolist(),
            "sales": pd_data_frame['sales'].tolist()}
    return data