#! /usr/bin/clisp

(defun pr(list max)
  (format t "============~%")
  (dotimes (no max)
    (format t "~A~%" (aref list no))))

(defun mid3(x y z)
  (if (< x y)
      (cond
       ((< y z) y)
       ((< z x) x)
       (t z))
    (cond
     ((< z y) y)
     ((< x z) x)
     (t z))))

(defun mysort(list s e)
;;  (setq target (elt list s))
    (setq target (aref list (+ s (floor (/ (- e s) 2)))))
;;  (setq target (mid3 (aref list s) (aref list (+ s (floor (/ (- e s) 2)))) (aref list e)))
  (setq sp     s)
  (setq ep     e)

  (loop
   (loop
    (if (and (< (aref list sp) target) (< (+ sp 1) ep))
	(setq sp (+ sp 1))
      (return)))
   (loop
    (if (and (>= (aref list ep) target) (< (+ sp 1) ep))
	(setq ep (- ep 1))
      (return)))

   (if (> (aref list sp) (aref list ep))
       (progn
	 (setf tmp (aref list ep))
	 (setf (aref list ep) (aref list sp))
	 (setf (aref list sp) tmp)))

   (if (= (+ sp 1) ep)
       (progn
	 (return))))

  (if (> (- sp s) 0)
      (progn
	(mysort list s sp)))

  (if (> (- e ep) 0)
      (progn
	(mysort list ep e))))

(setq max 100000)
(setq list (make-array max))
(dotimes (no max)
  (setf (aref list no) (- max no)))

;;(pr list max)
(mysort list 0 (- (length list) 1))
;;(pr list max)

