-- party_relationship_types
--   * PK name                NOT NULL
--   * first_party_role_name  NOT NULL
--   * second_party_role_name NOT NULL
--
-- Examples
--   * Employment, Employer, Employee
--   * Marriage, Husband, Wife
--   * Hierarchical, Parent, Child
--   * Filial, Parent, Child

-- party_types
--   * PK code NOT NULL
--   * description

-- first_party_relationship_party_type_rules
--   * PK relationship_type NOT NULL FK->party_relationship_types
--   * PK party_type        NOT NULL FK->party_types

-- second_party_relationship_party_type_rules
--   * PK relationship_type NOT NULL FK->party_relationship_types
--   * PK party_type        NOT NULL FK->party_types

-- parties
--   * PK id NOT NULL
--   * born_on
--   * dead_on

-- M:N JOIN table between party_types and parties.
--
-- parties_types
--   * PK party_id        NOT NULL FK->parties
--   * PK party_type_code NOT NULL FK->party_types

-- The different names a party may be known as. A party may have multiple names, or no names.
--
-- party_names
--   * party_id NOT NULL FK->parties
--   * surname NOT NULL
--   * rest_of_name
--   * prefix
--   * salutation
--   * first_used_on NOT NULL (2nd order)

-- Describes relationships between parties.
--
-- party_relationships
--   * PK relationship_type NOT NULL FK->party_relationship_types
--   * PK first_party_id    NOT NULL FK->parties
--   * PK second_party_id   NOT NULL FK->parties
--   * started_at
--   * planned_end_at
--   * actual_ended_at

-- sites
--   * physical_address

-- mailboxes
--   * postal_address

-- postal_locators
--   * PK party_id   NOT NULL FK->parties
--   * PK mailbox_id NOT NULL FK->mailboxes
--   * valid_starting_on
--   * valid_ending_on

-- walk_to_locators
--   * PK party_id NOT NULL FK->parties
--   * PK site_id  NOT NULL FK->sites
--   * valid_starting_on
--   * valid_ending_on

-- web_locators
--   * PK party_id NOT NULL FK->parties
--   * PK url      NOT NULL
--   * valid_starting_on
--   * valid_ending_on

-- email_locators
--   * PK party_id NOT NULL FK->parties
--   * PK address  NOT NULL
--   * valid_starting_on
--   * valid_ending_on

-- phone_locators
--   * PK party_id NOT NULL FK->parties
--   * PK number   NOT NULL
--   * site_id FK->sites
--   * valid_starting_on
--   * valid_ending_on

-- external_party_identifiers
--   * PK code NOT NULL
--   * PK identifying_party_id NOT NULL FK->parties
--   * PK identified_party_id  NOT NULL FK->parties

-- vim: ft=sql
