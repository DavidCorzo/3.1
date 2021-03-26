from os import getcwd
from win32com.client import Dispatch, constants

xl = Dispatch("Excel.Application")

wb = xl.Workbooks.Open(getcwd().replace('\\', '/') + "/excel.xlsx")
ws = wb.Worksheets(1)

cell = ws.Cells('A1:C10')
cell.Value = 'Some more text'

wb.Close(True)
