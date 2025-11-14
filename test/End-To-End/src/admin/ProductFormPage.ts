import { Page, Locator, FrameLocator } from '@playwright/test';
import { AdminPageBase } from "@models/AdminPageBase";

export class ProductFormPage extends AdminPageBase {
    public readonly titleInput = this.page.locator('#Title');
    public readonly englishNameInput = this.page.locator('#Url');
    public readonly imageInput = this.page.locator('#ImageUrl');
    public readonly thumbnailInput = this.page.locator('#ImageThumbUrl');
    public readonly productCategoryDropdownTree = this.page.locator('#dropdown-tree-ProductCategoryID > .form-control');
    public readonly modelInput = this.page.locator('#PartNumber');
    public readonly colorInput = this.page.locator('#Color');
    public readonly priceInput = this.page.locator('#Price');
    public readonly discountPriceInput = this.page.locator('#RebatePrice');
    public readonly costPriceInput = this.page.locator('#PurchasePrice');
    public readonly specificationInput = this.page.locator('#Norm');
    public readonly warrantyInput = this.page.locator('#ShelfLife');
    public readonly detailedContentFrame = this.page.locator('#ProductContent_ifr');
    public readonly seoTitleInput = this.page.locator('#SEOTitle');
    public readonly seoKeywordsInput = this.page.locator('#SEOKeyWord');
    public readonly seoDescriptionInput = this.page.locator('#SEODescription');
    public readonly sortInput = this.page.locator('#OrderIndex');
    public readonly sourceInput = this.page.locator('#SourceFrom');
    public readonly publishDateInput = this.page.locator('#PublishDate');
    public readonly descriptionInput = this.page.locator('#Description');
    public readonly statusDropdown = this.page.locator('#Status');
    public readonly saveButton = this.page.locator('input[value="保存"]');
    public readonly saveAndExitButton = this.page.locator('input[value="保存并退出"]');
    public readonly publishButton = this.page.locator('input[value="发布"]');
    public readonly cancelButton = this.page.locator('a.btn-default');
    public readonly addImageButton = this.page.locator('.btn-xs.add');

    constructor(page: Page) {
        super(page);
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
