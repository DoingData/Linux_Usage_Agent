--DROP TABLE public.host_usage

CREATE TABLE PUBLIC.host_usage
(
	"timestamp" 		TIMESTAMP NOT NULL,
	host_id 		SERIAL NOT NULL,
	memory_free		INT4 NOT NULL,
	cpu_idel		INT2 NOT NULL,
	cpu_kernel 		INT2 NOT NULL,
	disk_io 		INT4 NOT NULL,
	disk_available 		INT4 NOT NULL,
	CONSTRAINT host_usage_host_info_fk 
	FOREIGN KEY (host_id)
	REFERENCES host_info(id)
);

--Group hosts by CPU number and sort by their
--memory size in descending oreder(within each cpu group)
host_agent=# SELECT cpu_number,id,total_mem
FROM host_info
ORDER BY cpu_number ASC, total_mem DESC;


--Average used memory in percentage over 5 minutes intervals
--for each host.( used_memory= total_memory-free_memory)
SELECT host_info.id as host_id, host_info.hostname, host_info.total_mem as total_memory,
ROUND(((AVG(host_info.total_mem - host_usage.memory_free)*100)/host_info.total_mem),0) as used_memory_percentage, 
(date_trunc('hour', host_usage."timestamp") + date_part('minute',host_usage."timestamp")::int / 5 * interval '5 min') as five_min_interval
FROM host_info
INNER JOIN host_usage ON host_usage.host_id = host_info.id 
GROUP BY five_min_interval, id
ORDER BY five_min_interval;

