String convertAuthorNameInAssetName(String author, String type) {
  final authorsName = {
    'Benito Lopez': 'benito-lopez.webp',
    'Cesar Damasceno': 'cesar-damasceno.webp',
    'Edmar Ferreira': 'edmar-ferreira.webp',
    'Eliseu Moreira': 'eliseu-moreira.webp',
    'Gilberto Bajo': 'gilberto-bajo.webp',
    'Hélio Azevedo': 'helio-azevedo.webp',
    'João Bium': 'joao-bium.webp',
    'Manoel Rocha': 'manoel-rocha.webp',
    'Marcos Moraes': 'marcos-moraes.webp',
    'Mario Fagundes': 'mario-fagundes.webp',
    'Sérgio Avillez': 'sergio-avillez.webp',
    'Vanjo Souza': 'vanjo-souza.webp',
  };
  if (authorsName.containsKey(author)) {
    return "public/assets/images/$type/${authorsName[author]}";
  }
  return "public/assets/images/$type/${authorsName['Benito Lopez']}";
}
