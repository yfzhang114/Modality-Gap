deepspeed --master_port 25001 --num_nodes=1 --num_gpus=8 llava/feature/extract.py \
    --deepspeed /opt/tiger/LLaVA1.5/scripts/zero2.json \
    --model_name_or_path /mnt/bn/bohanzhainas1/Public_Models/vicuna-13b-v1.5 \
    --version v1 \
    --data_path /mnt/bn/bohanzhainas1/yiqi.wang/sharegpt4v_mix665k_cap23k_coco-ap9k_lcs3k_sam9k_div2k.json \
    --vision_tower runwayml/stable-diffusion-v1-5 \
    --pretrain_mm_mlp_adapter /mnt/bn/bohanzhainas1/bohan/exp/2023-12-23/LLaVA_diffusion/mm_projector.bin \
    --mm_projector_type mlp2x_gelu \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --group_by_modality_length True \
    --bf16 True \
    --output_dir /mnt/bn/bohanzhainas1/bohan/exp/2023-12-23/LLaVA_diffusion_ft \
    --num_train_epochs 1 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 500 \
    --save_total_limit 10 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --dataloader_num_workers 4 \
    --lazy_preprocess True \