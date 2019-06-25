# Linux_Usage_Agent

## Introduction
What does this project do ...


## Architecture and Design
1) Draw a cluster diagram with three hosts,a DB and agents
2) Describe tables (no sql code,just explain their usage)
3) Describe scripts (no code,just explain their usage)
## Usage
1) how to init database and tables
2) `host_info.sh` usage
3) `host_usage.sh` usage
4) crontab setup

## Improvements

**Write at least three things you want to improve**
l1) handle hardware update
...
nux_Usage_Agent

## Introduction
What does this project do ... 


## Architecture and Design
1) Draw a cluster diagram with three hosts,a DB and agents
2) Describe tables (no sql code,just explain their usage)

table **host_info** is used to store information about the nodes of cluster.

table **host_usage** is used to store critical data related to a nodes performance

such as

* free diskspace
* cache size
* cpu usage

3) Describe scripts (no code,just explain their usage)

Scripts  **host_info.sh**  and **host_usage.sh** are taking the information and putting it 

into **postgresql** tables;

## Usage
1) how to init database and tables
2) `host_info.sh` usage
3) `host_usage.sh` usage
4) crontab setup



``` bash
#crontab scheduler script is developed using online crontab generator tools
# absolute path and logfile path is also provided
crontab -e
# generated code is pasted in text editor which appears after running above command
# make sure the bash file you runing a schedule on have executable permissions
# if not give permissions using command
chmod u+x filename
# or 
chmod 777 filename

```

## Improvements

**Write at least three things you want to improve**
l1) handle hardware update
...
