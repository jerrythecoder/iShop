package com.ishop.service.impl;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ishop.model.Product;
import com.ishop.service.FileStorageService;

@Service
public class FileStorageServiceImpl implements FileStorageService {
	
	/**
	 * Gets the static path based on product ID. The path will be generated
	 * as "<root_dir>\WEB-INF\resources\images\product-images\large\<productId>.jpg"
	 * 
	 * @param product
	 * @param rootDir
	 * @return A Path object that represents the product image.
	 */
	private Path getImagePath(Product product, String rootDir) {
		return Paths.get(rootDir, "WEB-INF", "resources", "images", "product-images", 
						"large", product.getProductId().toString() + ".jpg");
	}
	
	/**
	 * Gets the static image thumbnail path based on product ID. The path will be generated
	 * as "<root_dir>\WEB-INF\resources\images\product-images\thumbnail\<productId>.jpg"
	 * 
	 * @param product
	 * @param rootDir
	 * @return A Path object that represents the product image thumbnail.
	 */
	private Path getImageThumbnailPath(Product product, String rootDir) {
		return Paths.get(rootDir, "WEB-INF", "resources", "images", "product-images", 
						"thumbnail", product.getProductId().toString() + ".jpg");
	}

	@Override
	public void storeProductImage(Product product, String rootDir) {
		
		MultipartFile image = product.getProductImage();
		
		if (!image.isEmpty()) {
			try {
				
				// Save the large format image.
				Path imagePath = getImagePath(product, rootDir);
				image.transferTo(imagePath.toFile());
				
				// Resize large image to thumbnail with Scalr.
				BufferedImage largeImage = ImageIO.read(imagePath.toFile());
				BufferedImage thumbnailImage = 
						Scalr.resize(largeImage, Scalr.Method.QUALITY, Scalr.Mode.AUTOMATIC, 160);
				
				// Write thumbnail image to specific folder.
				ImageIO.write(thumbnailImage, "jpg", getImageThumbnailPath(product, rootDir).toFile());
				
			} catch (IOException e) {
				throw new RuntimeException("Fail to save product image, Product ID: " 
						+ product.getProductId(), e);
			}
		}
	}

	@Override
	public void deleteProductImage(Product product, String rootDir) {
		
		Path imagePath = getImagePath(product, rootDir);
		Path thumbnailPath = getImageThumbnailPath(product, rootDir);
		
		try {
			// Remove both large images and thumbnails.
			Files.deleteIfExists(imagePath);
			Files.deleteIfExists(thumbnailPath);
		} catch (IOException e) {
			throw new RuntimeException("Fail to delete product image, Product ID: " 
					+ product.getProductId(), e);
		}
	}

}
