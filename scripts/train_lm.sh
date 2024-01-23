torchrun --nproc_per_node=1 \
--master_port=2349 \
train/train_lm.py \
    --model_name_or_path "DAMO-NLP-SG/CLEX-Phi-2-32K"  \
    --data_path  "/workspace/git/LongQLoRA/data/pretrain/iCliniq_1k.jsonl" \
    --bf16 True \
    --output_dir "/workspace/models/phi2-32k-pretrain-HC" \
    --num_train_epochs 1 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 4 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 200 \
    --save_total_limit 2 \
    --max_steps 250 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 8192 \
    --gradient_checkpointing True \
    --ddp_find_unused_parameters True \
    --do_train True \
    --do_eval False \
    --do_predict False \
    --log_scale False \
    #--deepspeed "playground/deepspeed_zero3_offload.json"
