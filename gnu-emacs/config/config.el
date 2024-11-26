

;; Customizando status de TODO itens



(require 'org-src)
(require 'ob-async)
(require 'ob-jupyter)
(require 'ob-python)
(require 'jupyter)
(require 'jupyter-org-client)
(org-babel-jupyter-aliases-from-kernelspecs)



;; Configurando org-babel
(org-babel-do-load-languages
'org-babel-load-languages
        '((emacs-lisp . t)
          (cpp . t)
          (python . t)
          (ipython . t)
          (jupyter . t)
          (haskell . t)
          (shell . t)))

;; Show syntax highlighting per language native mode in *.org
(setq org-src-fontify-natively t)
;; For languages with significant whitespace like Python:
(setq org-src-preserve-indentation t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
;; Fix an incompatibility between the ob-async and ob-ipython packages
(setq ob-async-no-async-languages-alist '("ipython"))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


(after! (ob-jupyter)
  (org-babel-jupyter-aliases-from-kernelspecs))

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(p)" "BLOCKED(s)" "|" "DONE(d)" "CANCELLED(w)")
          (sequence "AULA" "EVENTO" "TAREFA")
          (sequence "MESA" "PALESTRA" "OFICINA" "MINICURSO")))



;; Customizando estilo (faces) de TODO itens

  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "tomato"))
          ("DOING" . (:foreground "DarkGoldenrod1"))
          ("BLOCKED" . (:foreground "DeepPink1"))
          ("DONE" . (:foreground "SpringGreen1"))
          ("CANCELLED" . (:foreground "SlateGray4")))))

;; Habilitando o módulo de log de hábitos
  (add-to-list 'org-modules 'org-habit t)
  (setq org-log-into-drawer t)
  (setq org-habit-show-all-today t)

;;; Configurações gerais org-mode, org-agenda e org-modern


;; centered and trimmed
(setq visual-fill-column-width 110
      visual-fill-column-center-text t)

(add-hook! org-mode '(org-modern-mode
                      visual-fill-column-mode
                      visual-line-mode
                      (lambda () (display-line-numbers-mode 0))
                      (lambda () (org-fancy-priorities-mode 0))))

;; Habilitando org-modern para org-agenda
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(add-hook! org-mode '(org-modern-mode visual-fill-column-mode))


;;; Definindo configuração básica pro funcionamento do OrgMode
(setq org-log-done "time"
        org-directory "~/org-update/")

;; Mais bonitinho
(setq-default
 org-startup-indented t
 org-use-sub-superscripts "{}"
 org-startup-with-inline-images t
 org-image-actual-width '(300))

(setq visual-fill-column-width 110
      visual-fill-column-center-text t)

;; Um pouco mais bonitinho
(after! org-modern
  (setq
   org-modern-keyword nil
   org-modern-checkbox nil
   org-modern-table nil))

;; O org-agenda monitora recursivamente os arquivos .org do diretório base ~/org/, exceto os do subdiretório /daily/
(setq org-agenda-files
      (seq-filter (lambda(x) (not (string-match "/daily/" (file-name-directory x))))
                (directory-files-recursively "~/org-update/" "\\.org$")))



;; Cria diferentes visualizações no org-agenda e associa bindings a eles
;;
;; os comandos da lista (todo, agenda, search, tags, tags-todo, stuck, etc)
;; varrem os arquivos do seu org-directory buscando por tarefas que atendem
;; aos critérios passados como parâmetro. o entendimento exige alguma leitura
;; da documentação da variável org-agenda-custom-command, mas não muito mais
;; que isso.
;;
;; org-agenda-overriding-header cria
(setq org-agenda-custom-commands

  ;; o comando agenda busca pelas tarefas agendadas pra este dia/semana
'(("w" "Semanal"
        ((agenda "" ((org-agenda-overriding-header "Agenda semanal")
                     (org-deadline-warning-days 10)))
         (todo ""
                ((org-agenda-overriding-header "Entradas não agendadas")
                (org-agenda-skip-function
                '(org-agenda-skip-entry-if 'scheduled 'deadline))))))
  ;; o comando tags busca por tarefas em qualquer status que atendem à query de
  ;; parâmetros solicitada. usar o sinal (+) seleciona as tags desejadas e o de (-)
  ;; exclui tags indesejadas. de tal forma, a busca "+ufrn+atividade-circuitos"
  ;; buscaria pelas tarefas que:
  ;;
  ;; 1. têm a tag ufrn e
  ;; 2. têm a tag atividade e
  ;; 3. não têm a tag circuitos
  ;;
  ("k" "UFRN" tags "+ufrn")
  ;; a query "-{.*}" busca por tarefas no estado TODO que não têm tags associadas
  ("u" "Tarefas sem tag"
        ((tags-todo "-{.*}" ((org-agenda-overriding-header "Tarefas sem tags")))))
  ;; a query com o org-agenda-files busca as tarefas de um arquivo específico
  ("i" "Inbox"
        ((todo ".*" ((org-agenda-files '("~/org-update/inbox.org"))
                     (org-agenda-overriding-header "Arquivos não caracterizados")))))))



;; config org-present mode
(defun rbs/org-present-start ()
  (visual-fill-column-mode 1)
  (visual-line-mode 1)
  (display-line-numbers-mode 0)
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                   (header-line (:height 4.0) variable-pitch)
                                   (org-document-title (:height 1.75) org-document-title)
                                  (org-code (:height 1.55) org-code)
                                   (org-verbatim (:height 1.55) org-verbatim)
                                   (org-block (:height 1.25) org-block)
                                   (org-block-begin-line (:height 0.7) org-block)))

  ;; Install doom-themes
  (unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

  ;; Load up doom-palenight for the System Crafters look
  (load-theme 'doom-palenight t)

  ;; NOTE: These settings might not be ideal for your machine, tweak them as needed!
  (set-face-attribute 'default nil :font "Iosevka" :weight 'semi-light :height 140)
  (set-face-attribute 'fixed-pitch nil :font "Iosevka" :weight 'light :height 140)
  (set-face-attribute 'variable-pitch nil :font "Iosevka Aile" :weight 'light :height 1.15)
  ;; Load org-faces to make sure we can set appropriate faces
  (require 'org-faces)

  ;; Hide emphasis markers on formatted text
  (setq org-hide-emphasis-markers t)

  ;; Resize Org headings
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))

  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :font "Iosevka Aile" :weight 'bold :height 1.22)

  ;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

  ;; Set a blank header line string to create blank space at the top
  (setq header-line-format " ")
  ;; Clear the header line format by setting to `nil'
  (setq header-line-format nil)

  ;; Set bindings for slide cycling

  )


(defun my/org-present-prepare-slide (buffer-name heading)
  ;; Show only top-level headlines
  (org-overview)
  ;; Unfold the current entry
  (org-fold-show-entry)
  ;; Show only direct subheadings of the slide but don't expand them
  (org-fold-show-children))

(add-hook 'org-present-after-navigate-functions 'my/org-present-prepare-slide)



(defun rbs/org-present-end ()
  (visual-line-mode 0)
  (display-line-numbers-mode)
  (setq-local face-remapping-alist '((default variable-pitch default))))

(add-hook 'org-present-mode-hook 'rbs/org-present-start)
(add-hook 'org-present-mode-quit-hook 'rbs/org-present-end)
