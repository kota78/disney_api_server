--
-- Class Attraction as table attraction
--

CREATE TABLE "attraction" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "openingDate" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "attraction"
  ADD CONSTRAINT attraction_pkey PRIMARY KEY (id);


