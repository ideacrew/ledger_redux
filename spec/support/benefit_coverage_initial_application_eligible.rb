{
  :organization=> {
    :id => {:id => "1061102"},
    :name => "ACME Widgets, LLC",
    :fein => "444555687",
    :office_locations=> {
      :office_location=> {
        :id => {:id => "5f28683ae59c4a38bc12875b"},
        :primary => "true",
        :address=>  {  
          :type=>"urn:openhbx:terms:v1:address_type#work",
          :address_line_1=>"1150 Connecticut Ave NW", 
          :address_line_2=>"Suite 800", 
          :location_city_name=>"Washington", 
          :location_state=>"urn:openhbx:terms:v1:us_state#district_of_columbia", 
          :location_state_code=>"DC", 
          :postal_code=>"20036", 
          :location_country_name=>nil, 
          :address_full_text=>"1150 Connecticut Ave NW Suite 800 Washington, DC 20036"
        }, 
        :phone=>  { 
          :type=>"urn:openhbx:terms:v1:phone_type#work", 
          :area_code=>"202", 
          :phone_number=>"5551212", 
          :full_phone_number=>"2025551212", 
          :is_preferred=>"false"
        }
      }
    }, 
    :contacts=>  { 
      :contact=> {:id=> {:id=>"20132292"},
      :person_name=> {
      }, 
      :emails=> {
        :email=> {
          :type=>"urn:openhbx:terms:v1:email_type#work", 
          :email_address=>"whiley@acmewidgets.com"
        }
      }, 
      :phones=> {
        :phone=> {
          :type=>"urn:openhbx:terms:v1:phone_type#work", 
          :area_code=>"202", 
          :phone_number=>"5551212", 
          :full_phone_number=>"2025551212", 
          :is_preferred=>"false"
        }
      }
    }
  }, 
  :is_active => "true", 
  :broker_agency_profile=> {
    :npn=>nil, 
    :primary_broker=> {
      :id => {:id => "561bf301547265b2361c1100"},
      :person=> {
        :id => {:id => "561bf301547265b236191100"}, 
        :person_name=> {
          :person_surname => "Fudd", 
          :person_given_name => "Elmer", 
          :person_middle_name => "S", 
          :person_full_name => "Elmer S Fudd"
        }, 
        :emails=> {
          :email=> {
            :type => "urn:openhbx:terms:v1:email_type#work", 
            :email_address => "elmer.fudd@brokersgalore.com"
          }
        }, 
        :phones=> {
          :phone=> {
            :type => "urn:openhbx:terms:v1:phone_type#work", 
            :area_code => "202", 
            :phone_number => "5551213", 
            :full_phone_number => "2025551213", 
            :is_preferred => "false"
          }
        }
      }, 
      :npn => "2668303"
    }, 
    :brokers=> {
      :broker=> {
        :id => {:id => "561bf301547265b2361c1100"}, 
        :person=> {
          :id => {:id => "561bf301547265b236191100"}, 
          :person_name=> {
            :person_surname => "Fudd", 
            :person_given_name => "Elmer", 
            :person_middle_name => "S", 
            :person_full_name => "Elmer S Fudd"
          }, 
          :emails=> {
            :email=> {
              :type => "urn:openhbx:terms:v1:email_type#work", 
              :email_address => "elmer.fudd@brokersgalore.com"
            }
          }, 
          :phones=> {
            :phone=> { 
              :type => "urn:openhbx:terms:v1:phone_type#work", 
              :area_code => "202", 
              :phone_number => "5551213", 
              :full_phone_number => "2025551213", 
              :is_preferred => "false"
            }
          }
        }, 
        :npn => "2668303"
      }
    }
  }, 
  :employer_profile=> {
   :business_entity_kind => "urn:openhbx:terms:v1:employers#limited_liability_corporation", 
   :brokers=> {
     :broker_account=> {
       :broker_agency=> {
         :id => {:id => "e35cea92489b466db67bc04a4b3a4bff"
         },
         :name => "Brokers Galore, Inc.", 
         :display_name=>nil, 
         :npn=>nil
       }, 
       :writing_agent=> {
         :id => {:id => "bc1f2aceeefc48c3b374a192da9ad3dd"},
         :person=> {
           :id => {:id => "bc1f2aceeefc48c3b374a192da9ad3dd"},
           :person_name=> {
             :person_surname => "Fudd",
             :person_given_name => "Elmer", 
             :person_middle_name => "S", 
             :person_full_name => "Elmer S Fudd"
           }, 
           :emails=> {
             :email=> {
               :type => "urn:openhbx:terms:v1:email_type#work", 
               :email_address => "elmer.fudd@brokersgalore.com"
             }
           }, 
           :phones=> {
             :phone=> {
               :type => "urn:openhbx:terms:v1:phone_type#work", 
               :area_code => "202", 
               :phone_number => "5551213", 
               :full_phone_number => "2025551213", 
               :is_preferred => "false"
             }
           }
         }, 
         :npn => "2668303"
       }, 
       :start_on => "20200803"
     }
   }, 
   :plan_years=> {
     :plan_year=> {
       :plan_year_start => "20200901", 
       :plan_year_end => "20210831", 
       :fte_count => "3", 
       :pte_count => "2", 
       :open_enrollment_start => "20200803", 
       :open_enrollment_end => "20200810", 
       :benefit_groups=> {
         :benefit_group=> {
           :id => {:id => "5f286fb0e59c4a38df1286de"},
           :name => "Choice Plus HSA Gold 1750", 
           :elected_plans => {
             :elected_plan => [
               {:id => {:id => "21066DC0040007-01"},
               :name => "UHC Core Essential HSA Gold 1750", 
               :active_year => "2020", 
               :is_dental_only => "false", 
               :carrier=> {
                 :id => {:id => "116034"},
                 :name => "UnitedHealthcare", 
                 :is_active => "true"
               }, 
               :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
               :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
               :ehb_percent => "100.0"
             },
             {:id => {:id => "21066DC0040001-01"},
             :name => "UHC Core Essential HSA Bronze 6700", 
             :active_year => "2020", 
             :is_dental_only => "false", 
             :carrier=> {
               :id => {:id => "116034"},
               :name => "UnitedHealthcare", 
               :is_active => "true"
             }, 
             :metal_level => "urn:openhbx:terms:v1:plan_metal_level#bronze", 
             :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
             :ehb_percent => "100.0"
           },
           {
             :id => {:id => "21066DC0050006-01"},
             :name => "UHC Navigate HSA Gold 1750", 
             :active_year => "2020", 
             :is_dental_only => "false", 
             :carrier=>
             {
               :id => {:id => "116034"},
               :name => "UnitedHealthcare", 
               :is_active => "true"
             }, 
             :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
             :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
             :ehb_percent => "100.0"
           },
           {
             :id => {:id => "21066DC0050001-01"},
             :name => "UHC Navigate HSA Bronze 6700", 
             :active_year => "2020", 
             :is_dental_only => "false", 
             :carrier=>
             {
              :id => {:id => "116034"},
              :name => "UnitedHealthcare", 
              :is_active => "true"
            }, 
            :metal_level => "urn:openhbx:terms:v1:plan_metal_level#bronze", 
            :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
            :ehb_percent => "100.0"
          },
          {
            :id => {:id => "21066DC0050007-01"},
            :name => "UHC Navigate HSA Silver 2750", 
            :active_year => "2020", 
            :is_dental_only => "false", 
            :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "21066DC0010015-01"},
           :name => "UHC Core Essential HSA Silver 2750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        },
        {
          :id => {:id => "21066DC0010017-01"},
          :name => "UHC Navigate Gold 750", 
          :active_year => "2020", 
          :is_dental_only => "false", 
          :carrier=> {
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        }, 
        {
          :id => {:id => "21066DC0050003-01"},
          :name => "UHC Navigate Silver 2750", 
          :active_year => "2020", 
          :is_dental_only => "false", 
          :carrier=> {
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        },
        {
          :id => {:id => "21066DC0010019-01"},
          :name => "UHC Core Essential Gold 750", 
          :active_year => "2020", 
          :is_dental_only => "false", 
          :carrier=> {
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold",
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        },
        {
          :id => {:id => "21066DC0040003-01"},
          :name => "UHC Core Essential Silver 2750", 
          :active_year => "2020", 
          :is_dental_only => "false", 
          :carrier=> {
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver",
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        },
        {
          :id => {:id => "41842DC0040008-01"},
          :name => "UHC Choice HSA Bronze 6700", 
          :active_year => "2020", 
          :is_dental_only => "false", 
          :carrier=> { 
            :id => {:id => "116034"},
            :name => "UnitedHealthcare", 
            :is_active => "true"
          }, 
          :metal_level => "urn:openhbx:terms:v1:plan_metal_level#bronze", 
          :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
          :ehb_percent => "100.0"
        },
        {
         :id => {:id => "41842DC0040061-01"},
         :name => "UHC Choice HSA Gold 1400", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> {
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0010081-01"},
         :name => "UHC Choice Plus HSA Gold 1400", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> { 
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0010006-01"},
         :name => "UHC Choice Plus HSA Gold 1750", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> { 
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0040046-01"},
         :name => "UHC Choice HSA Silver 2750", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> { 
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0010043-01"},
         :name => "UHC Choice Plus HSA Silver 2750", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> {
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0040057-01"},
         :name => "UHC Choice Gold 0", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> { 
           :id => {:id => "116034"},
           :name => "UnitedHealthcare", 
           :is_active => "true"
         }, 
         :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
         :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
         :ehb_percent => "100.0"
       },
       {
         :id => {:id => "41842DC0010085-01"},
         :name => "UHC Choice Plus Gold 2020", 
         :active_year => "2020", 
         :is_dental_only => "false", 
         :carrier=> {
           :id =>
           {
             :id => "116034"}, 
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010078-01"},
           :name => "UHC Choice Plus Gold 0", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010086-01"},
           :name => "UHC Choice Plus Gold 0-1", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010074-01"},
           :name => "UHC Choice Plus Platinum 0-1", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010087-01"},
           :name => "UHC Choice Plus Platinum 0-2-1", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040045-01"},
           :name => "UHC Choice Gold 1750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040064-01"},
           :name => "UHC Choice Gold 2000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040091-01"},
           :name => "UHC Choice Gold 1250", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040059-01"},
           :name => "UHC Choice Platinum 250", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040060-01"},
           :name => "UHC Choice Platinum 0", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040101-01"},
           :name => "UHC Choice Silver 2750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040062-01"},
           :name => "UHC Choice Gold 1000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0040065-01"},
           :name => "UHC Choice Silver 5000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010066-01"},
           :name => "UHC Choice Plus Platinum 250", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010032-01"},
           :name => "UHC Choice Plus Gold 750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010054-01"},
           :name => "UHC Choice Plus Gold 1250", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010042-01"},
           :name => "UHC Choice Plus Gold 1750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010084-01"},
           :name => "UHC Choice Plus Gold 2000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010080-01"},
           :name => "UHC Choice Plus Silver 2750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010068-01"},
           :name => "UHC Choice Plus Platinum 0-2", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010082-01"},
           :name => "UHC Choice Plus Gold 1000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=> {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010088-01"},
           :name => "UHC Choice Plus Gold 2750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "41842DC0010089-01"},
           :name => "UHC Choice Plus Silver 5000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010062-01"},
           :name => "UHC OCI HSA Gold 1400", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010065-01"},
           :name => "UHC OCI HSA Bronze 6700", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#bronze", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010066-01"},
           :name => "UHC OCI HSA Silver 2750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010018-01"},
           :name => "UHC OCI Gold 0", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010063-01"},
           :name => "UHC OCI Gold 1000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010064-01"},
           :name => "UHC OCI Gold 2000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010074-01"},
           :name => "UHC OCI Gold 3000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010075-01"},
           :name => "UHC OCI Silver 6500", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010042-01"},
           :name => "UHC OCI Gold 1750", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#gold", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010056-01"},
           :name => "UHC OCI Platinum 250", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010058-01"},
           :name => "UHC OCI Platinum 0", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         },
         {
           :id => {:id => "75753DC0010078-01"},
           :name => "UHC OCI Silver 5000", 
           :active_year => "2020", 
           :is_dental_only => "false", 
           :carrier=>
           {
             :id => {:id => "116034"},
             :name => "UnitedHealthcare", 
             :is_active => "true"
           }, 
           :metal_level => "urn:openhbx:terms:v1:plan_metal_level#silver", 
           :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health", 
           :ehb_percent => "100.0"
         }
       ]
     }, 
     :relationship_benefits=> {
      :relationship_benefit => [
        {
         :relationship => "urn:openhbx:terms:v1:employee_census_relationship#employee", 
         :offered => "true", 
         :contribution_percent => "100.0"
       },
       {
         :relationship => "urn:openhbx:terms:v1:employee_census_relationship#spouse", 
         :offered => "true", 
         :contribution_percent => "0.0"
       },
       {
         :relationship => "urn:openhbx:terms:v1:employee_census_relationship#domestic_partner", 
         :offered => "true", 
         :contribution_percent => "0.0"
       },
       {
        :relationship => "urn:openhbx:terms:v1:employee_census_relationship#child_under_26", 
        :offered => "true", 
        :contribution_percent => "0.0"}
      ]
    }
  }
}, 
:created_at => "2020-08-03T19:58:58Z", 
:modified_at => "2020-08-12T14:16:06Z"
}
}
}, 
:created_at => "2020-08-03T19:40:42Z", 
:modified_at => "2020-08-03T19:40:42Z"
}
}