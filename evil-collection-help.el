;;; evil-collection-help.el --- Evil bindings for help-mode -*- lexical-binding: t -*-

;; Copyright (C) 2017 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <ambrevar@gmail.com>
;; URL: https://github.com/emacs-evil/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: evil, help, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Evil bindings for `help-mode'.

;;; Code:
(require 'evil)
(require 'help-mode)

(declare-function evil-collection-define-key "evil-collection")
(defconst evil-collection-help-maps '(help-mode-map))

(defun evil-collection-help-setup ()
  "Set up `evil' bindings for `help'."
  (evil-set-initial-state 'help-mode 'normal)
  (evil-collection-define-key 'normal 'help-mode-map
    ;; motion
    (kbd "SPC") 'scroll-up-command
    (kbd "S-SPC") 'scroll-down-command
    (kbd "C-f") 'scroll-up-command
    (kbd "C-b") 'scroll-down-command
    (kbd "<tab>") 'forward-button
    (kbd "<backtab>") 'backward-button

    (kbd "C-o") 'help-go-back
    (kbd "C-i") 'help-go-forward

    ;; TODO: Enable more help-go-* bindings?
    ;; "gj" 'help-go-forward
    ;; "gk" 'help-go-back
    ;; "\C-j" 'help-go-forward
    ;; "\C-k" 'help-go-back

    ;; The following bindings don't do what they are supposed to. "go" should open
    ;; in the same window and "gO" should open in a different one.
    "go" 'push-button 
    "gO" 'push-button
    
    "g?" 'describe-mode
    "gr" 'revert-buffer
    "<" 'help-go-back
    ">" 'help-go-forward
    "r" 'help-follow

    ;; quit
    "q" 'quit-window
    "ZQ" 'evil-quit
    "ZZ" 'quit-window))

(provide 'evil-collection-help)
;;; evil-collection-help.el ends here
