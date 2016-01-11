class FabricaDeCriterio
  
  def self.criar_criterio(params)
    if params[:tipo_de_busca] == :promocional
      FabricaDeCriterio.criar_promocional(params)
    elsif params[:tipo_de_busca] == :por_categoria
      FabricaDeCriterio.criar_por_categoria(params)
    else
      FabricaDeCriterio.criar_por_busca_normal(params)
    end
  end

  def self.criar_promocional(params)
    criterio = cria_criterio(params)
    criterio.categoria   = :em_promocao
    criterio.ordenar_por = :mais_recente
    criterio
  end

  def self.criar_por_categoria(params)
    return criar_por_busca_normal(params) if params[:categoria].nil?
    criterio = cria_criterio(params)
    criterio.categoria   = params[:categoria] 
    criterio.ordenar_por = params[:ordenar_por] || :mais_recente
    criterio
  end

  def self.criar_por_busca_normal(params)
    criterio = cria_criterio(params)
    criterio.categoria   = params[:categoria] || :tudo
    criterio.ordenar_por = params[:ordenar_por] || :relevancia
    criterio
  end

  private

  def self.cria_criterio(params)
    criterio = CriterioDeBusca.new
    criterio.por_pagina  = params[:resultados_por_pagina] || 15
    criterio
  end
end