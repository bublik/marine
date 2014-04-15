class CreateCerts < ActiveRecord::Migration
  def change
    create_table :certs do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
    {'medical' => [
      'Blood Chemical Test',
      'Cholera Vaccination',
      'Drug and alchohol test',
      'Hepatitis test',
      'Physical Examination Certificate',
      'Vaccination against: Yellow Fever',
      'Vaccination against: Hepatitis A',
      'Vaccination against: Hepatitis B',
      'Vaccination against: Typhoid',
      'Vaccination against: Polio',
      'Vaccination against: Tetanus',
      'Vaccination against: Diphtheria',
      'Vaccination against: Cholera',
      'Vaccination against: Meningococcal',
      'Malaria visa (on-line training)',
      'Negative TB statement'
    ],
     'traning' => [
       'GMDSS (Restricted Operator)',
       'Ship Security Officer',
       'Advanced Fire Fighting',
       'Advanced tanker training (Chemical)',
       'Advanced tanker training (Gas)',
       'Advanced tanker training (Oil)',
       'Basic Safety Training (SOLAS)',
       'Basic Safety Training (SOLAS) - Refresher Course',
       'Bridge Team Management',
       'Cargo and Ballast Handling',
       'Competence updating course',
       'Corrosion Protection and Maintenance',
       'Crowd management',
       'Efficient Deck Hand (EDH)',
       'Efficient Engine Room Rating (EER)',
       'Medical First Aid',
       'Engine Room Simulator',
       'Fast rescue boats',
       'VARIOUS',
       'Loading Control System',
       'Maritime English',
       'Medical Care on board Ship (Limited)',
       'Medical Care on board Ship (Unlimited)',
       'Proficiency Survival Craft and Rescue Boat (other than Fast Rescue boats)',
       'Radar Navigation, Manual and Automatic Radar Plotting Aids (ARPA) Management',
       'Radar navigation, manual and automatic radar plotting aids (ARPA) Operational',
       'Radar navigation, manual and automatic radar plotting aids (ARPA) Support',
       'Safety Management System',
       'Search and rescue operations (Management)',
       'Search and rescue operations (Operational)',
       'Ship Handling Simulator',
       'Shore-based fire fighting',
       'Tanker Familiarization (Chemical)',
       'Tanker Familiarization (Gas)',
       'Tanker Familiarization (Oil)',
       'The Operational Use of Electronic Chart Display and Information Systems (ECDIS)',
       'Training for Ro-Ro Passanger Ships Personnel',
       'International Safety Management Code',
       'Radar Simulator',
       'ARPA Simulator',
       'Harbour Craft Master Course',
       'Proficiency in Fast Rescue Boat',
       'Oil Tanker Specialized Training Program',
       'Security Familiarization (ISPS Code)',
       'Ship Security Awareness',
       'Electrical Installation',
       'General Tanker Familiarization',
       'Crane Operator',
       'Shielded Metal Arc Welding II',
       'Tanker Familiarization',
       'Liquified Gas Tanker Specialized Training Programme',
       'Chemical Tanker Specialised Training Programme',
       'Shipboard safety officer',
       'Navigation and Watch Keeping',
       'Norwegian Rules and Regulations for Master Serving on "NIS" ships',
       'Medical Care &amp; Medical First Aid',
       'Radar Observation, Plotting and Automatic Radar Plotting Aids (ARPA)',
       'Norwegian Pilot Exemption',
       'Radar, ARPA, bridge team work and search and rescue',
       'Polution Prevention Duties',
       'Theoretical,Practical &amp; Simulating training using AIS',
       'Maintenance of electrical and electronic equipment',
       'SDP maintenance course'],
     'documents' => [
       'Dienstboek NL',
       'Dienstboek PL',
       'Passport',
       'Dienstboek D',
       'ID CARD'
     ]}.each_pair do |category, names|
      names.each do |name|
        Cert.create(category: category, name: name)
      end
    end
  end
end
