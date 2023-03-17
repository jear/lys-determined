conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge
git clone https://github.com/facebookresearch/detectron2 detectron2_repo 
pip install -e detectron2_repo -f \
  https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html
pip install horovod==0.24.2

