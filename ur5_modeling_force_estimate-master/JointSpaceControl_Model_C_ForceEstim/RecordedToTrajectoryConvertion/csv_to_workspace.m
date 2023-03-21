function csv_to_workspace()
% CSV_TO_WORKSPACE() converts measured data from csv files into mat files.

csv_folder_name = 'Movement_No1/csv_files/';
mat_folder_name = 'Movement_No1/mat_files/';

csv_force_sensor = 'log_force_sensor.csv';
csv_i_actual = 'log_i_actual.csv';
csv_i_target = 'log_i_target.csv';
csv_m_target = 'log_m_target.csv';
csv_q_actual = 'log_q_actual.csv';
csv_q_target = 'log_q_target.csv';
csv_qd_actual = 'log_qd_actual.csv';
csv_qd_target = 'log_qd_target.csv';
csv_qdd_target = 'log_qdd_target.csv';
csv_tcp_force = 'log_tcp_force.csv';
csv_tcp_speed = 'log_tcp_speed.csv';
csv_tool_acc = 'log_tool_acc.csv';
csv_tool_vector = 'log_tool_vector.csv';

%% Read the csv files, save the data in matrices.

force_sensor = csvread([csv_folder_name, csv_force_sensor]);
i_actual = csvread([csv_folder_name, csv_i_actual]);
i_target = csvread([csv_folder_name, csv_i_target]);
m_target = csvread([csv_folder_name, csv_m_target]);
q_actual = csvread([csv_folder_name, csv_q_actual]);
q_target = csvread([csv_folder_name, csv_q_target]);
qd_actual = csvread([csv_folder_name, csv_qd_actual]);
qd_target = csvread([csv_folder_name, csv_qd_target]);
qdd_target = csvread([csv_folder_name, csv_qdd_target]);
tcp_force = csvread([csv_folder_name, csv_tcp_force]);
tcp_speed = csvread([csv_folder_name, csv_tcp_speed]);
tool_acc  = csvread([csv_folder_name, csv_tool_acc]);
tool_vector = csvread([csv_folder_name, csv_tool_vector]);

%% Save data in structs with data = (time, signals(values)).

force_sensor = struct('time', force_sensor(:,1), ...
                      'signals', struct('values', force_sensor(:,2:end)));
i_actual = struct('time', i_actual(:,1), ...
                  'signals', struct('values', i_actual(:,2:end)));
i_target = struct('time', i_target(:,1), ...
                  'signals', struct('values', i_target(:,2:end)));
m_target = struct('time', m_target(:,1), ...
                  'signals', struct('values', m_target(:,2:end)));
q_actual = struct('time', q_actual(:,1), ...
                  'signals', struct('values', q_actual(:,2:end)));
q_target = struct('time', q_target(:,1), ...
                  'signals', struct('values', q_target(:,2:end)));
qd_actual = struct('time', qd_actual(:,1), ...
                  'signals', struct('values', qd_actual(:,2:end)));
qd_target = struct('time', qd_target(:,1), ...
                  'signals', struct('values', qd_target(:,2:end)));
qdd_target = struct('time', qdd_target(:,1), ...
                  'signals', struct('values', qdd_target(:,2:end)));
tcp_force = struct('time', tcp_force(:,1), ...
                  'signals', struct('values', tcp_force(:,2:end)));
tcp_speed = struct('time', tcp_speed(:,1), ...
                  'signals', struct('values', tcp_speed(:,2:end)));
tool_acc = struct('time', tool_acc(:,1), ...
                  'signals', struct('values', tool_acc(:,2:end)));
tool_vector = struct('time', tool_vector(:,1), ...
                  'signals', struct('values', tool_vector(:,2:end)));

save([mat_folder_name,'force_sensor'], 'force_sensor')
save([mat_folder_name,'i_actual'], 'i_actual')
save([mat_folder_name,'i_target'], 'i_target')
save([mat_folder_name,'m_target'], 'm_target')
save([mat_folder_name,'q_actual'], 'q_actual')
save([mat_folder_name,'q_target'], 'q_target')
save([mat_folder_name,'qd_actual'], 'qd_actual')
save([mat_folder_name,'qd_target'], 'qd_target')
save([mat_folder_name,'qdd_target'], 'qdd_target')
save([mat_folder_name,'tcp_force'], 'tcp_force')
save([mat_folder_name,'tcp_speed'], 'tcp_speed')
save([mat_folder_name,'tool_acc'], 'tool_acc')
save([mat_folder_name,'tool_vector'], 'tool_vector')

end
