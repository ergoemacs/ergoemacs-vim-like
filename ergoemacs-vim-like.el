;;; ergoemacs-vim-like.el --- VIM-like theme for ergoemacs-mode
;; 
;; Filename: ergoemacs-vim-like.el
;; Description: 
;; Author: Matthew L. Fidler
;; Maintainer: 
;; Created: Thu Oct 24 12:06:20 2013 (-0500)
;; Version: 
;; Package-Requires: ((ergoemacs-mode "5.7"))
;; Last-Updated: 
;;           By: 
;;     Update #: 0
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;; Features that might be required by this library:
;;
;;   None
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:
;;(require 'ergoemacs-mode)


;; Viper/Evil compatability layers for ex emulation.
;; Use their functions when available???

(require 'viper nil t)
(require 'evil nil t)

(defun ergoemacs-vim-append (&optonal arg)
  "Call end-of-line then append."
  (interactive "P")
  (call-interactively 'move-end-of-line)
  (ergoemacs-toggle-full-alt))

(defun ergoemacs-vim-replace ()
  "Enter into ergoemacs-vim relpace mode."
  (interactive)
  (ergoemacs-toggle-full-alt)
  (overwrite-mode 1))

(ergoemacs-theme-component vim-movement ()
  "Vim movement commands."
  (global-set-key (kbd "M-h") 'backward-char)
  (global-set-key (kbd "M-j") 'next-char)
  (global-set-key (kbd "M-k") 'previous-line)
  (global-set-key (kbd "M-l") 'forward-char))

(ergoemacs-deftheme vim-like
  "Keys similar to Vim"
  nil 
  ;; Vi Lesson #1.
  ;; http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.HTML
  (ergoemacs-key "M-h" 'backward-char "← char")
  (ergoemacs-key "M-j" 'next-line "↓ line")
  (ergoemacs-key "M-k" 'previous-line "↑ line")
  (ergoemacs-key "M-l" 'forward-char "→ char")

  ;; Entering Editing mode
  (ergoemacs-key "M-i" 'ergoemacs-toggle-full-alt "Alt+")
  (ergoemacs-key "M-A" 'ergoemacs-vim-append "Append")
  (ergoemacs-key "M-R" 'ergoemacs-vim-replace "Overwrite")
  
  (ergoemacs-key "M-u" 'undo "Undo")
  ;; C-R is redo...
  (ergoemacs-key "M-X" 'delete-backward-char "⌫ char")
  (ergoemacs-key "M-x" 'delete-char "⌦ char")
  (ergoemacs-key "M-$" 'ergoemacs-end-of-line-or-what "→ line/*")
  (ergoemacs-key "M-^" 'ergoemacs-beginning-of-line-or-what "← line/*")
  (ergoemacs-key "M-0" 'beginning-of-line "← line")

  ;; word and WORD....
  (ergoemacs-key "M-w" 'right-word "→ word")
  ;; (ergoemacs-key "M-e")  End word...?
  (ergoemacs-key "M-b" 'left-word "← word") ;; prev word

  (ergoemacs-key "M-:" '(evil-ex viper-ex) ":") ;; Use evil
  (ergoemacs-key "M-/" '(isearch-forward) "Search")

  
  ;; Vi Lesson #2.
  (ergoemacs-key "M-v" 'set-mark-command "Set Mark")
  (ergoemacs-key "M-." 'repeat  "Repeat")
  
  (ergoemacs-key "M-d M-w" 'kill-word "⌦ word")
  (ergoemacs-key "M-d M-b" 'backward-kill-word "⌦ word")
  
  (ergoemacs-key "M-d M-h" 'delete-backward-char "⌫ char")
  (ergoemacs-key "M-d M-l" 'delete-char "⌦ char")
  (ergoemacs-key "M-~" 'ergoemacs-toggle-case "Case")
  
  (ergoemacs-key "M-<escape>" 'ergoemacs-toggle-full-alt "Alt+"))

(provide 'ergoemacs-vim-like)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ergoemacs-vim-like.el ends here
