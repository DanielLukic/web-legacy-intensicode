
def link( url, text = nil )
  unless text
    text = url
    text.sub! /\Ahttp:\/\//, ''
  end

  clazz = 'link'
  target = ''
  if url.index( /\Ahttp:\/\// ) == 0
    clazz = 'external_link'
    target = 'target="_blank"'
  end

  %Q{<a class="#{clazz}" href="#{url}" #{target}>#{text}</a>}
end
