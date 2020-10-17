--las transacciones se usa para evaluar una porcion de codigo donde estamos
--realizando un update, delete o un insert


begin tran 
	update Pacientes set telefono = 114
		where idPaciente = 8
	if @@ROWCOUNT = 1 --rowcount devuelve la cantidad de filas procesadas
		begin
		commit tran --importante colocarlo porque sino la tabla queda bloqueada
		end
		else
		begin
		rollback tran  --cancela la transaccion
		end