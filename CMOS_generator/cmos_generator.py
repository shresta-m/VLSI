print(" The format of boolean expression :\n"
         "~((A.B)+(C.D))\n"
         "Symbols : ~(NOT) , .(AND) , + (OR)\n"
      )   
      
_Symbols_ = ['(' ,'.','+','~',')',' ']
_op_precedence = {'~':3, '.' :2 ,'+': 1,'(':0,')':0}
         
print("Enter the Boolean expression")
exp = input().strip()
print(len(exp))
tokens = []
s = 0
#first step : extraction of individual tokens from the expression
for index in range(len(exp)):
            if exp[index] in _Symbols_ :
                  if s < index :
                           tokens.append(exp[s:index])
                  if exp[index]!= ' ' :
                           tokens.append(exp[index])
                           
                  s = index+1                        

if s < len(exp):
         tokens.append(exp[s:len(exp)])
         
#next step : convert the tokens to postfix 
tokens_postfix =[]
op_stack = [] 

for token_element in tokens:
         #classify as operator 
         if token_element in _op_precedence.keys():
                  if token_element == '(':
                           op_stack.append(token_element)
                           
                  elif token_element == ')' :
                           while( op_stack[-1]!='('):
                                    tokens_postfix.append(op_stack.pop())
                      #this is to pop the top-most '('     
                           op_stack.pop()    
                      
                  else:
                           while( (len(op_stack)!=0) and (op_stack[-1]!='(') and (_op_precedence [op_stack[-1]] >= _op_precedence [token_element])):    
                                    tokens_postfix.append(op_stack.pop()) 
                          
                          
                           op_stack.append(token_element)
                           
                       #this is for appending the input variables     
         else:
                  tokens_postfix.append(token_element)
                                   
while (len(op_stack)!=0):
         tokens_postfix.append(op_stack.pop())         
                 
#print(tokens_postfix)   

#3rd step : getting the expression for pull up and pull down
token_pmos_postfix= tokens_postfix.copy()
#negate  the nmos postfix expression
token_nmos_postfix =  tokens_postfix.copy()
token_nmos_postfix.append('~')   

def inverse(tokens_postfix, index):

	#if token is a symbol
	if tokens_postfix[index] not in _op_precedence.keys():

		if tokens_postfix[index][0] == '-':
			tokens_postfix[index] = tokens_postfix[index][1:]

		else:
			tokens_postfix[index] = '-'+ tokens_postfix[index]

		return index;

	#if token is an operator(. or +)
	else:

		if tokens_postfix[index] == '.':
			tokens_postfix[index] = '+'

		elif tokens_postfix[index] == '+':
			tokens_postfix[index] = '.';

		s_end = inverse(tokens_postfix, index-1)
		return inverse(tokens_postfix, s_end - 1)



#Step 3 (i) :  (~) elimination in PMOS postix expr.
token_index = 0

while token_index < len(token_pmos_postfix):

	if token_pmos_postfix[token_index] == '~':
	         
		inverse(token_pmos_postfix, token_index - 1)
		#print(token_index)
		
		token_pmos_postfix.pop(token_index)

	else:
		token_index += 1

#inverted output print(token_pmos_postfix)
#Step 3 (ii) :  (~) elimination in NMOS postfix expr.
token_index = 0

while token_index < len(token_nmos_postfix):

	if token_nmos_postfix[token_index] == '~':
		inverse(token_nmos_postfix, token_index - 1)
		token_nmos_postfix.pop(token_index)

	else:
		token_index += 1

#inverted output print(token_nmos_postfix)	
#pull up netlist 

post_eval_nstack = []
n_index = 0
#index of last intersection/junction
n_jn_index = 0 

for token in token_nmos_postfix:

	if token not in ['.','+']:

		post_eval_nstack.append([{ "name":"n", "src":n_jn_index,"drain":n_jn_index+1, "gate":token}])
		#print("hey")
		#print(post_eval_nstack)
		n_jn_index += 2
		n_index += 1

	elif token == '.':
                  
		old_src = post_eval_nstack[-1][0]["src"]
		#print(post_eval_nstack[-1][0]["src"])
		new_src = post_eval_nstack[-2][-1]["drain"]
		#print(post_eval_nstack[-2][-1]["drain"])
		#print(old_src)
		#print(new_src)

		for transistor in post_eval_nstack[-1]:
			if transistor["src"] == old_src:
				transistor["src"] = new_src

		post_eval_nstack[-2].extend(post_eval_nstack.pop(-1))
		
	elif token == '+':
		
		old_src = post_eval_nstack[-1][0]["src"]
		new_src = post_eval_nstack[-2][0]["src"]
		#print(old_src)
		#print(new_src)

		old_drain = post_eval_nstack[-1][-1]["drain"]
		new_drain = post_eval_nstack[-2][-1]["drain"]
		#print(old_drain)
		#print(new_drain)
		#print(post_eval_nstack[-1])

		for transistor in post_eval_nstack[-1]:

			if transistor["src"] == old_src:
				transistor["src"] = new_src

			if transistor["drain"] == old_drain:
				transistor["drain"] = new_drain

		post_eval_nstack[-2].extend(post_eval_nstack.pop(-1))
#print(post_eval_nstack)

#Identify OUTPUT and Gnd pins
ground = post_eval_nstack[0][0]["src"]
out_nmos = post_eval_nstack[0][-1]["drain"]
#print(post_eval_nstack)
#print(ground)
#print(out_nmos)
for transistor in post_eval_nstack[0]:

	if transistor["src"] == ground:
		transistor["src"] = "Gnd"

	if transistor["drain"] == out_nmos:
		transistor["drain"] = "OUTPUT"

#print(post_eval_nstack[0])


def invert_input(token):

	if token[0] == '-':
		return token[1:]

	else:
		return "-"+token
# --- end - helper function - invert input symbol --- #


post_eval_pstack = []
p_index = 0
#index of last intersection/junction
pmos_jn_index = n_jn_index 

for token in token_pmos_postfix:

	if token not in ['.','+']:

		post_eval_pstack.append([{ "name":"p", "src":pmos_jn_index,"drain":pmos_jn_index+1, "gate":invert_input(token)}])
		#print(post_eval_pstack)
		pmos_jn_index += 2
		p_index += 1

	elif token == '.':

		old_src = post_eval_pstack[-1][0]["src"]
		new_src = post_eval_pstack[-2][-1]["drain"]

		for transistor in post_eval_pstack[-1]:
			if transistor["src"] == old_src:
				transistor["src"] = new_src

		post_eval_pstack[-2].extend(post_eval_pstack.pop(-1))
		
	elif token == '+':
		
		old_src = post_eval_pstack[-1][0]["src"]
		new_src = post_eval_pstack[-2][0]["src"]

		old_drain = post_eval_pstack[-1][-1]["drain"]
		new_drain = post_eval_pstack[-2][-1]["drain"]

		for transistor in post_eval_pstack[-1]:

			if transistor["src"] == old_src:
				transistor["src"] = new_src

			if transistor["drain"] == old_drain:
				transistor["drain"] = new_drain

		post_eval_pstack[-2].extend(post_eval_pstack.pop(-1))

#identify Vdd and OUTPUT pins
Vdd = post_eval_pstack[0][0]["src"]
out_pmos = post_eval_pstack[0][-1]["drain"]

for transistor in post_eval_pstack[0]:

	if transistor["src"] == Vdd:
		transistor["src"] = "Vdd"

	if transistor["drain"] == out_pmos:
		transistor["drain"] = "OUTPUT"

#print(post_eval_pstack)
length = 2
width = 4
input_symbols = set(tokens_postfix) - {'~','.','+'}
print("\nInputs: ",end='')
print(*input_symbols, sep = ', ')
f = open("test.sim", 'w')
for transistor in post_eval_pstack[0]:
        print(transistor["name"], transistor["gate"], transistor["src"], transistor["drain"],length,width,sep='  ', file=open("test.sim", "a"))
       
#print("\nPULL DOWN NETWORK (NMOS)\n")
print("\n", file=open("test.sim","a"))
for transistor in post_eval_nstack[0]:
        print(transistor["name"], transistor["gate"], transistor["src"], transistor["drain"],length, width,sep='  ', file=open("test.sim", "a"))
	
print("test.sim file has been created");	
f.close()
	
	
	
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$	


