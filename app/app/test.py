
from django.conf import settings

settings.configure()
from django.test import SimpleTestCase
import calc

class Testing(SimpleTestCase):
    def test_add(self):
        x = 4
        y = 5
        res = calc.add(x, y)
        self.assertEquals(res, 9)

    def test_subtrack_numbers(self):
        res = calc.subtrack(10, 15)

        self.assertEquals(res, 5)
