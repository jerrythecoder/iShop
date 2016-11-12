package com.ishop.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ishop.model.Product;
import com.ishop.service.FileStorageService;

@Service
public class FileStorageServiceImpl implements FileStorageService {
	
	/**
	 * Gets the static path based on product ID. The path will be generated
	 * as "<root_dir>\WEB-INF\resources\images\product-images\<product_id>.png"
	 * 
	 * @param product
	 * @param rootDir
	 * @return A Path object that represents the product image.
	 */
	private Path getImagePath(Product product, String rootDir) {
		return Paths.get(rootDir, "WEB-INF", "resources", "images", "product-images", 
						"product_" + product.getProductId() + ".png");
	}

	@Override
	public void storeProductImage(Product product, String rootDir) {
		
		MultipartFile image = product.getProductImage();
		
		if (!image.isEmpty()) {
			try {
				image.transferTo(getImagePath(product, rootDir).toFile());
			} catch (IOException e) {
				throw new RuntimeException("Fail to save product image, Product ID: " 
						+ product.getProductId(), e);
			}
		}
	}

	@Override
	public void deleteProductImage(Product product, String rootDir) {
		
		Path imagePath = getImagePath(product, rootDir);
		
		try {
			Files.deleteIfExists(imagePath);
		} catch (IOException e) {
			throw new RuntimeException("Fail to delete product image, Product ID: " 
					+ product.getProductId(), e);
		}
	}

}
