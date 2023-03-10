```
export DET_MASTER=mlde.gpu03.lysdemolab.fr
det user login pollen
PROJECT_ID=`det project list pollen-workspace  --json | jq '.[0].id'`


det experiment create --project_id $PROJECT_ID jear-const.yaml .
det experiment create --project_id $PROJECT_ID jear-const-b.yaml .

```
