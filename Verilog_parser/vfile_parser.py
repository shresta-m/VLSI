def vfile_parser(filename):

	verilog_file = open(filename,'r')#open the file in read mode
	Gates=['not','and','or','nand','nor','xor','xnor','buf']
	inp_nodes=[]
	out_nodes=[]
	gates=[]
	wires=[]
    # method readlines() reads until EOF using readline() and returns a list containing the lines. 
	lines=verilog_file.readlines()
	verilog_file.close() #close the verilog file

	for line in lines:

		line=line.lstrip() #remove all the leading spaces
		if(line.startswith('input')): #here we extract all the input nodes 
			inp_nodes.extend([x.strip(',;\n ') for x in line.lstrip('input').split(',')])
		elif(line.startswith('output')): #here we extract all the output nodes
			out_nodes.extend([x.strip(',;\n ') for x in line.lstrip('output').split(',')])
        #find all the gates and connections
		elif(any(g in line for g in Gates)):
            #remove the gate type instantiation and extract the gate from the line
			temp_gate,nodes=[x.strip(',;\n ()') for x in line.split('(')]
			temp_gate=temp_gate.split(' ')[1]
			gates.append(temp_gate)
            #here we are extracting the inputs and outputs of gate in a line
			nodes=[x.strip(' ') for x in nodes.split(',')]
			out=nodes[0]
			inp=nodes[1:]

            #here we are finding all the wires
			if out in out_nodes:
				wires.append([out,temp_gate,[out]])
			else:
				flag=1
				for i in wires:
					if i[0]==out:
						i[1]=temp_gate
						flag=0
						break
				if flag:
					wires.append([out,temp_gate,[]])

			for i in inp:
				if i in inp_nodes:
					flag=1
					for j in wires:
						if j[0]==i:
							j[2].append(temp_gate)
							flag=0
							break
					if flag:
						wires.append([i,i,[temp_gate]])
				else:
					flag=1
					for j in wires:
						if j[0]==i:
							j[2].append(temp_gate)
							flag=0
							break
					if flag:
						wires.append([i,' ',[temp_gate]])

	if(True):
		print("Input Nodes: ",inp_nodes,"\nOutput Nodes:",out_nodes,"\nGates: ",gates,"\nWires:")
		x=max([len(str(i[2])) for i in wires])
		print(("+---------------+----------+{:-^"+str(x)+"}+").format(''))
		print(("|{:^15}|{:^10}|{:^"+str(x)+"}|").format("Wire groups","from","to"))
		print(("+---------------+----------+{:-^"+str(x)+"}+").format(''))
		for i in wires:
			print(("|{:^15}|{:^10}|{:^"+str(x)+"}|").format(i[0],i[1],str(i[2])[1:-1]))
		print(("+---------------+----------+{:-^"+str(x)+"}+").format(''))

	return inp_nodes,out_nodes,gates,wires