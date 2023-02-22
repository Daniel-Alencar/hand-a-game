PGDMP     &                    {            postgres    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3349                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    24576 
   Plataforma    TABLE     &   CREATE TABLE public."Plataforma" (
);
     DROP TABLE public."Plataforma";
       public         heap    postgres    false            �            1259    24586    game    TABLE     �   CREATE TABLE public.game (
    id integer NOT NULL,
    "Titulo" character varying(100) NOT NULL,
    fisico boolean NOT NULL,
    generos character varying(100)[] NOT NULL
);
    DROP TABLE public.game;
       public         heap    postgres    false            �            1259    24591    notificação    TABLE     �   CREATE TABLE public."notificação" (
    id integer NOT NULL,
    texto character varying(1000) NOT NULL,
    data date NOT NULL
);
 #   DROP TABLE public."notificação";
       public         heap    postgres    false            �            1259    24596 
   plataforma    TABLE     v   CREATE TABLE public.plataforma (
    nome character varying(100) NOT NULL,
    aluguel_simultaneo boolean NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false            �            1259    24579    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100),
    contato character varying(100),
    cidade character varying(100),
    email character varying(100),
    hashsehnha character varying(100)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                      0    24576 
   Plataforma 
   TABLE DATA           &   COPY public."Plataforma"  FROM stdin;
    public          postgres    false    215   l                 0    24586    game 
   TABLE DATA           =   COPY public.game (id, "Titulo", fisico, generos) FROM stdin;
    public          postgres    false    217   �                 0    24591    notificação 
   TABLE DATA           :   COPY public."notificação" (id, texto, data) FROM stdin;
    public          postgres    false    218   �                 0    24596 
   plataforma 
   TABLE DATA           >   COPY public.plataforma (nome, aluguel_simultaneo) FROM stdin;
    public          postgres    false    219   �                 0    24579    usuario 
   TABLE DATA           O   COPY public.usuario (id, nome, contato, cidade, email, hashsehnha) FROM stdin;
    public          postgres    false    216   �       x           2606    24600    game game_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public            postgres    false    217            z           2606    24602     notificação notificação_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."notificação"
    ADD CONSTRAINT "notificação_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."notificação" DROP CONSTRAINT "notificação_pkey";
       public            postgres    false    218            |           2606    24604    plataforma platafomra_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT platafomra_pkey PRIMARY KEY (nome);
 D   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT platafomra_pkey;
       public            postgres    false    219            v           2606    24585    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    216                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     