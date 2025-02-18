PGDMP                      |            hotdog_da_re    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    hotdog_da_re    DATABASE     �   CREATE DATABASE hotdog_da_re WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hotdog_da_re;
                postgres    false                        2615    24595    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    24597    produtos    TABLE     �   CREATE TABLE public.produtos (
    produtoid integer NOT NULL,
    nome character varying(100) NOT NULL,
    preco numeric(10,2) NOT NULL
);
    DROP TABLE public.produtos;
       public         heap    postgres    false    5            �            1259    24596    produtos_produtoid_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_produtoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produtos_produtoid_seq;
       public          postgres    false    5    216            �           0    0    produtos_produtoid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produtos_produtoid_seq OWNED BY public.produtos.produtoid;
          public          postgres    false    215            �            1259    24604    vendas    TABLE       CREATE TABLE public.vendas (
    vendaid integer NOT NULL,
    nomecliente character varying(100) NOT NULL,
    produtoid integer NOT NULL,
    quantidade integer NOT NULL,
    precototal numeric(10,2) NOT NULL,
    datavenda timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.vendas;
       public         heap    postgres    false    5            �            1259    24603    vendas_vendaid_seq    SEQUENCE     �   CREATE SEQUENCE public.vendas_vendaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.vendas_vendaid_seq;
       public          postgres    false    218    5            �           0    0    vendas_vendaid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.vendas_vendaid_seq OWNED BY public.vendas.vendaid;
          public          postgres    false    217            U           2604    24600    produtos produtoid    DEFAULT     x   ALTER TABLE ONLY public.produtos ALTER COLUMN produtoid SET DEFAULT nextval('public.produtos_produtoid_seq'::regclass);
 A   ALTER TABLE public.produtos ALTER COLUMN produtoid DROP DEFAULT;
       public          postgres    false    215    216    216            V           2604    24607    vendas vendaid    DEFAULT     p   ALTER TABLE ONLY public.vendas ALTER COLUMN vendaid SET DEFAULT nextval('public.vendas_vendaid_seq'::regclass);
 =   ALTER TABLE public.vendas ALTER COLUMN vendaid DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    24597    produtos 
   TABLE DATA           :   COPY public.produtos (produtoid, nome, preco) FROM stdin;
    public          postgres    false    216   �       �          0    24604    vendas 
   TABLE DATA           d   COPY public.vendas (vendaid, nomecliente, produtoid, quantidade, precototal, datavenda) FROM stdin;
    public          postgres    false    218   A       �           0    0    produtos_produtoid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.produtos_produtoid_seq', 4, true);
          public          postgres    false    215            �           0    0    vendas_vendaid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.vendas_vendaid_seq', 7, true);
          public          postgres    false    217            Y           2606    24602    produtos produtos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (produtoid);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public            postgres    false    216            [           2606    24610    vendas vendas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (vendaid);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public            postgres    false    218            \           2606    24611    vendas vendas_produtoid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_produtoid_fkey FOREIGN KEY (produtoid) REFERENCES public.produtos(produtoid);
 F   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_produtoid_fkey;
       public          postgres    false    218    4697    216            �   P   x�3�tJ,B��̒DNC=.#N����tNא�#17�����"NC#��	g��[���k��_�+'X,F��� ���      �      x������ � �     