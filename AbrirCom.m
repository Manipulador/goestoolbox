%Este codigo visa facilitar a comunica��o PIC-PC
function s = AbrirCom(fecha)
if nargin > 0 && fecha == 1
    %Tentando fechar as poss�veis portas abertas
    try
        fclose(instrfind);
    end
end
%Encontrando instruct de portas COM dispon�veis. 
ser = instrhwinfo('serial');
%Lista com as COM dispon�veis
ok = 0;
while ok == 0
    [index ok] = listdlg('PromptString','Qual COM dispon�vel deseja abrir',...
    'SelectionMode', 'single','ListString', ser.AvailableSerialPorts);
    %Janela de Confirma��o
    if ok==0
        resp = questdlg('Deseja encerrar o programa?',' ' , 'Sim', 'N�o', 'N�o');
        if strcmp (resp, 'Sim') || strcmp(resp, '')
            disp('Se vira a� na m�o ent�o bonit�o!')
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
        