;; Auto-generated. Do not edit!


(when (boundp 'topic_demo::gps)
  (if (not (find-package "TOPIC_DEMO"))
    (make-package "TOPIC_DEMO"))
  (shadow 'gps (find-package "TOPIC_DEMO")))
(unless (find-package "TOPIC_DEMO::GPS")
  (make-package "TOPIC_DEMO::GPS"))

(in-package "ROS")
;;//! \htmlinclude gps.msg.html


(defclass topic_demo::gps
  :super ros::object
  :slots (_state _x _y ))

(defmethod topic_demo::gps
  (:init
   (&key
    ((:state __state) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _state (string __state))
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get topic_demo::gps :md5sum-) "422d8c1acf467b91eec9568156b21cd7")
(setf (get topic_demo::gps :datatype-) "topic_demo/gps")
(setf (get topic_demo::gps :definition-)
      "string state
float32 x
float32 y
")



(provide :topic_demo/gps "422d8c1acf467b91eec9568156b21cd7")


