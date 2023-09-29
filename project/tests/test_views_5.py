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
        sql=select_script + 'select * from joined_tickets_travel_ag;'
    )


def test(select_df):
    assert select_df.query("travel_ag_id == 1")['price'].iloc[0] == 501
