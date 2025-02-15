PGDMP  *    "                }            practSQLMAF    17.2 (Debian 17.2-1.pgdg120+1)    17.1 I    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            |           1262    32771    practSQLMAF    DATABASE     x   CREATE DATABASE "practSQLMAF" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "practSQLMAF";
                     postgres    false            �            1259    32786    alumns    TABLE     �   CREATE TABLE public.alumns (
    alumn_id integer NOT NULL,
    alumn_firstname character varying(255),
    alumn_lastname character varying(255),
    alumn_email character varying(255) NOT NULL,
    alumn_phone character varying(255) NOT NULL
);
    DROP TABLE public.alumns;
       public         heap r       postgres    false            �            1259    32785    alumns_alumn_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alumns_alumn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.alumns_alumn_id_seq;
       public               postgres    false    220            }           0    0    alumns_alumn_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.alumns_alumn_id_seq OWNED BY public.alumns.alumn_id;
          public               postgres    false    219            �            1259    32860    alumnscourse    TABLE     n   CREATE TABLE public.alumnscourse (
    ac_id integer NOT NULL,
    course_id integer,
    alumn_id integer
);
     DROP TABLE public.alumnscourse;
       public         heap r       postgres    false            �            1259    32859    alumnscourse_ac_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alumnscourse_ac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.alumnscourse_ac_id_seq;
       public               postgres    false    228            ~           0    0    alumnscourse_ac_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.alumnscourse_ac_id_seq OWNED BY public.alumnscourse.ac_id;
          public               postgres    false    227            �            1259    32838    coursemodule    TABLE     �   CREATE TABLE public.coursemodule (
    cm_id integer NOT NULL,
    teach_id integer,
    module_id integer,
    course_id integer,
    start_date_module date,
    end_date_module date,
    course_tipopres character varying(255)
);
     DROP TABLE public.coursemodule;
       public         heap r       postgres    false            �            1259    32837    coursemodule_cm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coursemodule_cm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.coursemodule_cm_id_seq;
       public               postgres    false    226                       0    0    coursemodule_cm_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.coursemodule_cm_id_seq OWNED BY public.coursemodule.cm_id;
          public               postgres    false    225            �            1259    32808    courses    TABLE     �   CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(255),
    course_start date,
    course_end date,
    descripcion text
);
    DROP TABLE public.courses;
       public         heap r       postgres    false            �            1259    32807    courses_course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.courses_course_id_seq;
       public               postgres    false    224            �           0    0    courses_course_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;
          public               postgres    false    223            �            1259    32799    modules    TABLE     �   CREATE TABLE public.modules (
    module_id integer NOT NULL,
    module_name character varying(255),
    descripcion text,
    cost numeric(10,2)
);
    DROP TABLE public.modules;
       public         heap r       postgres    false            �            1259    32798    modules_module_id_seq    SEQUENCE     �   CREATE SEQUENCE public.modules_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.modules_module_id_seq;
       public               postgres    false    222            �           0    0    modules_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.modules_module_id_seq OWNED BY public.modules.module_id;
          public               postgres    false    221            �            1259    32877    notaslalummodul    TABLE     �   CREATE TABLE public.notaslalummodul (
    nam_id integer NOT NULL,
    notaalumn integer,
    cm_id integer,
    alumn_id integer
);
 #   DROP TABLE public.notaslalummodul;
       public         heap r       postgres    false            �            1259    32876    notaslalummodul_nam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notaslalummodul_nam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.notaslalummodul_nam_id_seq;
       public               postgres    false    230            �           0    0    notaslalummodul_nam_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.notaslalummodul_nam_id_seq OWNED BY public.notaslalummodul.nam_id;
          public               postgres    false    229            �            1259    32773    teachers    TABLE     �   CREATE TABLE public.teachers (
    teach_id integer NOT NULL,
    teach_firstname character varying(255),
    teach_lastname character varying(255),
    teach_email character varying(255) NOT NULL,
    teach_phone character varying(255) NOT NULL
);
    DROP TABLE public.teachers;
       public         heap r       postgres    false            �            1259    32772    teachers_teach_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teachers_teach_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.teachers_teach_id_seq;
       public               postgres    false    218            �           0    0    teachers_teach_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.teachers_teach_id_seq OWNED BY public.teachers.teach_id;
          public               postgres    false    217            �            1259    32894    xxx    TABLE     |   CREATE TABLE public.xxx (
    amd_id integer NOT NULL,
    percentasist integer,
    cm_id integer,
    alumn_id integer
);
    DROP TABLE public.xxx;
       public         heap r       postgres    false            �            1259    32893    xxx_amd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.xxx_amd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.xxx_amd_id_seq;
       public               postgres    false    232            �           0    0    xxx_amd_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.xxx_amd_id_seq OWNED BY public.xxx.amd_id;
          public               postgres    false    231            �           2604    32789    alumns alumn_id    DEFAULT     r   ALTER TABLE ONLY public.alumns ALTER COLUMN alumn_id SET DEFAULT nextval('public.alumns_alumn_id_seq'::regclass);
 >   ALTER TABLE public.alumns ALTER COLUMN alumn_id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    32863    alumnscourse ac_id    DEFAULT     x   ALTER TABLE ONLY public.alumnscourse ALTER COLUMN ac_id SET DEFAULT nextval('public.alumnscourse_ac_id_seq'::regclass);
 A   ALTER TABLE public.alumnscourse ALTER COLUMN ac_id DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    32841    coursemodule cm_id    DEFAULT     x   ALTER TABLE ONLY public.coursemodule ALTER COLUMN cm_id SET DEFAULT nextval('public.coursemodule_cm_id_seq'::regclass);
 A   ALTER TABLE public.coursemodule ALTER COLUMN cm_id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    32811    courses course_id    DEFAULT     v   ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);
 @   ALTER TABLE public.courses ALTER COLUMN course_id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    32802    modules module_id    DEFAULT     v   ALTER TABLE ONLY public.modules ALTER COLUMN module_id SET DEFAULT nextval('public.modules_module_id_seq'::regclass);
 @   ALTER TABLE public.modules ALTER COLUMN module_id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    32880    notaslalummodul nam_id    DEFAULT     �   ALTER TABLE ONLY public.notaslalummodul ALTER COLUMN nam_id SET DEFAULT nextval('public.notaslalummodul_nam_id_seq'::regclass);
 E   ALTER TABLE public.notaslalummodul ALTER COLUMN nam_id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    32776    teachers teach_id    DEFAULT     v   ALTER TABLE ONLY public.teachers ALTER COLUMN teach_id SET DEFAULT nextval('public.teachers_teach_id_seq'::regclass);
 @   ALTER TABLE public.teachers ALTER COLUMN teach_id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    32897 
   xxx amd_id    DEFAULT     h   ALTER TABLE ONLY public.xxx ALTER COLUMN amd_id SET DEFAULT nextval('public.xxx_amd_id_seq'::regclass);
 9   ALTER TABLE public.xxx ALTER COLUMN amd_id DROP DEFAULT;
       public               postgres    false    232    231    232            j          0    32786    alumns 
   TABLE DATA           e   COPY public.alumns (alumn_id, alumn_firstname, alumn_lastname, alumn_email, alumn_phone) FROM stdin;
    public               postgres    false    220   bW       r          0    32860    alumnscourse 
   TABLE DATA           B   COPY public.alumnscourse (ac_id, course_id, alumn_id) FROM stdin;
    public               postgres    false    228   W       p          0    32838    coursemodule 
   TABLE DATA           �   COPY public.coursemodule (cm_id, teach_id, module_id, course_id, start_date_module, end_date_module, course_tipopres) FROM stdin;
    public               postgres    false    226   �W       n          0    32808    courses 
   TABLE DATA           `   COPY public.courses (course_id, course_name, course_start, course_end, descripcion) FROM stdin;
    public               postgres    false    224   �W       l          0    32799    modules 
   TABLE DATA           L   COPY public.modules (module_id, module_name, descripcion, cost) FROM stdin;
    public               postgres    false    222   �W       t          0    32877    notaslalummodul 
   TABLE DATA           M   COPY public.notaslalummodul (nam_id, notaalumn, cm_id, alumn_id) FROM stdin;
    public               postgres    false    230   �W       h          0    32773    teachers 
   TABLE DATA           g   COPY public.teachers (teach_id, teach_firstname, teach_lastname, teach_email, teach_phone) FROM stdin;
    public               postgres    false    218   X       v          0    32894    xxx 
   TABLE DATA           D   COPY public.xxx (amd_id, percentasist, cm_id, alumn_id) FROM stdin;
    public               postgres    false    232   -X       �           0    0    alumns_alumn_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.alumns_alumn_id_seq', 1, false);
          public               postgres    false    219            �           0    0    alumnscourse_ac_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.alumnscourse_ac_id_seq', 1, false);
          public               postgres    false    227            �           0    0    coursemodule_cm_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.coursemodule_cm_id_seq', 1, false);
          public               postgres    false    225            �           0    0    courses_course_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.courses_course_id_seq', 1, false);
          public               postgres    false    223            �           0    0    modules_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.modules_module_id_seq', 1, false);
          public               postgres    false    221            �           0    0    notaslalummodul_nam_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.notaslalummodul_nam_id_seq', 1, false);
          public               postgres    false    229            �           0    0    teachers_teach_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.teachers_teach_id_seq', 1, false);
          public               postgres    false    217            �           0    0    xxx_amd_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.xxx_amd_id_seq', 1, false);
          public               postgres    false    231            �           2606    32793    alumns alumns_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.alumns
    ADD CONSTRAINT alumns_pkey PRIMARY KEY (alumn_id);
 <   ALTER TABLE ONLY public.alumns DROP CONSTRAINT alumns_pkey;
       public                 postgres    false    220            �           2606    32865    alumnscourse alumnscourse_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.alumnscourse
    ADD CONSTRAINT alumnscourse_pkey PRIMARY KEY (ac_id);
 H   ALTER TABLE ONLY public.alumnscourse DROP CONSTRAINT alumnscourse_pkey;
       public                 postgres    false    228            �           2606    32843    coursemodule coursemodule_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.coursemodule
    ADD CONSTRAINT coursemodule_pkey PRIMARY KEY (cm_id);
 H   ALTER TABLE ONLY public.coursemodule DROP CONSTRAINT coursemodule_pkey;
       public                 postgres    false    226            �           2606    32815    courses courses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public                 postgres    false    224            �           2606    32806    modules modules_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (module_id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public                 postgres    false    222            �           2606    32882 $   notaslalummodul notaslalummodul_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.notaslalummodul
    ADD CONSTRAINT notaslalummodul_pkey PRIMARY KEY (nam_id);
 N   ALTER TABLE ONLY public.notaslalummodul DROP CONSTRAINT notaslalummodul_pkey;
       public                 postgres    false    230            �           2606    32780    teachers teachers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teach_id);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
       public                 postgres    false    218            �           2606    32795    alumns unique_alumn_email 
   CONSTRAINT     [   ALTER TABLE ONLY public.alumns
    ADD CONSTRAINT unique_alumn_email UNIQUE (alumn_email);
 C   ALTER TABLE ONLY public.alumns DROP CONSTRAINT unique_alumn_email;
       public                 postgres    false    220            �           2606    32797    alumns unique_alumn_phone 
   CONSTRAINT     [   ALTER TABLE ONLY public.alumns
    ADD CONSTRAINT unique_alumn_phone UNIQUE (alumn_phone);
 C   ALTER TABLE ONLY public.alumns DROP CONSTRAINT unique_alumn_phone;
       public                 postgres    false    220            �           2606    32782    teachers unique_teach_email 
   CONSTRAINT     ]   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT unique_teach_email UNIQUE (teach_email);
 E   ALTER TABLE ONLY public.teachers DROP CONSTRAINT unique_teach_email;
       public                 postgres    false    218            �           2606    32784    teachers unique_teach_phone 
   CONSTRAINT     ]   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT unique_teach_phone UNIQUE (teach_phone);
 E   ALTER TABLE ONLY public.teachers DROP CONSTRAINT unique_teach_phone;
       public                 postgres    false    218            �           2606    32899    xxx xxx_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.xxx
    ADD CONSTRAINT xxx_pkey PRIMARY KEY (amd_id);
 6   ALTER TABLE ONLY public.xxx DROP CONSTRAINT xxx_pkey;
       public                 postgres    false    232            �           2606    32871 '   alumnscourse alumnscourse_alumn_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumnscourse
    ADD CONSTRAINT alumnscourse_alumn_id_fkey FOREIGN KEY (alumn_id) REFERENCES public.alumns(alumn_id);
 Q   ALTER TABLE ONLY public.alumnscourse DROP CONSTRAINT alumnscourse_alumn_id_fkey;
       public               postgres    false    220    3260    228            �           2606    32866 (   alumnscourse alumnscourse_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumnscourse
    ADD CONSTRAINT alumnscourse_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);
 R   ALTER TABLE ONLY public.alumnscourse DROP CONSTRAINT alumnscourse_course_id_fkey;
       public               postgres    false    228    224    3268            �           2606    32854 (   coursemodule coursemodule_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursemodule
    ADD CONSTRAINT coursemodule_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);
 R   ALTER TABLE ONLY public.coursemodule DROP CONSTRAINT coursemodule_course_id_fkey;
       public               postgres    false    226    3268    224            �           2606    32849 (   coursemodule coursemodule_module_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursemodule
    ADD CONSTRAINT coursemodule_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(module_id);
 R   ALTER TABLE ONLY public.coursemodule DROP CONSTRAINT coursemodule_module_id_fkey;
       public               postgres    false    222    3266    226            �           2606    32844 '   coursemodule coursemodule_teach_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursemodule
    ADD CONSTRAINT coursemodule_teach_id_fkey FOREIGN KEY (teach_id) REFERENCES public.teachers(teach_id);
 Q   ALTER TABLE ONLY public.coursemodule DROP CONSTRAINT coursemodule_teach_id_fkey;
       public               postgres    false    226    218    3254            �           2606    32888 -   notaslalummodul notaslalummodul_alumn_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notaslalummodul
    ADD CONSTRAINT notaslalummodul_alumn_id_fkey FOREIGN KEY (alumn_id) REFERENCES public.alumns(alumn_id);
 W   ALTER TABLE ONLY public.notaslalummodul DROP CONSTRAINT notaslalummodul_alumn_id_fkey;
       public               postgres    false    3260    230    220            �           2606    32883 *   notaslalummodul notaslalummodul_cm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notaslalummodul
    ADD CONSTRAINT notaslalummodul_cm_id_fkey FOREIGN KEY (cm_id) REFERENCES public.coursemodule(cm_id);
 T   ALTER TABLE ONLY public.notaslalummodul DROP CONSTRAINT notaslalummodul_cm_id_fkey;
       public               postgres    false    226    3270    230            �           2606    32905    xxx xxx_alumn_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.xxx
    ADD CONSTRAINT xxx_alumn_id_fkey FOREIGN KEY (alumn_id) REFERENCES public.alumns(alumn_id);
 ?   ALTER TABLE ONLY public.xxx DROP CONSTRAINT xxx_alumn_id_fkey;
       public               postgres    false    232    220    3260            �           2606    32900    xxx xxx_cm_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.xxx
    ADD CONSTRAINT xxx_cm_id_fkey FOREIGN KEY (cm_id) REFERENCES public.coursemodule(cm_id);
 <   ALTER TABLE ONLY public.xxx DROP CONSTRAINT xxx_cm_id_fkey;
       public               postgres    false    232    3270    226            j      x������ � �      r      x������ � �      p      x������ � �      n      x������ � �      l      x������ � �      t      x������ � �      h      x������ � �      v      x������ � �     