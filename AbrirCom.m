%Este codigo visa facilitar a comunicação PIC-PC
function s = AbrirCom(fecha)
if nargin > 0 && fecha == 1
    %Tentando fechar as possíveis portas abertas
    try
        fclose(instrfind);
    end
end
%Encontrando instruct de portas COM disponíveis. 
ser = instrhwinfo('serial');
%Lista com as COM disponíveis
ok = 0;
while ok == 0
    [index ok] = listdlg('PromptString','Qual COM disponível deseja abrir',...
    'SelectionMode', 'single','ListString', ser.AvailableSerialPorts);
    %Janela de Confirmação
    if ok==0
        resp = questdlg('Deseja encerrar o programa?',' ' , 'Sim', 'Não', 'Não');
        if strcmp (resp, 'Sim') || strcmp(resp, '')
            disp('Se vira aí na mão então bonitão!')
            clear all
            s = [];
            return
        end
    end
end
%Abrindo porta escolhida
s = serial(ser.AvailableSerialPorts{index}(:));
disp('Porta Aberta!')
fopen(s);
end
        