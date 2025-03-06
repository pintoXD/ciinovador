module queues_array;

bit [31:0] queue_1[$];

int Ivar;


initial begin

queue_1 = {0,1,2,3};

$display("\tQueue_l size is %0d",queue_l.size());


queue_1.push_front (22);

$display("\tQueue_l size after push_front is %0d",queue_1l.size());


queue_1. push_back (44);

$display("\tQueue_1l size after push_back is %0d",queue_1l.size());


var = queue_1.pop_front() ;

$display("\tQueue_1 pop_front value is %0d",lvar);


lvar = queue_1.pop_back();

$display("\tQueue_1 pop_back value is %0d",lvar);


end

endmodule