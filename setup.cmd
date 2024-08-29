echo "building conda environment"
conda env create -f requirements.yml
conda activate moconvq


echo "install pytorch"
mamba install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
mamba install cuda-nvcc=12.4.131

echo "building rotation library"
cd .\diff-quaternion\TorchRotation\
pip install -e .
cd ..\..

echo "building VclSimuBackend"
cd ModifyODESrc
.\clear.cmd
pip install -e .
cd ..

echo "build moconvq core"
pip install -e .
