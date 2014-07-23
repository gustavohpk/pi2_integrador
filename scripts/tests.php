<!-- <h4>Testes</h4>
<div class="row">
	<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<table class="table">
			<thead>
				<tr>
					<th>Status</th>
					<th>Teste</th>
					<th>Operação</th>
				</tr>
			</thead>
			<tfoot>
				
			</tfoot>
			<tbody>
				<tr style="background-color: #5cb85c; color: #FFF">
					<td><span class="glyphicon glyphicon-ok-sign" style="font-size: 20px"></span></td>
					<td>Validação de CPF</td>
					<td>pontos ou traços</td>
				</tr>
				<tr style="background-color: #d9534f; color: #FFF">
					<td><span class="glyphicon glyphicon-remove-sign" style="font-size: 20px"></span></td>
					<td>Validação de CPF</td>
					<td>pontos ou traços</td>
				</tr>
			</tbody>
		</table>
	</div>
</div> -->
<?php

$tests = array();
$i = 0;

$tests[$i]["result"] = $this->validateCpf('');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "CPF nulo";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateCpf('303.29');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "CPF incompleto";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateCpf('352683543');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "CPF incompleto 2";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateCpf('87596741258');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "Número aleatório";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateCpf('33158327813');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "CPF válido";
$tests[$i]["expected"] = true;
$i++;

$tests[$i]["result"] = $this->validateCpf('872.388.686-28');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "CPF válido com máscara";
$tests[$i]["expected"] = true;
$i++;

$tests[$i]["result"] = $this->validateCpf('a7h8dy-326#');
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "String aleatória";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateCpf("$at8'fx'aa");
$tests[$i]["test"] = "Validação de CPF";
$tests[$i]["operation"] = "String aleatória com cifrão e aspas";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("aswkhyuwe");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "String aleatória";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("e74hu5#v^asx");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "String aleatória com números e caracteres especiais";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("e74hu5#v^asx");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "String aleatória com números e caracteres especiais";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("testmail0203@testmail");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "E-mail sem .com";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("testmail0203@testmail.");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "E-mail sem 'com'";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("testmail0203testmail.com");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "E-mail sem '@'";
$tests[$i]["expected"] = false;
$i++;

$tests[$i]["result"] = $this->validateEmail("testmail0203@testmail.com");
$tests[$i]["test"] = "Validação de E-mail";
$tests[$i]["operation"] = "E-mail válido";
$tests[$i]["expected"] = true;
$i++;