import argparse
from vfile_parser import vfile_parser
from plot_graph import plot_graph
#argparse is used to get the command line arguments
def main():
    parser = argparse.ArgumentParser(description="converting the verilog module to graph")
    parser.add_argument('verilogfile',type =str,help ="path to the verilog file")
    args = parser.parse_args()
    graph_img_file = args.verilogfile.split('.v')[0]+".png"
    input_nodes,output_nodes,nodes,edges = vfile_parser(args.verilogfile)
    plot_graph(input_nodes,output_nodes,nodes,edges,graph_img_file)

if __name__=="__main__":
    main()

