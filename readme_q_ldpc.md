# Quantum LDPC Codes via Asymmetric Product Constructions

> **End‑to‑end research prototype — theory ⇄ simulation ⇄ analysis**\
> Developed by **Baset Veisy** (2025) as part of the Quantum Error‑Correction research track.

&#x20;&#x20;

---

## 🚀 Executive summary

This repository distils my latest work on **Quantum LDPC code** design based on an **asymmetric CSS product** of a repetition code and a single‑parity‑check (SPC) code.\
Key achievements:

- **Novel family of [[n², k, d]] CSS codes** built from ⊗‑products of the parity‑check matrices (PCMs) 𝐴 (repetition) and 𝐵 (SPC).
- **Systematic puncturing strategy** that raises the encoding rate while preserving impressive Z‑distance *d*Z ≈ *n*.
- **Tight analytic & numerical bounds** on minimum distance after row deletions, verified up to *n* = 8 using a custom **Simulated Annealing** search.
- Formal conjectures on scaling laws: *d*Z(n) ≈ ⌊n⁄2⌋² for one‑row deletions and O(n²) for carefully chosen O(1) deletions.

The full 25‑page report lives in [`paper/Quantum_LDPC_report.pdf`](paper/Quantum_LDPC_report.pdf).

---

## 📂 Repository layout

```
quantum-ldpc/
├── paper/                 # Peer‑review‑ready report (LaTeX → PDF)
├── matlab/                # Matlab scripts for distance computation & SA optimiser
├── data/                  # Pre‑computed PCM matrices & distance tables (.mat)
└── notebooks/             # Jupyter sanity‑checks & visualisations
```

| Path         | Highlight                                                      | Technologies                   |
| ------------ | -------------------------------------------------------------- | ------------------------------ |
| `paper/`     | 25‑page LaTeX report with proofs, tables & figures             | **LaTeX**, TikZ, Biber         |
| `matlab/`    | Exhaustive search & **Simulated Annealing** distance optimiser | MATLAB, GF(2) linear algebra   |
| `notebooks/` | Interactive demos of PCM structure & syndrome statistics       | **Python** (NumPy, Matplotlib) |

---

## 🔬 Theory in a nutshell

1. **Base codes:**\
   • 𝐴 = [n, 1, n] repetition (odd weight rows)\
   • 𝐵 = [n, n‑1, 2] single‑parity‑check (even weight rows)
2. **CSS construction:** 𝐴 ⊗ 𝐴 → 𝐻X, [I ⊗ 𝐵; 𝐵 ⊗ I] → 𝐻Z\
   ⇒ [[n², 0, {δX=4, δZ=n}]].
3. **Rate‑boosting:** delete judicious subsets of 𝐻X rows ("augmentation") while maintaining CSS orthogonality.
4. **Distance analysis:**
   - Single‑row deletion distance *d*Z(n) ≤ ⌊n⁄2⌋² (proved for n≤7, conjectured general).
   - Multi‑row deletions follow symmetry & neighbour‑avoidance rules (see §2 of the report).
5. **Scalability:** evidence that O(1) deletions can yield O(n²) distance ⇒ **quantum‑LDPC scaling**.

---

## 📊 Reproducing the numbers

```bash
# Clone & enter
git clone https://github.com/BasetV/quantum-ldpc.git
cd quantum-ldpc

# MATLAB workflow (distance calculation for n=6)
matlab -batch "run('matlab/run_distance_n6.m')"

# Python notebook quick‑look
pip install -r notebooks/requirements.txt
jupyter lab notebooks/PCM_visualisation.ipynb
```

Hardware notes: exhaustive distance search beyond n=7 requires > 32 GB RAM; for n=8 we default to the Simulated Annealing heuristic (runtime ≈ 4 h on M1 Air).

---

## 🛣️ Future directions

- Implement **belief‑propagation decoding** tailored to the punctured PCM.
- Port SA distance search to C++/OpenMP for n > 10.
- Explore d‑fold product generalisation hinted in §1 of the report.

PRs & discussions welcome — let’s push Quantum LDPC codes to fault‑tolerant reality! ⚛️

---

## 📜 License

Released under the **MIT License** (see `LICENSE`). You’re free to use, modify & cite — a note of attribution is appreciated.

---

## 👋 About the author

I’m **Baset Veisy**, a physics‑to‑quantum‑software convert passionate about bridging abstract QEC theory and real‑world quantum devices.\
Let’s connect on [LinkedIn](https://linkedin.com/in/basetveisy) or discuss ideas via [GitHub Issues](https://github.com/BasetV/quantum-ldpc/issues).

