```matlab
%% =====================================================
% BLOOD TRANSFUSION MATCHING SYSTEM
% Digital Blood Bank - Programming for Engineers Group Project
% =====================================================

clc;
clear;

%% -------------------------------
% BLOOD TYPE DATA
%% -------------------------------

Input = ["A+","A-","B+","B-","O+","O-","AB+","AB-"];

Receive = {
    ["A+","A-","O+","O-"]                         % A+
    ["A-","O-"]                                   % A-
    ["B+","B-","O+","O-"]                         % B+
    ["B-","O-"]                                   % B-
    ["O+","O-"]                                   % O+
    ["O-"]                                        % O-
    ["A+","A-","B+","B-","O+","O-","AB+","AB-"]  % AB+
    ["AB-","A-","B-","O-"]                        % AB-
};

%% -------------------------------
% PATIENT INPUT
%% -------------------------------

[indx,tf] = listdlg( ...
    'PromptString','Select your blood type', ...
    'SelectionMode','single', ...
    'ListString',Input);

if tf == 0
    return;
end

conditionList = ["Normal","Sickle Cell","Thalassemia", ...
                 "Anemia","Cancer","Autoimmune Disorder"];

[condIdx,tf2] = listdlg( ...
    'PromptString','Select condition', ...
    'SelectionMode','single', ...
    'ListString',conditionList);

if tf2 == 0
    return;
end

urgencyInput = inputdlg('Enter urgency level (1-10):');
historyInput = inputdlg('Number of past transfusions:');

pregnancyQ = questdlg('History of pregnancy?', ...
    'Patient History','Yes','No','No');

reactionQ = questdlg('Previous transfusion reaction?', ...
    'Patient History','Yes','No','No');

chronicQ = questdlg('Any chronic illness?', ...
    'Patient History','Yes','No','No');

conditionsInput = inputdlg( ...
    'List pre-existing conditions (comma separated):');

%% -------------------------------
% BUILD PATIENT STRUCT
%% -------------------------------

patient.bloodType   = Input(indx);
patient.condition   = conditionList(condIdx);
patient.urgency     = str2double(urgencyInput{1});
patient.history     = str2double(historyInput{1});
patient.pregnancy   = pregnancyQ;
patient.reaction    = reactionQ;
patient.chronic     = chronicQ;
patient.preExisting = lower(conditionsInput{1});

compatible = Receive{indx};

%% -------------------------------
% DISPLAY PATIENT INFO
%% -------------------------------

disp("---- PATIENT INFO ----")
disp("Blood type: " + patient.bloodType)
disp("Condition: " + patient.condition)
disp("Urgency: " + patient.urgency)
disp("Compatible donor types: " + strjoin(compatible,", "))

%% -------------------------------
% ADVANCED BLOOD BANK INVENTORY
%% -------------------------------

bloodDB.Type = ["A+","O-","B+","O+","AB+","A-","B-"];

bloodDB.UnitID = [101,102,103,104,105,106,107];

bloodDB.DaysOld = [10,5,20,15,8,30,12];

bloodDB.Quantity = [3,2,4,5,1,2,3];

bloodDB.Location = ["Fridge A","Fridge B","Fridge A", ...
                    "Fridge C","Fridge B","Fridge A","Fridge C"];

bloodDB.Available = [1,1,1,1,1,1,1];

%% =====================================================
% MATCHING ALGORITHM WITH REAL INVENTORY SYSTEM
%% =====================================================

scores = -inf(1,length(bloodDB.Type));

for i = 1:length(bloodDB.Type)

    donor = bloodDB.Type(i);

    % Skip unavailable or empty stock
    if bloodDB.Available(i) == 0 || bloodDB.Quantity(i) == 0
        continue;
    end

    % Check compatibility
    if any(strcmp(donor, compatible))

        score = 0;

        %% Exact Match

        if strcmp(donor, patient.bloodType)
            score = score + 100;
        end

        %% Same ABO Group

        patientABO = erase(patient.bloodType,["+","-"]);
        donorABO   = erase(donor,["+","-"]);

        if strcmp(patientABO, donorABO)
            score = score + 50;
        end

        %% Same Rh

        patientRh = extractAfter( ...
            patient.bloodType,strlength(patientABO));

        donorRh = extractAfter( ...
            donor,strlength(donorABO));

        if strcmp(patientRh, donorRh)
            score = score + 25;
        end

        %% Fresher Blood Preferred

        score = score - bloodDB.DaysOld(i);

        %% Urgency

        score = score + patient.urgency * 3;

        %% Low Stock Protection

        if bloodDB.Quantity(i) == 1
            score = score - 20;
        end

        %% O- Preservation for Emergencies

        if strcmp(donor,"O-") && patient.urgency < 8 ...
                && ~strcmp(patient.bloodType,"O-")

            score = score - 40;
        end

        %% -----------------------
        % HISTORY FACTORS
        %% -----------------------

        if patient.history > 2
            score = score - 15;
        end

        if strcmp(patient.reaction,"Yes")

            if ~strcmp(donor,patient.bloodType)
                score = score - 25;
            end

        end

        if strcmp(patient.pregnancy,"Yes")
            score = score - 10;
        end

        if strcmp(patient.chronic,"Yes")
            score = score - 10;
        end

        %% -----------------------
        % PRE-EXISTING CONDITIONS
        %% -----------------------

        if contains(patient.preExisting,"diabetes")
            score = score - 5;
        end

        if contains(patient.preExisting,"heart")
            score = score + 10;
        end

        %% SAVE SCORE

        scores(i) = score;

    end
end

%% =====================================================
% BEST MATCH RESULT
%% =====================================================

[bestScore,bestIdx] = max(scores);

bestMatch = bloodDB.Type(bestIdx);
bestUnitID = bloodDB.UnitID(bestIdx);
bestLocation = bloodDB.Location(bestIdx);

% Reduce inventory after reservation

bloodDB.Quantity(bestIdx) = bloodDB.Quantity(bestIdx) - 1;

if bloodDB.Quantity(bestIdx) == 0
    bloodDB.Available(bestIdx) = 0;
end

disp(" ")
disp("---- MATCH RESULT ----")
disp("Best Blood Unit: " + bestMatch)
disp("Unit ID: " + bestUnitID)
disp("Storage Location: " + bestLocation)
disp("Remaining Quantity: " + bloodDB.Quantity(bestIdx))
disp("Match Score: " + bestScore)

%% -------------------------------
% SCORE INTERPRETATION
%% -------------------------------

if bestScore >= 170

    rating = "Excellent Match";

elseif bestScore >= 140

    rating = "Good Match";

elseif bestScore >= 100

    rating = "Acceptable Match";

elseif bestScore >= 60

    rating = "Emergency Substitute";

else

    rating = "Limited Option - Review Required";

end

%% -------------------------------
% DISPLAY RESULT
%% ---------
```
