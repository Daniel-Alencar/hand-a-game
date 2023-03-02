PGDMP                         {            postgres    15.1    15.1 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false                        0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3359                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            !           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    24631    aluga    TABLE     �   CREATE TABLE public.aluga (
    data_inicio date,
    solicitacao_aceita boolean,
    tempo_max bigint,
    "FK_id_game" integer NOT NULL,
    "FK_id_usuario" integer NOT NULL
);
    DROP TABLE public.aluga;
       public         heap    postgres    false            "           0    0    TABLE aluga    COMMENT     P   COMMENT ON TABLE public.aluga IS 'Tabela relacionamento entre usuário e jogo';
          public          postgres    false    219            #           0    0    COLUMN aluga.data_inicio    COMMENT     P   COMMENT ON COLUMN public.aluga.data_inicio IS 'início do período de aluguel';
          public          postgres    false    219            $           0    0    COLUMN aluga.solicitacao_aceita    COMMENT     q   COMMENT ON COLUMN public.aluga.solicitacao_aceita IS 'informa se a solicitação para alugar o jogo foi aceita';
          public          postgres    false    219            %           0    0    COLUMN aluga.tempo_max    COMMENT     S   COMMENT ON COLUMN public.aluga.tempo_max IS 'tempo máximo de empréstimo (dias)';
          public          postgres    false    219            �            1259    24605    game    TABLE     �   CREATE TABLE public.game (
    id integer NOT NULL,
    "Titulo" character varying(100) NOT NULL,
    fisico boolean NOT NULL,
    generos character varying(100)[] NOT NULL,
    "FK_id_usuario" integer,
    "FK_nome_plataforma" character varying
);
    DROP TABLE public.game;
       public         heap    postgres    false            �            1259    24610    notificação    TABLE     �   CREATE TABLE public."notificação" (
    id integer NOT NULL,
    texto character varying(1000) NOT NULL,
    data date NOT NULL,
    "FK_id_usuario" integer
);
 #   DROP TABLE public."notificação";
       public         heap    postgres    false            �            1259    24615 
   plataforma    TABLE     v   CREATE TABLE public.plataforma (
    nome character varying(100) NOT NULL,
    aluguel_simultaneo boolean NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false            �            1259    24618    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100),
    contato character varying(100),
    cidade character varying(100),
    email character varying(100),
    hashsenha character varying(150)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                      0    24631    aluga 
   TABLE DATA           j   COPY public.aluga (data_inicio, solicitacao_aceita, tempo_max, "FK_id_game", "FK_id_usuario") FROM stdin;
    public          postgres    false    219   2%                 0    24605    game 
   TABLE DATA           d   COPY public.game (id, "Titulo", fisico, generos, "FK_id_usuario", "FK_nome_plataforma") FROM stdin;
    public          postgres    false    215   O%                 0    24610    notificação 
   TABLE DATA           K   COPY public."notificação" (id, texto, data, "FK_id_usuario") FROM stdin;
    public          postgres    false    216   l%                 0    24615 
   plataforma 
   TABLE DATA           >   COPY public.plataforma (nome, aluguel_simultaneo) FROM stdin;
    public          postgres    false    217   �%                 0    24618    usuario 
   TABLE DATA           N   COPY public.usuario (id, nome, contato, cidade, email, hashsenha) FROM stdin;
    public          postgres    false    218   �%                  2606    24647    aluga PK_id_usuario_game 
   CONSTRAINT     s   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT "PK_id_usuario_game" PRIMARY KEY ("FK_id_game", "FK_id_usuario");
 D   ALTER TABLE ONLY public.aluga DROP CONSTRAINT "PK_id_usuario_game";
       public            postgres    false    219    219            w           2606    24624    game game_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public            postgres    false    215            y           2606    24626     notificação notificação_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."notificação"
    ADD CONSTRAINT "notificação_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."notificação" DROP CONSTRAINT "notificação_pkey";
       public            postgres    false    216            {           2606    24628    plataforma plataforma_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT plataforma_pkey PRIMARY KEY (nome);
 D   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT plataforma_pkey;
       public            postgres    false    217            }           2606    24630    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    218            �           1259    24639    fki_FK_id_game    INDEX     J   CREATE INDEX "fki_FK_id_game" ON public.aluga USING btree ("FK_id_game");
 $   DROP INDEX public."fki_FK_id_game";
       public            postgres    false    219            �           1259    24645    fki_FK_id_usuario    INDEX     P   CREATE INDEX "fki_FK_id_usuario" ON public.aluga USING btree ("FK_id_usuario");
 '   DROP INDEX public."fki_FK_id_usuario";
       public            postgres    false    219            u           1259    24663    fki_FK_nome_plataforma    INDEX     Y   CREATE INDEX "fki_FK_nome_plataforma" ON public.game USING btree ("FK_nome_plataforma");
 ,   DROP INDEX public."fki_FK_nome_plataforma";
       public            postgres    false    215            �           2606    24634    aluga FK_id_game    FK CONSTRAINT     u   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT "FK_id_game" FOREIGN KEY ("FK_id_game") REFERENCES public.game(id);
 <   ALTER TABLE ONLY public.aluga DROP CONSTRAINT "FK_id_game";
       public          postgres    false    3191    219    215            �           2606    24640    aluga FK_id_usuario    FK CONSTRAINT     ~   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY ("FK_id_usuario") REFERENCES public.usuario(id);
 ?   ALTER TABLE ONLY public.aluga DROP CONSTRAINT "FK_id_usuario";
       public          postgres    false    3197    219    218            �           2606    24648    notificação FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public."notificação"
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY ("FK_id_usuario") REFERENCES public.usuario(id);
 I   ALTER TABLE ONLY public."notificação" DROP CONSTRAINT "FK_id_usuario";
       public          postgres    false    218    216    3197            �           2606    24653    game FK_id_usuario    FK CONSTRAINT     }   ALTER TABLE ONLY public.game
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY ("FK_id_usuario") REFERENCES public.usuario(id);
 >   ALTER TABLE ONLY public.game DROP CONSTRAINT "FK_id_usuario";
       public          postgres    false    215    218    3197            �           2606    24658    game FK_nome_plataforma    FK CONSTRAINT     �   ALTER TABLE ONLY public.game
    ADD CONSTRAINT "FK_nome_plataforma" FOREIGN KEY ("FK_nome_plataforma") REFERENCES public.plataforma(nome);
 C   ALTER TABLE ONLY public.game DROP CONSTRAINT "FK_nome_plataforma";
       public          postgres    false    215    3195    217                  x������ � �            x������ � �            x������ � �            x�.IM��L����+I�K�2c���� b6�         �   x�]�1ND1��SPB��Nl��h�� 4�K��%v/�9��C���f���q��JZ[�"�D�u�>������q�����Ӽ��|�㒚8E�ƈ��@��4��E"�KkE�Fq�P�y�.=�5#f�C[�E;U)�+�f.���]	}xa2"�rz����>�5U���������`f`X,�Y</�:�U� �,J4��L���Q��P�Yr�:yP8�2nLy�𰢕��䱆;�j���uoo�m�~ �1eI     