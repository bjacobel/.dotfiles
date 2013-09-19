;;; Modes I want
(ido-mode 1)
(global-auto-revert-mode)


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;;; We define modes for c++, python, and java
(defun robocup-c++-mode ()
  "C++ mode made to fit the way I like it."
  (interactive)
  (c++-mode)
					;(c-subword-mode) ; Uncomment to treat camelText words as separate
  (c-set-style "my-c-style")
  (setq tab-width 4)
  (setq c-basic-offset 4))

(defun robocup-python-mode ()
  (interactive)
  (python-mode)
					;(c-subword-mode) ; Uncomment to treat camelText words as separate
  (setq tab-width 4)
  (setq c-basic-offset 4)
  ;;(when (load "flymake" t)
  ;;  (defun flymake-pyflakes-init ()
  ;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
  ;;			 'flymake-create-temp-inplace))
  ;;	     (local-file (file-relative-name
  ;;			  temp-file
  ;;			  (file-name-directory buffer-file-name))))
  ;;	(list "pyflakes" (list local-file))))
  ;;
  ;;  (add-to-list 'flymake-allowed-file-name-masks
  ;;		 '("\\.py$" flymake-pyflakes-init)))
  ;;
  ;;(add-hook 'find-file-hook 'flymake-find-file-hook))
  )

(defun robocup-java-mode ()
  (interactive)
  (java-mode)
					;(c-subword-mode) ; Uncomment to treat camelText words as separate
  (setq tab-width 4)
  (setq c-basic-offset 4))

;;; We set the robocup modes as default for the appropraite files
;;;
;;; To make this apply only in robocup directories add a path to the settings
;;; i.e. ("~/src/robocup/.*\\.cpp$" . robocup-c++-mode)
(setq auto-mode-alist (append '(("\\.cpp$" . robocup-c++-mode)
				("\\.cc$" . robocup-c++-mode)
				("\\.hpp$" . robocup-c++-mode)
				("\\.h$" . robocup-c++-mode)
				("\\.py$" . robocup-python-mode)
				("\\.java$" . robocup-java-mode)
				) auto-mode-alist))
;;; This makes trailing whitespace be highlighted
(setq-default show-trailing-whitespace t)

;; Highlight lines over 80 characters
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tomorrow-night)))
 '(custom-safe-themes (quote ("0bcc3cee017174dec4f895bc417a9b3fa66748ab504490ae5cba0eaba646c37e" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(inhibit-startup-screen t)
 '(initial-scratch-message (quote "")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; do not make backup files
(setq make-backup-files nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Set up the keyboard so the <delete> key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)


;;save auto-save files in the temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; no tabs?
(setq indent-tabs-mode nil)

(c-add-style "my-c-style"
             '("BSD"
	       (c-offsets-alist .
				((innamespace . 0))
				)))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(set 'temporary-file-directory "/tmp")

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

(setq ring-bell-function #'ignore)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; 2 lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'tomorrow-night)

(tool-bar-mode -1)
