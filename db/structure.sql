--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: jared; Tablespace: 
--

CREATE TABLE cards (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE cards OWNER TO jared;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: jared
--

CREATE SEQUENCE cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cards_id_seq OWNER TO jared;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jared
--

ALTER SEQUENCE cards_id_seq OWNED BY cards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jared; Tablespace: 
--

CREATE TABLE schema_migrations (
    filename text NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jared;

--
-- Name: users; Type: TABLE; Schema: public; Owner: jared; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email text NOT NULL,
    family_name text NOT NULL,
    given_name text NOT NULL,
    password_digest text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO jared;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jared
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jared;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jared
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jared
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jared
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: cards_pkey; Type: CONSTRAINT; Schema: public; Owner: jared; Tablespace: 
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jared; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jared; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: uniq_users_email; Type: INDEX; Schema: public; Owner: jared; Tablespace: 
--

CREATE UNIQUE INDEX uniq_users_email ON users USING btree (lower(email));


--
-- Name: public; Type: ACL; Schema: -; Owner: jared
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jared;
GRANT ALL ON SCHEMA public TO jared;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

