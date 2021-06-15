from PyQt5 import QtWidgets, QtCore
from pyqtgraph import PlotWidget, plot
import pyqtgraph as pg
import sys  # We need sys so that we can pass argv to QApplication
import os
import math 
from random import randint
import serial
ser = serial.Serial("COM4", 9600)

class MainWindow(QtWidgets.QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.graphWidget = pg.PlotWidget()
        self.setCentralWidget(self.graphWidget)

        self.x = list(range(800))  # 100 time points
        self.y = [randint(0,100) for _ in range(800)]  # 100 data points

        self.graphWidget.setBackground('w')

        pen = pg.mkPen(color=(255, 0, 0))
        self.data_line =  self.graphWidget.plot(self.x, self.y, pen=pen)
        self.timer = QtCore.QTimer()
        self.timer.setInterval(50)
        self.timer.timeout.connect(self.update_plot_data)
        self.timer.start()

    def update_plot_data(self):

        m = [ser.readline(100).decode('utf-8')]
        n = m[0].split()
        print(n)
        x_value = float(int(n[3])*math.sin(int(n[0])*math.pi/200.0)) #int(ser.readline(10).decode('utf-8'))
        y_value = float(int(n[3])*math.cos(int(n[0])*math.pi/200.0))

        self.x = self.x[1:]  # Remove the first y element.
        self.x.append(x_value)  # Add a new value 1 higher than the last.

        self.y = self.y[1:]  # Remove the first 
        self.y.append(y_value)  # Add a new random value.

        self.data_line.setData(self.x, self.y)  # Update the data.

app = QtWidgets.QApplication(sys.argv)
w = MainWindow()
w.show()
sys.exit(app.exec_())