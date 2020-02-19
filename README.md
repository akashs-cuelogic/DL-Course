# DL-Course
This is deep learning class lessons. 


## Installations And Build Image
1. Make sure you have docker installed on your machine. 
2. run following command to get the docker image `sudo docker build -t "as_docker_test:dl-course" .`

## Running The Container
`docker run -it -p 8008:8008 -p 6006:6006 <container image>`


## Dataset
1. Sample dog-cat dataset: [here](https://www.dropbox.com/s/df6vzzdc96cce6p/sample-dog-cat.tar) 
2. Large dog-cat dataset: [here](http://files.fast.ai/data/dogscats.zip)

Inside your docker workarea: `wget <url>` to get the dataset.  
