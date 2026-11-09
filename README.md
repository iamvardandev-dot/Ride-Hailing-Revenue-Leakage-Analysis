# Ride-Hailing Operations & Friction Analysis

**Scope:** Analyzed 148.8K unique ride requests and ₹47.26M in captured revenue.

### ⚠️ The Problem
The platform is losing 38% of its pipeline. The overall completion rate is stuck at 62%.

### 🔍 The Data
Cancellations spike aggressively at 18:00. The data proves drivers are accepting rides, realizing the payment method isn't their preference, and immediately dropping them. **27K rides were cancelled by drivers before a payment method was even assigned.**

### 🚨 The Loophole
Drivers are dodging app penalties by randomly mashing cancellation excuses. This is proven by a highly suspicious, perfectly even ~25% split across all four customer-blame categories. 

### 💡 The Fix
Lock the cancellation menu post-acceptance, or implement strict algorithmic penalties for drivers dropping digital-payment rides during the 6 PM evening commute.

---
*Dashboard PDF, Python cleaning scripts, and SQL exploration queries are included in this repository.*
