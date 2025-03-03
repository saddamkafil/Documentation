# **Essential tmux Commands Cheat Sheet**

## **🌟 Basic tmux Commands**
| Action | Command |
|--------|---------|
| **Start a new session** | `tmux new -s mysession` |
| **List all sessions** | `tmux list-sessions` or `tmux ls` |
| **Attach to an existing session** | `tmux attach -t mysession` or `tmux a -t mysession` |
| **Detach from a session** | `Ctrl + B`, then `D` |
| **Kill a session** | `tmux kill-session -t mysession` |
| **Kill all sessions** | `tmux kill-server` |
| **Rename a session** | `tmux rename-session -t oldname newname` |

---

## **🖥️ Pane Management (Splitting Windows)**
| Action | Command |
|--------|---------|
| **Split horizontally** | `Ctrl + B`, then `%` |
| **Split vertically** | `Ctrl + B`, then `"` |
| **Switch between panes** | `Ctrl + B`, then Arrow Keys |
| **Swap panes** | `Ctrl + B`, then `Ctrl + O` |
| **Resize pane (manual)** | `Ctrl + B`, then `Alt + Arrow Keys` |
| **Equalize pane sizes** | `Ctrl + B`, then `Space` |
| **Close a pane** | `Ctrl + B`, then `X` (confirm with `Y`) |

---

## **🪟 Window Management (Multiple Tabs)**
| Action | Command |
|--------|---------|
| **Create a new window** | `Ctrl + B`, then `C` |
| **List windows** | `Ctrl + B`, then `W` |
| **Switch between windows** | `Ctrl + B`, then `N` (next) / `P` (previous) |
| **Rename window** | `Ctrl + B`, then `,` (comma) |
| **Close current window** | `Ctrl + B`, then `&` |

---

## **📌 Session Management (Multiple Workspaces)**
| Action | Command |
|--------|---------|
| **Detach from a session** | `Ctrl + B`, then `D` |
| **Reattach to last session** | `tmux attach` |
| **Reattach to a specific session** | `tmux attach -t mysession` |
| **Move window to another session** | `tmux move-window -s 1 -t mysession` |

---

## **🔧 Useful tmux Tricks**
| Trick | Command |
|-------|---------|
| **Scroll inside a pane** | `Ctrl + B`, then `[` (use Arrow Keys to scroll) |
| **Copy text in tmux** | `Ctrl + B`, then `[` (scroll mode) → `Space` (start selection) → `Enter` (copy) |
| **Paste copied text** | `Ctrl + B`, then `]` |
| **Synchronize input across all panes** | `Ctrl + B`, then `:` → `setw synchronize-panes on` |

---

## **🔥 Bonus: Start tmux with a Preconfigured Layout**
If you always work with the same layout, save it as a script:

```bash
tmux new-session -d -s work
tmux split-window -h -t work
tmux split-window -v -t work:0.0
tmux split-window -v -t work:0.1
tmux select-layout -t work tiled
tmux attach -t work
```

Save it as `start_tmux.sh` and run:
```bash
chmod +x start_tmux.sh
./start_tmux.sh
```

---

These **tmux commands** will boost your efficiency 🚀! Let me know if you need more customization tips. 🎯

