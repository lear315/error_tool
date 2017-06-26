# -*- coding: utf-8 -*-
from xml.dom.minidom import parse
#
import codecs
from xml.dom import minidom  
import os
from Tkinter import *
import Tkinter as tknt
import tkFileDialog as tk
import sys
reload(sys)
sys.setdefaultencoding('utf8')

# ==由于minidom默认的writexml()函数在读取一个xml文件后，修改后重新写入如果加了newl='\n',会将原有的xml中写入多余的行  
#　 ==因此使用下面这个函数来代替  
def fixed_writexml(self, writer, indent="", addindent="", newl=""):  
	# indent = current indentation  
	# addindent = indentation to add to higher levels  
	# newl = newline string  
	writer.write(indent+"<" + self.tagName)  
	
	attrs = self._get_attributes()  
	a_names = attrs.keys()  
	a_names.sort()  
	
	for a_name in a_names:
		writer.write(" %s=\"" % a_name)  
		minidom._write_data(writer, attrs[a_name].value)  
		writer.write("\"")  
	if self.childNodes:  
		if len(self.childNodes) == 1 and self.childNodes[0].nodeType == minidom.Node.TEXT_NODE:  
			writer.write(">")  
			self.childNodes[0].writexml(writer, "", "", "")  
			writer.write("</%s>%s" % (self.tagName, newl))  
			return  
		writer.write(">%s"%(newl))  
		for node in self.childNodes:
			if node.nodeType is not minidom.Node.TEXT_NODE:  
				node.writexml(writer,indent+addindent,addindent,newl)  
		writer.write("%s</%s>%s" % (indent,self.tagName,newl))  
	else:  
		writer.write("/>%s"%(newl))  

minidom.Element.writexml = fixed_writexml

class XmlData:
	'解析数据类'
	def __init__(self, path):
		self.path = path
		self.DOMTree = minidom.parse(self.path)
		self.collection = self.DOMTree.documentElement
		self.row_list = self.collection.getElementsByTagName("row")

	def check_by_key(self, key):
		for row in self.row_list:
			name_item = row.getElementsByTagName('value')[0]
			name_str = name_item.childNodes[0].data
			if name_str == key:
				return True
		return False

	#通过key改变值
	def change_by_key(self, key, value):
		for row in self.row_list:
			name_item = row.getElementsByTagName('value')[0]
			name_str = name_item.childNodes[0].data
			if name_str == key:
				row.getElementsByTagName('value')[1].childNodes[0].data = str(value)

	def insert_data(self, key, value):
		tool_item = self.DOMTree.createElement("row")
		value0 = self.DOMTree.createElement("value")
		value0.setAttribute('column','0')
		value0_str = self.DOMTree.createTextNode(str(key))
		value0.appendChild(value0_str) 
		value1 = self.DOMTree.createElement("value")
		value1.setAttribute('column','1')
		value1_str = self.DOMTree.createTextNode(value)
		value1.appendChild(value1_str)
		tool_item.appendChild(value0)
		tool_item.appendChild(value1)
		rows = self.collection.getElementsByTagName("rows")[0]
		rows.appendChild(tool_item)

	#存储数据
	def sava_data(self):
		f= codecs.open(self.path, 'w', 'utf-8')
		self.DOMTree.writexml(f,addindent='	',newl='\n',encoding = 'utf-8')
		f.close()
		#更新
		self.row_list = self.collection.getElementsByTagName("row")

	def insert_xml(self, get_key, get_value):
			get_key = get_key.encode('utf-8')
			get_value = get_value.encode('utf-8')
			if get_key == "":
				print u'key为空!'
				return
			if get_value == "":
				print u'值为空'
			if self.check_by_key(get_key) == False:
				print u'插入...'
				self.insert_data(get_key, get_value)
				if self.fast == False:
					self.sava_data()	
					print u'插入成功'
			else:
				print u'重复...'
				self.change_by_key(get_key, get_value)
				if self.fast == False:
					self.sava_data()
					print u'重复替换'

	def read_dic(self):
		for (k, v) in self.data_dic.items():
			print k
			print v
			self.insert_xml(k, v)
			if self.fast == True:
				self.sava_data()
			print u'转换完成'

	def readData(self):
		self.data_dic = {}
		for line in codecs.open(self.data_url, 'r','utf-8').readlines(): #读取每一行
			if line.find('#') == -1:
				continue		
			strlist = line.split('\'')	
			if len(strlist) != 5:
				continue
			key = strlist[1]
			value = strlist[3]

			self.data_dic[key] = value
		self.read_dic()

	def openPath(self):
		root = tknt.Tk()
		root.withdraw()

		options = {}
		options['initialdir'] = ''
		options['title'] = '选择导入文件文件'
		options['parent'] = root

		url = tk.askopenfilename(**options)
		print url
		self.data_url = url
		
	def getPath(self):
		self.fast = False
		self.openPath()
		self.readData()
		
	def getPathFast(self):
		self.fast = True
		self.openPath()
		self.readData()
		
		
		

	def init_ui(self):
		self.top = tknt.Tk()
		# 进入消息循环
		self.top.geometry('480x320')
		self.titleLabel=Label(self.top,text='语言文本库插入数据的工具V0.2',font='Helvetica -14 bold') 
		self.titleLabel.pack(side = TOP,pady = 10)

		self.insertBtn = Button(self.top,text='导入数据',command=self.getPath,activeforeground='white',activebackground='red')
		self.insertBtn.pack(side = TOP,pady = 0)
		
		self.valueLabel=Label(self.top,text='导入的文本必须为无BOM的UTF-8格式 \n 识别判断形如 \'key\'#\'value\' \n严格匹配不含空格 \n \n 如果导入文本无重复信息,可使用快速导入 ',font='Helvetica -14 bold') 
		self.valueLabel.pack(side = TOP,pady = 20)
		
		self.insertBtn = Button(self.top,text='快速导入',command=self.getPathFast,activeforeground='white',activebackground='red')
		self.insertBtn.pack(side = TOP,pady = 0)

		self.top.mainloop()

def mainLoop():
	lang_path = "lang.xml"
	if os.path.exists(lang_path):
		emp1 = XmlData(lang_path)
		emp1.init_ui()
	else:
		print u'找不到lang.xml'


if __name__ == '__main__':
	mainLoop()

