PGDMP     5    2                {            Hand-A-Game    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16415    Hand-A-Game    DATABASE     �   CREATE DATABASE "Hand-A-Game" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE "Hand-A-Game";
                postgres    false            �            1259    16434    game    TABLE     �   CREATE TABLE public.game (
    id integer NOT NULL,
    "Titulo" character varying(100) NOT NULL,
    fisico boolean NOT NULL,
    generos character varying(100)[] NOT NULL
);
    DROP TABLE public.game;
       public         heap    postgres    false            �            1259    16444    notificação    TABLE     �   CREATE TABLE public."notificação" (
    id integer NOT NULL,
    texto character varying(1000) NOT NULL,
    data date NOT NULL
);
 #   DROP TABLE public."notificação";
       public         heap    postgres    false            �            1259    16429 
   plataforma    TABLE     v   CREATE TABLE public.plataforma (
    nome character varying(100) NOT NULL,
    aluguel_simultaneo boolean NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false            �            1259    16416    usuario    TABLE       CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    contato character varying(100) NOT NULL,
    cidade character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    hashsehnha character varying(100) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                      0    16434    game 
   TABLE DATA           =   COPY public.game (id, "Titulo", fisico, generos) FROM stdin;
    public          postgres    false    216   �       	          0    16444    notificação 
   TABLE DATA           :   COPY public."notificação" (id, texto, data) FROM stdin;
    public          postgres    false    217   �                 0    16429 
   plataforma 
   TABLE DATA           >   COPY public.plataforma (nome, aluguel_simultaneo) FROM stdin;
    public          postgres    false    215   �                 0    16416    usuario 
   TABLE DATA           O   COPY public.usuario (id, nome, contato, cidade, email, hashsehnha) FROM stdin;
    public          postgres    false    214          u           2606    16438    game game_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public            postgres    false    216            w           2606    16450     notificação notificação_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."notificação"
    ADD CONSTRAINT "notificação_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."notificação" DROP CONSTRAINT "notificação_pkey";
       public            postgres    false    217            s           2606    16433    plataforma platafomra_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT platafomra_pkey PRIMARY KEY (nome);
 D   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT platafomra_pkey;
       public            postgres    false    215            q           2606    16422    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    214                  x������ � �      	      x������ � �            x������ � �            x������ � �     