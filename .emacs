(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

(require 'helm-config)
(helm-mode 1)

(dumb-jump-mode t)

(projectile-mode)
;; (setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)
(helm-projectile-on)

(require 'neotree)

(require 'all-the-icons)

(require 'indent-guide)

(setq  x-meta-keysym 'super
       x-super-keysym 'meta)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'text-mode-hook 'indent-guide-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
(eval-after-load "anaconda-mode"
		 '(progn
		 	(define-key anaconda-mode-map (kbd "M-.") 'anaconda-mode-find-definitions)
		 	(define-key anaconda-mode-map (kbd "M-,") 'anaconda-mode-go-back)
		 	(define-key anaconda-mode-map (kbd "M-/") 'anaconda-mode-find-assignments)))

(add-hook 'python-mode-hook
    (lambda () (setq python-indent-offset 4)))

(defadvice evil-inner-word (around eiw-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
(defadvice evil-forward-word-end (around evil-forward-word-end-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
(defadvice evil-backward-word-begin (around evil-backward-‌​word-begin-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
(defadvice evil-forward-word-begin (around evil-forward-word-begin-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
(defadvice evil-backward-word-end (around evil-backward-word-end-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
(defadvice evil-a-word (around evil-a-word-underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-M-r") 'dumb-jump-go-prompt)

(global-set-key [f8] 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(setq neo-smart-open t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(load-theme 'monokai t)
(global-linum-mode t)

(menu-bar-showhide-tool-bar-menu-customize-disable)
(setq inhibit-startup-screen t)
(setq column-number-mode t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
