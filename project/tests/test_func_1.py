import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_df(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script + "select * from tickets_to_with_min_cost('Barcelona', 500);"

    )


def test(select_df):
    assert select_df.query("city == 'Barcelona'")['price'].iloc[0] == 472

