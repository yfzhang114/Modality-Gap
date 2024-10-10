pip3 install -e .
pip install -e ".[train]"
pip3 install flash-attn --no-build-isolation
pip install wandb
pip3 install transformers==4.38.2
pip3 install tokenizers==0.15.2
pip3 install accelerate==0.27.2
pip3 install deepspeed==0.12.6

accelerate launch --num_processes=1 --main_process_port 12363 -m lmms_eval --model llava --model_args pretrained="liuhaotian/llava-v1.5-7b" --tasks mme --batch_size 1 --log_samples --log_samples_suffix llava_v1.5_mme --output_path ./logs/