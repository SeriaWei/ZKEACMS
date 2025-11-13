import { Page, Locator, FrameLocator } from '@playwright/test';
import { AdminPageBase } from "@models/AdminPageBase";

export class ProductFormPage extends AdminPageBase {
    public readonly titleInput: Locator;
    public readonly englishNameInput: Locator;
    public readonly imageInput: Locator;
    public readonly thumbnailInput: Locator;
    public readonly productCategoryDropdownTree: Locator;
    public readonly modelInput: Locator;
    public readonly colorInput: Locator;
    public readonly priceInput: Locator;
    public readonly discountPriceInput: Locator;
    public readonly costPriceInput: Locator;
    public readonly specificationInput: Locator;
    public readonly warrantyInput: Locator;
    public readonly detailedContentFrame: Locator;
    public readonly seoTitleInput: Locator;
    public readonly seoKeywordsInput: Locator;
    public readonly seoDescriptionInput: Locator;
    public readonly sortInput: Locator;
    public readonly sourceInput: Locator;
    public readonly publishDateInput: Locator;
    public readonly descriptionInput: Locator;
    public readonly statusDropdown: Locator;
    public readonly saveButton: Locator;
    public readonly saveAndExitButton: Locator;
    public readonly publishButton: Locator;
    public readonly cancelButton: Locator;
    public readonly addImageButton: Locator;

    constructor(page: Page) {
        super(page);
        this.titleInput = page.locator('#Title');
        this.englishNameInput = page.locator('#Url');
        this.imageInput = page.locator('#ImageUrl');
        this.thumbnailInput = page.locator('#ImageThumbUrl');
        this.productCategoryDropdownTree = page.locator('#dropdown-tree-ProductCategoryID > .form-control');
        this.modelInput = page.locator('#PartNumber');
        this.colorInput = page.locator('#Color');
        this.priceInput = page.locator('#Price');
        this.discountPriceInput = page.locator('#RebatePrice');
        this.costPriceInput = page.locator('#PurchasePrice');
        this.specificationInput = page.locator('#Norm');
        this.warrantyInput = page.locator('#ShelfLife');
        this.detailedContentFrame = page.locator('#ProductContent_ifr');
        this.seoTitleInput = page.locator('#SEOTitle');
        this.seoKeywordsInput = page.locator('#SEOKeyWord');
        this.seoDescriptionInput = page.locator('#SEODescription');
        this.sortInput = page.locator('#OrderIndex');
        this.sourceInput = page.locator('#SourceFrom');
        this.publishDateInput = page.locator('#PublishDate');
        this.descriptionInput = page.locator('#Description');
        this.statusDropdown = page.locator('#Status');
        this.saveButton = page.locator('input[value="保存"]');
        this.saveAndExitButton = page.locator('input[value="保存并退出"]');
        this.publishButton = page.locator('input[value="发布"]');
        this.cancelButton = page.locator('a.btn-default');
        this.addImageButton = page.locator('.btn-xs.add');
    }

    async navigateTo(): Promise<void> {
        await this.page.goto('/admin/product/create');
    }

    async fillProductForm(product: {
        title?: string;
        englishName?: string;
        image?: string;
        thumbnail?: string;
        category?: string;
        model?: string;
        color?: string;
        price?: string;
        discountPrice?: string;
        costPrice?: string;
        specification?: string;
        warranty?: string;
        content?: string;
        seoTitle?: string;
        seoKeywords?: string;
        seoDescription?: string;
        sort?: string;
        source?: string;
        publishDate?: string;
        status?: string;
        description?: string;
        images?: {
            title?: string;
            url?: string;
            stauts?: string;
        }[]
    }): Promise<void> {
        await this.fill(this.titleInput, product.title);
        await this.fill(this.englishNameInput, product.englishName);
        await this.fill(this.imageInput, product.image);
        await this.fill(this.thumbnailInput, product.thumbnail);
        await this.selectProductCategory(product.category);
        await this.fill(this.modelInput, product.model);
        await this.fill(this.colorInput, product.color);
        await this.fill(this.priceInput, product.price);
        await this.fill(this.discountPriceInput, product.discountPrice);
        await this.fill(this.costPriceInput, product.costPrice);
        await this.fill(this.specificationInput, product.specification);
        await this.fill(this.warrantyInput, product.warranty);
        if (product.content) {
            await this.detailedContentFrame.contentFrame().locator('#tinymce').fill(product.content);
        }
        await this.fill(this.seoTitleInput, product.seoTitle);
        await this.fill(this.seoKeywordsInput, product.seoKeywords);
        await this.fill(this.seoDescriptionInput, product.seoDescription);
        await this.fill(this.sortInput, product.sort);
        await this.fill(this.sourceInput, product.source);
        await this.fill(this.publishDateInput, product.publishDate);
        await this.fill(this.descriptionInput, product.description);
        await this.fill(this.statusDropdown, product.status);
        await this.fillImages(product.images);
    }

    async selectProductCategory(productCategory?: string): Promise<void> {

        if (productCategory == null || productCategory === undefined) {
            return;
        }

        if (await this.productCategoryDropdownTree.isVisible()) {
            await this.productCategoryDropdownTree.click();
        }

        const productCategoryOption = this.page.getByRole('treeitem', { name: productCategory, exact: true });
        await productCategoryOption.click();
    }

    async fillImages(images?: {
        title?: string;
        url?: string;
        stauts?: string;
    }[]): Promise<void> {
        if (images == null || images === undefined) {
            return;
        }
        for (let i = 0; i < images.length; i++) {
            const image = images[i];
            await this.addImageButton.click();
            await new Promise(r => setTimeout(r, 100));
            await this.fill(this.page.locator('input[name*="ProductImages"][name*="Title"]').last(), image.title);
            await this.fill(this.page.locator('input[name*="ProductImages"][name*="ImageUrl"]').last(), image.url);
            await this.fill(this.page.locator('select[name*="ProductImages"][name*="Status"]').last(), image.stauts);
        }
    }

    async save(): Promise<void> {
        await this.saveButton.click();
    }

    async saveAndExit(): Promise<void> {
        await this.saveAndExitButton.click();
    }

    async publish(): Promise<void> {
        await this.publishButton.click();
    }

    async cancel(): Promise<void> {
        await this.cancelButton.click();
    }
}
