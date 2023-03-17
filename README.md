# lys-determined

   # For detectron2 exemple, I am using this  https://github.com/jear/my-nfs-csi  
  
```
export DET_MASTER=mlde.gpu03.lysdemolab.fr
det user login pollen
PROJECT_ID=`det project list pollen-workspace  --json | jq '.[0].id'`


det experiment create --project_id $PROJECT_ID const.yaml .

det experiment create --project_id $PROJECT_ID adaptive.yaml .

det experiment create --project_id $PROJECT_ID distributed.yaml .
```
