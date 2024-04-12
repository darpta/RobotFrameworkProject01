import random

from robot.api.deco import library, keyword


@library
class MyLibrary:

    @keyword
    def wylosuj_date_wypisz_argument(self, argument):

        print(str(argument).upper())

        rok = random.randint(1970, 2000)
        print("Moj wylosowany rok: ", str(rok))
