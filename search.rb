  def self.search(query)
    where('similarity(code, :query) > 0.3 OR similarity(name, :query) > 0', query: query)
      .order([Arel.sql('similarity(code, ?) + similarity(name, ?) DESC'), query, query])
      .order(rank: :asc)
  end
