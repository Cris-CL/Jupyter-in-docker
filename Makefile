run-notebook:
	docker run -p 127.0.0.1:8888:8888 -v /Users/fujiorganics/program/Cris-CL/google_dev_env/notebook/:/app test_g/gclenv:v1
run-notebook-man:
	docker run -p 127.0.0.1:8888:8888 -v /home/cris/Repos/notebook:/app jupy:manjaro
run-notebook-v2:
	docker run -p 127.0.0.1:8888:8888 -v /Users/fujiorganics/program/Cris-CL/google_dev_env/notebook/:/app test_g/gclenv:v2
