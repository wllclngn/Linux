;;; terminal-theme.el // terminal (v1.0), a vintage theme for GNU Emacs
;; Copyright 2018: wllclngn (https://github.com/wllclngn/GNUmacs-Themes/blob/master/terminal-theme.el)
;; Copyright 2012-2015: Nicholas M. Van Horn (https://github.com/n3mo/cyberpunk-theme.el)

;; QUOTE:
;; "Things aren't different. Things are things," 'Neuromancer,' William Gibson.

;; STATEMENT:
;; terminal theme is a fork of Nicholas M. Van Horn's Cyberpunk Theme.
;; As with the original, terminal is designed for use with deftheme in
;; iterations of GNU Emacs 24.1+. It is a stripped down (perhaps overly
;; simplified) fork which runs off Cyberpunk's original core w/ the aim
;; of coloring all text and UI as if it were an old-school terminal.

;; GNU GENERAL PUBLIC LICENSE:
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

(deftheme terminal "terminal, a scifi theme for GNU Emacs")

(defcustom terminal-transparent-background nil
  "Make transparent background in terminal. (Workaround)")
(let ((class '((class color) (min-colors 32)))
      ;; terminal palette
      (terminal-fg "#2FFFA5") ;; TERMINAL COLOR
      (terminal-bg-and-modeline "#090909") ;; BACKGROUND & FORE' MODELINE
      )
  
 (custom-theme-set-faces
   'terminal
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,terminal-fg :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,terminal-fg :underline t :weight normal))))
   `(blue ((,class (:foreground ,terminal-fg))))
   `(bold ((,class (:bold t))))
   `(border-glyph ((,class (nil))))
   `(buffers-tab ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))

   ;;; basic coloring
   `(default ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(cursor ((,class (:background ,terminal-fg))))
   `(escape-glyph-face ((,class (:foreground ,terminal-fg))))
   ;; `(fringe ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(header-line ((,class (:foreground ,terminal-fg
                                       :background ,terminal-fg
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,terminal-fg))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,terminal-fg))))
   `(compilation-enter-directory-face ((,class (:foreground ,terminal-fg))))
   `(compilation-error-face ((,class (:foreground ,terminal-fg :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,terminal-fg))))
   `(compilation-info-face ((,class (:foreground ,terminal-fg))))
   `(compilation-info ((,class (:foreground ,terminal-fg :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,terminal-fg))))
   `(compilation-line-face ((,class (:foreground ,terminal-fg))))
   `(compilation-line-number ((,class (:foreground ,terminal-fg))))
   `(compilation-message-face ((,class (:foreground ,terminal-fg))))
   `(compilation-warning-face ((,class (:foreground ,terminal-fg :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(grep-error-face ((,class (:foreground ,terminal-fg :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(grep-match-face ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(match ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))


   ;;; multiple-cursors
   `(mc/cursor-face ((,class (:inverse-video nil, :background ,terminal-fg :foreground ,terminal-bg-and-modeline))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(isearch-fail ((,class (:background ,terminal-fg))))
   
   `(lazy-highlight ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(query-replace ((,class (:background ,terminal-fg))))
   `(Highline-face ((,class (:background ,terminal-fg))))
   `(left-margin ((,class (nil))))
   `(toolbar ((,class (nil))))
   `(text-cursor ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))

   `(menu ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(minibuffer-prompt ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   ;;; mode-line
   `(mode-line
     ((,class (:foreground ,terminal-bg-and-modeline
                           :background ,terminal-fg
                           :box (:line-width -1 :color ,terminal-fg)))))
   ;; `(mode-line-buffer-id ((,class (:foreground ,terminal-fg :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,terminal-bg-and-modeline
                           :background ,terminal-fg
                           :box (:line-width -1 :color ,terminal-fg)))))
   `(region ((,class (:background ,terminal-fg))))
   `(secondary-selection ((,class (:background ,terminal-fg))))
   `(trailing-whitespace ((,class (:background ,terminal-fg))))
   `(vertical-border ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-comment-face ((,class (:foreground ,terminal-fg :italic t))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,terminal-fg)))) 
   `(font-lock-constant-face ((,class (:foreground ,terminal-fg))))
   ;; `(font-lock-doc-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-doc-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-function-name-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-keyword-face ((,class (:foreground ,terminal-fg))))
   ;; `(font-lock-negation-char-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-string-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-type-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-variable-name-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-warning-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-reference-face ((,class (:foreground ,terminal-fg))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,terminal-fg))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,terminal-fg))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   `(gui-element ((,class (:background ,terminal-fg :foreground ,terminal-fg))))

   ;;; newsticker
   ;; These are currently placeholders that probably look terrible.
   ;; Someone who uses newsticker is welcome to change these
   `(newsticker-date-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-default-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-enclosure-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-extra-face ((,class (:foreground ,terminal-fg :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-immortal-item-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-new-item-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-old-item-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-statistics-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-new-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-old-face ((,class (:foreground ,terminal-fg))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,terminal-fg))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,terminal-fg))))
   `(ack-file ((,class (:foreground ,terminal-fg))))
   `(ack-line ((,class (:foreground ,terminal-fg))))
   `(ack-match ((,class (:foreground ,terminal-fg :background ,terminal-fg :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,terminal-fg :weight bold))))
   `(font-latex-string ((,class (:foreground ,terminal-fg))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
   `(font-latex-sectioning-0 ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :scale 1.5))))
   `(font-latex-sectioning-1 ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :scale 1.5))))

   ;; auto-complete
   `(ac-completion-face ((,class (:background ,terminal-fg :underline t))))
   `(ac-candidate-face ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))
   `(ac-selection-face ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))
   `(popup-tip-face ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,terminal-bg-and-modeline))))
   `(popup-scroll-bar-background-face ((,class (:background ,terminal-fg))))
   `(popup-isearch-match ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))

   `(window-number-face ((,class (:background ,terminal-fg :foreground ,terminal-fg))))

   ;; company-mode
   `(company-tooltip ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(company-tooltip-common ((,class (:inherit company-tooltip :foreground ,terminal-fg))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :foreground ,terminal-fg))))
   `(company-tooltip-selection ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(company-tooltip-annotation ((,class (:inherit company-tooltip :foreground ,terminal-bg-and-modeline))))
   `(company-scrollbar-fg ((,class (:background ,terminal-bg-and-modeline))))
   `(company-scrollbar-bg ((,class (:background ,terminal-fg))))
   `(company-preview ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(company-preview-common ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   
   ;; diff
   `(diff-added ((,class (:foreground ,terminal-fg))))
   `(diff-changed ((,class (:foreground ,terminal-fg))))
   `(diff-removed ((,class (:foreground ,terminal-fg))))
   `(diff-header ((,class (:background ,terminal-fg))))
   `(diff-file-header ((,class (:background ,terminal-fg :foreground ,terminal-fg :bold t))))

   ;; ediff
   `(ediff-current-diff-Ancestor ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-current-diff-A ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-current-diff-B ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-current-diff-C ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-even-diff-Ancestor ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-even-diff-A ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-even-diff-B ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-even-diff-C ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(ediff-fine-diff-Ancestor ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-fine-diff-A ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-fine-diff-B ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-fine-diff-C ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-odd-diff-Ancestor ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-odd-diff-A ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-odd-diff-B ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(ediff-odd-diff-C ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(ert-test-result-unexpected ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,terminal-fg :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,terminal-fg :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,terminal-fg :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,terminal-fg :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,terminal-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,terminal-fg :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,terminal-fg :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,terminal-fg :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,terminal-fg :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,terminal-fg :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,terminal-fg :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,terminal-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,terminal-fg))))
   `(erc-keyword-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,terminal-fg :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,terminal-fg))))
   `(erc-pal-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,terminal-fg))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-high-ancient ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-high-read ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-low-read ((t (:foreground ,terminal-fg))))
   `(gnus-summary-low-ticked ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-normal-read ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,terminal-fg))))
   `(gnus-summary-selected ((,class (:foreground ,terminal-fg :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-10 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-11 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-2 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-3 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-4 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-5 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-6 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-7 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-8 ((,class (:foreground ,terminal-fg))))
   `(gnus-cite-9 ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-1-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-2-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-3-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-4-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-5-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-6-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-group-news-low-empty ((,class (:foreground ,terminal-fg))))
   `(gnus-signature ((,class (:foreground ,terminal-fg))))
   `(gnus-x ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,terminal-fg
                           :background ,terminal-bg-and-modeline
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,terminal-fg
                           :background ,terminal-fg
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,terminal-fg :underline nil))))
   `(helm-selection-line ((,class (:background ,terminal-fg))))
   `(helm-visible-mark ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))
   `(helm-candidate-number ((,class (:foreground ,terminal-fg :background ,terminal-fg))))

   ;; hl-line-mode
   `(hl-sexp-face ((,class (:background ,terminal-fg))))
   `(hl-line-face ((,class (:background ,terminal-fg))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(ido-only-match ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(ido-subdir ((,class (:foreground ,terminal-fg :backgroun ,terminal-bg-and-modeline))))
   `(ido-indicator ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,terminal-fg))))
   `(js2-error-face ((,class (:foreground ,terminal-fg :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,terminal-fg))))
   `(js2-jsdoc-type-face ((,class (:foreground ,terminal-fg))))
   `(js2-jsdoc-value-face ((,class (:foreground ,terminal-fg))))
   `(js2-function-param-face ((,class (:foreground ,terminal-fg))))
   `(js2-external-variable-face ((,class (:foreground ,terminal-fg))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,terminal-fg))))
   `(jabber-roster-user-online ((,class (:foreground ,terminal-fg))))
   `(jabber-roster-user-dnd ((,class (:foreground ,terminal-fg))))
   `(jabber-rare-time-face ((,class (:foreground ,terminal-fg))))
   `(jabber-chat-prompt-local ((,class (:foreground ,terminal-fg))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,terminal-fg))))
   `(jabber-activity-face((,class (:foreground ,terminal-fg))))
   `(jabber-activity-personal-face ((,class (:foreground ,terminal-fg))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))

   ;;linum-relative
   `(linum-relative-current-face ((,class (:inherit linum :foreground ,terminal-fg :weight bold))))

   ;; magit
   ;; magit headings and diffs
   `(magit-section-highlight ((t (:background ,terminal-fg))))
   `(magit-section-heading ((t (:foreground ,terminal-fg :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,terminal-fg :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,terminal-fg  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,terminal-fg
                                            :foreground ,terminal-fg :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,terminal-bg-and-modeline))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,terminal-fg))))
   `(magit-diff-hunk-heading-selection ((t (:background ,terminal-fg
                                            :foreground ,terminal-fg))))
   `(magit-diff-lines-heading          ((t (:background ,terminal-fg
                                            :foreground ,terminal-fg))))
   `(magit-diff-added                  ((t (:foreground ,terminal-fg))))
   `(magit-diff-added-highlight        ((t (:inherit magit-diff-added :weight bold))))
   `(magit-diff-removed                ((t (:foreground ,terminal-fg))))
   `(magit-diff-removed-highlight      ((t (:inherit magit-diff-removed :weight bold))))
   `(magit-diff-context                ((t (:foreground ,terminal-fg))))
   `(magit-diff-context-highlight      ((t (:inherit magit-diff-context :weight bold))))
   `(magit-diffstat-added   ((t (:inherit magit-diff-added))))
   `(magit-diffstat-removed ((t (:inherit magit-diff-removed))))
   ;; magit popup
   `(magit-popup-heading             ((t (:foreground ,terminal-fg  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,terminal-fg :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,terminal-fg   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,terminal-fg    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,terminal-fg  :weight bold))))
   ;; ;; magit process
   `(magit-process-ok    ((t (:foreground ,terminal-fg  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,terminal-fg    :weight bold))))
   ;; ;; magit log
   `(magit-log-author    ((t (:foreground ,terminal-fg))))
   `(magit-log-date      ((t (:foreground ,terminal-fg))))
   `(magit-log-graph     ((t (:foreground ,terminal-fg))))
   ;; ;; magit sequence
   `(magit-sequence-pick ((t (:foreground ,terminal-fg))))
   `(magit-sequence-stop ((t (:foreground ,terminal-fg))))
   `(magit-sequence-part ((t (:foreground ,terminal-fg))))
   `(magit-sequence-head ((t (:foreground ,terminal-fg))))
   `(magit-sequence-drop ((t (:foreground ,terminal-fg))))
   `(magit-sequence-done ((t (:foreground ,terminal-fg))))
   `(magit-sequence-onto ((t (:foreground ,terminal-fg))))
   ;; ;; magit bisect
   `(magit-bisect-good ((t (:foreground ,terminal-fg))))
   `(magit-bisect-skip ((t (:foreground ,terminal-fg))))
   `(magit-bisect-bad  ((t (:foreground ,terminal-fg))))
   ;; ;; magit blame
   `(magit-blame-heading ((t (:background ,terminal-fg :foreground ,terminal-fg))))
   `(magit-blame-hash    ((t (:background ,terminal-fg :foreground ,terminal-fg))))
   `(magit-blame-name    ((t (:background ,terminal-fg :foreground ,terminal-fg))))
   `(magit-blame-date    ((t (:background ,terminal-fg :foreground ,terminal-fg))))
   `(magit-blame-summary ((t (:background ,terminal-fg :foreground ,terminal-fg
                                          :weight bold))))
   ;; ;; magit references etc
   `(magit-dimmed         ((t (:foreground ,terminal-fg))))
   `(magit-hash           ((t (:foreground ,terminal-fg))))
   `(magit-tag            ((t (:foreground ,terminal-fg :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,terminal-fg  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,terminal-fg   :weight bold))))
   `(magit-branch-current ((t (:foreground ,terminal-fg   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,terminal-fg   :weight bold))))
   `(magit-refname        ((t (:background ,terminal-fg :foreground ,terminal-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,terminal-fg :foreground ,terminal-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,terminal-fg :foreground ,terminal-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,terminal-fg))))
   `(magit-signature-bad       ((t (:foreground ,terminal-fg))))
   `(magit-signature-untrusted ((t (:foreground ,terminal-fg))))
   `(magit-cherry-unmatched    ((t (:foreground ,terminal-fg))))
   `(magit-cherry-equivalent   ((t (:foreground ,terminal-fg))))
   `(magit-reflog-commit       ((t (:foreground ,terminal-fg))))
   `(magit-reflog-amend        ((t (:foreground ,terminal-fg))))
   `(magit-reflog-merge        ((t (:foreground ,terminal-fg))))
   `(magit-reflog-checkout     ((t (:foreground ,terminal-fg))))
   `(magit-reflog-reset        ((t (:foreground ,terminal-fg))))
   `(magit-reflog-rebase       ((t (:foreground ,terminal-fg))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,terminal-fg))))
   `(magit-reflog-remote       ((t (:foreground ,terminal-fg))))
   `(magit-reflog-other        ((t (:foreground ,terminal-fg))))
   
   `(eval-sexp-fu-flash ((,class (:background ,terminal-fg :foreground ,terminal-fg))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,terminal-fg))))
   `(message-header-other ((,class (:foreground ,terminal-fg))))
   `(message-header-to ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-header-from ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-header-cc ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-header-subject ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-header-xheader ((,class (:foreground ,terminal-fg))))
   `(message-mml ((,class (:foreground ,terminal-fg :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-from ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-date ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-to ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-key ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-private ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-important ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-marginal ((,class (:foreground ,terminal-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-xmew ((,class (:foreground ,terminal-fg))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-url ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-comment ((,class (:foreground ,terminal-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-cite2 ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-cite3 ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-cite4 ((,class (:foreground ,terminal-fg))))
   `(mew-face-body-cite5 ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-review ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-escape ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-delete ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-unlink ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-refile ((,class (:foreground ,terminal-fg))))
   `(mew-face-mark-unread ((,class (:foreground ,terminal-fg))))
   `(mew-face-eof-message ((,class (:foreground ,terminal-fg))))
   `(mew-face-eof-part ((,class (:foreground ,terminal-fg))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg :weight bold))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,terminal-fg))))
   `(nav-face-button-num ((,class (:foreground ,terminal-fg))))
   `(nav-face-dir ((,class (:foreground ,terminal-fg))))
   `(nav-face-hdir ((,class (:foreground ,terminal-fg))))
   `(nav-face-file ((,class (:foreground ,terminal-fg))))
   `(nav-face-hfile ((,class (:foreground ,terminal-fg))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background ,terminal-bg-and-modeline))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,terminal-bg-and-modeline))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,terminal-fg))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,terminal-fg))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,terminal-fg))))

   ;; org-mode
   `(org-document-title ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :weight bold :height 1.5))))
   `(org-document-info ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline :weight bold))))
   `(org-document-info-keyword ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(org-agenda-date-today
     ((,class (:foreground ,terminal-fg :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,terminal-fg :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,terminal-fg
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :foreground ,terminal-fg :weight bold
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,terminal-fg :height 1.3))))
   `(org-level-2 ((,class (:foreground ,terminal-fg :height 1.2))))
   `(org-level-3 ((,class (:foreground ,terminal-fg :height 1.1))))
   `(org-level-4 ((,class (:foreground ,terminal-fg))))
   `(org-level-5 ((,class (:foreground ,terminal-fg))))
   `(org-level-6 ((,class (:foreground ,terminal-fg))))
   `(org-level-7 ((,class (:foreground ,terminal-fg))))
   `(org-level-8 ((,class (:foreground ,terminal-fg))))
   `(org-link ((,class (:foreground ,terminal-fg :underline t))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-column ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))
   `(org-column-title ((,class (:background ,terminal-fg :underline t :weight bold))))
   `(org-block ((,class (:foreground ,terminal-fg :background ,terminal-fg))))
   `(org-block-begin-line 
     ((,class (:foreground "#008ED1" :background ,terminal-fg))))
   `(org-block-background ((,class (:background ,terminal-fg))))
   `(org-block-end-line 
     ((,class (:foreground "#008ED1" :background ,terminal-fg))))

   ;; `(org-deadline-announce ((,class (:foreground ,terminal-fg))))
   ;; `(org-scheduled ((,class (:foreground ,terminal-fg))))
   ;; `(org-scheduled-previously ((,class (:foreground ,terminal-fg))))
   ;; `(org-scheduled-today ((,class (:foreground ,terminal-fg))))
   ;; `(org-special-keyword ((,class (:foreground ,terminal-fg))))
   ;; `(org-table ((,class (:foreground ,terminal-fg))))
   ;; `(org-time-grid ((,class (:foreground ,terminal-fg))))
   ;; `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   ;; `(org-warning ((,class (:bold t :foreground ,terminal-fg :weight bold :underline nil))))
   ;; `(org-formula ((,class (:foreground ,terminal-fg))))
   ;; `(org-headline-done ((,class (:foreground ,terminal-fg))))
   ;; `(org-hide ((,class (:foreground ,terminal-fg))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,terminal-fg))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,terminal-fg))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-doc-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-ghost-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-macro-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-package-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-section-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-tag-face ((,class (:foreground ,terminal-fg))))
   `(rpm-spec-var-face ((,class (:foreground ,terminal-fg))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,terminal-fg))))
   `(rst-level-2-face ((,class (:foreground ,terminal-fg))))
   `(rst-level-3-face ((,class (:foreground ,terminal-fg))))
   `(rst-level-4-face ((,class (:foreground ,terminal-fg))))
   `(rst-level-5-face ((,class (:foreground ,terminal-fg))))
   `(rst-level-6-face ((,class (:foreground ,terminal-fg))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(show-paren-match ((,class (:foreground ,terminal-bg-and-modeline :background ,terminal-fg))))

   `(naeu-green-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(naeu-pink-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(naeu-blue-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(naeu-orange-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(naeu-red-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(naeu-grey-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,terminal-fg))))

  ;;; ansi-term
   `(term-color-black ((,class (:foreground ,terminal-bg-and-modeline
                                            :background ,terminal-fg))))
   `(term-color-red ((,class (:foreground ,terminal-fg
                                          :background ,terminal-fg))))
   `(term-color-green ((,class (:foreground ,terminal-fg
                                            :background ,terminal-fg))))
   `(term-color-yellow ((,class (:foreground ,terminal-fg
                                             :background ,terminal-fg))))
   `(term-color-blue ((,class (:foreground ,terminal-fg
                                           :background ,terminal-fg))))
   `(term-color-magenta ((,class (:foreground ,terminal-fg
                                              :background ,terminal-fg))))
   `(term-color-cyan ((,class (:foreground ,terminal-fg
                                           :background ,terminal-fg))))
   `(term-color-white ((,class (:foreground ,terminal-fg
                                            :background ,terminal-fg))))
   `(term-default-fg-color ((,class (:inherit term-color-white))))
   `(term-default-bg-color ((,class (:inherit term-color-black))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,terminal-fg))))

   `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))
   `(whitespace-hspace ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))
   `(whitespace-tab ((,class (:background ,terminal-bg-and-modeline :foreground ,terminal-fg))))
   `(whitespace-newline ((,class (:foreground ,terminal-fg))))
   `(whitespace-trailing ((,class (:foreground ,terminal-fg :background ,terminal-bg-and-modeline))))
   `(whitespace-line ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(whitespace-space-before-tab ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(whitespace-indentation ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(whitespace-empty ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   `(whitespace-space-after-tab ((,class (:background ,terminal-fg :foreground ,terminal-fg))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-signature ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,terminal-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,terminal-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,terminal-fg))))

   ;; yasnippet
   `(yas/field-highlight-face ((,class (:background ,terminal-fg :foreground ,terminal-bg-and-modeline))))

   ;; enh-ruby-mode enh-ruby-op-face
   `(enh-ruby-op-face ((,class (:foreground ,terminal-fg))))
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,terminal-fg))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground ,terminal-fg))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,terminal-fg))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,terminal-fg))))
   `(yascroll:thumb-fringe ((,class (:background ,terminal-fg :foreground ,terminal-fg))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'terminal
   `(ansi-color-names-vector [,terminal-bg-and-modeline ,terminal-fg ,terminal-fg ,terminal-fg
                                          ,terminal-fg ,terminal-fg ,terminal-fg ,terminal-fg])
   ;; fill-column-indicator
   `(fci-rule-color ,terminal-fg)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'terminal)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; terminal-theme.el ends here.
