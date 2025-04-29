<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Handcrafted Wonders - Admin Dashboard</title>
      <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f5f0;
            color: #333;
        }
    
        /* Navbar */
        .navbar {
            background-color: #3E2723;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
    
        .logo {
            font-size: 22px;
            font-weight: bold;
        }
    
        .nav-menu {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }
    
        .nav-menu li {
            margin-left: 20px;
        }
    
        .nav-menu a {
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
            display: flex;
            align-items: center;
        }
    
        .nav-menu a:hover, .nav-menu a.active {
            background-color: #8B5A2B;
        }
    
        .nav-menu i {
            margin-right: 8px;
        }
    
        .user-info {
            display: flex;
            align-items: center;
        }
    
        .user-info img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
        }
    
        /* Main Content */
        .main-content {
            padding: 30px;
            max-width: 1400px;
            margin: 0 auto;
        }
    
        .page-title {
            font-size: 28px;
            color: #3E2723;
            margin: 0 0 30px 0;
        }
    
        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
    
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    
        .stat-card h3 {
            margin-top: 0;
            color: #8B5A2B;
            font-size: 16px;
        }
    
        .stat-card .value {
            font-size: 28px;
            font-weight: bold;
            margin: 10px 0;
        }
    
        .stat-card .trend {
            font-size: 14px;
            color: #666;
        }
    
        .trend.up {
            color: #4CAF50;
        }
    
        .trend.down {
            color: #F44336;
        }
    
        /* Product Table */
        .product-table-container {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow-x: auto;
            margin-bottom: 30px;
        }
    
        table {
            width: 100%;
            border-collapse: collapse;
        }
    
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
    
        th {
            background-color: #F5F5DC;
            color: #3E2723;
            font-weight: 600;
        }
    
        tr:hover {
            background-color: #f9f9f9;
        }
    
        .status-active {
            color: #4CAF50;
            font-weight: 500;
        }
    
        .status-inactive {
            color: #FFC107;
            font-weight: 500;
        }
    
        .status-discontinued {
            color: #F44336;
            font-weight: 500;
        }
    
        /* Product Form */
        .product-form {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    
        .form-title {
            margin-top: 0;
            color: #3E2723;
            font-size: 22px;
            margin-bottom: 20px;
        }
    
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
    
        .form-group {
            margin-bottom: 15px;
        }
    
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
    
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
    
        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
    
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }
    
        .btn-primary {
            background-color: #8B5A2B;
            color: white;
        }
    
        .btn-secondary {
            background-color: #D2B48C;
            color: #3E2723;
        }
    
        .btn-danger {
            background-color: #F44336;
            color: white;
        }
    
        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
    
        /* Responsive */
        @media (max-width: 1024px) {
            .stats-container {
                grid-template-columns: 1fr;
            }
    
            .form-grid {
                grid-template-columns: 1fr;
            }
    
            .navbar {
                flex-direction: column;
                padding: 15px;
            }
    
            .nav-menu {
                margin-top: 15px;
                width: 100%;
                justify-content: space-between;
            }
    
            .nav-menu li {
                margin-left: 0;
            }
        }
    
        @media (max-width: 768px) {
            .nav-menu {
                flex-direction: column;
                align-items: flex-start;
            }
    
            .nav-menu li {
                margin: 5px 0;
                width: 100%;
            }
    
            .nav-menu a {
                display: block;
                width: 100%;
            }
        }
    </style>
    
</head>
<body>
   
        <jsp:include page="header.jsp"/>

    
    <div class="main-content">
        <h1 class="page-title">Product Management</h1>
        
        <div class="stats-container">
            <div class="stat-card">
                <h3>Total Sales</h3>
                <div class="value">Rs. 9,611,492</div>
                <div class="trend up">↑ 12% from last month</div>
            </div>
            <div class="stat-card">
                <h3>Total Stock</h3>
                <div class="value">250 items</div>
                <div class="trend down">↓ 5% from last month</div>
            </div>
            <div class="stat-card">
                <h3>Items Sold</h3>
                <div class="value">1,753</div>
                <div class="trend up">↑ 8% from last month</div>
            </div>
        </div>
        
        <div class="product-table-container">
            <table>
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Price (Rs.)</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th>Total Sales</th>
                        <th>Status</th>
                        <th>Date Created</th>
                        <th>Weight (kg)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>128UU2A</td>
                        <td>Mika</td>
                        <td>2,999.90</td>
                        <td>60</td>
                        <td>Pottery</td>
                        <td>233</td>
                        <td class="status-active">Active</td>
                        <td>2024/09/22</td>
                        <td>8.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                    <tr>
                        <td>213ACSNC</td>
                        <td>Decorative Plate</td>
                        <td>3,999.00</td>
                        <td>75</td>
                        <td>Ceramics</td>
                        <td>322</td>
                        <td class="status-inactive">Inactive</td>
                        <td>2024/12/24</td>
                        <td>12.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                    <tr>
                        <td>92VCDW24</td>
                        <td>Elegant Bowl</td>
                        <td>5,599.00</td>
                        <td>30</td>
                        <td>Ceramics</td>
                        <td>656</td>
                        <td class="status-inactive">Inactive</td>
                        <td>2023/01/24</td>
                        <td>7.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                    <tr>
                        <td>228KUN82</td>
                        <td>Wood Sculpture</td>
                        <td>6,999.80</td>
                        <td>50</td>
                        <td>Woodcraft</td>
                        <td>452</td>
                        <td class="status-discontinued">Discontinued</td>
                        <td>2023/12/14</td>
                        <td>3.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                    <tr>
                        <td>125FWE23</td>
                        <td>Art Deco Ceramic Vase</td>
                        <td>7,999.90</td>
                        <td>20</td>
                        <td>Ceramics</td>
                        <td>56</td>
                        <td class="status-inactive">Inactive</td>
                        <td>2024/02/28</td>
                        <td>6.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                    <tr>
                        <td>CFAJ833A</td>
                        <td>Modern Pot Pitcher</td>
                        <td>9,999.70</td>
                        <td>15</td>
                        <td>Pottery</td>
                        <td>34</td>
                        <td class="status-discontinued">Discontinued</td>
                        <td>2020/12/18</td>
                        <td>4.0</td>
                        <td>
                            <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;">Edit</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="product-form">
            <h2>Product Information</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label for="product-code">Product Code</label>
                    <input type="text" id="product-code" placeholder="Enter product code">
                </div>
                <div class="form-group">
                    <label for="product-name">Product Name</label>
                    <input type="text" id="product-name" placeholder="Enter product name">
                </div>
                <div class="form-group">
                    <label for="price">Price (Rs.)</label>
                    <input type="number" id="price" placeholder="Enter price">
                </div>
                <div class="form-group">
                    <label for="stock">Stock</label>
                    <input type="number" id="stock" placeholder="Enter stock quantity">
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category">
                        <option value="">Select category</option>
                        <option value="pottery">Pottery</option>
                        <option value="ceramics">Ceramics</option>
                        <option value="woodcraft">Woodcraft</option>
                        <option value="textiles">Textiles</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="weight">Weight (kg)</label>
                    <input type="number" id="weight" placeholder="Enter weight">
                </div>
                <div class="form-group">
                    <label for="date-created">Date Created</label>
                    <input type="date" id="date-created">
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status">
                        <option value="">Select status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                        <option value="discontinued">Discontinued</option>
                    </select>
                </div>
            </div>
            <div class="form-actions">
                <button class="btn btn-primary">Add Product</button>
                <button class="btn btn-secondary">Update</button>
                <button class="btn btn-danger">Delete</button>
                <button class="btn btn-secondary">Clear</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>