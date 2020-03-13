;;; org-treescope.el --- Time scoping sparse trees within org -*- lexical-binding: t; -*-

;; Copright (C) 2020 Mehmet Tekman <mtekman89@gmail.com>

;; Author: Mehmet Tekman
;; URL: https://github.com/mtekman/org-treescope.el
;; Keywords: outlines
;; Package-Requires: ((emacs "24") (org "9.2.3") (org-ql "0.5-pre") (dash "2.17.0"))
;; Version: 0.3

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;;; Commentary:

;; Navigating through an org file to see what needs to be done
;; this week and what was completed last month can be tricky.
;; This tool provides a time window to analyse your org file.

;;; Code:
(require 'org-ql)

(require 'org-treescope-faces)
(require 'org-treescope-cyclestates)
(require 'org-treescope-calendarranges)
(require 'org-treescope-datehelper)

(defgroup org-treescope nil "org-treescope customisable variables."
  :group 'productivity)

(defcustom org-treescope-userbuffer nil
  "Apply match function to a specific user-defined `org-mode' file.  Cannot be nil otherwise attempts to apply to calendar buffer."
  :type 'string
  :group 'org-treescope)


;;;###autoload
(defun org-treescope ()
  "Reset all variables and center around current date."
  (interactive)
  (setq org-treescope-calendarranges--day--leftflank nil
        org-treescope-calendarranges--day--rightflank nil
        org-treescope-calendarranges--day--frommidpoint-select nil)
  (org-treescope-calendarranges--sensible-values)
  (org-treescope-query-apply-to-buffer))

(provide 'org-treescope)
;;; org-treescope.el ends here
