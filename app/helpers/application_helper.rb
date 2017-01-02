module ApplicationHelper
    def friendly_date(d)
        d.strtime("%B %e, %Y")
    end
end
