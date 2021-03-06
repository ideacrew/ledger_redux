{
  :enrollment_event => { 
    :header => { 
      :hbx_id=> "DC0", 
      :submitted_timestamp => "2020-08-21T14:01:39" 
    },
    :event => {
      :body => {
        :enrollment_event_body => {
          :affected_members => {
            :affected_member => {
              :member => {
                :id => { :id => "urn:openhbx:hbx:dc0:resources:v1:person:hbx_id#20021233" },
                :primary_family_id => { :id => "870984" },
                :person => { 
                  :id => { :id => "urn:openhbx:hbx:dc0:resources:v1:person:hbx_id#20021233" },
                  :person_name => {
                    :person_surname => "John",
                    :person_given_name => "Snow",
                    :person_middle_name => "Idk"
                  },
                  :addresses => {
                    :address => {
                      :type => "urn:openhbx:terms:v1:address_type#home",
                      :address_line_1 => "1580 H Street",
                      :address_line_2 => "#102",
                      :location_city_name => "Fairfax",
                      :location_state_code => "Va",
                      :postal_code => "22031" 
                    }
                  },
                  :emails => {
                    :email => [
                      {
                        :type => "urn:openhbx:terms:v1:email_type#home",
                        :email_address => "snowtest@gmail.com"
                      }, 
                      {
                        :type => "urn:openhbx:terms:v1:email_type#work",
                        :email_address => "snow.test@test.org" 
                      }
                    ]
                  },
                  :phones => {
                    :phone => {
                      :type => "urn:openhbx:terms:v1:phone_type#home",
                      :full_phone_number => "6098707111",
                      :is_preferred => "false" 
                    }
                  }
                },
                :person_demographics => {
                  :ssn => "1112223333",
                  :sex => "urn:openhbx:terms:v1:gender#female",
                  :birth_date => "19911121",
                  :is_incarcerated => "false",
                  :created_at => "2018-09-12T01:17:39Z",
                  :modified_at => "2018-09-12T01:20:44Z"
                },
                :is_primary_applicant => "true",
                :is_coverage_applicant => "true", 
                :person_health => {
                  :is_tobacco_user=> "unknown" 
                }
              },
              :is_subscriber => "true", 
              :benefit => { 
                :premium_amount => "518.8", 
                :begin_date => "20200901" 
              }
            }
          },
          :transaction_id => "2020082304004222123290",
          :is_trading_partner_publishable => "true",
          :enrollment => {
            :transaction_id => { :id => "2020082304004222123290" },
            :type => "urn:openhbx:terms:v1:enrollment#initial",
            :market => "urn:openhbx:terms:v1:aca_marketplace#shop",
            :policy => {
              :id => { :id => "1130108" },
              :previous_policy_id => { :id => "1230048" },
              :broker => {
                :id => { :id => "10111119" },
                :name=> "Some Person",
                :display_name=> "Hann & Park Insurance"
              },
              :enrollees => {
                :enrollee => {
                  :member => {
                    :id => { :id => "urn:openhbx:hbx:dc0:resources:v1:person:hbx_id#20021233" },
                    :primary_family_id => { :id => "787878" }, 
                    :person => {
                      :id => { :id => "urn:openhbx:hbx:dc0:resources:v1:person:hbx_id#20021233" },
                      :person_name => {
                        :person_surname=> "John",
                        :person_given_name=> "Snow",
                        :person_middle_name=> "Idk"
                      },
                      :addresses => {
                        :address => {
                          :type => "urn:openhbx:terms:v1:address_type#home",
                          :address_line_1 => "5900 H Street",
                          :address_line_2 => "#112",
                          :location_city_name => "Fairfax",
                          :location_state_code => "VA",
                          :postal_code => "22031" 
                        }
                      },
                      :emails => {
                        :email => [
                          {
                            :type => "urn:openhbx:terms:v1:email_type#home",
                            :email_address => "jhons.snow@gmail.com"
                          }, 
                          {
                            :type => "urn:openhbx:terms:v1:email_type#work",
                            :email_address => "jhon.snow@test.org" 
                          }
                        ]
                      },
                      :phones => {
                        :phone => {
                          :type => "urn:openhbx:terms:v1:phone_type#home",
                          :full_phone_number => "6093337111",
                          :is_preferred => "false" 
                        }
                      }
                    },
                    :person_demographics => {
                      :ssn => "1112223333",
                      :sex => "urn:openhbx:terms:v1:gender#female",
                      :birth_date => "19911121",
                      :is_incarcerated => "false",
                      :created_at => "2018-09-12T01:17:39Z",
                      :modified_at => "2018-09-12T01:20:44Z"
                    },
                    :is_primary_applicant => "true",
                    :is_coverage_applicant => "true", 
                    :person_health => {
                      :is_tobacco_user => "unknown" 
                    }
                  },
                  :is_subscriber => "true",
                  :benefit => {
                    :premium_amount => "518.8", 
                    :begin_date => "20200901" 
                  }
                }
              },
              :enrollment => {
                :plan => {
                  :id => { :id => "86052DC0460011-01" },
                  :name=> "BlueChoice HMO Platinum 0",
                  :active_year => "2020",
                  :is_dental_only => "false", 
                  :carrier => { 
                    :id => { :id => "116036" },
                    :name=> "CareFirst"
                  },
                  :metal_level => "urn:openhbx:terms:v1:plan_metal_level#platinum",
                  :coverage_type => "urn:openhbx:terms:v1:qhp_benefit_coverage#health",
                  :ehb_percent => "100.0"
                },
                :shop_market => {
                  :employer_link => { 
                    :id => { :id => "urn:openhbx:terms:v1:employer:id#1051910" },
                    :name => "Center for Advanced Defense Studies",
                    :dba => "Center for Advanced Defense Studies",
                    :fein => "1231231212"
                  },
                  :total_employer_responsible_amount => "209.4"
                },
                :premium_total_amount => "518.8",
                :total_responsible_amount => "209.4",
                :rating_area => "R-DC001",
                :eligibility_event => {
                  :event_kind => "urn:dc0:terms:v1:qualifying_life_event#open_enrollment"
                }
              },
              :request_submitted_timestamp => "2020-08-21T14:01:39",
              :is_active => "true" 
            }
          }
        }
      }
    }
  }
}