class Busca
  def self.por(params)
    criterio = FabricaDeCriterio.criar_criterio(params)
    ids_de_resultado = ServicoDeBusca.realizar_busca_com(criterio)
    encontrar_produtos_por_ids(ids_de_resultado)
  end

  def self.encontrar_produtos_por_ids(ids)
  end
end
