# ✍️ Escrita Livre (WriteFreely em PT-BR)

Uma plataforma de publicação minimalista, federada e livre, personalizada em **Português do Brasil (pt-BR)** para reflexão, filosofia e literatura pedagógica.

---

## 🌟 Características
* **WriteFreely v0.17.2** em container Alpine Linux ultra-leve.
* **Interface 100% em Português (pt-BR):** Menus, editor, publicação, botões de administração e configurações do blog traduzidos nativamente.
* **Fediverso Ativo:** Compatível com ActivityPub e Mastodon.
* **Base de Dados SQLite3:** Persistente e rápida, sem dependência de bancos pesados externos.
* **Otimizado para Cloud in a Bottle (OpenHost):** Manifesto `cloudinabottle.toml` com limites de memória configurados para economia de recursos.

---

## 🚀 Como Executar Localmente ou em Servidor Pessoal

### Com Docker / Podman:
```bash
docker build -t escritalivre .
docker run -d -p 8080:8080 -v escritalivre_data:/data/app_data/escritalivre escritalivre
```

### No Cloud in a Bottle:
Adicione o repositório no catálogo ou cole a URL:
`https://github.com/zonaeducacional/escritalivre`

---

## 🌐 Produção
* **URL Oficial:** [https://escrita.zonaeducacional.org](https://escrita.zonaeducacional.org)
* **Hospedagem:** Dell Inspiron N4050 (Home Server) + Hostinger VPS (Túnel Reverso NPM com SSL Let's Encrypt).
