import removerAcentos from "./removerAcentos";

export default function normalizarNome(nome) {
  return removerAcentos(nome.toLowerCase().replaceAll(" ", "-"));
}
