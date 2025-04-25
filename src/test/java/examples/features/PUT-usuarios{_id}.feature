@actualizarUsuario
Feature: Actualizar usuario existente

  Background:
    * url baseUrl
    * def result = call read('POST-usuario.feature')
    * def userId = result.id
    * def randomEmail = 'yrvin+' + java.util.UUID.randomUUID() + '@gmail.com'

  Scenario: Actualizar información de un usuario
    Given path 'usuarios', userId
    And request { nome: 'Yrvin put', email: '#(randomEmail)', password: 'nuevo', administrador: 'false' }
    When method PUT
    Then status 200
    And match response.message == '#string'

  Scenario: Actualizar con email ya registrado
    Given path 'usuarios', userId
    And request { nome: 'NuevoNombre', email: 'pardito@gmail.com', password: 'nuevoPass123', administrador: 'false' }
    When method PUT
    Then status 400
    And match response.message == '#string'
