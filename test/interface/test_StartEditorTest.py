from pywinauto.application import Application
import time

import sys


import unittest


class TestEditorModule(unittest.TestCase):

	def test_guistart(self):
		app = Application().Start(cmd_line=u'"..\\..\\gui\\gui.exe" ')
		wxwindownr = app.wxWindowNR
		wxwindownr.Wait('ready')
		wxwindownr.Maximize()
		wxwindownr.Close()
		self.assertTrue(True)
 

if __name__ == '__main__':
    unittest.main()

