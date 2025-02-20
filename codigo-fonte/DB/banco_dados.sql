PGDMP                      |            confeitariaBD    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16421    confeitariaBD    DATABASE     �   CREATE DATABASE "confeitariaBD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "confeitariaBD";
                postgres    false            �            1259    16422    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    cpf_cnpj character(20),
    nome_cliente character varying(50) NOT NULL,
    telefone_cliente character varying(20) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16425    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    215            �           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    216            �            1259    16532 	   id_tarefa    SEQUENCE     r   CREATE SEQUENCE public.id_tarefa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.id_tarefa;
       public          postgres    false            �            1259    16426    pedido    TABLE     �  CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_cliente_chave integer NOT NULL,
    data_criacao_pedido date NOT NULL,
    endereco_entrega character varying(90) NOT NULL,
    data_entrega date NOT NULL,
    valor_pago double precision,
    descricao_pedido text NOT NULL,
    custos double precision,
    pedido_finalizado boolean NOT NULL,
    preco_pedido double precision
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16432    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    217            �           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    218            �            1259    16536    tarefa    TABLE     �   CREATE TABLE public.tarefa (
    id_tarefa integer NOT NULL,
    texto character varying(50) NOT NULL,
    cor character varying(20) NOT NULL,
    diasemana character varying(20) NOT NULL
);
    DROP TABLE public.tarefa;
       public         heap    postgres    false            �            1259    16535    tarefa_id_tarefa_seq    SEQUENCE     �   CREATE SEQUENCE public.tarefa_id_tarefa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tarefa_id_tarefa_seq;
       public          postgres    false    221            �           0    0    tarefa_id_tarefa_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tarefa_id_tarefa_seq OWNED BY public.tarefa.id_tarefa;
          public          postgres    false    220            %           2604    16433    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    216    215            &           2604    16434    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    218    217            '           2604    16539    tarefa id_tarefa    DEFAULT     t   ALTER TABLE ONLY public.tarefa ALTER COLUMN id_tarefa SET DEFAULT nextval('public.tarefa_id_tarefa_seq'::regclass);
 ?   ALTER TABLE public.tarefa ALTER COLUMN id_tarefa DROP DEFAULT;
       public          postgres    false    221    220    221            �          0    16422    cliente 
   TABLE DATA           W   COPY public.cliente (id_cliente, cpf_cnpj, nome_cliente, telefone_cliente) FROM stdin;
    public          postgres    false    215   h       �          0    16426    pedido 
   TABLE DATA           �   COPY public.pedido (id_pedido, id_cliente_chave, data_criacao_pedido, endereco_entrega, data_entrega, valor_pago, descricao_pedido, custos, pedido_finalizado, preco_pedido) FROM stdin;
    public          postgres    false    217   �       �          0    16536    tarefa 
   TABLE DATA           B   COPY public.tarefa (id_tarefa, texto, cor, diasemana) FROM stdin;
    public          postgres    false    221   �       �           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public          postgres    false    216            �           0    0 	   id_tarefa    SEQUENCE SET     7   SELECT pg_catalog.setval('public.id_tarefa', 1, true);
          public          postgres    false    219            �           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public          postgres    false    218            �           0    0    tarefa_id_tarefa_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarefa_id_tarefa_seq', 31, true);
          public          postgres    false    220            )           2606    16436    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            +           2606    16438    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    217            -           2606    16543    tarefa tarefa_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT tarefa_pkey PRIMARY KEY (id_tarefa);
 <   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT tarefa_pkey;
       public            postgres    false    221            .           2606    16439    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente_chave) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public          postgres    false    215    4649    217            �      x������ � �      �      x������ � �      �      x������ � �     