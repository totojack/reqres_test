from client import get_data

def check_data():
    res = get_data()

    for item in res:
        if type(item['first_name']) != str:
            return False
        if type(item['last_name']) != str:
            return False

    return True

def test_get_data():
    assert check_data()
