module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - Combee"
    else 
      "Combee"
    end
  end
end
