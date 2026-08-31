const categoriesEl = document.getElementById('categories');
const productsEl = document.getElementById('products');
const statusEl = document.getElementById('status');

let categoriesCache = [];

const money = new Intl.NumberFormat('ru-RU', {
    style: 'currency',
    currency: 'USD',
});

function escapeHtml(value) {
    return String(value)
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;');
}

function setStatus(text) {
    statusEl.textContent = text;
}

async function fetchJson(url) {
    const response = await fetch(url);
    const payload = await response.json();
    if (!response.ok) {
        throw new Error(payload.error || 'Ошибка запроса');
    }
    return payload;
}

function renderCategories(categories, selectedId) {
    categoriesEl.replaceChildren();

    categories.forEach((category) => {
        const button = document.createElement('button');
        button.type = 'button';
        button.textContent = category.name;
        button.setAttribute('aria-pressed', String(category.id === selectedId));
        button.addEventListener('click', () => {
            loadProducts(category);
        });
        categoriesEl.append(button);
    });
}

function renderProducts(products) {
    productsEl.replaceChildren();

    if (products.length === 0) {
        const empty = document.createElement('div');
        empty.className = 'empty';
        empty.textContent = 'В этой категории пока нет товаров';
        productsEl.append(empty);
        return;
    }

    products.forEach((product) => {
        const card = document.createElement('article');
        card.className = 'card';
        card.innerHTML = `
            <h2>${escapeHtml(product.name)}</h2>
            <p class="price">${escapeHtml(money.format(Number(product.price)))}</p>
            <p>${escapeHtml(product.description || '')}</p>
        `;
        productsEl.append(card);
    });
}

async function loadProducts(category) {
    renderCategories(categoriesCache, category.id);
    setStatus(category.description || 'Загрузка…');

    try {
        const products = await fetchJson(`/api/products?category_id=${category.id}`);
        renderProducts(products);
        setStatus(`${category.description} · ${products.length} шт.`);
    } catch (error) {
        productsEl.replaceChildren();
        setStatus(error.message);
    }
}

async function init() {
    setStatus('Загрузка категорий…');

    try {
        const categories = await fetchJson('/api/categories');
        categoriesCache = categories;

        if (categories.length === 0) {
            setStatus('Категории не найдены');
            return;
        }

        await loadProducts(categories[0]);
    } catch (error) {
        setStatus(error.message);
    }
}

init();
