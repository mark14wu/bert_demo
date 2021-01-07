#!/bin/bash
# Copyright 2020 Huawei Technologies Co., Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================

	# -H gpu9-docker:1,gpu11-docker:1		\
	# --mca btl_tcp_if_include ens11f0	\


/usr/local/openmpi-3.1.5/bin/mpirun --allow-run-as-root -n 3 --mca btl_tcp_if_include ens11f0 -H gpu11-docker:3 --output-filename log_output --merge-stderr-to-stdout \
	python run_pretrain.py				\
		--device_target="GPU"			\
		--distribute="true"				\
		--epoch_size=1		\
		--train_steps=5		\
		--enable_save_ckpt="true"		\
		--enable_lossscale="false"		\
		--do_shuffle="true"				\
		--enable_data_sink="true"		\
		--data_sink_steps=1				\
		--load_checkpoint_path=""			\
		--save_checkpoint_steps=10000	\
		--save_checkpoint_num=1			\
		--data_dir="/data/bert/zhwiki-tf-record"	\
		> log.txt 2>&1 &

