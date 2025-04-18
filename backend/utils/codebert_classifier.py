# utils/codebert_classifier.py

from transformers import RobertaTokenizer, RobertaForSequenceClassification
import torch
import os

MODEL_NAME = "microsoft/codebert-base"
LABELS = ["benign", "suspicious", "malicious"]

tokenizer = RobertaTokenizer.from_pretrained(MODEL_NAME)
model = RobertaForSequenceClassification.from_pretrained(MODEL_NAME, num_labels=3)

def classify_method_code(method_code):
    inputs = tokenizer(method_code, return_tensors="pt", truncation=True, padding=True, max_length=512)
    with torch.no_grad():
        outputs = model(**inputs)
    prediction = torch.argmax(outputs.logits, dim=1).item()
    return LABELS[prediction]
