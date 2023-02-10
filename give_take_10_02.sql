--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: booking_program_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.booking_program_model (
    id bigint NOT NULL,
    program_name character varying(1024) NOT NULL,
    date date,
    start_time time without time zone,
    end_time time without time zone,
    venue character varying(1024) NOT NULL,
    address text,
    contact_no character varying(12),
    food text,
    agenda text,
    inauguration_name character varying(1024),
    total_seats integer NOT NULL,
    available_seats integer,
    fk_admin_id_id bigint,
    fk_district_id bigint,
    fk_state_id bigint,
    price integer,
    map_url character varying(200)
);


ALTER TABLE public.booking_program_model OWNER TO admin;

--
-- Name: booking_program_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.booking_program_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_program_model_id_seq OWNER TO admin;

--
-- Name: booking_program_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.booking_program_model_id_seq OWNED BY public.booking_program_model.id;


--
-- Name: booking_program_model_qr_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.booking_program_model_qr_permission (
    id bigint NOT NULL,
    program_model_id bigint NOT NULL,
    committee_members_id bigint NOT NULL
);


ALTER TABLE public.booking_program_model_qr_permission OWNER TO admin;

--
-- Name: booking_program_model_qr_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.booking_program_model_qr_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_program_model_qr_permission_id_seq OWNER TO admin;

--
-- Name: booking_program_model_qr_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.booking_program_model_qr_permission_id_seq OWNED BY public.booking_program_model_qr_permission.id;


--
-- Name: booking_ticketbooking; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.booking_ticketbooking (
    id bigint NOT NULL,
    no_of_seats integer NOT NULL,
    payment_status character varying(50) NOT NULL,
    payment_completed boolean NOT NULL,
    qr_code_image character varying(100),
    fk_program_id bigint,
    fk_user_id_id integer,
    total_amount integer,
    qr_image_scanned boolean NOT NULL,
    qr_random_num character varying(50),
    payment_id character varying(1024),
    date_booked timestamp with time zone
);


ALTER TABLE public.booking_ticketbooking OWNER TO admin;

--
-- Name: booking_ticketbooking_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.booking_ticketbooking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_ticketbooking_id_seq OWNER TO admin;

--
-- Name: booking_ticketbooking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.booking_ticketbooking_id_seq OWNED BY public.booking_ticketbooking.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: news_meetingattendance; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news_meetingattendance (
    id bigint NOT NULL,
    attendance character varying(100),
    meeting_highligths_id bigint NOT NULL
);


ALTER TABLE public.news_meetingattendance OWNER TO admin;

--
-- Name: news_meetingattendance_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_meetingattendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_meetingattendance_id_seq OWNER TO admin;

--
-- Name: news_meetingattendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_meetingattendance_id_seq OWNED BY public.news_meetingattendance.id;


--
-- Name: news_meetinghighligths; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news_meetinghighligths (
    id bigint NOT NULL,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    meeting_minutes text,
    description text,
    created_by_id integer,
    modified_by_id integer,
    meeting_attendance integer
);


ALTER TABLE public.news_meetinghighligths OWNER TO admin;

--
-- Name: news_meetinghighligths_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_meetinghighligths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_meetinghighligths_id_seq OWNER TO admin;

--
-- Name: news_meetinghighligths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_meetinghighligths_id_seq OWNED BY public.news_meetinghighligths.id;


--
-- Name: news_meetingphoto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news_meetingphoto (
    id bigint NOT NULL,
    photo character varying(100),
    meeting_highligths_id bigint NOT NULL
);


ALTER TABLE public.news_meetingphoto OWNER TO admin;

--
-- Name: news_meetingphoto_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_meetingphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_meetingphoto_id_seq OWNER TO admin;

--
-- Name: news_meetingphoto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_meetingphoto_id_seq OWNED BY public.news_meetingphoto.id;


--
-- Name: news_news; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news_news (
    id bigint NOT NULL,
    title character varying(255),
    description text,
    meeting_link character varying(255),
    date_added timestamp with time zone,
    date_expired timestamp with time zone,
    status character varying(255),
    news_type_id bigint,
    news_image character varying(240),
    created_by_id integer,
    date_modified timestamp with time zone,
    modified_by_id integer,
    committe_type_id bigint,
    district_region_id bigint,
    panchayath_region_id bigint,
    show_all boolean NOT NULL,
    state_region_id bigint
);


ALTER TABLE public.news_news OWNER TO admin;

--
-- Name: news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_news_id_seq OWNER TO admin;

--
-- Name: news_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_news_id_seq OWNED BY public.news_news.id;


--
-- Name: news_newstype; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news_newstype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer
);


ALTER TABLE public.news_newstype OWNER TO admin;

--
-- Name: news_newstype_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_newstype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_newstype_id_seq OWNER TO admin;

--
-- Name: news_newstype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_newstype_id_seq OWNED BY public.news_newstype.id;


--
-- Name: register_admin_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.register_admin_model (
    id bigint NOT NULL,
    user_image character varying(100),
    name character varying(1024) NOT NULL,
    phone_number character varying(12) NOT NULL,
    username character varying(1024) NOT NULL,
    login_token character varying(50) NOT NULL,
    created_by bigint,
    updated_by bigint,
    committee_type_id bigint NOT NULL,
    district_id bigint NOT NULL,
    panchayath_id bigint NOT NULL,
    staff_role_id bigint NOT NULL,
    state_id bigint NOT NULL,
    user_id_id integer,
    ward_id bigint NOT NULL,
    is_deleted boolean NOT NULL,
    CONSTRAINT register_admin_model_created_by_check CHECK ((created_by >= 0)),
    CONSTRAINT register_admin_model_updated_by_check CHECK ((updated_by >= 0))
);


ALTER TABLE public.register_admin_model OWNER TO admin;

--
-- Name: register_admin_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.register_admin_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.register_admin_model_id_seq OWNER TO admin;

--
-- Name: register_admin_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.register_admin_model_id_seq OWNED BY public.register_admin_model.id;


--
-- Name: register_committee_members; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.register_committee_members (
    id bigint NOT NULL,
    user_image character varying(100),
    name character varying(1024) NOT NULL,
    phone_number character varying(12) NOT NULL,
    login_token character varying(50) NOT NULL,
    created_by bigint,
    updated_by bigint,
    committee_type_id bigint NOT NULL,
    district_id bigint NOT NULL,
    panchayath_id bigint,
    staff_role_id bigint NOT NULL,
    state_id bigint NOT NULL,
    ward_id bigint,
    username character varying(50),
    CONSTRAINT register_committee_members_created_by_check CHECK ((created_by >= 0)),
    CONSTRAINT register_committee_members_updated_by_check CHECK ((updated_by >= 0))
);


ALTER TABLE public.register_committee_members OWNER TO admin;

--
-- Name: register_committee_members_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.register_committee_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.register_committee_members_id_seq OWNER TO admin;

--
-- Name: register_committee_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.register_committee_members_id_seq OWNED BY public.register_committee_members.id;


--
-- Name: user_details_bloodgroup; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_bloodgroup (
    id bigint NOT NULL,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    name character varying(266) NOT NULL,
    created_by_id integer,
    modified_by_id integer
);


ALTER TABLE public.user_details_bloodgroup OWNER TO admin;

--
-- Name: user_details_bloodgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_bloodgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_bloodgroup_id_seq OWNER TO admin;

--
-- Name: user_details_bloodgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_bloodgroup_id_seq OWNED BY public.user_details_bloodgroup.id;


--
-- Name: user_details_committee; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_committee (
    id bigint NOT NULL,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    name character varying(266) NOT NULL,
    phone_number character varying(20),
    committee_type_id bigint,
    created_by_id integer,
    modified_by_id integer,
    staff_role_id bigint
);


ALTER TABLE public.user_details_committee OWNER TO admin;

--
-- Name: user_details_committee_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_committee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_committee_id_seq OWNER TO admin;

--
-- Name: user_details_committee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_committee_id_seq OWNED BY public.user_details_committee.id;


--
-- Name: user_details_committeetype; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_committeetype (
    id bigint NOT NULL,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    name character varying(255) NOT NULL,
    code character varying(255),
    created_by_id integer,
    modified_by_id integer
);


ALTER TABLE public.user_details_committeetype OWNER TO admin;

--
-- Name: user_details_committeetype_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_committeetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_committeetype_id_seq OWNER TO admin;

--
-- Name: user_details_committeetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_committeetype_id_seq OWNED BY public.user_details_committeetype.id;


--
-- Name: user_details_district; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_district (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255),
    state_id bigint,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer
);


ALTER TABLE public.user_details_district OWNER TO admin;

--
-- Name: user_details_district_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_district_id_seq OWNER TO admin;

--
-- Name: user_details_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_district_id_seq OWNED BY public.user_details_district.id;


--
-- Name: user_details_panchayath; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_panchayath (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255),
    district_id bigint,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer
);


ALTER TABLE public.user_details_panchayath OWNER TO admin;

--
-- Name: user_details_panchayath_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_panchayath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_panchayath_id_seq OWNER TO admin;

--
-- Name: user_details_panchayath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_panchayath_id_seq OWNED BY public.user_details_panchayath.id;


--
-- Name: user_details_staffrole; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_staffrole (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255),
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer,
    json_sidebar jsonb
);


ALTER TABLE public.user_details_staffrole OWNER TO admin;

--
-- Name: user_details_staffrole_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_staffrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_staffrole_id_seq OWNER TO admin;

--
-- Name: user_details_staffrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_staffrole_id_seq OWNED BY public.user_details_staffrole.id;


--
-- Name: user_details_state; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_state (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer
);


ALTER TABLE public.user_details_state OWNER TO admin;

--
-- Name: user_details_state_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_state_id_seq OWNER TO admin;

--
-- Name: user_details_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_state_id_seq OWNED BY public.user_details_state.id;


--
-- Name: user_details_userdetails; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_userdetails (
    user_ptr_id integer NOT NULL,
    name character varying(266) NOT NULL,
    phone_number character varying(20),
    joined_date timestamp with time zone,
    designation character varying(255),
    bln_staff boolean,
    district_id bigint,
    panchayath_id bigint,
    staff_role_id bigint,
    state_id bigint,
    ward_id bigint,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer,
    user_image character varying(240),
    address text,
    blood_group character varying(50),
    committee_type_id bigint,
    pin_code character varying(255),
    str_panchayath character varying(255),
    str_ward character varying(255),
    is_details boolean,
    is_admin boolean
);


ALTER TABLE public.user_details_userdetails OWNER TO admin;

--
-- Name: user_details_ward; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_details_ward (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255),
    panchayath_id bigint,
    created_by_id integer,
    date_added timestamp with time zone,
    date_modified timestamp with time zone,
    modified_by_id integer
);


ALTER TABLE public.user_details_ward OWNER TO admin;

--
-- Name: user_details_ward_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_details_ward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_ward_id_seq OWNER TO admin;

--
-- Name: user_details_ward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_details_ward_id_seq OWNED BY public.user_details_ward.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: booking_program_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model ALTER COLUMN id SET DEFAULT nextval('public.booking_program_model_id_seq'::regclass);


--
-- Name: booking_program_model_qr_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model_qr_permission ALTER COLUMN id SET DEFAULT nextval('public.booking_program_model_qr_permission_id_seq'::regclass);


--
-- Name: booking_ticketbooking id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_ticketbooking ALTER COLUMN id SET DEFAULT nextval('public.booking_ticketbooking_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: news_meetingattendance id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingattendance ALTER COLUMN id SET DEFAULT nextval('public.news_meetingattendance_id_seq'::regclass);


--
-- Name: news_meetinghighligths id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetinghighligths ALTER COLUMN id SET DEFAULT nextval('public.news_meetinghighligths_id_seq'::regclass);


--
-- Name: news_meetingphoto id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingphoto ALTER COLUMN id SET DEFAULT nextval('public.news_meetingphoto_id_seq'::regclass);


--
-- Name: news_news id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news ALTER COLUMN id SET DEFAULT nextval('public.news_news_id_seq'::regclass);


--
-- Name: news_newstype id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_newstype ALTER COLUMN id SET DEFAULT nextval('public.news_newstype_id_seq'::regclass);


--
-- Name: register_admin_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model ALTER COLUMN id SET DEFAULT nextval('public.register_admin_model_id_seq'::regclass);


--
-- Name: register_committee_members id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members ALTER COLUMN id SET DEFAULT nextval('public.register_committee_members_id_seq'::regclass);


--
-- Name: user_details_bloodgroup id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_bloodgroup ALTER COLUMN id SET DEFAULT nextval('public.user_details_bloodgroup_id_seq'::regclass);


--
-- Name: user_details_committee id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee ALTER COLUMN id SET DEFAULT nextval('public.user_details_committee_id_seq'::regclass);


--
-- Name: user_details_committeetype id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committeetype ALTER COLUMN id SET DEFAULT nextval('public.user_details_committeetype_id_seq'::regclass);


--
-- Name: user_details_district id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_district ALTER COLUMN id SET DEFAULT nextval('public.user_details_district_id_seq'::regclass);


--
-- Name: user_details_panchayath id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_panchayath ALTER COLUMN id SET DEFAULT nextval('public.user_details_panchayath_id_seq'::regclass);


--
-- Name: user_details_staffrole id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_staffrole ALTER COLUMN id SET DEFAULT nextval('public.user_details_staffrole_id_seq'::regclass);


--
-- Name: user_details_state id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_state ALTER COLUMN id SET DEFAULT nextval('public.user_details_state_id_seq'::regclass);


--
-- Name: user_details_ward id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_ward ALTER COLUMN id SET DEFAULT nextval('public.user_details_ward_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add block	7	add_block
26	Can change block	7	change_block
27	Can delete block	7	delete_block
28	Can view block	7	view_block
29	Can add district	8	add_district
30	Can change district	8	change_district
31	Can delete district	8	delete_district
32	Can view district	8	view_district
33	Can add panchayath	9	add_panchayath
34	Can change panchayath	9	change_panchayath
35	Can delete panchayath	9	delete_panchayath
36	Can view panchayath	9	view_panchayath
37	Can add staff role	10	add_staffrole
38	Can change staff role	10	change_staffrole
39	Can delete staff role	10	delete_staffrole
40	Can view staff role	10	view_staffrole
41	Can add state	11	add_state
42	Can change state	11	change_state
43	Can delete state	11	delete_state
44	Can view state	11	view_state
45	Can add ward	12	add_ward
46	Can change ward	12	change_ward
47	Can delete ward	12	delete_ward
48	Can view ward	12	view_ward
49	Can add user	13	add_userdetails
50	Can change user	13	change_userdetails
51	Can delete user	13	delete_userdetails
52	Can view user	13	view_userdetails
53	Can add news type	14	add_newstype
54	Can change news type	14	change_newstype
55	Can delete news type	14	delete_newstype
56	Can view news type	14	view_newstype
57	Can add news	15	add_news
58	Can change news	15	change_news
59	Can delete news	15	delete_news
60	Can view news	15	view_news
61	Can add committee	16	add_committee
62	Can change committee	16	change_committee
63	Can delete committee	16	delete_committee
64	Can view committee	16	view_committee
65	Can add committee type	17	add_committeetype
66	Can change committee type	17	change_committeetype
67	Can delete committee type	17	delete_committeetype
68	Can view committee type	17	view_committeetype
69	Can add meeting highligths	18	add_meetinghighligths
70	Can change meeting highligths	18	change_meetinghighligths
71	Can delete meeting highligths	18	delete_meetinghighligths
72	Can view meeting highligths	18	view_meetinghighligths
73	Can add meeting photo	19	add_meetingphoto
74	Can change meeting photo	19	change_meetingphoto
75	Can delete meeting photo	19	delete_meetingphoto
76	Can view meeting photo	19	view_meetingphoto
77	Can add meeting attendance	20	add_meetingattendance
78	Can change meeting attendance	20	change_meetingattendance
79	Can delete meeting attendance	20	delete_meetingattendance
80	Can view meeting attendance	20	view_meetingattendance
81	Can add blood group	21	add_bloodgroup
82	Can change blood group	21	change_bloodgroup
83	Can delete blood group	21	delete_bloodgroup
84	Can view blood group	21	view_bloodgroup
85	Can add admin_model	22	add_admin_model
86	Can change admin_model	22	change_admin_model
87	Can delete admin_model	22	delete_admin_model
88	Can view admin_model	22	view_admin_model
89	Can add program_model	23	add_program_model
90	Can change program_model	23	change_program_model
91	Can delete program_model	23	delete_program_model
92	Can view program_model	23	view_program_model
93	Can add ticket booking	24	add_ticketbooking
94	Can change ticket booking	24	change_ticketbooking
95	Can delete ticket booking	24	delete_ticketbooking
96	Can view ticket booking	24	view_ticketbooking
97	Can add committee_members	25	add_committee_members
98	Can change committee_members	25	change_committee_members
99	Can delete committee_members	25	delete_committee_members
100	Can view committee_members	25	view_committee_members
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$iCwLkyHkAWgOXFfaBsLfvq$VXBWVYiQSn2lnSgAjuA4QaIpCMAfcj+CoQD1hIGVHB4=	2022-07-20 09:30:11.612635+00	t	shanid				t	t	2022-07-19 12:12:50.81736+00
42	pbkdf2_sha256$320000$pD4hIgRk8hmgPXmFZ5SO75$af7p61DYneUJPiMKb3/FuqC/rHnIuz2rbefTmnazqTM=	\N	t	superuser01				t	t	2023-01-24 10:22:53.227254+00
35	pbkdf2_sha256$320000$E44e9vlZLAkX831vyn71v8$C0o9IsNCwoIdWTEIsNdYNg/UaWq0CEwSChMyKHEHIc8=	\N	f	testdummy				f	t	2022-12-14 07:17:06.563649+00
21	pbkdf2_sha256$320000$bnf9Gh9amxo7wJlrsJNzCn$SjtGtYegm4LEJ/ZTEnu77xebyhYiMlgLOiNGJadD36I=	\N	f	arjun				f	t	2022-10-28 07:21:20.061269+00
43	pbkdf2_sha256$320000$ReE8iOCIeDZIxexh6ZRgpY$GhzQSkT9/JmFGkS7O8Ivk/7RlXoDp+hD9IWYsE5XeN0=	\N	t	Super111				f	t	2023-01-24 10:37:28.450561+00
44	pbkdf2_sha256$320000$ODxNlQkWZ71kSzn3LOpt7G$bU4z8i/Ev8fknQ+j7TQ4ShBPJ/GYj6QR0XyhjFjnkG4=	\N	t	Superadmin				f	t	2023-01-24 10:39:04.515322+00
23	pbkdf2_sha256$320000$2bDDUpOCkGkqIIyRwv8nea$RMvoMRO3Vjg6FcDHcb1gqPoPL/HGHpOeqDsrrFcJppc=	\N	f	akhila				f	t	2022-10-28 08:56:17.730212+00
24	pbkdf2_sha256$320000$2gx9mjwdJd5Nm9OmysijNL$WaU25wsmRfUOe4cLiX6ssp533aSMPo6SNFzZEbqajtc=	\N	f	raju				f	t	2022-10-28 08:58:59.706066+00
45	pbkdf2_sha256$320000$UfqFB4WSVaSCfpOeljqfIA$G6XCvLmAL0awK8WARK6ReZakNpz8dF7B00jwNhfgm5U=	\N	t	Superadmin12				f	t	2023-01-24 10:43:01.403585+00
11	pbkdf2_sha256$320000$ZNc0kfb5ozDJqRmPpMxuPN$pk4T+1/46sFyGz961LDcJlpNtsKM82KCiBvN359fAew=	\N	f	163992760098	SreeJagath K S			f	t	2022-08-25 15:06:25.373142+00
27	pbkdf2_sha256$320000$K8OxIJlRo56GBq7UeiSqJg$Gzh7tiikGFVnhrubzB2IQr/pbTSHVmi30Q3vet9vgps=	\N	f	surumi				f	t	2022-10-29 03:47:00.392152+00
26	pbkdf2_sha256$320000$WUhAdLyMXkROM9CyQJgHXk$644uqgrpd+dxJ7XcYfTrIkX1Vjh3L39O+juoRfpqqSo=	\N	f	cyberonics				f	t	2022-10-28 11:45:01.265707+00
15	pbkdf2_sha256$320000$nlkBTfi5uj84t8cnIZb0Qm$AZVkQoDmV23TkN/H636avECeNTFlN0/VwEE4ZyAtAOc=	\N	f	dummy@cyberonics	TestCybero	check	cyberonics@gmail.com	f	t	2022-10-04 05:12:29.760183+00
16	pbkdf2_sha256$320000$p5AqHlMjrJ8hqXiw3MGc45$GDUPiMzY5YIjFUzEgfvC65AUA1VxGLUN8sitaoI/WwI=	\N	t	superuser				f	t	2022-10-27 08:54:53.764975+00
38	pbkdf2_sha256$320000$N36RpUP2qveC0sn8nszbBa$XiJTq77YJm4GhVtKVkVl4/1vtXX09QbmnmC9/oUU4dM=	\N	f	163997748293	Rajeena			f	t	2022-12-15 05:09:07.497428+00
31	pbkdf2_sha256$320000$wUJM8HbxmYY0LQMtE3beAQ$teZq5vwfdCFUjwSNWP9yy6dZNSqtowyeaE7dT7OXowg=	\N	f	vishnu123				f	t	2022-11-04 06:59:35.078286+00
41	pbkdf2_sha256$320000$PGHYziVpbxavnhp7WyQmQZ$KseoF/45lZEx+7RBe00mN3SJYYDjtlWWpNvi3gY/EAk=	\N	f	user				f	t	2022-12-21 08:40:11.50319+00
14	pbkdf2_sha256$320000$MlyOpKnk95s4XhK1qEHlND$ebjWBqyE86DLXK+v9F2iGP9qWPRXpFmvugM8X1Rg1F0=	\N	f	163799581970	Rasheed chungath			f	t	2022-08-29 04:31:37.853452+00
20	pbkdf2_sha256$320000$hbt4wF0CSKPPfpre7PBJiW$duAyqzzS/tTZ7T0nN9GB0ebcJSOyxQA4668OEIrk67k=	\N	f	sreehari	Sreehari			f	t	2022-10-27 12:11:28.484973+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: booking_program_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.booking_program_model (id, program_name, date, start_time, end_time, venue, address, contact_no, food, agenda, inauguration_name, total_seats, available_seats, fk_admin_id_id, fk_district_id, fk_state_id, price, map_url) FROM stdin;
\.


--
-- Data for Name: booking_program_model_qr_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.booking_program_model_qr_permission (id, program_model_id, committee_members_id) FROM stdin;
\.


--
-- Data for Name: booking_ticketbooking; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.booking_ticketbooking (id, no_of_seats, payment_status, payment_completed, qr_code_image, fk_program_id, fk_user_id_id, total_amount, qr_image_scanned, qr_random_num, payment_id, date_booked) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	user_details	block
8	user_details	district
9	user_details	panchayath
10	user_details	staffrole
11	user_details	state
12	user_details	ward
13	user_details	userdetails
14	news	newstype
15	news	news
16	user_details	committee
17	user_details	committeetype
18	news	meetinghighligths
19	news	meetingphoto
20	news	meetingattendance
21	user_details	bloodgroup
22	register	admin_model
23	booking	program_model
24	booking	ticketbooking
25	register	committee_members
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-07-19 12:09:10.477675+00
2	auth	0001_initial	2022-07-19 12:09:10.552246+00
3	admin	0001_initial	2022-07-19 12:09:10.576219+00
4	admin	0002_logentry_remove_auto_add	2022-07-19 12:09:10.587675+00
5	admin	0003_logentry_add_action_flag_choices	2022-07-19 12:09:10.600021+00
6	contenttypes	0002_remove_content_type_name	2022-07-19 12:09:10.622982+00
7	auth	0002_alter_permission_name_max_length	2022-07-19 12:09:10.6339+00
8	auth	0003_alter_user_email_max_length	2022-07-19 12:09:10.655795+00
9	auth	0004_alter_user_username_opts	2022-07-19 12:09:10.676529+00
10	auth	0005_alter_user_last_login_null	2022-07-19 12:09:10.687118+00
11	auth	0006_require_contenttypes_0002	2022-07-19 12:09:10.689443+00
12	auth	0007_alter_validators_add_error_messages	2022-07-19 12:09:10.697395+00
13	auth	0008_alter_user_username_max_length	2022-07-19 12:09:10.708683+00
14	auth	0009_alter_user_last_name_max_length	2022-07-19 12:09:10.717755+00
15	auth	0010_alter_group_name_max_length	2022-07-19 12:09:10.72862+00
16	auth	0011_update_proxy_permissions	2022-07-19 12:09:10.736105+00
17	auth	0012_alter_user_first_name_max_length	2022-07-19 12:09:10.744272+00
18	news	0001_initial	2022-07-19 12:09:10.760162+00
19	news	0002_remove_news_vchr_image_news_news_image	2022-07-19 12:09:10.768066+00
20	news	0003_alter_news_news_image	2022-07-19 12:09:10.772182+00
21	sessions	0001_initial	2022-07-19 12:09:10.783178+00
22	user_details	0001_initial	2022-07-19 12:09:10.89636+00
23	user_details	0002_alter_block_code_alter_district_code_and_more	2022-07-19 12:09:10.920246+00
24	news	0004_alter_news_news_image	2022-07-29 09:39:36.150632+00
25	user_details	0003_remove_panchayath_block_remove_userdetails_block_and_more	2022-07-29 09:39:36.208338+00
26	user_details	0004_rename_district_panchayath_district	2022-07-29 09:39:36.221676+00
27	user_details	0005_alter_userdetails_staff_role	2022-07-29 12:31:35.261543+00
28	user_details	0006_alter_userdetails_designation	2022-08-02 06:35:51.571033+00
29	user_details	0007_alter_userdetails_phone_number	2022-08-02 06:35:51.589245+00
30	news	0005_news_created_by_news_date_modified_news_modified_by_and_more	2022-08-02 12:15:26.859638+00
31	user_details	0008_district_created_by_district_date_added_and_more	2022-08-02 12:15:27.242409+00
32	user_details	0009_userdetails_user_image_alter_userdetails_bln_staff	2022-08-03 08:39:56.583058+00
33	user_details	0010_committeetype_committee	2022-08-04 11:15:03.833419+00
34	news	0006_news_committe_type	2022-08-05 09:42:21.960949+00
35	news	0007_meetinghighligths_alter_news_description_and_more	2022-08-06 07:22:50.788482+00
36	news	0008_meetinghighligths_meeting_attendance_and_more	2022-08-06 08:42:37.215856+00
37	user_details	0011_staffrole_json_sidebar	2022-08-12 05:43:01.601415+00
38	user_details	0012_userdetails_committee	2022-08-25 04:49:00.164754+00
39	user_details	0013_remove_userdetails_committee_userdetails_address_and_more	2022-08-27 08:10:35.782594+00
40	news	0009_news_region	2022-08-27 08:10:35.808837+00
41	news	0010_alter_news_status	2022-08-27 08:10:35.876044+00
42	user_details	0014_userdetails_is_details	2022-08-27 08:10:35.894428+00
43	news	0011_alter_meetinghighligths_date_added_and_more	2022-09-13 05:00:14.155987+00
44	user_details	0015_alter_userdetails_is_details	2022-09-13 05:00:14.174969+00
45	user_details	0016_alter_bloodgroup_date_added_and_more	2022-09-13 05:00:14.521487+00
46	user_details	0017_userdetails_is_admin	2022-10-27 05:34:27.154037+00
47	register	0001_initial	2022-10-27 05:34:27.242715+00
48	user_details	0018_alter_userdetails_user_image	2022-11-30 08:42:15.34918+00
49	booking	0001_initial	2022-11-30 08:42:15.434787+00
50	booking	0002_alter_ticketbooking_qr_code_image	2022-11-30 08:42:15.457227+00
51	booking	0003_alter_ticketbooking_qr_code_image	2022-11-30 08:42:15.531106+00
52	booking	0004_program_model_price_ticketbooking_total_amount	2022-11-30 08:42:15.568123+00
53	booking	0005_alter_ticketbooking_total_amount	2022-11-30 08:42:15.591645+00
54	booking	0006_remove_program_model_schedule_and_more	2022-11-30 08:42:15.623229+00
55	booking	0007_ticketbooking_qr_image_scanned	2022-11-30 08:42:15.645502+00
56	booking	0008_ticketbooking_qr_random_num	2022-11-30 08:42:15.669486+00
57	booking	0009_remove_program_model_latitude_and_more	2022-12-02 17:49:24.286273+00
58	news	0012_rename_region_news_district_region_and_more	2022-12-12 08:19:23.055711+00
59	register	0002_committee_members	2022-12-15 07:53:24.410267+00
60	register	0003_committee_members_username	2023-01-12 11:45:25.987479+00
61	booking	0010_program_model_qr_permission	2023-01-12 11:45:26.039931+00
62	booking	0011_alter_program_model_qr_permission	2023-01-12 11:45:26.0761+00
63	booking	0012_alter_program_model_qr_permission	2023-01-12 11:45:26.151435+00
64	register	0004_alter_committee_members_panchayath_and_more	2023-01-12 11:45:26.210022+00
65	booking	0013_ticketbooking_date_booked	2023-01-17 12:05:25.555978+00
66	booking	0014_alter_ticketbooking_date_booked	2023-01-17 12:05:25.582644+00
67	booking	0015_alter_ticketbooking_date_booked	2023-01-18 10:14:01.252073+00
68	register	0005_admin_model_is_deleted	2023-01-24 12:18:40.805142+00
69	booking	0016_alter_program_model_fk_admin_id	2023-01-25 09:16:10.002307+00
70	booking	0017_alter_ticketbooking_fk_user_id	2023-01-25 09:16:10.030394+00
71	news	0013_alter_news_district_region	2023-01-25 09:16:10.056495+00
72	news	0014_alter_news_district_region	2023-01-25 09:16:10.130413+00
73	news	0015_alter_news_committe_type_alter_news_news_type_and_more	2023-01-25 09:16:10.225843+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
76oslk9aq1sg0g5sel3hu5itt3cf7in2	.eJxVjEEOwiAQRe_C2hBgBmxduvcMhIFBqgaS0q6MdzckXej2v_f-W_iwb8XvnVe_JHERWpx-NwrxyXWA9Aj13mRsdVsXkkORB-3y1hK_rof7d1BCL6OmTEw0MToHgMCaAChnG3BK0Ro0mikgg4lKMc4zR5OMddFZAmXO4vMFDFA4TA:1oE5wc:umG2JV-_V8mZpsv4YILHXc8PMNXADmGJEe_Qw1JHwwY	2022-08-03 09:24:38.287105+00
3s9qt1ti3mi3mqbi4mb61owx3enocqzr	.eJxVjEEOwiAQRe_C2hBgBmxduvcMhIFBqgaS0q6MdzckXej2v_f-W_iwb8XvnVe_JHERWpx-NwrxyXWA9Aj13mRsdVsXkkORB-3y1hK_rof7d1BCL6OmTEw0MToHgMCaAChnG3BK0Ro0mikgg4lKMc4zR5OMddFZAmXO4vMFDFA4TA:1oE61z:IEQwraK4mGLJPWPeP5junf7vGm4cm0JOlnQH3X1TG08	2022-08-03 09:30:11.614336+00
\.


--
-- Data for Name: news_meetingattendance; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news_meetingattendance (id, attendance, meeting_highligths_id) FROM stdin;
\.


--
-- Data for Name: news_meetinghighligths; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news_meetinghighligths (id, date_added, date_modified, meeting_minutes, description, created_by_id, modified_by_id, meeting_attendance) FROM stdin;
\.


--
-- Data for Name: news_meetingphoto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news_meetingphoto (id, photo, meeting_highligths_id) FROM stdin;
\.


--
-- Data for Name: news_news; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news_news (id, title, description, meeting_link, date_added, date_expired, status, news_type_id, news_image, created_by_id, date_modified, modified_by_id, committe_type_id, district_region_id, panchayath_region_id, show_all, state_region_id) FROM stdin;
\.


--
-- Data for Name: news_newstype; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news_newstype (id, name, created_by_id, date_added, date_modified, modified_by_id) FROM stdin;
\.


--
-- Data for Name: register_admin_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.register_admin_model (id, user_image, name, phone_number, username, login_token, created_by, updated_by, committee_type_id, district_id, panchayath_id, staff_role_id, state_id, user_id_id, ward_id, is_deleted) FROM stdin;
2	staff/user.png	Arjun	1234567890	arjun	0	20	\N	5	60	5	21	13	21	4	f
4	staff/business.jpg	Akhila	8943725437	akhila	0	19	\N	3	65	1	21	13	23	7	f
5	staff/meeting.jpeg	Raju	9012345678	raju	0	19	\N	1	60	5	21	13	24	4	f
8	staff/business_cILNlcV.jpg	surumi	9012345678	surumi	0	19	\N	3	60	3	20	13	27	6	f
7	staff/attendance.jpeg	cybero	9012345678	cyberonics	0	19	\N	3	65	1	21	13	26	7	f
12	staff/user1_Jg0Gh1m.jpeg	vishnu	8943725437	vishnu123	0	20	\N	7	60	5	20	13	31	4	f
16	staff/pngwing.com_hzREO9s.png	tester	9801234567	testdummy	0	20	\N	6	65	1	20	13	35	7	f
1	staff/user1.jpeg	Sreehari	901234567	sreehari	0	32	\N	5	65	1	20	13	20	7	f
21	staff/box-5.jpg	test user	7736696937	user	0	32	\N	4	60	5	20	13	41	4	f
22		Superadmin12	232323	Superadmin12	0	\N	\N	1	2	20	21	3	45	6	f
\.


--
-- Data for Name: register_committee_members; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.register_committee_members (id, user_image, name, phone_number, login_token, created_by, updated_by, committee_type_id, district_id, panchayath_id, staff_role_id, state_id, ward_id, username) FROM stdin;
5	staff/breaking-news-interface-screen-design-vector-34408869.jpeg	check	0011223344	0	32	\N	6	65	1	21	13	7	\N
10	default.jpeg	Arjun	1234567890	0	20	\N	5	65	\N	21	13	\N	arjun
12	default.jpeg	tester	9801234567	0	32	\N	6	65	1	20	13	7	testdummy
13	default.jpeg	tester sreehari	9801234567	0	20	\N	5	65	1	20	13	7	testdummy
15	default.jpeg	jesil	9012345678	0	32	\N	5	60	5	20	13	4	jesil
\.


--
-- Data for Name: user_details_bloodgroup; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_bloodgroup (id, date_added, date_modified, name, created_by_id, modified_by_id) FROM stdin;
\.


--
-- Data for Name: user_details_committee; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_committee (id, date_added, date_modified, name, phone_number, committee_type_id, created_by_id, modified_by_id, staff_role_id) FROM stdin;
\.


--
-- Data for Name: user_details_committeetype; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_committeetype (id, date_added, date_modified, name, code, created_by_id, modified_by_id) FROM stdin;
1	2022-08-04 11:22:32.692264+00	2022-08-04 11:22:32.692286+00	Board of Directors	BOD	\N	\N
2	2022-08-04 11:23:03.070037+00	2022-08-04 11:23:03.070058+00	Executive Committee	EC	\N	\N
3	2022-08-04 11:23:27.241045+00	2022-08-04 11:23:27.241067+00	National Committee	NC	\N	\N
4	2022-08-04 11:24:19.51264+00	2022-08-04 11:24:19.512661+00	State Committee	SC	\N	\N
5	2022-08-04 11:30:21.618269+00	2022-08-04 11:30:21.618291+00	District Committee	DC	\N	\N
6	2022-08-04 11:31:02.433096+00	2022-08-04 11:31:02.433117+00	Panchayath Committee	PC	\N	\N
7	2022-08-04 11:31:26.413389+00	2022-08-04 11:31:26.413418+00	Ward Committee	WC	\N	\N
\.


--
-- Data for Name: user_details_district; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_district (id, name, code, state_id, created_by_id, date_added, date_modified, modified_by_id) FROM stdin;
1	Alluri Sitharama Raju	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
2	Anakapalli	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
3	Anantapuramu	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
4	Annamayya	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
5	Bapatla	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
6	Chittoor	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
7	Dr. B.R. Ambedkar Konaseema	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
8	East Godavari	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
9	Eluru	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
10	Guntur	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
11	Kakinada	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
12	Krishna	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
13	Kurnool	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
14	Nandyal	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
15	NTR	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
16	Palnadu	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
17	Parvathipuram Manyam	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
18	Prakasam	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
19	Srikakulam	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
20	Sri Potti Sriramulu Nellore	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
21	Sri Sathya Sai	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
22	Tirupati	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
23	Visakhapatnam	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
24	Vizianagaram	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
25	West Godavari	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
26	YSR	\N	1	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
27	Anjaw	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
28	Changlang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
29	East Kameng	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
30	East Siang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
31	Kamle	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
32	Kra Daadi	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
33	Kurung Kumey	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
34	Lepa Rada	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
35	Lohit	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
36	Longding	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
37	Lower Dibang Valley	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
38	Lower Siang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
39	Lower Subansiri	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
40	Namsai	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
41	Pakke-Kessang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
42	Papum Pare	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
43	Shi Yomi	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
44	Siang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
45	Tawang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
46	Tirap	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
47	Upper Dibang Valley	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
48	Upper Siang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
49	Upper Subansiri	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
50	West Kameng	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
51	West Siang	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
52	Itanagar City Complex	\N	2	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
53	Kasaragod	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
54	Kannur	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
55	Wayanadu	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
56	Kozhikode	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
57	Malappuram	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
58	Palakkad	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
59	Thrissur	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
60	Ernakulam	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
62	Kottayam	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
63	Pathanamthitta	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
64	Alappuzha	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
65	Kollam	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
66	Thiruvananthapuram	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-02 12:15:26.897848+00	\N
67	Bangalore	\N	12	\N	2022-08-08 08:31:34.236602+00	2022-08-08 08:31:34.236628+00	\N
61	Idukki	\N	13	\N	2022-08-02 12:15:26.885824+00	2022-08-13 12:20:25.077281+00	\N
69	District 1	\N	3	\N	2022-08-20 09:43:25.416663+00	2022-08-20 09:43:25.416684+00	\N
70	District 2	\N	3	\N	2022-08-20 10:54:18.998024+00	2022-08-20 10:54:18.998046+00	\N
71	District 3	\N	3	\N	2022-08-20 10:57:51.877414+00	2022-08-20 10:57:51.877434+00	\N
73	District Test2	\N	13	14	2022-09-14 04:54:20.21602+00	2022-09-14 04:54:20.216041+00	\N
72	District Test 1	\N	13	14	2022-09-13 11:08:49.359941+00	2022-09-16 08:04:57.369554+00	\N
76	District T	\N	13	11	2022-10-04 08:33:41.636874+00	2022-10-04 08:33:41.636895+00	\N
79	South Goa	\N	6	20	2022-10-28 05:08:27.520111+00	2022-10-28 05:08:27.520131+00	\N
78	District 15	\N	13	20	2022-10-28 04:43:29.180554+00	2022-10-28 05:13:43.919582+00	20
81	District 16	\N	13	20	2022-11-04 06:34:17.352524+00	2022-11-04 06:34:17.352551+00	\N
82	District 17	\N	13	20	2022-12-06 08:47:41.834909+00	2022-12-06 08:47:55.624526+00	20
83	District 18	\N	13	20	2022-12-06 09:43:41.845684+00	2022-12-06 09:43:41.845707+00	\N
77	Madgoa	\N	6	\N	2022-10-28 04:26:13.595011+00	2022-10-28 04:26:13.595034+00	\N
80	Goa 1	\N	6	\N	2022-10-28 06:28:20.392033+00	2022-10-28 06:28:20.392052+00	\N
84	District A	\N	3	\N	2022-12-06 10:24:34.95683+00	2022-12-06 10:24:34.956857+00	\N
85	District B	\N	3	\N	2023-01-13 09:28:21.400337+00	2023-01-13 09:28:21.400358+00	\N
86	North Goa 1	\N	6	45	2023-01-24 10:49:17.227392+00	2023-01-24 10:49:17.227416+00	\N
87	South Goa 1	\N	6	45	2023-01-24 10:49:37.843003+00	2023-01-24 10:49:37.843026+00	\N
88	North Goa 2	\N	6	45	2023-01-24 10:52:50.67134+00	2023-01-24 10:52:50.671372+00	\N
\.


--
-- Data for Name: user_details_panchayath; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_panchayath (id, name, code, district_id, created_by_id, date_added, date_modified, modified_by_id) FROM stdin;
2	Panmana	\N	65	\N	2022-08-08 07:05:28.286045+00	2022-08-08 07:05:28.286067+00	\N
3	Kunnathunad	\N	60	\N	2022-08-08 08:07:32.340795+00	2022-08-08 08:07:32.340817+00	\N
5	Kaloor	\N	60	\N	2022-08-08 08:09:08.560711+00	2022-08-08 08:09:08.560731+00	\N
14	Panchayath1	\N	67	\N	2022-08-08 08:32:39.232542+00	2022-08-08 08:32:39.232569+00	\N
18	Karunagapally	\N	65	\N	2022-11-04 05:40:52.236862+00	2022-11-04 05:40:52.236881+00	\N
19	Panchayath A	\N	84	\N	2022-12-06 10:25:48.807036+00	2022-12-06 10:25:48.807057+00	\N
1	Chavara	\N	65	\N	2022-08-02 12:15:26.935634+00	2022-08-13 14:20:08.413072+00	\N
15	p1	\N	60	\N	2022-08-30 04:43:32.666615+00	2022-08-30 04:43:32.666636+00	\N
16	p3	\N	60	14	2022-09-07 09:26:55.65854+00	2022-09-07 09:26:55.658562+00	\N
17	Aluva	\N	60	21	2022-10-28 08:27:12.140166+00	2022-10-28 08:27:12.140196+00	\N
20	Adichanalloor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.146734+00	2022-12-12 08:23:22.146757+00	\N
21	Alappad Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.156894+00	2022-12-12 08:23:22.156915+00	\N
22	Alayamon Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.159009+00	2022-12-12 08:23:22.159026+00	\N
23	Anchal Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.160857+00	2022-12-12 08:23:22.160873+00	\N
24	Aryankavu Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.166983+00	2022-12-12 08:23:22.167004+00	\N
25	Chadayamangalam Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.169058+00	2022-12-12 08:23:22.169074+00	\N
26	Chathannoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.170962+00	2022-12-12 08:23:22.170978+00	\N
27	Chavara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.172777+00	2022-12-12 08:23:22.172792+00	\N
28	Chirakkara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.174497+00	2022-12-12 08:23:22.174511+00	\N
29	Chithara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.176107+00	2022-12-12 08:23:22.17612+00	\N
30	Clappana Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.177773+00	2022-12-12 08:23:22.177786+00	\N
31	East Kallada Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.179388+00	2022-12-12 08:23:22.179402+00	\N
32	Edamulackal Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.180983+00	2022-12-12 08:23:22.180996+00	\N
33	Elamadu Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.182572+00	2022-12-12 08:23:22.182585+00	\N
34	Elampalloor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.184265+00	2022-12-12 08:23:22.184277+00	\N
35	Ezhukone Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.185916+00	2022-12-12 08:23:22.185929+00	\N
36	Ittiva Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.187544+00	2022-12-12 08:23:22.187556+00	\N
37	Kadakkal Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.189099+00	2022-12-12 08:23:22.189111+00	\N
38	Kalluvathukkal Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.190792+00	2022-12-12 08:23:22.190807+00	\N
39	Karavaloor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.192515+00	2022-12-12 08:23:22.192526+00	\N
40	Kareepra Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.194038+00	2022-12-12 08:23:22.19405+00	\N
41	Kottamkara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.195612+00	2022-12-12 08:23:22.195623+00	\N
42	Kulakkada Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.197177+00	2022-12-12 08:23:22.197189+00	\N
43	Kulasekharapuram Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.198752+00	2022-12-12 08:23:22.198763+00	\N
44	Kulathupuzha Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.200186+00	2022-12-12 08:23:22.200198+00	\N
45	Kummil Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.201696+00	2022-12-12 08:23:22.201707+00	\N
46	Kundara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.203199+00	2022-12-12 08:23:22.20321+00	\N
47	Kunnathoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.204756+00	2022-12-12 08:23:22.204767+00	\N
48	Mayyanad Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.20652+00	2022-12-12 08:23:22.206535+00	\N
49	Melila Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.208255+00	2022-12-12 08:23:22.208267+00	\N
50	Munroethuruth Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.209935+00	2022-12-12 08:23:22.209948+00	\N
51	Mylom Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.211664+00	2022-12-12 08:23:22.211676+00	\N
52	Mynagappally Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.21328+00	2022-12-12 08:23:22.213298+00	\N
53	Nedumpana Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.214855+00	2022-12-12 08:23:22.214867+00	\N
54	Neduvathoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.216458+00	2022-12-12 08:23:22.21647+00	\N
55	Neendakara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.218055+00	2022-12-12 08:23:22.218068+00	\N
56	Nilamel Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.219622+00	2022-12-12 08:23:22.219635+00	\N
57	Oachira Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.221211+00	2022-12-12 08:23:22.221224+00	\N
58	Panayam Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.222871+00	2022-12-12 08:23:22.222883+00	\N
59	Panmana Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.224379+00	2022-12-12 08:23:22.224391+00	\N
60	Pathanapuram Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.225934+00	2022-12-12 08:23:22.225946+00	\N
61	Pattazhi Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.227584+00	2022-12-12 08:23:22.227597+00	\N
62	Pattazhi Vadakkekara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.229474+00	2022-12-12 08:23:22.229488+00	\N
63	Pavithreswaram Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.231122+00	2022-12-12 08:23:22.231136+00	\N
64	Perayam Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.232782+00	2022-12-12 08:23:22.232795+00	\N
65	Perinad Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.234405+00	2022-12-12 08:23:22.234418+00	\N
66	Piravanthoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.235996+00	2022-12-12 08:23:22.236012+00	\N
67	Poothakulam Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.237586+00	2022-12-12 08:23:22.237598+00	\N
68	Pooyappally Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.23941+00	2022-12-12 08:23:22.239423+00	\N
69	Poruvazhy Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.241589+00	2022-12-12 08:23:22.241606+00	\N
70	Sasthamcotta Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.243741+00	2022-12-12 08:23:22.243758+00	\N
71	Sooranad North Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.245963+00	2022-12-12 08:23:22.245981+00	\N
72	Sooranad South Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.248087+00	2022-12-12 08:23:22.248104+00	\N
73	Thalavoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.250133+00	2022-12-12 08:23:22.25015+00	\N
74	Thazhava Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.252128+00	2022-12-12 08:23:22.25217+00	\N
75	Thekkumbhagom Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.254217+00	2022-12-12 08:23:22.254235+00	\N
76	Thenmala Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.256319+00	2022-12-12 08:23:22.256337+00	\N
77	Thevalakkara Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.262379+00	2022-12-12 08:23:22.262404+00	\N
78	Thodiyoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.264957+00	2022-12-12 08:23:22.264981+00	\N
79	Thrikkaruva Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.267375+00	2022-12-12 08:23:22.267397+00	\N
80	Thrikkovilvattom Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.269912+00	2022-12-12 08:23:22.269934+00	\N
81	Ummannoor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.272293+00	2022-12-12 08:23:22.272314+00	\N
82	Velinalloor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.274491+00	2022-12-12 08:23:22.274512+00	\N
83	Veliyam Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.276676+00	2022-12-12 08:23:22.276698+00	\N
84	Vettikavala Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.279057+00	2022-12-12 08:23:22.279075+00	\N
85	Vilakkudy Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.282598+00	2022-12-12 08:23:22.282619+00	\N
86	West Kallada Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.28482+00	2022-12-12 08:23:22.284841+00	\N
87	Yeroor Grama Panchayat	\N	65	\N	2022-12-12 08:23:22.286978+00	2022-12-12 08:23:22.286998+00	\N
88	Anicadu Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.458311+00	2022-12-12 08:23:22.458341+00	\N
89	Aranmula Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.463791+00	2022-12-12 08:23:22.463816+00	\N
90	Aruvappulam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.466895+00	2022-12-12 08:23:22.46692+00	\N
91	Ayroor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.4697+00	2022-12-12 08:23:22.469724+00	\N
92	Chenneerkara Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.472263+00	2022-12-12 08:23:22.472285+00	\N
93	Cherukole Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.474861+00	2022-12-12 08:23:22.474883+00	\N
94	Chittar Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.477557+00	2022-12-12 08:23:22.477578+00	\N
95	Elanthoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.479959+00	2022-12-12 08:23:22.47998+00	\N
96	Enadimangalam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.482439+00	2022-12-12 08:23:22.482462+00	\N
97	Erathu Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.484613+00	2022-12-12 08:23:22.484634+00	\N
98	Eraviperoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.487046+00	2022-12-12 08:23:22.487085+00	\N
99	Ezhamkulam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.489427+00	2022-12-12 08:23:22.489447+00	\N
100	Ezhumattoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.491839+00	2022-12-12 08:23:22.491858+00	\N
101	Kadampanad Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.494193+00	2022-12-12 08:23:22.494212+00	\N
102	Kadapra Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.496632+00	2022-12-12 08:23:22.496651+00	\N
103	Kalanjoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.498916+00	2022-12-12 08:23:22.498935+00	\N
104	Kallooppara Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.501133+00	2022-12-12 08:23:22.501153+00	\N
105	Kaviyoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.50342+00	2022-12-12 08:23:22.503439+00	\N
106	Kodumon Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.505799+00	2022-12-12 08:23:22.505814+00	\N
107	Koipuram Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.507527+00	2022-12-12 08:23:22.507542+00	\N
108	Konni Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.509212+00	2022-12-12 08:23:22.509228+00	\N
109	Kottanad Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.511235+00	2022-12-12 08:23:22.51125+00	\N
110	Kottangal Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.512997+00	2022-12-12 08:23:22.513012+00	\N
111	Kozhencherry Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.514777+00	2022-12-12 08:23:22.514791+00	\N
112	Kulanada Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.516655+00	2022-12-12 08:23:22.516669+00	\N
113	Kunnamthanam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.518441+00	2022-12-12 08:23:22.518455+00	\N
114	Kuttoor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.5203+00	2022-12-12 08:23:22.520319+00	\N
115	Malayalapuzha Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.522088+00	2022-12-12 08:23:22.522103+00	\N
116	Mallappally Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.524039+00	2022-12-12 08:23:22.524062+00	\N
117	Mallappuzhassery Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.532496+00	2022-12-12 08:23:22.532517+00	\N
118	Mezhuveli Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.534806+00	2022-12-12 08:23:22.534826+00	\N
119	Mylapra Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.53694+00	2022-12-12 08:23:22.536957+00	\N
120	Naranammoozhy Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.538946+00	2022-12-12 08:23:22.538964+00	\N
121	Naranganam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.541025+00	2022-12-12 08:23:22.541045+00	\N
122	Nedumpuram Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.543123+00	2022-12-12 08:23:22.543141+00	\N
123	Niranam Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.544999+00	2022-12-12 08:23:22.545016+00	\N
124	Omalloor Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.546929+00	2022-12-12 08:23:22.546946+00	\N
125	Pallickal Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.548609+00	2022-12-12 08:23:22.548625+00	\N
126	Pandalam Thekkekara Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.550564+00	2022-12-12 08:23:22.55058+00	\N
127	Peringara Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.552317+00	2022-12-12 08:23:22.552331+00	\N
128	Pramadom Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.554036+00	2022-12-12 08:23:22.554051+00	\N
129	Puramattom Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.555804+00	2022-12-12 08:23:22.555819+00	\N
130	Ranni Angadi Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.5575+00	2022-12-12 08:23:22.557513+00	\N
131	Ranni Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.559103+00	2022-12-12 08:23:22.559117+00	\N
132	Ranni Pazhavangadi Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.560733+00	2022-12-12 08:23:22.560748+00	\N
133	Ranni Perunadu Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.562448+00	2022-12-12 08:23:22.562462+00	\N
134	Seethathodu Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.564042+00	2022-12-12 08:23:22.564055+00	\N
135	Thannithodu Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.565656+00	2022-12-12 08:23:22.565671+00	\N
136	Thottappuzhassery Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.567303+00	2022-12-12 08:23:22.567315+00	\N
137	Thumpamon Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.56876+00	2022-12-12 08:23:22.568772+00	\N
138	Vadaserikara Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.570569+00	2022-12-12 08:23:22.570581+00	\N
139	Vallicode Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.572375+00	2022-12-12 08:23:22.572387+00	\N
140	Vechoochira Grama Panchayat	\N	63	\N	2022-12-12 08:23:22.574113+00	2022-12-12 08:23:22.574126+00	\N
141	Ala Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.597063+00	2022-12-12 08:23:22.597083+00	\N
142	Ambalapuzha North Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.599317+00	2022-12-12 08:23:22.599337+00	\N
143	Ambalapuzha South Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.60123+00	2022-12-12 08:23:22.601292+00	\N
144	Arattupuzha Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.603055+00	2022-12-12 08:23:22.603072+00	\N
145	Arookutty Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.604643+00	2022-12-12 08:23:22.604659+00	\N
146	Aroor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.606364+00	2022-12-12 08:23:22.606378+00	\N
147	Aryad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.608072+00	2022-12-12 08:23:22.608085+00	\N
148	Bharanickavu Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.609722+00	2022-12-12 08:23:22.609735+00	\N
149	Budhanoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.611351+00	2022-12-12 08:23:22.611364+00	\N
150	Champakulam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.613148+00	2022-12-12 08:23:22.613163+00	\N
151	Chennam Pallippuram Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.616061+00	2022-12-12 08:23:22.616075+00	\N
152	Chennithala-Thripperumthura Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.619783+00	2022-12-12 08:23:22.619799+00	\N
153	Cheppad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.621813+00	2022-12-12 08:23:22.621827+00	\N
154	Cheriyanad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.623605+00	2022-12-12 08:23:22.623619+00	\N
155	Cherthala South Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.625571+00	2022-12-12 08:23:22.625585+00	\N
156	Cheruthana Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.62712+00	2022-12-12 08:23:22.627133+00	\N
157	Chettikulangara Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.628596+00	2022-12-12 08:23:22.628608+00	\N
158	Chingoli Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.630304+00	2022-12-12 08:23:22.630316+00	\N
159	Chunakara Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.631948+00	2022-12-12 08:23:22.631961+00	\N
160	Devikulangara Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.633682+00	2022-12-12 08:23:22.633694+00	\N
161	Edathua Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.635486+00	2022-12-12 08:23:22.635498+00	\N
162	Ezhupunna Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.637002+00	2022-12-12 08:23:22.637014+00	\N
163	Kadakkarappally Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.638752+00	2022-12-12 08:23:22.638764+00	\N
164	Kainakary Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.640268+00	2022-12-12 08:23:22.640279+00	\N
165	Kandalloor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.641866+00	2022-12-12 08:23:22.641878+00	\N
166	Kanjikuzhy Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.64334+00	2022-12-12 08:23:22.643352+00	\N
167	Karthikappally Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.644974+00	2022-12-12 08:23:22.644986+00	\N
168	Karuvatta Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.646598+00	2022-12-12 08:23:22.64661+00	\N
169	Kavalam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.648146+00	2022-12-12 08:23:22.648157+00	\N
170	Kodamthuruth Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.649875+00	2022-12-12 08:23:22.649886+00	\N
171	Krishnapuram Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.651386+00	2022-12-12 08:23:22.651398+00	\N
172	Kumarapuram Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.652856+00	2022-12-12 08:23:22.652868+00	\N
173	Kuthiathod Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.654888+00	2022-12-12 08:23:22.654901+00	\N
174	Mannancherry Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.656548+00	2022-12-12 08:23:22.656562+00	\N
175	Mannar Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.658256+00	2022-12-12 08:23:22.658269+00	\N
176	Mararikulam North Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.659944+00	2022-12-12 08:23:22.659957+00	\N
177	Mararikulam South Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.661656+00	2022-12-12 08:23:22.661669+00	\N
178	Mavelikara Thamarakulam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.663337+00	2022-12-12 08:23:22.663349+00	\N
179	Mavelikara Thekkekara Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.66487+00	2022-12-12 08:23:22.664882+00	\N
180	Muhamma Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.666564+00	2022-12-12 08:23:22.666576+00	\N
181	Mulakuzha Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.668124+00	2022-12-12 08:23:22.668136+00	\N
182	Muthukulam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.669662+00	2022-12-12 08:23:22.669674+00	\N
183	Muttar Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.67128+00	2022-12-12 08:23:22.671292+00	\N
184	Nedumudi Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.672791+00	2022-12-12 08:23:22.672802+00	\N
185	Neelamperoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.674512+00	2022-12-12 08:23:22.674523+00	\N
186	Nooranad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.676163+00	2022-12-12 08:23:22.676175+00	\N
187	Palamel Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.678135+00	2022-12-12 08:23:22.678147+00	\N
188	Pallippad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.679717+00	2022-12-12 08:23:22.679729+00	\N
189	Panavally Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.681208+00	2022-12-12 08:23:22.68122+00	\N
190	Pandanad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.682857+00	2022-12-12 08:23:22.682869+00	\N
191	Pathiyoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.684521+00	2022-12-12 08:23:22.684533+00	\N
192	Pattanakkad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.68607+00	2022-12-12 08:23:22.686081+00	\N
193	Perumpalam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.687642+00	2022-12-12 08:23:22.687653+00	\N
194	Pulincunnoo Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.689344+00	2022-12-12 08:23:22.689356+00	\N
195	Puliyoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.690928+00	2022-12-12 08:23:22.69094+00	\N
196	Punnapra North Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.692451+00	2022-12-12 08:23:22.692465+00	\N
197	Punnapra South Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.694195+00	2022-12-12 08:23:22.694207+00	\N
198	Purakkad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.695742+00	2022-12-12 08:23:22.695754+00	\N
199	Ramankary Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.697297+00	2022-12-12 08:23:22.697308+00	\N
200	Thakazhy Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.698826+00	2022-12-12 08:23:22.698838+00	\N
201	Thalavady Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.700348+00	2022-12-12 08:23:22.70036+00	\N
202	Thanneermukkom Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.702036+00	2022-12-12 08:23:22.702048+00	\N
203	Thazhakara Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.703627+00	2022-12-12 08:23:22.703639+00	\N
204	Thiruvanvandoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.705346+00	2022-12-12 08:23:22.705363+00	\N
205	Thrikkunnappuzha Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.706997+00	2022-12-12 08:23:22.707009+00	\N
206	Thuravoor Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.708609+00	2022-12-12 08:23:22.708621+00	\N
207	Thycattussery Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.710202+00	2022-12-12 08:23:22.710213+00	\N
208	Vallikunnam Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.711791+00	2022-12-12 08:23:22.711803+00	\N
209	Vayalar Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.713509+00	2022-12-12 08:23:22.71352+00	\N
210	Veeyapuram Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.715131+00	2022-12-12 08:23:22.715142+00	\N
211	Veliyanad Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.716649+00	2022-12-12 08:23:22.716661+00	\N
212	Venmoney Grama Panchayat	\N	64	\N	2022-12-12 08:23:22.71817+00	2022-12-12 08:23:22.718182+00	\N
213	Akalakunnam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.740271+00	2022-12-12 08:23:22.740291+00	\N
214	Arpookara Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.74239+00	2022-12-12 08:23:22.742408+00	\N
215	Athirampuzha Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.744209+00	2022-12-12 08:23:22.744228+00	\N
216	Ayarkunnam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.746077+00	2022-12-12 08:23:22.746093+00	\N
217	Aymanam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.747907+00	2022-12-12 08:23:22.747921+00	\N
218	Bharananganam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.749714+00	2022-12-12 08:23:22.749729+00	\N
219	Chempu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.751371+00	2022-12-12 08:23:22.751384+00	\N
220	Chirakkadavu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.75309+00	2022-12-12 08:23:22.753104+00	\N
221	Elikulam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.754716+00	2022-12-12 08:23:22.754729+00	\N
222	Erumely Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.756342+00	2022-12-12 08:23:22.756354+00	\N
223	Kadanad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.7579+00	2022-12-12 08:23:22.757912+00	\N
224	Kadaplamattom Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.759439+00	2022-12-12 08:23:22.759451+00	\N
225	Kaduthuruthy Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.760933+00	2022-12-12 08:23:22.760944+00	\N
226	Kallara Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.762456+00	2022-12-12 08:23:22.762467+00	\N
227	Kanakkary Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.763925+00	2022-12-12 08:23:22.763937+00	\N
228	Kangazha Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.765581+00	2022-12-12 08:23:22.765594+00	\N
229	Kanjirappally Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.767168+00	2022-12-12 08:23:22.76718+00	\N
230	Karoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.768925+00	2022-12-12 08:23:22.768937+00	\N
231	Karukachal Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.770736+00	2022-12-12 08:23:22.770748+00	\N
232	Kidangoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.772351+00	2022-12-12 08:23:22.772364+00	\N
233	Kooroppada Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.774103+00	2022-12-12 08:23:22.774118+00	\N
234	Koottickal Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.775734+00	2022-12-12 08:23:22.775746+00	\N
235	Koruthodu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.777416+00	2022-12-12 08:23:22.777429+00	\N
236	Kozhuvanal Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.779005+00	2022-12-12 08:23:22.779017+00	\N
237	Kumarakom Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.780626+00	2022-12-12 08:23:22.780638+00	\N
238	Kuravilangad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.782382+00	2022-12-12 08:23:22.782394+00	\N
239	Kurichy Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.783969+00	2022-12-12 08:23:22.783981+00	\N
240	Madappally Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.785588+00	2022-12-12 08:23:22.7856+00	\N
241	Manarcadu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.787213+00	2022-12-12 08:23:22.787225+00	\N
242	Manimala Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.788763+00	2022-12-12 08:23:22.788775+00	\N
243	Manjoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.790705+00	2022-12-12 08:23:22.790719+00	\N
244	Marangattupilly Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.792476+00	2022-12-12 08:23:22.79249+00	\N
245	Maravanthuruthu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.794155+00	2022-12-12 08:23:22.794169+00	\N
246	Meenachil Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.795759+00	2022-12-12 08:23:22.795773+00	\N
247	Meenadom Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.797758+00	2022-12-12 08:23:22.797772+00	\N
248	Melukavu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.799325+00	2022-12-12 08:23:22.799339+00	\N
249	Moonnilavu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.800971+00	2022-12-12 08:23:22.800984+00	\N
250	Mulakulam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.802611+00	2022-12-12 08:23:22.802624+00	\N
251	Mundakayam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.804205+00	2022-12-12 08:23:22.804219+00	\N
252	Mutholy Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.805892+00	2022-12-12 08:23:22.805905+00	\N
253	Nedumkunnam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.807512+00	2022-12-12 08:23:22.807525+00	\N
254	Neendoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.809409+00	2022-12-12 08:23:22.809422+00	\N
255	Neezhoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.810989+00	2022-12-12 08:23:22.811+00	\N
256	Paippad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.812554+00	2022-12-12 08:23:22.812566+00	\N
257	Pallickathodu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.814203+00	2022-12-12 08:23:22.814215+00	\N
258	Pampady Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.81571+00	2022-12-12 08:23:22.815721+00	\N
259	Panachikkad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.817211+00	2022-12-12 08:23:22.817223+00	\N
260	Parathodu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.818782+00	2022-12-12 08:23:22.818793+00	\N
261	Poonjar Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.820396+00	2022-12-12 08:23:22.820408+00	\N
262	Poonjar Thekkekara Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.821966+00	2022-12-12 08:23:22.821978+00	\N
263	Puthuppally Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.82352+00	2022-12-12 08:23:22.823533+00	\N
264	Ramapuram Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.825187+00	2022-12-12 08:23:22.825199+00	\N
265	Teekoy Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.826753+00	2022-12-12 08:23:22.826766+00	\N
266	Thalanad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.828257+00	2022-12-12 08:23:22.828269+00	\N
267	Thalappalam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.829817+00	2022-12-12 08:23:22.829829+00	\N
268	Thalayazham Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.831363+00	2022-12-12 08:23:22.831375+00	\N
269	Thalayolaparambu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.832876+00	2022-12-12 08:23:22.832887+00	\N
270	Thidanad Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.834475+00	2022-12-12 08:23:22.834487+00	\N
271	Thiruvarppu Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.836185+00	2022-12-12 08:23:22.836197+00	\N
272	Thrickodithanam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.837793+00	2022-12-12 08:23:22.837806+00	\N
273	TV Puram Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.839519+00	2022-12-12 08:23:22.839533+00	\N
274	Udayanapuram Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.841344+00	2022-12-12 08:23:22.841359+00	\N
275	Uzhavoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.842994+00	2022-12-12 08:23:22.843008+00	\N
276	Vakathanam Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.844738+00	2022-12-12 08:23:22.844752+00	\N
277	Vazhappally Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.846476+00	2022-12-12 08:23:22.846492+00	\N
278	Vazhoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.848074+00	2022-12-12 08:23:22.848086+00	\N
279	Vechoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.849801+00	2022-12-12 08:23:22.849814+00	\N
280	Veliyannoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.85142+00	2022-12-12 08:23:22.851432+00	\N
281	Vellavoor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.852952+00	2022-12-12 08:23:22.852964+00	\N
282	Velloor Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.854484+00	2022-12-12 08:23:22.854496+00	\N
283	Vijayapuram Grama Panchayat	\N	62	\N	2022-12-12 08:23:22.856016+00	2022-12-12 08:23:22.856028+00	\N
284	Adimaly Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.877157+00	2022-12-12 08:23:22.877177+00	\N
285	Alakode Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.879215+00	2022-12-12 08:23:22.879238+00	\N
286	Arakulam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.881007+00	2022-12-12 08:23:22.881025+00	\N
287	AyyappanCoil Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.882799+00	2022-12-12 08:23:22.882815+00	\N
288	BysonValley Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.884623+00	2022-12-12 08:23:22.884638+00	\N
289	Chakkupallam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.886271+00	2022-12-12 08:23:22.886285+00	\N
290	Chinnakanal Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.88788+00	2022-12-12 08:23:22.887893+00	\N
291	Devikulam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.889474+00	2022-12-12 08:23:22.889489+00	\N
292	Edamalakkudy Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.891106+00	2022-12-12 08:23:22.891119+00	\N
293	Edavetty Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.892655+00	2022-12-12 08:23:22.892668+00	\N
294	Elappara Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.89426+00	2022-12-12 08:23:22.894272+00	\N
295	Erattayar Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.895793+00	2022-12-12 08:23:22.895805+00	\N
296	IdukkiKanjikuzhy Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.897328+00	2022-12-12 08:23:22.89734+00	\N
297	Kamakshy Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.898915+00	2022-12-12 08:23:22.898926+00	\N
298	Kanchiyar Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.900607+00	2022-12-12 08:23:22.900618+00	\N
299	Kanthalloor Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.902193+00	2022-12-12 08:23:22.902205+00	\N
300	Karimannoor Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.90382+00	2022-12-12 08:23:22.903831+00	\N
301	Karimkunnam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.905646+00	2022-12-12 08:23:22.905657+00	\N
302	Karunapuram Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.907345+00	2022-12-12 08:23:22.907356+00	\N
303	Kodikulam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.908896+00	2022-12-12 08:23:22.908907+00	\N
304	Kokkayar Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.910586+00	2022-12-12 08:23:22.910597+00	\N
305	Konnathady Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.912288+00	2022-12-12 08:23:22.912299+00	\N
306	Kudayathoor Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.913872+00	2022-12-12 08:23:22.913883+00	\N
307	Kumaramangalam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.915428+00	2022-12-12 08:23:22.915439+00	\N
308	Kumily Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.917208+00	2022-12-12 08:23:22.917221+00	\N
309	Manakkad Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.919136+00	2022-12-12 08:23:22.919154+00	\N
310	Mankulam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.920846+00	2022-12-12 08:23:22.920859+00	\N
311	Marayoor Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.922629+00	2022-12-12 08:23:22.922642+00	\N
312	Mariyapuram Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.924301+00	2022-12-12 08:23:22.924314+00	\N
313	Munnar Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.925952+00	2022-12-12 08:23:22.925966+00	\N
314	Muttom Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.927546+00	2022-12-12 08:23:22.927559+00	\N
315	Nedumkandam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.929176+00	2022-12-12 08:23:22.929193+00	\N
316	Pallivasal Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.930988+00	2022-12-12 08:23:22.931001+00	\N
317	Pampadumpara Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.932662+00	2022-12-12 08:23:22.932675+00	\N
318	Peermade Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.934317+00	2022-12-12 08:23:22.93433+00	\N
319	Peruvanthanam Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.935951+00	2022-12-12 08:23:22.935963+00	\N
320	Purapuzha Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.937548+00	2022-12-12 08:23:22.93756+00	\N
321	Rajakkad Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.939161+00	2022-12-12 08:23:22.939174+00	\N
322	Rajakumary Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.940963+00	2022-12-12 08:23:22.940975+00	\N
323	Santhanpara Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.942581+00	2022-12-12 08:23:22.942596+00	\N
324	Senapathy Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.944259+00	2022-12-12 08:23:22.944271+00	\N
325	Udumbanchola Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.945885+00	2022-12-12 08:23:22.9459+00	\N
326	Udumbanoor Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.947747+00	2022-12-12 08:23:22.947759+00	\N
327	Upputhara Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.949349+00	2022-12-12 08:23:22.949362+00	\N
328	Vandanmedu Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.951065+00	2022-12-12 08:23:22.951078+00	\N
329	Vandiperiyar Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.952583+00	2022-12-12 08:23:22.952595+00	\N
330	Vannappuram Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.954113+00	2022-12-12 08:23:22.954127+00	\N
331	Vathikudy Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.955714+00	2022-12-12 08:23:22.955726+00	\N
332	Vattavada Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.957207+00	2022-12-12 08:23:22.957218+00	\N
333	Vazhathope Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.958775+00	2022-12-12 08:23:22.958787+00	\N
334	Vellathooval Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.960404+00	2022-12-12 08:23:22.960419+00	\N
335	Velliyamattom Grama Panchayat	\N	61	\N	2022-12-12 08:23:22.96196+00	2022-12-12 08:23:22.961972+00	\N
336	Aikaranad Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.985848+00	2022-12-12 08:23:22.985868+00	\N
337	Alangad Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.988021+00	2022-12-12 08:23:22.98804+00	\N
338	Amballoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.989994+00	2022-12-12 08:23:22.990014+00	\N
339	Arakuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.992067+00	2022-12-12 08:23:22.992088+00	\N
340	Asamannoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.993842+00	2022-12-12 08:23:22.993859+00	\N
341	Avoly Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.995647+00	2022-12-12 08:23:22.995664+00	\N
342	Ayavana Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.997331+00	2022-12-12 08:23:22.997347+00	\N
343	Ayyampuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:22.999033+00	2022-12-12 08:23:22.999047+00	\N
344	Chellanam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.000627+00	2022-12-12 08:23:23.000641+00	\N
345	Chendamangalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.002256+00	2022-12-12 08:23:23.002271+00	\N
346	Chengamanad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.003797+00	2022-12-12 08:23:23.00381+00	\N
347	Cheranalloor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.005417+00	2022-12-12 08:23:23.005431+00	\N
348	Chittattukara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.007037+00	2022-12-12 08:23:23.00705+00	\N
349	Choornikkara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.008718+00	2022-12-12 08:23:23.008732+00	\N
350	Chottanikkara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.010431+00	2022-12-12 08:23:23.010444+00	\N
351	Edakkattuvayal Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.012082+00	2022-12-12 08:23:23.012095+00	\N
352	Edathala Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.01369+00	2022-12-12 08:23:23.013704+00	\N
353	Edavanakkad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.015215+00	2022-12-12 08:23:23.015227+00	\N
354	Elanji Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.016655+00	2022-12-12 08:23:23.016667+00	\N
355	Elankunnapuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.018221+00	2022-12-12 08:23:23.018233+00	\N
356	Ezhikkara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.019953+00	2022-12-12 08:23:23.019965+00	\N
357	Kadamakudy Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.021615+00	2022-12-12 08:23:23.021627+00	\N
358	Kadungalloor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.023141+00	2022-12-12 08:23:23.023153+00	\N
359	Kalady Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.024636+00	2022-12-12 08:23:23.024648+00	\N
360	Kalloorkad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.026197+00	2022-12-12 08:23:23.026208+00	\N
361	Kanjoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.027682+00	2022-12-12 08:23:23.027694+00	\N
362	Karukutty Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.029173+00	2022-12-12 08:23:23.029187+00	\N
363	Karumallur Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.030765+00	2022-12-12 08:23:23.030776+00	\N
364	Kavalangad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.032312+00	2022-12-12 08:23:23.032323+00	\N
365	Keerampara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.033835+00	2022-12-12 08:23:23.033847+00	\N
366	Keezhmad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.035327+00	2022-12-12 08:23:23.035339+00	\N
367	Kizhakkambalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.036807+00	2022-12-12 08:23:23.036819+00	\N
368	Koovappady Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.038438+00	2022-12-12 08:23:23.03845+00	\N
369	Kottappady Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.039994+00	2022-12-12 08:23:23.040005+00	\N
370	Kottuvally Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.041715+00	2022-12-12 08:23:23.041727+00	\N
371	Kumbalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.043327+00	2022-12-12 08:23:23.043339+00	\N
372	Kumbalanghi Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.044978+00	2022-12-12 08:23:23.04499+00	\N
373	Kunnathunad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.046793+00	2022-12-12 08:23:23.046804+00	\N
374	Kunnukara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.04844+00	2022-12-12 08:23:23.048451+00	\N
375	Kuttampuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.050097+00	2022-12-12 08:23:23.050111+00	\N
376	Kuzhuppilly Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.051654+00	2022-12-12 08:23:23.051665+00	\N
377	MalayattoorNeeleswaram Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.053151+00	2022-12-12 08:23:23.053162+00	\N
378	Maneed Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.054713+00	2022-12-12 08:23:23.054724+00	\N
379	Manjalloor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.056177+00	2022-12-12 08:23:23.056188+00	\N
380	Manjapra Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.057633+00	2022-12-12 08:23:23.057643+00	\N
381	Marady Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.059094+00	2022-12-12 08:23:23.059104+00	\N
382	Mazhuvannoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.06057+00	2022-12-12 08:23:23.060581+00	\N
383	Mookkannur Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.062035+00	2022-12-12 08:23:23.062046+00	\N
384	Mudakuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.06348+00	2022-12-12 08:23:23.063491+00	\N
385	Mulanthuruthy Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.064948+00	2022-12-12 08:23:23.064958+00	\N
386	Mulavukad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.066577+00	2022-12-12 08:23:23.066588+00	\N
387	Narakal Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.068034+00	2022-12-12 08:23:23.068045+00	\N
388	Nayarambalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.069598+00	2022-12-12 08:23:23.06961+00	\N
389	Nedumbassery Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.07114+00	2022-12-12 08:23:23.071151+00	\N
390	Nellikuzhi Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.072805+00	2022-12-12 08:23:23.072816+00	\N
391	Okkal Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.074414+00	2022-12-12 08:23:23.074429+00	\N
392	Paingottoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.075935+00	2022-12-12 08:23:23.075946+00	\N
393	Paipra Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.077515+00	2022-12-12 08:23:23.077526+00	\N
394	Palakuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.078961+00	2022-12-12 08:23:23.078972+00	\N
395	Pallarimangalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.080627+00	2022-12-12 08:23:23.080638+00	\N
396	Pallippuram Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.082189+00	2022-12-12 08:23:23.082201+00	\N
397	Pampakuda Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.083647+00	2022-12-12 08:23:23.083659+00	\N
398	Parakkadavu Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.085068+00	2022-12-12 08:23:23.08508+00	\N
399	Pindimana Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.086604+00	2022-12-12 08:23:23.086617+00	\N
400	Poothrikka Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.088097+00	2022-12-12 08:23:23.088108+00	\N
401	Pothanicad Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.089633+00	2022-12-12 08:23:23.089644+00	\N
402	Puthenvelikkara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.091285+00	2022-12-12 08:23:23.091297+00	\N
403	Ramamangalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.093067+00	2022-12-12 08:23:23.09308+00	\N
404	Rayamangalam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.094904+00	2022-12-12 08:23:23.094916+00	\N
405	Sreemoolanagaram Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.096518+00	2022-12-12 08:23:23.09653+00	\N
406	Thirumarady Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.098494+00	2022-12-12 08:23:23.098508+00	\N
407	Thiruvaniyoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.100406+00	2022-12-12 08:23:23.10042+00	\N
408	Thuravoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.102097+00	2022-12-12 08:23:23.10211+00	\N
409	Udayamperoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.104317+00	2022-12-12 08:23:23.10433+00	\N
410	Vadakkekkara Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.10592+00	2022-12-12 08:23:23.105933+00	\N
411	VadavucodePuthencruz Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.108233+00	2022-12-12 08:23:23.108246+00	\N
412	Valakom Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.110098+00	2022-12-12 08:23:23.110113+00	\N
413	Varappetty Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.111983+00	2022-12-12 08:23:23.111997+00	\N
414	Varapuzha Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.113692+00	2022-12-12 08:23:23.113707+00	\N
415	Vazhakulam Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.115333+00	2022-12-12 08:23:23.115346+00	\N
416	Vengola Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.116849+00	2022-12-12 08:23:23.116862+00	\N
417	Vengoor Grama Panchayat	\N	60	\N	2022-12-12 08:23:23.118472+00	2022-12-12 08:23:23.118484+00	\N
418	Adat Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.141908+00	2022-12-12 08:23:23.141929+00	\N
419	Alagappanagar Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.143982+00	2022-12-12 08:23:23.144001+00	\N
420	Aloor Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.145842+00	2022-12-12 08:23:23.145861+00	\N
421	Annamanada Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.148018+00	2022-12-12 08:23:23.148034+00	\N
422	Anthikad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.149803+00	2022-12-12 08:23:23.14982+00	\N
423	Arimpur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.151696+00	2022-12-12 08:23:23.151712+00	\N
424	Athirappilly Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.153416+00	2022-12-12 08:23:23.153432+00	\N
425	Avanur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.155021+00	2022-12-12 08:23:23.155035+00	\N
426	Avinissery Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.15653+00	2022-12-12 08:23:23.156544+00	\N
427	Chazhur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.158231+00	2022-12-12 08:23:23.158247+00	\N
428	Chelakkara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.159824+00	2022-12-12 08:23:23.159838+00	\N
429	Cherpu Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.161495+00	2022-12-12 08:23:23.16151+00	\N
430	Choondal Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.163092+00	2022-12-12 08:23:23.163106+00	\N
431	Chowannur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.164575+00	2022-12-12 08:23:23.164589+00	\N
432	Desamangalam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.166222+00	2022-12-12 08:23:23.166238+00	\N
433	Edathiruthy Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.168372+00	2022-12-12 08:23:23.168391+00	\N
434	Edavilangu Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.170798+00	2022-12-12 08:23:23.170817+00	\N
435	Elavally Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.172793+00	2022-12-12 08:23:23.172808+00	\N
436	Engandiyur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.174515+00	2022-12-12 08:23:23.17453+00	\N
437	Eriyad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.176221+00	2022-12-12 08:23:23.176236+00	\N
438	Erumapetty Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.178305+00	2022-12-12 08:23:23.17832+00	\N
439	Kadangode Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.18006+00	2022-12-12 08:23:23.180075+00	\N
440	Kadappuram Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.18191+00	2022-12-12 08:23:23.181925+00	\N
441	Kadavallur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.18353+00	2022-12-12 08:23:23.183544+00	\N
442	Kadukutty Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.185184+00	2022-12-12 08:23:23.185198+00	\N
443	Kaipamangalam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.186923+00	2022-12-12 08:23:23.186936+00	\N
444	Kaiparambu Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.18853+00	2022-12-12 08:23:23.188544+00	\N
445	Kandanassery Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.190227+00	2022-12-12 08:23:23.190241+00	\N
446	Karalam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.193038+00	2022-12-12 08:23:23.193053+00	\N
447	Kattakampal Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.1948+00	2022-12-12 08:23:23.194818+00	\N
448	Kattoor Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.196398+00	2022-12-12 08:23:23.196412+00	\N
449	Kodakara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.198105+00	2022-12-12 08:23:23.198121+00	\N
450	Kodassery Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.199727+00	2022-12-12 08:23:23.199741+00	\N
451	Kolazhy Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.201405+00	2022-12-12 08:23:23.201417+00	\N
452	Kondazhy Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.203045+00	2022-12-12 08:23:23.203057+00	\N
453	Koratty Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.204525+00	2022-12-12 08:23:23.204538+00	\N
454	Kuzhur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.206059+00	2022-12-12 08:23:23.206071+00	\N
455	Madakkathara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.207779+00	2022-12-12 08:23:23.207791+00	\N
456	Mala Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.209403+00	2022-12-12 08:23:23.209416+00	\N
457	Manalur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.21096+00	2022-12-12 08:23:23.210971+00	\N
458	Mathilakam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.212576+00	2022-12-12 08:23:23.212587+00	\N
459	Mattathur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.214184+00	2022-12-12 08:23:23.214197+00	\N
460	Meloor Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.215764+00	2022-12-12 08:23:23.215777+00	\N
461	Mulakunnathukavu Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.217334+00	2022-12-12 08:23:23.217346+00	\N
462	Mullassery Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.218984+00	2022-12-12 08:23:23.218996+00	\N
463	Mullurkara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.22056+00	2022-12-12 08:23:23.220572+00	\N
464	Muriyad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.222137+00	2022-12-12 08:23:23.222149+00	\N
465	Nadathara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.223681+00	2022-12-12 08:23:23.223693+00	\N
466	Nattika Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.22539+00	2022-12-12 08:23:23.225404+00	\N
467	Nenmanikkara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.22694+00	2022-12-12 08:23:23.226952+00	\N
468	Orumanayur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.228415+00	2022-12-12 08:23:23.228427+00	\N
469	Padiyur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.230253+00	2022-12-12 08:23:23.230266+00	\N
470	Pananchery Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.231934+00	2022-12-12 08:23:23.231946+00	\N
471	Panjal Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.233685+00	2022-12-12 08:23:23.233698+00	\N
472	Paralam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.235643+00	2022-12-12 08:23:23.235656+00	\N
473	Parappukkara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.237292+00	2022-12-12 08:23:23.237306+00	\N
474	Pariyaram Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.23896+00	2022-12-12 08:23:23.238972+00	\N
475	Pavaratty Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.240626+00	2022-12-12 08:23:23.240639+00	\N
476	Pazhayannur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.242403+00	2022-12-12 08:23:23.242416+00	\N
477	Perinjanam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.244069+00	2022-12-12 08:23:23.244082+00	\N
478	Poomangalam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.245739+00	2022-12-12 08:23:23.24575+00	\N
479	Porkulam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.247352+00	2022-12-12 08:23:23.247364+00	\N
480	Poyya Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.249039+00	2022-12-12 08:23:23.249052+00	\N
481	Pudukad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.250972+00	2022-12-12 08:23:23.250984+00	\N
482	Punnayur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.252928+00	2022-12-12 08:23:23.25294+00	\N
483	Punnayurkulam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.254641+00	2022-12-12 08:23:23.254652+00	\N
484	Puthenchira Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.256155+00	2022-12-12 08:23:23.256167+00	\N
485	Puthur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.257678+00	2022-12-12 08:23:23.257688+00	\N
486	Sreenarayanapuram Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.259136+00	2022-12-12 08:23:23.259151+00	\N
487	Thalikulam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.260696+00	2022-12-12 08:23:23.260707+00	\N
488	Thanniyam Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.262236+00	2022-12-12 08:23:23.262247+00	\N
489	Thekkumkara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.263725+00	2022-12-12 08:23:23.263736+00	\N
490	Thiruvilwamala Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.265585+00	2022-12-12 08:23:23.265597+00	\N
491	Tholur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.267242+00	2022-12-12 08:23:23.267254+00	\N
492	Thrikkur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.268801+00	2022-12-12 08:23:23.268812+00	\N
493	Vadakkekkad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.27044+00	2022-12-12 08:23:23.270451+00	\N
494	Valapad Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.272167+00	2022-12-12 08:23:23.272178+00	\N
495	Vallachira Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.273792+00	2022-12-12 08:23:23.273803+00	\N
496	VallatholNagar Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.275395+00	2022-12-12 08:23:23.275406+00	\N
497	Varandarappilly Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.276806+00	2022-12-12 08:23:23.276817+00	\N
498	Varavoor Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.278317+00	2022-12-12 08:23:23.278328+00	\N
499	Vatanapally Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.279997+00	2022-12-12 08:23:23.280011+00	\N
500	Vellangallur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.28157+00	2022-12-12 08:23:23.281582+00	\N
501	Velukara Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.283275+00	2022-12-12 08:23:23.283302+00	\N
502	Velur Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.284823+00	2022-12-12 08:23:23.284833+00	\N
503	Venkitangu Grama Panchayat	\N	59	\N	2022-12-12 08:23:23.286341+00	2022-12-12 08:23:23.286352+00	\N
504	Alamkode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.310857+00	2022-12-12 08:23:23.310877+00	\N
505	Aliparamba Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.315896+00	2022-12-12 08:23:23.315916+00	\N
506	Amarambalam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.319497+00	2022-12-12 08:23:23.319524+00	\N
507	Anakkayam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.321794+00	2022-12-12 08:23:23.321816+00	\N
508	Angadippuram Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.323857+00	2022-12-12 08:23:23.323873+00	\N
509	Areacode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.325803+00	2022-12-12 08:23:23.325822+00	\N
510	ARNagar Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.32759+00	2022-12-12 08:23:23.327604+00	\N
511	Athavanad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.329506+00	2022-12-12 08:23:23.329521+00	\N
512	Chaliyar Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.331388+00	2022-12-12 08:23:23.331402+00	\N
513	Cheacode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.333011+00	2022-12-12 08:23:23.333035+00	\N
514	Chelembra Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.335275+00	2022-12-12 08:23:23.335292+00	\N
515	Cheriyamundam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.336954+00	2022-12-12 08:23:23.336968+00	\N
516	Cherukavu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.338737+00	2022-12-12 08:23:23.338748+00	\N
517	Chokkad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.34033+00	2022-12-12 08:23:23.34034+00	\N
518	Chungathara Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.34194+00	2022-12-12 08:23:23.341951+00	\N
519	Edakkara Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.343672+00	2022-12-12 08:23:23.343684+00	\N
520	Edapal Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.345236+00	2022-12-12 08:23:23.345304+00	\N
521	Edappatta Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.346822+00	2022-12-12 08:23:23.346834+00	\N
522	Edarikode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.348377+00	2022-12-12 08:23:23.34839+00	\N
523	Edavanna Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.349993+00	2022-12-12 08:23:23.350003+00	\N
524	Edayur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.351656+00	2022-12-12 08:23:23.351666+00	\N
525	Elamkulam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.353228+00	2022-12-12 08:23:23.353239+00	\N
526	Irimbiliyam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.354819+00	2022-12-12 08:23:23.35483+00	\N
527	Kaladi Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.356312+00	2022-12-12 08:23:23.356323+00	\N
528	Kalikavu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.357934+00	2022-12-12 08:23:23.357945+00	\N
529	Kalpakanchery Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.359487+00	2022-12-12 08:23:23.359497+00	\N
530	Kannamangalam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.361002+00	2022-12-12 08:23:23.361014+00	\N
531	Karulai Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.36257+00	2022-12-12 08:23:23.36258+00	\N
532	Karuvarakundu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.364157+00	2022-12-12 08:23:23.364167+00	\N
533	Kavanur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.365952+00	2022-12-12 08:23:23.365962+00	\N
534	Keezhattur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.367461+00	2022-12-12 08:23:23.367474+00	\N
535	Keezhuparamba Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.369123+00	2022-12-12 08:23:23.369134+00	\N
536	Kodur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.370813+00	2022-12-12 08:23:23.370823+00	\N
537	Koottilangadi Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.372404+00	2022-12-12 08:23:23.372414+00	\N
538	Kuruva Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.373985+00	2022-12-12 08:23:23.373998+00	\N
539	Kuttippuram Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.375703+00	2022-12-12 08:23:23.375713+00	\N
540	Kuzhimanna Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.377195+00	2022-12-12 08:23:23.377205+00	\N
541	Makkaraparamba Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.378712+00	2022-12-12 08:23:23.378722+00	\N
542	Mampad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.380401+00	2022-12-12 08:23:23.380412+00	\N
543	Mangalam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.382097+00	2022-12-12 08:23:23.382113+00	\N
544	Mankada Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.383791+00	2022-12-12 08:23:23.383802+00	\N
545	Marakkara Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.385364+00	2022-12-12 08:23:23.385391+00	\N
546	Maranchery Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.387097+00	2022-12-12 08:23:23.387108+00	\N
547	Melattur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.388663+00	2022-12-12 08:23:23.388674+00	\N
548	Moonniyur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.390353+00	2022-12-12 08:23:23.390364+00	\N
549	Moorkkanad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.392024+00	2022-12-12 08:23:23.392035+00	\N
550	Moothedam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.393881+00	2022-12-12 08:23:23.393892+00	\N
551	Morayur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.395401+00	2022-12-12 08:23:23.395412+00	\N
552	Muthuvalloor Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.397008+00	2022-12-12 08:23:23.397019+00	\N
553	Nannambra Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.398726+00	2022-12-12 08:23:23.398737+00	\N
554	Nannammukku Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.400269+00	2022-12-12 08:23:23.40028+00	\N
555	Niramaruthur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.401927+00	2022-12-12 08:23:23.401943+00	\N
556	Oorakam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.403662+00	2022-12-12 08:23:23.403674+00	\N
557	Othukkungal Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.405355+00	2022-12-12 08:23:23.405367+00	\N
558	Ozhur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.406946+00	2022-12-12 08:23:23.406956+00	\N
559	Pallikkal Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.408501+00	2022-12-12 08:23:23.408512+00	\N
560	Pandikkad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.410161+00	2022-12-12 08:23:23.410174+00	\N
561	Parappur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.411813+00	2022-12-12 08:23:23.411827+00	\N
562	Perumanna Klari Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.413459+00	2022-12-12 08:23:23.413471+00	\N
563	Perumpadappa Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.415099+00	2022-12-12 08:23:23.415112+00	\N
564	Peruvalloor Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.41675+00	2022-12-12 08:23:23.416761+00	\N
565	Ponmala Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.418359+00	2022-12-12 08:23:23.418371+00	\N
566	Ponmundam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.419914+00	2022-12-12 08:23:23.419925+00	\N
567	Pookkottur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.421795+00	2022-12-12 08:23:23.421807+00	\N
568	Porur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.423366+00	2022-12-12 08:23:23.423377+00	\N
569	Pothukallu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.425004+00	2022-12-12 08:23:23.425016+00	\N
570	Pulamanthole Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.426648+00	2022-12-12 08:23:23.426659+00	\N
571	Pulikkal Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.428224+00	2022-12-12 08:23:23.428235+00	\N
572	Pulpatta Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.429842+00	2022-12-12 08:23:23.429853+00	\N
573	Purathur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.431447+00	2022-12-12 08:23:23.431459+00	\N
574	Puzhakkattiri Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.43305+00	2022-12-12 08:23:23.433062+00	\N
575	Tanalur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.434652+00	2022-12-12 08:23:23.434664+00	\N
576	Tavanur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.436539+00	2022-12-12 08:23:23.436552+00	\N
577	Thalakkad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.438396+00	2022-12-12 08:23:23.438409+00	\N
578	Thazhekkode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.440005+00	2022-12-12 08:23:23.440015+00	\N
579	Thenhipalam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.441685+00	2022-12-12 08:23:23.441695+00	\N
580	Thennala Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.443317+00	2022-12-12 08:23:23.443328+00	\N
581	Thirunavaya Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.444977+00	2022-12-12 08:23:23.444988+00	\N
582	Thiruvali Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.447011+00	2022-12-12 08:23:23.447026+00	\N
583	Thrikkalangodu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.448878+00	2022-12-12 08:23:23.448892+00	\N
584	Triprangode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.451105+00	2022-12-12 08:23:23.451121+00	\N
585	Tuvvur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.453295+00	2022-12-12 08:23:23.453314+00	\N
586	Urangattiri Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.455398+00	2022-12-12 08:23:23.455412+00	\N
587	Valavannur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.457648+00	2022-12-12 08:23:23.457665+00	\N
588	Vallikkunnu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.45976+00	2022-12-12 08:23:23.459777+00	\N
589	Vattamkulam Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.461864+00	2022-12-12 08:23:23.46188+00	\N
590	Vazhakkad Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.463554+00	2022-12-12 08:23:23.463567+00	\N
591	Vazhayur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.471065+00	2022-12-12 08:23:23.471088+00	\N
592	Vazhikkadavu Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.473099+00	2022-12-12 08:23:23.473114+00	\N
593	Veliancode Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.477832+00	2022-12-12 08:23:23.477851+00	\N
594	Vengara Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.479863+00	2022-12-12 08:23:23.479879+00	\N
595	Vettathur Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.481714+00	2022-12-12 08:23:23.481729+00	\N
596	Vettom Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.485829+00	2022-12-12 08:23:23.485846+00	\N
597	Wandoor Grama Panchayat	\N	57	\N	2022-12-12 08:23:23.487748+00	2022-12-12 08:23:23.487763+00	\N
598	Arikkulam Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.512793+00	2022-12-12 08:23:23.512812+00	\N
599	Atholi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.514813+00	2022-12-12 08:23:23.514828+00	\N
600	Ayancheri Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.516511+00	2022-12-12 08:23:23.516524+00	\N
601	Azhiyur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.518375+00	2022-12-12 08:23:23.518388+00	\N
602	Balussery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.520009+00	2022-12-12 08:23:23.520021+00	\N
603	Chakkittapara Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.521614+00	2022-12-12 08:23:23.521626+00	\N
604	Changaroth Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.523253+00	2022-12-12 08:23:23.523265+00	\N
605	Chathamangalam Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.524833+00	2022-12-12 08:23:23.524845+00	\N
606	Chekkiad Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.526497+00	2022-12-12 08:23:23.526509+00	\N
607	Chelannur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.52804+00	2022-12-12 08:23:23.528052+00	\N
608	Chemanchery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.529867+00	2022-12-12 08:23:23.52988+00	\N
609	Chengottukavu Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.531504+00	2022-12-12 08:23:23.531515+00	\N
610	Cheruvannur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.533018+00	2022-12-12 08:23:23.533029+00	\N
611	Chorode Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.534639+00	2022-12-12 08:23:23.53465+00	\N
612	Edacheri Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.536196+00	2022-12-12 08:23:23.536207+00	\N
613	Eramala Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.537763+00	2022-12-12 08:23:23.537774+00	\N
614	Kadalundi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.539265+00	2022-12-12 08:23:23.539275+00	\N
615	Kakkodi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.540765+00	2022-12-12 08:23:23.540775+00	\N
616	Kakkur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.542277+00	2022-12-12 08:23:23.542288+00	\N
617	Karassery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.543775+00	2022-12-12 08:23:23.543786+00	\N
618	Kattippara Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.545624+00	2022-12-12 08:23:23.545635+00	\N
619	Kavilumpara Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.547177+00	2022-12-12 08:23:23.547188+00	\N
620	Kayakkody Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.548741+00	2022-12-12 08:23:23.548752+00	\N
621	Kayanna Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.550369+00	2022-12-12 08:23:23.55038+00	\N
622	Keezhariyur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.551875+00	2022-12-12 08:23:23.551885+00	\N
623	Kizhakkoth Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.553426+00	2022-12-12 08:23:23.553436+00	\N
624	Kodanchery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.555004+00	2022-12-12 08:23:23.555015+00	\N
625	Kodiyathur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.556512+00	2022-12-12 08:23:23.556522+00	\N
626	Koodaranhi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.558086+00	2022-12-12 08:23:23.558096+00	\N
627	Koorachundu Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.559654+00	2022-12-12 08:23:23.559664+00	\N
628	Koothali Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.561195+00	2022-12-12 08:23:23.561206+00	\N
629	Kottur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.562689+00	2022-12-12 08:23:23.562699+00	\N
630	Kunnamangalam Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.56414+00	2022-12-12 08:23:23.56415+00	\N
631	Kunnummal Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.565637+00	2022-12-12 08:23:23.565647+00	\N
632	Kuruvattoor Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.567068+00	2022-12-12 08:23:23.567078+00	\N
633	Kuttiadi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.568421+00	2022-12-12 08:23:23.568431+00	\N
634	Madavoor Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.569825+00	2022-12-12 08:23:23.569835+00	\N
635	Maniyur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.571472+00	2022-12-12 08:23:23.571482+00	\N
636	Maruthonkara Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.573093+00	2022-12-12 08:23:23.573103+00	\N
637	Mavoor Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.574583+00	2022-12-12 08:23:23.574594+00	\N
638	Meppayur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.576022+00	2022-12-12 08:23:23.576032+00	\N
639	Moodadi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.577555+00	2022-12-12 08:23:23.577565+00	\N
640	Nadapuram Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.578926+00	2022-12-12 08:23:23.578936+00	\N
641	Naduvannur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.580327+00	2022-12-12 08:23:23.580338+00	\N
642	Nanminda Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.581702+00	2022-12-12 08:23:23.581712+00	\N
643	Narikunni Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.583105+00	2022-12-12 08:23:23.583115+00	\N
644	Narippatta Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.584551+00	2022-12-12 08:23:23.58456+00	\N
645	Nochad Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.585961+00	2022-12-12 08:23:23.585971+00	\N
646	Olavanna Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.587342+00	2022-12-12 08:23:23.587352+00	\N
647	Omassery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.588808+00	2022-12-12 08:23:23.588818+00	\N
648	Onchiyam Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.590465+00	2022-12-12 08:23:23.590475+00	\N
649	Panangad Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.591916+00	2022-12-12 08:23:23.591926+00	\N
650	Perambra Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.59345+00	2022-12-12 08:23:23.593462+00	\N
651	Perumanna Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.594888+00	2022-12-12 08:23:23.594899+00	\N
652	Peruvayal Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.597055+00	2022-12-12 08:23:23.597071+00	\N
653	Puduppady Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.603773+00	2022-12-12 08:23:23.603789+00	\N
654	Purameri Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.605646+00	2022-12-12 08:23:23.60566+00	\N
655	Thalakulathur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.607272+00	2022-12-12 08:23:23.607285+00	\N
656	Thamarassery Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.608829+00	2022-12-12 08:23:23.608841+00	\N
657	Thikkodi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.610348+00	2022-12-12 08:23:23.610359+00	\N
658	Thiruvallur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.611859+00	2022-12-12 08:23:23.611872+00	\N
659	Thiruvambadi Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.613392+00	2022-12-12 08:23:23.613403+00	\N
660	Thurayur Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.615079+00	2022-12-12 08:23:23.615093+00	\N
661	Tuneri Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.617026+00	2022-12-12 08:23:23.617041+00	\N
662	Ulliyeri Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.618804+00	2022-12-12 08:23:23.618818+00	\N
663	Unnikulum Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.620723+00	2022-12-12 08:23:23.620737+00	\N
664	Valayam Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.622718+00	2022-12-12 08:23:23.622735+00	\N
665	Vanimal Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.624642+00	2022-12-12 08:23:23.624655+00	\N
666	Velom Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.626607+00	2022-12-12 08:23:23.626623+00	\N
667	Villiappally Grama Panchayat	\N	56	\N	2022-12-12 08:23:23.628472+00	2022-12-12 08:23:23.628487+00	\N
668	Alakode Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.667534+00	2022-12-12 08:23:23.667552+00	\N
669	Anjarakandy Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.669635+00	2022-12-12 08:23:23.669652+00	\N
670	Aralam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.671441+00	2022-12-12 08:23:23.671457+00	\N
671	Ayyankunnu Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.672995+00	2022-12-12 08:23:23.673008+00	\N
672	Azhikode Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.674587+00	2022-12-12 08:23:23.674599+00	\N
673	Chapparapadava Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.676099+00	2022-12-12 08:23:23.676111+00	\N
674	Chembilode Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.677615+00	2022-12-12 08:23:23.677626+00	\N
675	Chengalayi Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.679071+00	2022-12-12 08:23:23.679084+00	\N
676	Cherukunnu Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.680622+00	2022-12-12 08:23:23.680633+00	\N
677	Cherupuzha Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.682349+00	2022-12-12 08:23:23.68236+00	\N
678	Cheruthazham Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.683948+00	2022-12-12 08:23:23.683959+00	\N
679	Chirakkal Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.685475+00	2022-12-12 08:23:23.685486+00	\N
680	Chittariparamba Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.686966+00	2022-12-12 08:23:23.686977+00	\N
681	Chokli Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.688489+00	2022-12-12 08:23:23.6885+00	\N
682	Dharmadam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.689958+00	2022-12-12 08:23:23.689968+00	\N
683	Eramam Kuttur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.691394+00	2022-12-12 08:23:23.691404+00	\N
684	Eranholi Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.69285+00	2022-12-12 08:23:23.692861+00	\N
685	Eruvessy Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.694463+00	2022-12-12 08:23:23.694474+00	\N
686	Ezhome Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.695916+00	2022-12-12 08:23:23.695927+00	\N
687	Irikkur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.697365+00	2022-12-12 08:23:23.697393+00	\N
688	Kadambur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.698879+00	2022-12-12 08:23:23.698889+00	\N
689	Kadannappally Panapuzha Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.700309+00	2022-12-12 08:23:23.700319+00	\N
690	Kadirur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.701825+00	2022-12-12 08:23:23.701836+00	\N
691	Kalliasseri Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.703353+00	2022-12-12 08:23:23.703364+00	\N
692	Kanichar Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.704861+00	2022-12-12 08:23:23.704871+00	\N
693	Kankol - Alappadamba Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.706445+00	2022-12-12 08:23:23.706455+00	\N
694	Kannapuram Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.707876+00	2022-12-12 08:23:23.707886+00	\N
695	Karivellur Peralam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.709583+00	2022-12-12 08:23:23.709594+00	\N
696	Keezhallur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.711161+00	2022-12-12 08:23:23.711171+00	\N
697	Kelakam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.712635+00	2022-12-12 08:23:23.712646+00	\N
698	Kolachery Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.71414+00	2022-12-12 08:23:23.714151+00	\N
699	Kolayad Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.715637+00	2022-12-12 08:23:23.715647+00	\N
700	Koodali Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.717113+00	2022-12-12 08:23:23.717124+00	\N
701	Kottayam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.718708+00	2022-12-12 08:23:23.718718+00	\N
702	Kottiyoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.720161+00	2022-12-12 08:23:23.720171+00	\N
703	Kunhimangalam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.721737+00	2022-12-12 08:23:23.721749+00	\N
704	Kunnothuparamba Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.723301+00	2022-12-12 08:23:23.723314+00	\N
705	Kurumathur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.72484+00	2022-12-12 08:23:23.724851+00	\N
706	Kuttiattoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.726466+00	2022-12-12 08:23:23.726477+00	\N
707	Madayi Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.727951+00	2022-12-12 08:23:23.727962+00	\N
708	Malappattam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.72951+00	2022-12-12 08:23:23.729521+00	\N
709	Malur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.731048+00	2022-12-12 08:23:23.731059+00	\N
710	Mangattidam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.732545+00	2022-12-12 08:23:23.732556+00	\N
711	Mattool Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.734048+00	2022-12-12 08:23:23.734059+00	\N
712	Mayyil Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.735737+00	2022-12-12 08:23:23.735747+00	\N
713	Mokeri Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.737172+00	2022-12-12 08:23:23.737182+00	\N
714	Munderi Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.738665+00	2022-12-12 08:23:23.738675+00	\N
715	Muzhakkunnu Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.740167+00	2022-12-12 08:23:23.740178+00	\N
716	Muzhappilangad Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.74172+00	2022-12-12 08:23:23.741731+00	\N
717	Naduvil Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.743278+00	2022-12-12 08:23:23.743288+00	\N
718	Narath Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.744758+00	2022-12-12 08:23:23.744768+00	\N
719	New Mahe Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.746365+00	2022-12-12 08:23:23.746376+00	\N
720	Padiyoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.747874+00	2022-12-12 08:23:23.747939+00	\N
721	Panniyannur Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.749657+00	2022-12-12 08:23:23.749669+00	\N
722	Pappinisseri Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.751263+00	2022-12-12 08:23:23.751275+00	\N
723	Pariyaram Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.752743+00	2022-12-12 08:23:23.752754+00	\N
724	Pattiam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.754353+00	2022-12-12 08:23:23.754363+00	\N
725	Pattuvam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.755854+00	2022-12-12 08:23:23.755865+00	\N
726	Payam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.757304+00	2022-12-12 08:23:23.757317+00	\N
727	Payyavoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.758776+00	2022-12-12 08:23:23.758787+00	\N
728	Peralassery Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.760197+00	2022-12-12 08:23:23.760207+00	\N
729	Peravoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.761935+00	2022-12-12 08:23:23.761945+00	\N
730	Peringome Vayakkara Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.76351+00	2022-12-12 08:23:23.763521+00	\N
731	Pinarayi Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.765019+00	2022-12-12 08:23:23.76503+00	\N
732	Ramanthali Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.766555+00	2022-12-12 08:23:23.766566+00	\N
733	Thillankery Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.768047+00	2022-12-12 08:23:23.768058+00	\N
734	Triprangottoor Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.769575+00	2022-12-12 08:23:23.769586+00	\N
735	Udayagiri Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.771097+00	2022-12-12 08:23:23.771107+00	\N
736	Ulikkal Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.772563+00	2022-12-12 08:23:23.772574+00	\N
737	Valapattanam Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.774035+00	2022-12-12 08:23:23.774045+00	\N
738	Vengad Grama Panchayat	\N	54	\N	2022-12-12 08:23:23.775521+00	2022-12-12 08:23:23.775531+00	\N
739	Agali Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.818247+00	2022-12-12 08:23:23.818266+00	\N
740	Akathethara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.820318+00	2022-12-12 08:23:23.820335+00	\N
741	Alanallur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.822302+00	2022-12-12 08:23:23.822318+00	\N
742	Alathur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.824089+00	2022-12-12 08:23:23.824105+00	\N
743	Ambalappara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.825917+00	2022-12-12 08:23:23.825933+00	\N
744	Anakkara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.827696+00	2022-12-12 08:23:23.82771+00	\N
745	Ananganadi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.829553+00	2022-12-12 08:23:23.829569+00	\N
746	Ayiloor Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.831393+00	2022-12-12 08:23:23.831406+00	\N
747	Chalavara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.833051+00	2022-12-12 08:23:23.833064+00	\N
748	Chalissery Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.834803+00	2022-12-12 08:23:23.834816+00	\N
749	Elappully Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.83638+00	2022-12-12 08:23:23.836393+00	\N
750	Elavancherry Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.838056+00	2022-12-12 08:23:23.838069+00	\N
751	Erimayur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.839649+00	2022-12-12 08:23:23.83966+00	\N
752	Eruthenpathy Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.841306+00	2022-12-12 08:23:23.841322+00	\N
753	Kadampazhipuram Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.842938+00	2022-12-12 08:23:23.84295+00	\N
754	Kanhirapuzha Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.844518+00	2022-12-12 08:23:23.84453+00	\N
755	Kannadi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.846253+00	2022-12-12 08:23:23.846265+00	\N
756	Kannambra Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.847743+00	2022-12-12 08:23:23.847755+00	\N
757	Kappur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.84936+00	2022-12-12 08:23:23.849405+00	\N
758	Karakurussi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.85098+00	2022-12-12 08:23:23.850992+00	\N
759	Karimba Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.85242+00	2022-12-12 08:23:23.85243+00	\N
760	Karimpuzha Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.853925+00	2022-12-12 08:23:23.853935+00	\N
761	Kavassery Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.855356+00	2022-12-12 08:23:23.855366+00	\N
762	Keralassery Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.856754+00	2022-12-12 08:23:23.856764+00	\N
763	Kizhakkencherry Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.858486+00	2022-12-12 08:23:23.858497+00	\N
764	Kodumbu Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.859993+00	2022-12-12 08:23:23.860004+00	\N
765	Koduvayur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.861491+00	2022-12-12 08:23:23.861502+00	\N
766	Kollengode Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.863035+00	2022-12-12 08:23:23.863045+00	\N
767	Kongad Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.864428+00	2022-12-12 08:23:23.864439+00	\N
768	Koppam Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.865842+00	2022-12-12 08:23:23.865852+00	\N
769	Kottayi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.867258+00	2022-12-12 08:23:23.867268+00	\N
770	Kottopadam Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.868683+00	2022-12-12 08:23:23.868694+00	\N
771	Kozhinjampara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.870132+00	2022-12-12 08:23:23.870142+00	\N
772	Kulukkallur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.871573+00	2022-12-12 08:23:23.871584+00	\N
773	Kumaramputhur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.872983+00	2022-12-12 08:23:23.872994+00	\N
774	Kuthanur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.874467+00	2022-12-12 08:23:23.874477+00	\N
775	Kuzhalmannam Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.876049+00	2022-12-12 08:23:23.87606+00	\N
776	Lakkidi - Perur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.877502+00	2022-12-12 08:23:23.877512+00	\N
777	Malampuzha Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.878999+00	2022-12-12 08:23:23.879009+00	\N
778	Mankara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.880674+00	2022-12-12 08:23:23.880684+00	\N
779	Mannur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.882217+00	2022-12-12 08:23:23.882227+00	\N
780	Marutharode Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.883708+00	2022-12-12 08:23:23.883718+00	\N
781	Mathur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.885227+00	2022-12-12 08:23:23.885237+00	\N
782	Melarcode Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.886776+00	2022-12-12 08:23:23.886787+00	\N
783	Mundur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.888264+00	2022-12-12 08:23:23.888274+00	\N
784	Muthalamada Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.889808+00	2022-12-12 08:23:23.889819+00	\N
785	Muthuthala Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.891393+00	2022-12-12 08:23:23.891403+00	\N
786	Nagalassery Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.892855+00	2022-12-12 08:23:23.892865+00	\N
787	Nallepilly Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.894534+00	2022-12-12 08:23:23.894545+00	\N
788	Nellaya Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.895994+00	2022-12-12 08:23:23.896004+00	\N
789	Nelliyampathy Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.897665+00	2022-12-12 08:23:23.897675+00	\N
790	Nenmara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.899145+00	2022-12-12 08:23:23.899155+00	\N
791	Ongallur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.900554+00	2022-12-12 08:23:23.900564+00	\N
792	Pallassana Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.90207+00	2022-12-12 08:23:23.90208+00	\N
793	Parali Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.903543+00	2022-12-12 08:23:23.903553+00	\N
794	Paruthur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.904967+00	2022-12-12 08:23:23.904978+00	\N
795	Pattanchery Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.908965+00	2022-12-12 08:23:23.90898+00	\N
796	Pattithara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.91068+00	2022-12-12 08:23:23.910692+00	\N
797	Peringottukurissi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.912246+00	2022-12-12 08:23:23.912258+00	\N
798	Perumatty Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.913806+00	2022-12-12 08:23:23.913818+00	\N
799	Peruvemba Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.91543+00	2022-12-12 08:23:23.915441+00	\N
800	Pirayiri Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.916956+00	2022-12-12 08:23:23.916967+00	\N
801	Polpully Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.918502+00	2022-12-12 08:23:23.918513+00	\N
802	Pookkottukavu Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.920079+00	2022-12-12 08:23:23.92009+00	\N
803	Puducode Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.921756+00	2022-12-12 08:23:23.921766+00	\N
804	Pudunagaram Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.923249+00	2022-12-12 08:23:23.92326+00	\N
805	Puduppariyaram Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.924747+00	2022-12-12 08:23:23.924758+00	\N
806	Pudur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.926529+00	2022-12-12 08:23:23.926541+00	\N
807	Pudusseri Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.928171+00	2022-12-12 08:23:23.928183+00	\N
808	Sholayoor Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.929837+00	2022-12-12 08:23:23.929849+00	\N
809	Sreekrishnapuram Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.931366+00	2022-12-12 08:23:23.931377+00	\N
810	Tachampara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.933037+00	2022-12-12 08:23:23.933048+00	\N
811	Tarur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.934713+00	2022-12-12 08:23:23.934725+00	\N
812	Thachanattukara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.936231+00	2022-12-12 08:23:23.936242+00	\N
813	Thenkara Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.937836+00	2022-12-12 08:23:23.937847+00	\N
814	Thenkurissi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.93941+00	2022-12-12 08:23:23.939422+00	\N
815	Thirumittacode Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.940967+00	2022-12-12 08:23:23.940978+00	\N
816	Thiruvegappura Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.942579+00	2022-12-12 08:23:23.942589+00	\N
817	Trikkaderi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.944021+00	2022-12-12 08:23:23.944031+00	\N
818	Trithala Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.945718+00	2022-12-12 08:23:23.94573+00	\N
819	Vadakarapathy Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.947325+00	2022-12-12 08:23:23.947336+00	\N
820	Vadakkencheri Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.948968+00	2022-12-12 08:23:23.94898+00	\N
821	Vadavannur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.95064+00	2022-12-12 08:23:23.950651+00	\N
822	Vallapuzha Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.952193+00	2022-12-12 08:23:23.952203+00	\N
823	Vandazhy Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.953807+00	2022-12-12 08:23:23.953817+00	\N
824	Vaniamkulam Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.955239+00	2022-12-12 08:23:23.95525+00	\N
825	Vellinezhi Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.956611+00	2022-12-12 08:23:23.956621+00	\N
826	Vilayur Grama Panchayat	\N	58	\N	2022-12-12 08:23:23.958221+00	2022-12-12 08:23:23.958232+00	\N
827	Panchayath TT	\N	65	20	2023-01-13 09:59:45.4874+00	2023-01-13 09:59:45.487422+00	\N
828	Goa Panchayath 1	\N	86	45	2023-01-24 10:50:15.023065+00	2023-01-24 10:50:15.023096+00	\N
\.


--
-- Data for Name: user_details_staffrole; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_staffrole (id, name, code, created_by_id, date_added, date_modified, modified_by_id, json_sidebar) FROM stdin;
20	Secretary	\N	\N	2022-08-29 04:27:35.239363+00	2022-12-15 11:14:34.14667+00	\N	["news", "meeting", "committee-admin", "committee-member", "role-type", "settings", "programme"]
21	Joint Secretary	\N	\N	2022-08-29 05:02:10.08286+00	2022-12-16 09:39:10.615715+00	\N	["news", "user", "settings", "committee-admin"]
23	test	\N	\N	2022-12-16 10:10:00.973516+00	2022-12-16 10:21:13.687199+00	\N	["news", "committee-admin", "committee-member"]
24	Member	\N	\N	2022-12-21 08:33:51.961179+00	2022-12-21 08:33:51.9612+00	\N	["news", "meeting", "committee-member"]
25	president	\N	\N	2023-01-07 08:12:42.792058+00	2023-01-07 08:12:42.792081+00	\N	["news", "meeting", "committee-member", "programme"]
\.


--
-- Data for Name: user_details_state; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_state (id, name, code, created_by_id, date_added, date_modified, modified_by_id) FROM stdin;
1	Andra Pradesh	AP	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
2	Arunachal Pradesh	AR	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
3	Assam	AS	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
4	Bihar	BH	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
5	Chhattisgarh	CH	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
6	Goa	GA	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
7	Gujarat	GJ	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
8	Haryana	HR	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
9	Himachal Pradesh	HP	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
10	Jammu and Kashmir	JK	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
11	Jharkhand	JH	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
12	Karnataka	KA	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
13	Kerala	KL	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
14	Madya Pradesh	MP	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
15	Maharashtra	MH	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
16	Manipur	MN	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
17	Meghalaya	MG	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
18	Mizoram	MZ	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
19	Nagaland	NG	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
20	Orissa	OR	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
21	Punjab	PB	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
22	Rajasthan	RJ	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
23	Sikkim	SK	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
24	Tamil Nadu	TN	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
25	Telagana	TG	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
26	Tripura	TR	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
27	Uttaranchal	UT	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
28	Uttar Pradesh	UP	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
29	West Bengal	WB	\N	2022-08-02 12:15:27.085031+00	2022-08-02 12:15:27.099093+00	\N
\.


--
-- Data for Name: user_details_userdetails; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_userdetails (user_ptr_id, name, phone_number, joined_date, designation, bln_staff, district_id, panchayath_id, staff_role_id, state_id, ward_id, created_by_id, date_added, date_modified, modified_by_id, user_image, address, blood_group, committee_type_id, pin_code, str_panchayath, str_ward, is_details, is_admin) FROM stdin;
11		8943725437	\N	\N	t	65	1	21	13	7	14	2022-08-25 15:06:25.574944+00	2022-10-04 08:52:29.928306+00	\N	media/user_images/rn_image_picker_lib_temp_48e4b7e8-faae-4fa0-8282-dc689915affd.jpg	\N	\N	5	\N	\N	\N	t	f
23	Akhila	8943725437	\N	\N	f	65	1	21	13	7	\N	2022-10-28 08:56:17.731611+00	2022-10-28 08:56:18.01929+00	\N	media/user_images/business.jpg	\N	\N	3	\N	\N	\N	\N	t
24	Raju	9012345678	\N	\N	f	60	5	21	13	4	\N	2022-10-28 08:58:59.707819+00	2022-10-28 08:58:59.931684+00	\N	media/user_images/meeting.jpeg	\N	\N	1	\N	\N	\N	\N	t
15		1234567890	\N	\N	f	64	\N	\N	13	\N	\N	2022-10-04 05:12:29.978794+00	2022-10-04 09:34:35.196399+00	\N	media/user_images/rn_image_picker_lib_temp_10e2556e-71f0-4110-aee7-8f1eb3fcf42a.jpg	Testaddress	A+	\N	4567890	Panchayth 1	10	t	f
16		\N	\N	\N	f	\N	\N	\N	\N	\N	\N	2022-10-27 08:54:53.981078+00	2022-10-27 08:54:53.981094+00	\N	media/user_images/proxy_11.jpeg	\N	\N	1	\N	1	1	f	f
43		\N	\N	\N	f	\N	\N	\N	\N	\N	\N	2023-01-24 10:37:28.641085+00	2023-01-24 10:37:28.641106+00	\N	default.jpeg	\N	\N	\N	\N	\N	\N	f	f
21	Arjun	1234567890	\N	\N	f	60	5	21	13	4	20	2022-10-28 07:21:20.063397+00	2022-10-28 07:21:32.543694+00	\N	media/user_images/user_qMW2KQr.png	\N	\N	5	\N	\N	\N	\N	t
27	surumi	9012345678	\N	\N	f	60	3	20	13	6	\N	2022-10-29 03:47:00.395491+00	2022-10-29 03:47:00.821343+00	\N	media/user_images/business_cxeckjI.jpg	\N	\N	3	\N	\N	\N	\N	t
44		\N	\N	\N	f	\N	\N	\N	\N	\N	\N	2023-01-24 10:39:04.715844+00	2023-01-24 10:39:04.715861+00	\N	default.jpeg	\N	\N	\N	\N	\N	\N	f	f
45	Superadmin12	232323	\N	\N	f	2	20	21	3	6	\N	2023-01-24 10:43:01.404912+00	2023-01-24 10:47:13.139765+00	\N		\N	\N	1	\N	\N	\N	\N	t
31	vishnu	8943725437	\N	\N	f	60	5	20	13	4	\N	2022-11-04 06:59:35.08072+00	2022-11-04 06:59:35.30754+00	\N	media/user_images/user1_5DO763i.jpeg	\N	\N	7	\N	\N	\N	\N	t
35	tester	9801234567	\N	\N	f	65	1	20	13	7	\N	2022-12-14 07:17:06.565684+00	2022-12-14 07:17:06.757155+00	\N	media/user_images/pngwing.com_kZYEvuq.png	\N	\N	6	\N	\N	\N	\N	t
41	test user	7736696937	\N	\N	f	60	5	20	13	4	\N	2022-12-21 08:40:11.504809+00	2022-12-21 08:40:11.703791+00	\N	media/user_images/box-5.jpg	\N	\N	4	\N	\N	\N	\N	t
38		7306871846	\N	\N	f	59	\N	\N	13	\N	\N	2022-12-15 05:09:07.700725+00	2022-12-15 05:10:48.968382+00	\N	default.jpeg	Ambala the veettil	O+	\N	680541	Kaiparambu	2	t	f
14		1234567890	\N	\N	f	65	\N	20	13	\N	14	2022-08-29 04:31:38.051695+00	2023-01-18 13:14:20.327664+00	\N	media/user_images/rn_image_picker_lib_temp_dd8fdd1b-9c69-417b-be4b-ddba7d7721d9.jpg	Rasheedvilla	O+	4	123455	Chavara	1	t	f
26	cybero	9012345678	\N	\N	f	65	1	21	13	7	\N	2022-10-28 11:45:01.26773+00	2022-10-29 03:47:27.228818+00	\N	media/user_images/attendance.jpeg	\N	\N	3	\N	\N	\N	\N	t
20	Sreehari	901234567	\N	\N	f	65	1	20	13	7	\N	2022-10-27 12:11:28.487742+00	2023-01-18 13:15:44.710748+00	\N	media/user_images/user1.jpeg	Vilaparambathu	A+	5	123456	Chavara	10	t	t
\.


--
-- Data for Name: user_details_ward; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_details_ward (id, name, code, panchayath_id, created_by_id, date_added, date_modified, modified_by_id) FROM stdin;
2	Sankaramangalam	\N	2	\N	2022-08-08 08:22:30.937573+00	2022-08-08 08:27:43.008906+00	\N
3	Nallezhthumukku	\N	2	\N	2022-08-08 08:43:37.152983+00	2022-08-08 08:43:37.153005+00	\N
4	Kathrikadavu	\N	5	\N	2022-08-08 08:49:25.823648+00	2022-08-08 08:49:25.823668+00	\N
5	Ward 1	\N	14	\N	2022-08-08 08:54:10.690525+00	2022-08-08 08:54:10.690551+00	\N
6	Ward 1	\N	3	\N	2022-08-08 09:03:54.967031+00	2022-08-08 09:03:54.967053+00	\N
1	South-chavara	\N	1	\N	2022-08-02 12:15:27.189387+00	2022-08-13 14:22:37.194195+00	\N
7	Ward 1	\N	1	\N	2022-08-16 20:51:18.081805+00	2022-08-16 20:51:18.081827+00	\N
8	ward 2	\N	\N	14	2022-09-07 07:03:43.552992+00	2022-09-07 07:03:43.553014+00	\N
12	Ward 20	\N	1	35	2022-12-14 07:37:50.538676+00	2022-12-14 07:37:50.538705+00	\N
9	Ward 1	\N	18	\N	2022-11-04 05:41:44.819656+00	2022-11-04 05:41:44.819679+00	\N
10	Ward 2	\N	18	\N	2022-11-04 05:42:20.284878+00	2022-11-04 05:42:20.284903+00	\N
13	Ward 1	\N	2	\N	2022-12-16 08:40:42.951901+00	2022-12-16 08:40:42.951923+00	\N
14	Goa 1	\N	828	45	2023-01-24 10:50:44.145997+00	2023-01-24 10:50:44.146023+00	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 45, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: booking_program_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.booking_program_model_id_seq', 20, true);


--
-- Name: booking_program_model_qr_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.booking_program_model_qr_permission_id_seq', 12, true);


--
-- Name: booking_ticketbooking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.booking_ticketbooking_id_seq', 23, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 73, true);


--
-- Name: news_meetingattendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_meetingattendance_id_seq', 34, true);


--
-- Name: news_meetinghighligths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_meetinghighligths_id_seq', 32, true);


--
-- Name: news_meetingphoto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_meetingphoto_id_seq', 38, true);


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_news_id_seq', 61, true);


--
-- Name: news_newstype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_newstype_id_seq', 6, true);


--
-- Name: register_admin_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.register_admin_model_id_seq', 22, true);


--
-- Name: register_committee_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.register_committee_members_id_seq', 15, true);


--
-- Name: user_details_bloodgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_bloodgroup_id_seq', 1, false);


--
-- Name: user_details_committee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_committee_id_seq', 27, true);


--
-- Name: user_details_committeetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_committeetype_id_seq', 7, true);


--
-- Name: user_details_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_district_id_seq', 88, true);


--
-- Name: user_details_panchayath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_panchayath_id_seq', 828, true);


--
-- Name: user_details_staffrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_staffrole_id_seq', 25, true);


--
-- Name: user_details_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_state_id_seq', 29, true);


--
-- Name: user_details_ward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_details_ward_id_seq', 14, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: booking_program_model booking_program_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model
    ADD CONSTRAINT booking_program_model_pkey PRIMARY KEY (id);


--
-- Name: booking_program_model_qr_permission booking_program_model_qr_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model_qr_permission
    ADD CONSTRAINT booking_program_model_qr_permission_pkey PRIMARY KEY (id);


--
-- Name: booking_program_model_qr_permission booking_program_model_qr_program_model_id_admin_m_1e7239d9_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model_qr_permission
    ADD CONSTRAINT booking_program_model_qr_program_model_id_admin_m_1e7239d9_uniq UNIQUE (program_model_id, committee_members_id);


--
-- Name: booking_ticketbooking booking_ticketbooking_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_ticketbooking
    ADD CONSTRAINT booking_ticketbooking_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: news_meetingattendance news_meetingattendance_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingattendance
    ADD CONSTRAINT news_meetingattendance_pkey PRIMARY KEY (id);


--
-- Name: news_meetinghighligths news_meetinghighligths_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetinghighligths
    ADD CONSTRAINT news_meetinghighligths_pkey PRIMARY KEY (id);


--
-- Name: news_meetingphoto news_meetingphoto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingphoto
    ADD CONSTRAINT news_meetingphoto_pkey PRIMARY KEY (id);


--
-- Name: news_news news_news_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_pkey PRIMARY KEY (id);


--
-- Name: news_newstype news_newstype_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_newstype
    ADD CONSTRAINT news_newstype_pkey PRIMARY KEY (id);


--
-- Name: register_admin_model register_admin_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_pkey PRIMARY KEY (id);


--
-- Name: register_admin_model register_admin_model_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_username_key UNIQUE (username);


--
-- Name: register_committee_members register_committee_members_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_members_pkey PRIMARY KEY (id);


--
-- Name: user_details_bloodgroup user_details_bloodgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_bloodgroup
    ADD CONSTRAINT user_details_bloodgroup_pkey PRIMARY KEY (id);


--
-- Name: user_details_committee user_details_committee_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee
    ADD CONSTRAINT user_details_committee_pkey PRIMARY KEY (id);


--
-- Name: user_details_committeetype user_details_committeetype_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committeetype
    ADD CONSTRAINT user_details_committeetype_pkey PRIMARY KEY (id);


--
-- Name: user_details_district user_details_district_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_district
    ADD CONSTRAINT user_details_district_pkey PRIMARY KEY (id);


--
-- Name: user_details_panchayath user_details_panchayath_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_panchayath
    ADD CONSTRAINT user_details_panchayath_pkey PRIMARY KEY (id);


--
-- Name: user_details_staffrole user_details_staffrole_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_staffrole
    ADD CONSTRAINT user_details_staffrole_pkey PRIMARY KEY (id);


--
-- Name: user_details_state user_details_state_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_state
    ADD CONSTRAINT user_details_state_pkey PRIMARY KEY (id);


--
-- Name: user_details_userdetails user_details_userdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdetails_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: user_details_ward user_details_ward_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_ward
    ADD CONSTRAINT user_details_ward_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: booking_program_model_fk_admin_id_id_7e42bc46; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_program_model_fk_admin_id_id_7e42bc46 ON public.booking_program_model USING btree (fk_admin_id_id);


--
-- Name: booking_program_model_fk_district_id_fa8b7d78; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_program_model_fk_district_id_fa8b7d78 ON public.booking_program_model USING btree (fk_district_id);


--
-- Name: booking_program_model_fk_state_id_3ecf8b3d; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_program_model_fk_state_id_3ecf8b3d ON public.booking_program_model USING btree (fk_state_id);


--
-- Name: booking_program_model_qr_permission_admin_model_id_36f6f4ae; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_program_model_qr_permission_admin_model_id_36f6f4ae ON public.booking_program_model_qr_permission USING btree (committee_members_id);


--
-- Name: booking_program_model_qr_permission_program_model_id_8777c3c7; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_program_model_qr_permission_program_model_id_8777c3c7 ON public.booking_program_model_qr_permission USING btree (program_model_id);


--
-- Name: booking_ticketbooking_fk_program_id_4afd70d2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_ticketbooking_fk_program_id_4afd70d2 ON public.booking_ticketbooking USING btree (fk_program_id);


--
-- Name: booking_ticketbooking_fk_user_id_id_1be2597c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX booking_ticketbooking_fk_user_id_id_1be2597c ON public.booking_ticketbooking USING btree (fk_user_id_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: news_meetingattendance_meeting_highligths_id_fa30a89c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_meetingattendance_meeting_highligths_id_fa30a89c ON public.news_meetingattendance USING btree (meeting_highligths_id);


--
-- Name: news_meetinghighligths_created_by_id_cb047732; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_meetinghighligths_created_by_id_cb047732 ON public.news_meetinghighligths USING btree (created_by_id);


--
-- Name: news_meetinghighligths_modified_by_id_5a908846; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_meetinghighligths_modified_by_id_5a908846 ON public.news_meetinghighligths USING btree (modified_by_id);


--
-- Name: news_meetingphoto_meeting_highligths_id_7ece6a2e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_meetingphoto_meeting_highligths_id_7ece6a2e ON public.news_meetingphoto USING btree (meeting_highligths_id);


--
-- Name: news_news_committe_type_id_d700b72b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_committe_type_id_d700b72b ON public.news_news USING btree (committe_type_id);


--
-- Name: news_news_created_by_id_e387780b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_created_by_id_e387780b ON public.news_news USING btree (created_by_id);


--
-- Name: news_news_modified_by_id_cdcc478f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_modified_by_id_cdcc478f ON public.news_news USING btree (modified_by_id);


--
-- Name: news_news_news_type_id_67364c4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_news_type_id_67364c4b ON public.news_news USING btree (news_type_id);


--
-- Name: news_news_panchayath_region_id_363f017a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_panchayath_region_id_363f017a ON public.news_news USING btree (panchayath_region_id);


--
-- Name: news_news_region_id_3d92010e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_region_id_3d92010e ON public.news_news USING btree (district_region_id);


--
-- Name: news_news_state_region_id_41e8f59d; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_news_state_region_id_41e8f59d ON public.news_news USING btree (state_region_id);


--
-- Name: news_newstype_created_by_id_2378cfb3; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_newstype_created_by_id_2378cfb3 ON public.news_newstype USING btree (created_by_id);


--
-- Name: news_newstype_modified_by_id_ac8096df; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_newstype_modified_by_id_ac8096df ON public.news_newstype USING btree (modified_by_id);


--
-- Name: register_admin_model_committee_type_id_3a2dbed2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_committee_type_id_3a2dbed2 ON public.register_admin_model USING btree (committee_type_id);


--
-- Name: register_admin_model_district_id_36868599; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_district_id_36868599 ON public.register_admin_model USING btree (district_id);


--
-- Name: register_admin_model_panchayath_id_346b5599; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_panchayath_id_346b5599 ON public.register_admin_model USING btree (panchayath_id);


--
-- Name: register_admin_model_staff_role_id_34c695a6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_staff_role_id_34c695a6 ON public.register_admin_model USING btree (staff_role_id);


--
-- Name: register_admin_model_state_id_4e27c474; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_state_id_4e27c474 ON public.register_admin_model USING btree (state_id);


--
-- Name: register_admin_model_user_id_id_c9592a99; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_user_id_id_c9592a99 ON public.register_admin_model USING btree (user_id_id);


--
-- Name: register_admin_model_username_1b3119be_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_username_1b3119be_like ON public.register_admin_model USING btree (username varchar_pattern_ops);


--
-- Name: register_admin_model_ward_id_db56e902; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_admin_model_ward_id_db56e902 ON public.register_admin_model USING btree (ward_id);


--
-- Name: register_committee_members_committee_type_id_783f32f5; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_committee_type_id_783f32f5 ON public.register_committee_members USING btree (committee_type_id);


--
-- Name: register_committee_members_district_id_b2ae2a82; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_district_id_b2ae2a82 ON public.register_committee_members USING btree (district_id);


--
-- Name: register_committee_members_panchayath_id_0875524a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_panchayath_id_0875524a ON public.register_committee_members USING btree (panchayath_id);


--
-- Name: register_committee_members_staff_role_id_cbb3e241; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_staff_role_id_cbb3e241 ON public.register_committee_members USING btree (staff_role_id);


--
-- Name: register_committee_members_state_id_0bd4f855; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_state_id_0bd4f855 ON public.register_committee_members USING btree (state_id);


--
-- Name: register_committee_members_ward_id_4ec2d0d0; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX register_committee_members_ward_id_4ec2d0d0 ON public.register_committee_members USING btree (ward_id);


--
-- Name: user_details_bloodgroup_created_by_id_6e947c7a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_bloodgroup_created_by_id_6e947c7a ON public.user_details_bloodgroup USING btree (created_by_id);


--
-- Name: user_details_bloodgroup_modified_by_id_1b6a885f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_bloodgroup_modified_by_id_1b6a885f ON public.user_details_bloodgroup USING btree (modified_by_id);


--
-- Name: user_details_committee_committee_type_id_13240576; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committee_committee_type_id_13240576 ON public.user_details_committee USING btree (committee_type_id);


--
-- Name: user_details_committee_created_by_id_bd486ab6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committee_created_by_id_bd486ab6 ON public.user_details_committee USING btree (created_by_id);


--
-- Name: user_details_committee_modified_by_id_b27e2996; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committee_modified_by_id_b27e2996 ON public.user_details_committee USING btree (modified_by_id);


--
-- Name: user_details_committee_staff_role_id_da902b44; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committee_staff_role_id_da902b44 ON public.user_details_committee USING btree (staff_role_id);


--
-- Name: user_details_committeetype_created_by_id_8d380a05; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committeetype_created_by_id_8d380a05 ON public.user_details_committeetype USING btree (created_by_id);


--
-- Name: user_details_committeetype_modified_by_id_a7b83f43; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_committeetype_modified_by_id_a7b83f43 ON public.user_details_committeetype USING btree (modified_by_id);


--
-- Name: user_details_district_created_by_id_c3c3eb6f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_district_created_by_id_c3c3eb6f ON public.user_details_district USING btree (created_by_id);


--
-- Name: user_details_district_modified_by_id_15e5f5f3; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_district_modified_by_id_15e5f5f3 ON public.user_details_district USING btree (modified_by_id);


--
-- Name: user_details_district_state_id_edb0050c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_district_state_id_edb0050c ON public.user_details_district USING btree (state_id);


--
-- Name: user_details_panchayath_District_id_2f2e9df8; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "user_details_panchayath_District_id_2f2e9df8" ON public.user_details_panchayath USING btree (district_id);


--
-- Name: user_details_panchayath_created_by_id_5523299e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_panchayath_created_by_id_5523299e ON public.user_details_panchayath USING btree (created_by_id);


--
-- Name: user_details_panchayath_modified_by_id_29d0d99e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_panchayath_modified_by_id_29d0d99e ON public.user_details_panchayath USING btree (modified_by_id);


--
-- Name: user_details_staffrole_created_by_id_a6216177; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_staffrole_created_by_id_a6216177 ON public.user_details_staffrole USING btree (created_by_id);


--
-- Name: user_details_staffrole_modified_by_id_3cdffde0; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_staffrole_modified_by_id_3cdffde0 ON public.user_details_staffrole USING btree (modified_by_id);


--
-- Name: user_details_state_created_by_id_6ca689d7; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_state_created_by_id_6ca689d7 ON public.user_details_state USING btree (created_by_id);


--
-- Name: user_details_state_modified_by_id_9fe3bb6d; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_state_modified_by_id_9fe3bb6d ON public.user_details_state USING btree (modified_by_id);


--
-- Name: user_details_userdetails_committee_type_id_5c9177b5; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_committee_type_id_5c9177b5 ON public.user_details_userdetails USING btree (committee_type_id);


--
-- Name: user_details_userdetails_created_by_id_0f5dd3e6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_created_by_id_0f5dd3e6 ON public.user_details_userdetails USING btree (created_by_id);


--
-- Name: user_details_userdetails_district_id_ce8dae89; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_district_id_ce8dae89 ON public.user_details_userdetails USING btree (district_id);


--
-- Name: user_details_userdetails_modified_by_id_e7c581ae; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_modified_by_id_e7c581ae ON public.user_details_userdetails USING btree (modified_by_id);


--
-- Name: user_details_userdetails_panchayath_id_525ed716; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_panchayath_id_525ed716 ON public.user_details_userdetails USING btree (panchayath_id);


--
-- Name: user_details_userdetails_staff_role_id_7c840e83; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_staff_role_id_7c840e83 ON public.user_details_userdetails USING btree (staff_role_id);


--
-- Name: user_details_userdetails_state_id_aa14e890; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_state_id_aa14e890 ON public.user_details_userdetails USING btree (state_id);


--
-- Name: user_details_userdetails_ward_id_6984a301; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_userdetails_ward_id_6984a301 ON public.user_details_userdetails USING btree (ward_id);


--
-- Name: user_details_ward_created_by_id_348ec2c2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_ward_created_by_id_348ec2c2 ON public.user_details_ward USING btree (created_by_id);


--
-- Name: user_details_ward_modified_by_id_b749edc5; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_ward_modified_by_id_b749edc5 ON public.user_details_ward USING btree (modified_by_id);


--
-- Name: user_details_ward_panchayath_id_4f041fc6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_details_ward_panchayath_id_4f041fc6 ON public.user_details_ward USING btree (panchayath_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_program_model_qr_permission booking_program_mode_committee_members_id_81254276_fk_register_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model_qr_permission
    ADD CONSTRAINT booking_program_mode_committee_members_id_81254276_fk_register_ FOREIGN KEY (committee_members_id) REFERENCES public.register_committee_members(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_program_model booking_program_mode_fk_admin_id_id_7e42bc46_fk_register_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model
    ADD CONSTRAINT booking_program_mode_fk_admin_id_id_7e42bc46_fk_register_ FOREIGN KEY (fk_admin_id_id) REFERENCES public.register_admin_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_program_model booking_program_mode_fk_district_id_fa8b7d78_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model
    ADD CONSTRAINT booking_program_mode_fk_district_id_fa8b7d78_fk_user_deta FOREIGN KEY (fk_district_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_program_model booking_program_mode_fk_state_id_3ecf8b3d_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model
    ADD CONSTRAINT booking_program_mode_fk_state_id_3ecf8b3d_fk_user_deta FOREIGN KEY (fk_state_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_program_model_qr_permission booking_program_mode_program_model_id_8777c3c7_fk_booking_p; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_program_model_qr_permission
    ADD CONSTRAINT booking_program_mode_program_model_id_8777c3c7_fk_booking_p FOREIGN KEY (program_model_id) REFERENCES public.booking_program_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_ticketbooking booking_ticketbookin_fk_program_id_4afd70d2_fk_booking_p; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_ticketbooking
    ADD CONSTRAINT booking_ticketbookin_fk_program_id_4afd70d2_fk_booking_p FOREIGN KEY (fk_program_id) REFERENCES public.booking_program_model(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: booking_ticketbooking booking_ticketbookin_fk_user_id_id_1be2597c_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.booking_ticketbooking
    ADD CONSTRAINT booking_ticketbookin_fk_user_id_id_1be2597c_fk_user_deta FOREIGN KEY (fk_user_id_id) REFERENCES public.user_details_userdetails(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_meetingattendance news_meetingattendan_meeting_highligths_i_fa30a89c_fk_news_meet; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingattendance
    ADD CONSTRAINT news_meetingattendan_meeting_highligths_i_fa30a89c_fk_news_meet FOREIGN KEY (meeting_highligths_id) REFERENCES public.news_meetinghighligths(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_meetinghighligths news_meetinghighligths_created_by_id_cb047732_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetinghighligths
    ADD CONSTRAINT news_meetinghighligths_created_by_id_cb047732_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_meetinghighligths news_meetinghighligths_modified_by_id_5a908846_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetinghighligths
    ADD CONSTRAINT news_meetinghighligths_modified_by_id_5a908846_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_meetingphoto news_meetingphoto_meeting_highligths_i_7ece6a2e_fk_news_meet; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_meetingphoto
    ADD CONSTRAINT news_meetingphoto_meeting_highligths_i_7ece6a2e_fk_news_meet FOREIGN KEY (meeting_highligths_id) REFERENCES public.news_meetinghighligths(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_committe_type_id_d700b72b_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_committe_type_id_d700b72b_fk_user_deta FOREIGN KEY (committe_type_id) REFERENCES public.user_details_committeetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_created_by_id_e387780b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_created_by_id_e387780b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_district_region_id_098dd1f2_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_district_region_id_098dd1f2_fk_user_deta FOREIGN KEY (district_region_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_modified_by_id_cdcc478f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_modified_by_id_cdcc478f_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_news_type_id_67364c4b_fk_news_newstype_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_news_type_id_67364c4b_fk_news_newstype_id FOREIGN KEY (news_type_id) REFERENCES public.news_newstype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_panchayath_region_id_363f017a_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_panchayath_region_id_363f017a_fk_user_deta FOREIGN KEY (panchayath_region_id) REFERENCES public.user_details_panchayath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_state_region_id_41e8f59d_fk_user_details_state_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_state_region_id_41e8f59d_fk_user_details_state_id FOREIGN KEY (state_region_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newstype news_newstype_created_by_id_2378cfb3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_newstype
    ADD CONSTRAINT news_newstype_created_by_id_2378cfb3_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newstype news_newstype_modified_by_id_ac8096df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news_newstype
    ADD CONSTRAINT news_newstype_modified_by_id_ac8096df_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_committee_type_id_3a2dbed2_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_committee_type_id_3a2dbed2_fk_user_deta FOREIGN KEY (committee_type_id) REFERENCES public.user_details_committeetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_district_id_36868599_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_district_id_36868599_fk_user_deta FOREIGN KEY (district_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_panchayath_id_346b5599_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_panchayath_id_346b5599_fk_user_deta FOREIGN KEY (panchayath_id) REFERENCES public.user_details_panchayath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_staff_role_id_34c695a6_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_staff_role_id_34c695a6_fk_user_deta FOREIGN KEY (staff_role_id) REFERENCES public.user_details_staffrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_state_id_4e27c474_fk_user_details_state_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_state_id_4e27c474_fk_user_details_state_id FOREIGN KEY (state_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_user_id_id_c9592a99_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_user_id_id_c9592a99_fk_user_deta FOREIGN KEY (user_id_id) REFERENCES public.user_details_userdetails(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_admin_model register_admin_model_ward_id_db56e902_fk_user_details_ward_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_admin_model
    ADD CONSTRAINT register_admin_model_ward_id_db56e902_fk_user_details_ward_id FOREIGN KEY (ward_id) REFERENCES public.user_details_ward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_committee_type_id_783f32f5_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_committee_type_id_783f32f5_fk_user_deta FOREIGN KEY (committee_type_id) REFERENCES public.user_details_committeetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_district_id_b2ae2a82_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_district_id_b2ae2a82_fk_user_deta FOREIGN KEY (district_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_panchayath_id_0875524a_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_panchayath_id_0875524a_fk_user_deta FOREIGN KEY (panchayath_id) REFERENCES public.user_details_panchayath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_staff_role_id_cbb3e241_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_staff_role_id_cbb3e241_fk_user_deta FOREIGN KEY (staff_role_id) REFERENCES public.user_details_staffrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_state_id_0bd4f855_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_state_id_0bd4f855_fk_user_deta FOREIGN KEY (state_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: register_committee_members register_committee_m_ward_id_4ec2d0d0_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.register_committee_members
    ADD CONSTRAINT register_committee_m_ward_id_4ec2d0d0_fk_user_deta FOREIGN KEY (ward_id) REFERENCES public.user_details_ward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_bloodgroup user_details_bloodgroup_created_by_id_6e947c7a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_bloodgroup
    ADD CONSTRAINT user_details_bloodgroup_created_by_id_6e947c7a_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_bloodgroup user_details_bloodgroup_modified_by_id_1b6a885f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_bloodgroup
    ADD CONSTRAINT user_details_bloodgroup_modified_by_id_1b6a885f_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committee user_details_committ_committee_type_id_13240576_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee
    ADD CONSTRAINT user_details_committ_committee_type_id_13240576_fk_user_deta FOREIGN KEY (committee_type_id) REFERENCES public.user_details_committeetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committeetype user_details_committ_created_by_id_8d380a05_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committeetype
    ADD CONSTRAINT user_details_committ_created_by_id_8d380a05_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committeetype user_details_committ_modified_by_id_a7b83f43_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committeetype
    ADD CONSTRAINT user_details_committ_modified_by_id_a7b83f43_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committee user_details_committ_staff_role_id_da902b44_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee
    ADD CONSTRAINT user_details_committ_staff_role_id_da902b44_fk_user_deta FOREIGN KEY (staff_role_id) REFERENCES public.user_details_staffrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committee user_details_committee_created_by_id_bd486ab6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee
    ADD CONSTRAINT user_details_committee_created_by_id_bd486ab6_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_committee user_details_committee_modified_by_id_b27e2996_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_committee
    ADD CONSTRAINT user_details_committee_modified_by_id_b27e2996_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_district user_details_distric_state_id_edb0050c_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_district
    ADD CONSTRAINT user_details_distric_state_id_edb0050c_fk_user_deta FOREIGN KEY (state_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_district user_details_district_created_by_id_c3c3eb6f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_district
    ADD CONSTRAINT user_details_district_created_by_id_c3c3eb6f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_district user_details_district_modified_by_id_15e5f5f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_district
    ADD CONSTRAINT user_details_district_modified_by_id_15e5f5f3_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_panchayath user_details_panchay_district_id_3713a9e7_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_panchayath
    ADD CONSTRAINT user_details_panchay_district_id_3713a9e7_fk_user_deta FOREIGN KEY (district_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_panchayath user_details_panchayath_created_by_id_5523299e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_panchayath
    ADD CONSTRAINT user_details_panchayath_created_by_id_5523299e_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_panchayath user_details_panchayath_modified_by_id_29d0d99e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_panchayath
    ADD CONSTRAINT user_details_panchayath_modified_by_id_29d0d99e_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_staffrole user_details_staffrole_created_by_id_a6216177_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_staffrole
    ADD CONSTRAINT user_details_staffrole_created_by_id_a6216177_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_staffrole user_details_staffrole_modified_by_id_3cdffde0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_staffrole
    ADD CONSTRAINT user_details_staffrole_modified_by_id_3cdffde0_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_state user_details_state_created_by_id_6ca689d7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_state
    ADD CONSTRAINT user_details_state_created_by_id_6ca689d7_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_state user_details_state_modified_by_id_9fe3bb6d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_state
    ADD CONSTRAINT user_details_state_modified_by_id_9fe3bb6d_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_committee_type_id_5c9177b5_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_committee_type_id_5c9177b5_fk_user_deta FOREIGN KEY (committee_type_id) REFERENCES public.user_details_committeetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_district_id_ce8dae89_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_district_id_ce8dae89_fk_user_deta FOREIGN KEY (district_id) REFERENCES public.user_details_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_modified_by_id_e7c581ae_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_modified_by_id_e7c581ae_fk_auth_user FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_panchayath_id_525ed716_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_panchayath_id_525ed716_fk_user_deta FOREIGN KEY (panchayath_id) REFERENCES public.user_details_panchayath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_staff_role_id_7c840e83_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_staff_role_id_7c840e83_fk_user_deta FOREIGN KEY (staff_role_id) REFERENCES public.user_details_staffrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_state_id_aa14e890_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_state_id_aa14e890_fk_user_deta FOREIGN KEY (state_id) REFERENCES public.user_details_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdet_ward_id_6984a301_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdet_ward_id_6984a301_fk_user_deta FOREIGN KEY (ward_id) REFERENCES public.user_details_ward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdetails_created_by_id_0f5dd3e6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdetails_created_by_id_0f5dd3e6_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_userdetails user_details_userdetails_user_ptr_id_b39441b8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_userdetails
    ADD CONSTRAINT user_details_userdetails_user_ptr_id_b39441b8_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_ward user_details_ward_created_by_id_348ec2c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_ward
    ADD CONSTRAINT user_details_ward_created_by_id_348ec2c2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_ward user_details_ward_modified_by_id_b749edc5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_ward
    ADD CONSTRAINT user_details_ward_modified_by_id_b749edc5_fk_auth_user_id FOREIGN KEY (modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_details_ward user_details_ward_panchayath_id_4f041fc6_fk_user_deta; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_details_ward
    ADD CONSTRAINT user_details_ward_panchayath_id_4f041fc6_fk_user_deta FOREIGN KEY (panchayath_id) REFERENCES public.user_details_panchayath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

