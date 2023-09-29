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
        sql=select_script + "select concat(avg_price_minute_flight(501, 240), '$') as avg_price_minute_flight;"
    )


def test(select_df):
    assert select_df.query("avg_price_minute_flight == '2.0875$'")['avg_price_minute_flight'].iloc[0] == '2.0875$'

