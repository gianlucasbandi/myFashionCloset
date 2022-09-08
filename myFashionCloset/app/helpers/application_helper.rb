module ApplicationHelper

    def flash_class(level)              #Used to get bootstrap alert class from flash alert class
        bootstrap_alert_class = {
          "success" => "alert-success",
          "error" => "alert-danger",
          "notice" => "alert-info",
          "alert" => "alert-danger",
          "warn" => "alert-warning"
        }
        bootstrap_alert_class[level]
      end

end
