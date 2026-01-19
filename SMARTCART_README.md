# SmartCart - E-Commerce Mobile Application

## Project Overview
SmartCart is a fully functional e-commerce mobile application built with Flutter. It provides a complete shopping experience with product browsing, cart management, order placement, and user profile management.

## Features Implemented

### 1. User Authentication
- **Login Screen** - Email and password authentication
- **Sign Up Screen** - New user registration with validation
- **Forgot Password** - Password reset functionality
- **Persistent Login** - Users remain logged in using SharedPreferences

### 2. Home Screen
- **Product Categories** - Browse products by category (Electronics, Fashion, Sports, etc.)
- **Search Functionality** - Search products by name or description
- **Trending Products** - Display popular products
- **Bottom Navigation** - Easy navigation between Home, Cart, Orders, and Profile

### 3. Product Features
- **Product Listing** - Grid view of products with images, prices, and ratings
- **Product Details** - Detailed product information with description, reviews, and stock status
- **Product Filtering** - Filter by category
- **Product Sorting** - Sort by price (low to high, high to low), rating, and popularity
- **Discount Display** - Shows discount percentage and original/discounted prices
- **Add to Cart** - Quick add to cart from product listing or details

### 4. Shopping Cart
- **Cart Management** - View all cart items
- **Quantity Control** - Increment/decrement product quantity
- **Remove Items** - Delete products from cart
- **Price Breakdown** - Subtotal, delivery charge, tax (5%), and total amount
- **Empty Cart State** - User-friendly empty cart message

### 5. Checkout Process
- **Address Management** - Select or add new delivery address
- **Address Storage** - Multiple addresses with default selection
- **Order Summary** - Review items before payment
- **Price Summary** - Final price breakdown

### 6. Payment
- **Multiple Payment Methods**:
  - Cash on Delivery
  - UPI (GooglePay, PhonePe, Paytm)
  - Credit/Debit Card
  - Wallet
- **Demo Mode** - Simulated payment processing
- **Payment Confirmation** - Visual feedback during payment

### 7. Order Management
- **Order Placement** - Create orders with all details
- **Order History** - View all past orders
- **Order Status** - Track order status (Placed, Packed, Shipped, Delivered, Cancelled)
- **Order Details** - Complete order information including:
  - Order ID and date
  - Item details
  - Delivery address
  - Payment method
  - Price breakdown
  - Estimated delivery date
- **Cancel Order** - Cancel orders before shipping
- **Active/Completed Tabs** - Organized order viewing

### 8. User Profile
- **Profile Display** - Shows user name, email, and phone
- **Edit Profile** - (Placeholder - Coming Soon)
- **Saved Addresses** - (Placeholder - Coming Soon)
- **Wishlist** - (Placeholder - Coming Soon)
- **Notifications** - (Placeholder - Coming Soon)
- **Settings** - (Placeholder - Coming Soon)
- **Help & Support** - (Placeholder - Coming Soon)
- **About** - App information
- **Logout** - Secure logout with confirmation

### 9. Order Confirmation
- **Success Screen** - Beautiful order confirmation
- **Order Details Summary** - Key order information
- **Quick Actions** - View order details or continue shopping

## Technical Implementation

### State Management
- **Provider Pattern** - Used throughout the app for state management
- **Providers**:
  - AuthProvider - User authentication state
  - ProductProvider - Product data and filtering
  - CartProvider - Shopping cart management
  - OrderProvider - Order management
  - AddressProvider - Address management

### Data Models
- **User** - User profile information
- **Product** - Product details with pricing and images
- **CartItem** - Cart item with quantity
- **Address** - Delivery address information
- **Order** - Complete order information with status tracking

### Mock Data
- 10 sample products across different categories
- Sample addresses for testing
- All data stored in-memory (resets on app restart)

### Dependencies
- **provider** (^6.1.1) - State management
- **shared_preferences** (^2.2.2) - Local storage for authentication
- **intl** (^0.19.0) - Date formatting
- **cached_network_image** (^3.3.1) - Image caching and loading
- **image_picker** (^1.0.7) - Future use for profile pictures

## Project Structure

```
lib/
├── data/
│   └── mock_data.dart          # Sample products and addresses
├── models/
│   ├── user.dart               # User model
│   ├── product.dart            # Product model
│   ├── cart_item.dart          # Cart item model
│   ├── address.dart            # Address model
│   └── order.dart              # Order model
├── providers/
│   ├── auth_provider.dart      # Authentication state
│   ├── product_provider.dart   # Product state
│   ├── cart_provider.dart      # Cart state
│   ├── order_provider.dart     # Order state
│   └── address_provider.dart   # Address state
├── screens/
│   ├── splash_screen.dart      # App splash screen
│   ├── auth/
│   │   ├── login_screen.dart   # Login screen
│   │   ├── signup_screen.dart  # Sign up screen
│   │   └── forgot_password_screen.dart
│   ├── home/
│   │   ├── main_screen.dart    # Bottom navigation
│   │   └── home_tab.dart       # Home tab content
│   ├── products/
│   │   ├── product_list_screen.dart
│   │   └── product_details_screen.dart
│   ├── cart/
│   │   └── cart_screen.dart    # Shopping cart
│   ├── checkout/
│   │   ├── checkout_screen.dart
│   │   ├── address_selection_screen.dart
│   │   ├── payment_screen.dart
│   │   └── order_confirmation_screen.dart
│   ├── orders/
│   │   ├── orders_screen.dart  # Order history
│   │   └── order_details_screen.dart
│   └── profile/
│       └── profile_screen.dart # User profile
├── widgets/
│   └── product_card.dart       # Reusable product card
└── main.dart                   # App entry point
```

## How to Run

1. **Ensure Flutter is installed**:
   ```bash
   flutter --version
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Test Credentials

For testing, you can use any email and password combination:
- **Email**: any valid email format (e.g., test@example.com)
- **Password**: minimum 6 characters (e.g., 123456)

## App Flow

1. **Splash Screen** → Checks authentication status
2. **Login/Signup** → If not authenticated
3. **Home Screen** → Browse products and categories
4. **Product Details** → View detailed information
5. **Add to Cart** → Manage cart items
6. **Checkout** → Select delivery address
7. **Payment** → Choose payment method
8. **Order Confirmation** → View order details
9. **Order Tracking** → Track order status in Orders tab
10. **Profile** → Manage account and logout

## Key Highlights

### User Experience
- **Smooth Navigation** - Intuitive bottom navigation and routing
- **Visual Feedback** - Loading indicators, snackbars, and confirmations
- **Error Handling** - Form validation and user-friendly error messages
- **Responsive Design** - Works on various screen sizes
- **Image Loading** - Cached network images with placeholders

### Design
- **Material Design 3** - Modern Flutter UI
- **Consistent Color Scheme** - Blue theme throughout
- **Card-based Layout** - Clean and organized UI
- **Icons and Badges** - Visual indicators for cart count and status
- **Gradient Backgrounds** - Attractive splash and auth screens

### Performance
- **Efficient State Management** - Provider for optimal performance
- **Image Caching** - Fast image loading with caching
- **Lazy Loading** - ListView builders for large lists

## Future Enhancements

As outlined in the project specification, these features can be added:
- AI product recommendations
- Wishlist functionality
- Chat support
- Push notifications
- Multi-language support
- Real backend integration (Firebase or REST API)
- Real payment gateway integration
- Product reviews and ratings system
- Advanced search and filters
- Order returns and refunds
- Email notifications

## Database Schema (for future backend)

### Users Table
- user_id, name, email, password, phone, profile_image

### Products Table
- product_id, name, price, discount_price, description, category_id, image_url, rating, review_count, stock

### Cart Table
- cart_id, user_id, product_id, quantity

### Orders Table
- order_id, user_id, total_amount, status, order_date, estimated_delivery_date

### Addresses Table
- address_id, user_id, name, phone, street, city, state, pincode, is_default

## Notes

- All data is currently stored in-memory and will reset when the app restarts
- Login persistence uses SharedPreferences
- Images are loaded from Unsplash (requires internet connection)
- Payment is simulated - no real transactions occur
- The app follows Flutter best practices and Material Design guidelines

## Conclusion

SmartCart is a comprehensive e-commerce mobile application demonstrating a complete shopping flow from authentication to order placement. It showcases Flutter development skills including state management, navigation, form handling, and responsive UI design.

---
**Developer**: Built with Flutter & Provider
**Version**: 1.0.0
**Last Updated**: December 2025
