# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  include TagsHelper

Time::DATE_FORMATS[:uk] = "%d-%b-%y %H:%M"
def  button_to_remote(name, options = {}, html_options = {})   
           button_to_function(name, remote_function(options), html_options) 
end 

def snippet(thought, wordcount)
  if thought
   thought.split[0..(wordcount-1)].join(" ") +(thought.split.size > wordcount ? "..." : "")
  end
end

def strip_brackets(str)
  str ||=""
  str.gsub(/[\]\[()]/,"")
end

#jquery.pageless helper
def pageless(total_pages, url=nil)
  opts = {
    :totalPages => total_pages,
    :url => url,
    :loaderMsg => 'Loading more results',
    :params => {:query => @query, :sort_key => params[:sort_key], :sort_order => params[:sort_order]}
  }

  javascript_tag("jQuery('#results').pageless(#{opts.to_json});")
end

def tab_for(tab, link, label=nil)
  
  if @disabled_tabs && @disabled_tabs.include?(tab)
  content_tag :li, "<span class='disabled'>#{label||tab.to_s.titleize}</span>", :class => "disabled_tab" 
  else
  content_tag :li, link_to(label||tab.to_s.titleize, link), :class => ("current_tab" if @current_tab == tab)
  end
  
  end

def periodically_call_remote(options = {})
  variable = options[:variable] ||= 'poller'
  frequency = options[:frequency] ||= 10
  code = "#{variable} = new PeriodicalExecuter(function() 
              {#{remote_function(options)}}, #{frequency})"
  javascript_tag(code)
end


FLASH_NOTICE_KEYS = [:error, :notice, :warning]

def flash_messages
  return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
  formatted_messages = messages.map do |type|
    alert = case type
    when :error
      "alert alert-danger"
    when :warning
      "alert alert-warning"
    else
      "alert alert-info"
    end

    content_tag :div, :class => alert do
      message_for_item(flash[type], flash["#{type}_item".to_sym])
    end
  end
  formatted_messages.join
end

def message_for_item(message, item = nil)
  if item.is_a?(Array)
    message % link_to(*item)
  else
    message % item
  end
end

end

