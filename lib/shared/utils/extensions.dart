enum AppStatus { success, loading, error, empty }

//add funções na classe - pode ser usado para retornar formato da moeda etc
extension stateMessage on AppStatus {
  String message() {
    if (this == AppStatus.error) {
      return "Ops! Algo deu errado";
    }
    return "";
  }
}

// add formato para a moeda
extension format on double {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2)}".replaceAll(".", ",");
  }
}
