
FORMAT_SPEC = /\AFORMAT: (.+)\Z/
ANCHOR_SPEC = /\AANCHOR: (.+)\Z/

def simple_list( list_data, list_template, number_of_entries = nil )
  entries = load_entries list_data, number_of_entries
  bodies = merge list_template, entries
  bodies.join ''
end


def load_entries( list_data, number_of_entries )

  lines = context.load_file( list_data ).split "\n"

  format_spec = lines.delete_at 0
  format_ids = FORMAT_SPEC.match( format_spec )[ 1 ].split( / *, */ )

  anchor_spec = lines.delete_at 0
  anchor_base = ANCHOR_SPEC.match( anchor_spec )[ 1 ]

  entries = []
  lines.each do |line|
    entries << Entry.new( format_ids, anchor_base, entries.size ) && next if /^\[ENTRY\]$/ =~ line
    entries.last.consume line if entries.last
    break if number_of_entries && entries.size > number_of_entries
  end

  while number_of_entries && entries.size > number_of_entries
    entries.delete entries.last if entries.size > 0
  end

  entries
end


def merge( list_template, entries )
  template = load_file list_template
  entries.map do |entry|
    set_variable :entry, entry
    set_variable :anchor, entry.anchor

    body = template
    loop do
      new_body = context.run_erb_on body, list_template
      break if new_body == body
      body = new_body
    end
    body
  end
end


class Entry

  def initialize( line_ids, anchor_base, entry_id )
    @line_ids = line_ids.map { |i| i.downcase }
    @entry_id = "#{anchor_base}_#{entry_id}"
    @lines = []
  end

  def consume( line )
    @lines << line
  end

  def anchor
    @entry_id
  end

  def each_id( &block )
    @line_ids.each &block
  end

  def []( line_index )
    @lines[ line_index ]
  end

  def method_missing( symbol, *args )
    id_name = symbol.id2name.downcase
    line_index = @line_ids.index id_name
    remaining_lines = ( line_index == @line_ids.size - 1 )
    raise "Line ID undefined: #{id_name}" unless line_index
    return @lines[ line_index ] unless remaining_lines
    @lines[ line_index..@lines.size ].join "\n"
  end

end
