https://www.nvidia.com/Download/index.aspx

https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)



https://github.com/NVIDIA/nvidia-docker/wiki/GPU-isolation-(version-1.0)



https://unix.stackexchange.com/questions/249643/gpu-usage-per-process-on-a-linux-machine-cuda







sudo yum install -y wget gcc pciutils git

sudo yum install -y kernel-devel-$(uname -r) kernel-headers-$(uname -r)


wget http://us.download.nvidia.com/tesla/410.129/NVIDIA-Linux-x86_64-410.129-diagnostic.run

sudo bash NVIDIA-Linux-x86_64-410.129-diagnostic.run


curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker $USER


distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.repo | sudo tee /etc/yum.repos.d/nvidia-docker.repo

sudo yum install -y nvidia-container-toolkit
sudo systemctl restart docker



git clone https://github.com/tensorflow/models.git

docker run --gpus all -it --rm --mount type=bind,src=/home/newnius_cn/models,dst=/data tensorflow/tensorflow:1.14.0-gpu bash

docker run --gpus '"device=0,1"' -it --rm --mount type=bind,src=/home/newnius_cn/models,dst=/data tensorflow/tensorflow:1.14.0-gpu bash

export PYTHONPATH="$PYTHONPATH:/data"

pip install requests

# mnist
python official/r1/mnist/mnist_test.py --benchmarks=.

# CIFAR-10

python official/r1/resnet/cifar10_download_and_extract.py --data_dir /data/ds

python official/r1/resnet/cifar10_main.py --data_dir /data/ds/cifar-10-batches-bin --model_dir /tmp





```python
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
config.log_device_placement = True

sess = tf.Session(config=config)

tf.keras.backend.set_session(sess)
```




sudo yum erase -y nvidia-container-runtime-hook.x86_64 nvidia-container-runtime.x86_64 nvidia-docker2.noarch docker-ce docker-ce-cli.x86_64

sudo gpg --homedir /var/lib/yum/repos/x86_64/7/libnvidia-container/gpgdir --delete-key F796ECB0

sudo gpg --homedir /var/lib/yum/repos/x86_64/7/nvidia-container-runtime/gpgdir --delete-key F796ECB0

sudo gpg --homedir /var/lib/yum/repos/x86_64/7/nvidia-docker/gpgdir --delete-key F796ECB0

[Can not use nvidia-container-runtime repository - repomod.xml signature could not be verified](https://github.com/NVIDIA/nvidia-docker/issues/836)



ERROR: Unable to load the kernel module 'nvidia.ko'. This happens most frequently when this kernel module was built against the wrong or improperly configured kernel sources, with a version of gcc that differs from the one used to build the target kernel, or if a driver such as rivafb, nvidiafb, or nouveau is present and prevents the NVIDIA kernel module from obtaining ownership of the NVIDIA graphics device(s), or no NVIDIA GPU installed in this system is supported by this NVIDIA Linux graphics driver release.


The problem is likely due to one of the issues listed in that error message. You'll need to go through them one by one, modifying things to rule them out.

blacklisting nouveau is frequently not enough. Often it is necessary to remove it from the initrd image as well.

as root:

echo -e "blacklist nouveau\noptions nouveau modeset=0" > /etc/modprobe.d/disable-nouveau.conf

update-initramfs -u

如果提示command not found，似乎没有关系，重启机器即可。


It looks like you did something like the first line already - that is the blacklist. The second line will remove it from the initrd image.

Section 8.1 of the driver README document discusses nouveau:

http://us.download.nvidia.com/XFree86/Linux-x86_64/340.24/README/index.html





