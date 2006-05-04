
def link_hover( url, status, text, external = true )
  target = ''
  target = 'target="_blank"' if external
  %Q{<a class="link" href="#{url}" #{target} onmouseover="window.status='#{status}'; return true;" onmouseout="window.status=' '; return true;">#{text}</a>}
end
