# DL-Course
This is deep learning class lessons. 


## Installations And Build Image
1. Make sure you have docker installed on your machine. 
2. run following command to get the docker image `sudo docker build https://github.com/akashs-cuelogic/tensorflow.git#:tensorflow/tools/docker -t "akashs-cuelogic:dl-course"`

## Running The Container
`sudo docker run -it -p 8008:8008 -p 6006:6006 <container image>`

`sudo docker run -it -p 8008:8008 -p 6006:6006 -v absolute_path:/dl-courses/ <container image>`


## Dataset
1. Sample dog-cat dataset: [here](https://www.dropbox.com/s/df6vzzdc96cce6p/sample-dog-cat.tar) 
2. Large dog-cat dataset: [here](http://files.fast.ai/data/dogscats.zip)

Inside your docker workarea: `wget <url>` to get the dataset.  
