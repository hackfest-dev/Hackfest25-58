from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch

# Load CodeBERT
tokenizer = AutoTokenizer.from_pretrained("microsoft/codebert-base")
model = AutoModelForSequenceClassification.from_pretrained("microsoft/codebert-base")  # You can fine-tune if needed

# Inference
def classify_java_code(code_snippet):
    inputs = tokenizer(code_snippet, return_tensors="pt", truncation=True, padding=True)
    with torch.no_grad():
        outputs = model(**inputs)
    logits = outputs.logits
    predicted_class = torch.argmax(logits, dim=1).item()

    # You can define your own label mapping here
    labels = {0: "benign", 1: "suspicious", 2: "malicious"}
    return labels.get(predicted_class, "unknown")
