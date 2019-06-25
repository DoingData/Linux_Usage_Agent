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


