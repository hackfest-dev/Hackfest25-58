import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import joblib
import os

DATASET_PATH = "data/dataset.csv"
MODEL_PATH = "models/malware_model.pkl"

def train():
    if not os.path.exists(DATASET_PATH):
        print(f"[!] Dataset not found at {DATASET_PATH}")
        return

    df = pd.read_csv(DATASET_PATH)
    if df.shape[0] < 2:
        print("[!] Not enough data to train. Add more samples.")
        return

    X = df.drop("label", axis=1)
    y = df["label"]

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

    clf = RandomForestClassifier(n_estimators=100, random_state=42)
    clf.fit(X_train, y_train)

    acc = clf.score(X_test, y_test)
    print(f"[✓] Model trained. Accuracy: {acc * 100:.2f}%")

    joblib.dump(clf, MODEL_PATH)
    print(f"[💾] Model saved to {MODEL_PATH}")


if __name__ == "__main__":
    train()
