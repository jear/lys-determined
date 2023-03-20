# lys-determined

    # For detectron2 exemple, I am using this  https://github.com/jear/my-nfs-csi  
  
```
export DET_MASTER=mlde.gpu03.lysdemolab.fr
det user login pollen
PROJECT_ID=`det project list pollen-workspace  --json | jq '.[0].id'`


det experiment create --project_id $PROJECT_ID const.yaml .

det experiment create --project_id $PROJECT_ID adaptive.yaml .

det experiment create --project_id $PROJECT_ID distributed.yaml .



det checkpoint download a5319a67-d19d-4bf1-b5ec-9d7e68077f93 -o ./a5319a67-d19d-4bf1-b5ec-9d7e68077f93   


# Troubleshooting
det  -m https://determined.83-206-89-105.nip.io/ shell start --config environment.image=determinedai/example-detectron2:0.6-cuda-10.2-pytorch-1.10 --config resources.slots=1 -- -L 6006:localhost:6006


```
