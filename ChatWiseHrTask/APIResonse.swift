//
//  APIResonse.swift
//  ChatWiseHrTask
//
//  Created by Macintosh on 04/06/24.
//


import Foundation

class ProductResponse: Codable {
    var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

class Product: Codable {
    var id: Int
    var title: String
    var description: String
    var category: Category
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var tags: [String]
    var brand: String?
    var sku: String
    var weight: Int
    var dimensions: Dimensions
    var warrantyInformation: String
    var shippingInformation: String
    var availabilityStatus: AvailabilityStatus
    var reviews: [Review]
    var returnPolicy: ReturnPolicy
    var minimumOrderQuantity: Int
    var meta: Meta
    var images: [String]
    var thumbnail: String
    
    init(id: Int, title: String, description: String, category: Category, price: Double, discountPercentage: Double, rating: Double, stock: Int, tags: [String], brand: String?, sku: String, weight: Int, dimensions: Dimensions, warrantyInformation: String, shippingInformation: String, availabilityStatus: AvailabilityStatus, reviews: [Review], returnPolicy: ReturnPolicy, minimumOrderQuantity: Int, meta: Meta, images: [String], thumbnail: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.tags = tags
        self.brand = brand
        self.sku = sku
        self.weight = weight
        self.dimensions = dimensions
        self.warrantyInformation = warrantyInformation
        self.shippingInformation = shippingInformation
        self.availabilityStatus = availabilityStatus
        self.reviews = reviews
        self.returnPolicy = returnPolicy
        self.minimumOrderQuantity = minimumOrderQuantity
        self.meta = meta
        self.images = images
        self.thumbnail = thumbnail
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

class Dimensions: Codable {
    var width: Double
    var height: Double
    var depth: Double
    
    init(width: Double, height: Double, depth: Double) {
        self.width = width
        self.height = height
        self.depth = depth
    }
}

class Meta: Codable {
    var createdAt: CreatedAt
    var updatedAt: CreatedAt
    var barcode: String
    var qrCode: String
    
    init(createdAt: CreatedAt, updatedAt: CreatedAt, barcode: String, qrCode: String) {
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.barcode = barcode
        self.qrCode = qrCode
    }
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

class Review: Codable {
    var rating: Int
    var comment: String
    var date: CreatedAt
    var reviewerName: String
    var reviewerEmail: String
    
    init(rating: Int, comment: String, date: CreatedAt, reviewerName: String, reviewerEmail: String) {
        self.rating = rating
        self.comment = comment
        self.date = date
        self.reviewerName = reviewerName
        self.reviewerEmail = reviewerEmail
    }
}
