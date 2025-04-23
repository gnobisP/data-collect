# %%
import pandas as pd
from sqlalchemy import create_engine

# Carregar CSV
df = pd.read_csv('dados/teste.csv')  # Trata anos como inteiros

# Converter colunas (ex: datacompleteness para booleano)
df['playoffs'] = df['playoffs'].map({'1': True, '0': False})
df['firstblood'] = df['firstblood'].map({'1': True, '0': False})
df['firstdragon'] = df['firstdragon'].map({'1': True, '0': False})
df['firstherald'] = df['firstherald'].map({'1': True, '0': False})
df['firstbaron'] = df['firstbaron'].map({'1': True, '0': False})
df['firsttower'] = df['firsttower'].map({'1': True, '0': False})
df['firstmidtower'] = df['firstmidtower'].map({'1': True, '0': False})
df['firsttothreetowers'] = df['firsttothreetowers'].map({'1': True, '0': False})

# Conexão com o PostgreSQL
engine = create_engine('postgresql://relations_users:gnobisP@localhost:5432/relations')
print(df)
# Inserir dados

# %%
df.to_sql('games', engine, if_exists='append', index=False)
# %%
