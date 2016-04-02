module ApplicationHelper
    def sortable(column, title = nil,admint)
      title ||= column.titleize
    #   css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction, :admin => admint }#, {:class => css_class}
    end
end
